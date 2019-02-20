#!/usr/bin/env python3

import rospy
import re
import rospkg
import sys

from rosplan_dispatch_msgs.msg import *
from std_msgs.msg import String
from std_srvs.srv import Empty
from rosplan_planning_system.main import compute_envelope_construct


class RobustEnvelope(object):

    def __init__(self):
        
        # get path of pkg
        rospack = rospkg.RosPack()
        pkg_path = rospack.get_path('rosplan_planning_system')
        #print('searching for param:')
        domain_name = rospy.get_param('/rosplan_planner_interface/domain_path').split('/')[-1]
        problem_name = rospy.get_param('/rosplan_planner_interface/problem_path').split('/')[-1]
        self.data_path = pkg_path + '/common/rosplan_planning_system/'
        self.domain_path = self.data_path + domain_name
        self.problem_path = self.data_path + problem_name 
        self.plan_path = self.data_path + 'plan_' + problem_name 
        self.STN_plan_path = self.data_path + 'STN_plan_' + problem_name[:-5] + '.stn' 
        self.Esterel_plan_path = self.data_path + 'Esterel_plan_' + problem_name[:-5] +'.txt'
        self.Robust_plan_path = self.data_path + 'Robust_plan_' + problem_name[:-5] + '.txt_' 
        #relate the parameter to the source node and the sink node
        self.dict_pram_source_node = dict()
        self.dict_pram_sink_node = dict()
        #getting the value of the dur from service
        self.dict_dur_lower = dict()
        self.dict_dur_upper = dict()

        #mapping the stn node to esterel node
        self.dict_stn = dict()
        

        rospy.loginfo('Updating the esterele plan bounds')

        # publications
        self.pub_robust_plan = rospy.Publisher('rosplan_parsing_interface/robust_plan', EsterelPlan , queue_size=10) # template stuff, TODO: fill
        
        # subscriptions
        rospy.Subscriber('rosplan_planner_interface/planner_output', String, self.planCallback, queue_size=1)
        rospy.Subscriber('rosplan_problem_interface/problem_instance', String, self.problemCallback, queue_size=1)
        # I think we don't need this
        rospy.Subscriber('rosplan_plan_dispatcher/plan_graph', String, self.stnCallback, queue_size=1)
        rospy.Subscriber('rosplan_parsing_interface/complete_plan', EsterelPlan, self.esterelPlanCallback, queue_size=1)
        
        # Var for better readability
        self.esterel_plan_received = False
        self.output_robust_plan_msg = None
        self.publish_robust = False

        rospy.loginfo('Starting robust envelope node')
        
        # STN service offered by this node
        rospy.Service('run_STN', Empty, self.serviceCB)

        # to control the frequency at which this node will run
        self.loop_rate = rospy.Rate(rospy.get_param('~loop_rate', 10.0))

        # give some time for the node to subscribe to the topic
        rospy.sleep(0.2)
        rospy.logdebug('Ready to compute robust envelopes')
    
    
    def esterelPlanCallback(self, input_esterel_plan):
        # save in member variable
        self.output_robust_plan_msg = input_esterel_plan
        # raise flag indicating that msg has been received
        self.esterel_plan_received = True  


    def paramter_relate_edge(self):
        stn_plan_file = open(self.STN_plan_path, 'r')
        for line in stn_plan_file:
            if line.find('[dur_') > 0:
                for key, value in self.dict_stn.items():
                    if value == line[3:(line.find("-")-1)]:
                        #modificatiobs for the robust plan : update the bounds
                        par_edge = str(set(self.output_robust_plan_msg.nodes[0].edges_out).intersection(self.output_robust_plan_msg.nodes[key].edges_in))
                        par_edge_id = int(par_edge[1:(len(par_edge)-1)])
                        self.output_robust_plan_msg.edges[par_edge_id].duration_lower_bound = self.dict_dur_lower[line[(line.find('[')+1):line.find(',')]]
                        self.output_robust_plan_msg.edges[par_edge_id].duration_upper_bound = self.dict_dur_upper[line[(line.find('[')+1):line.find(',')]]

   
    
    def serviceCB(self, req):
        rospy.loginfo(self.domain_path)
        rospy.loginfo(self.problem_path)
        rospy.loginfo(self.STN_plan_path)
        rospy.loginfo(self.Esterel_plan_path)
        # call STN python tool
        rospy.loginfo('Calling STN python tool')
        stream = sys.stdout
        res = compute_envelope_construct(self.domain_path,self.problem_path,self.STN_plan_path)
                                         #debug=False, splitting=None, early_forall_elimination=False, compact_encoding=True, solver=None, qelim_name=None,epsilon=None, simplify_effects=True)
        # rectangle_callback=None)
        rospy.loginfo('It worksssssssssssssssss')
        
        if res:
            for p, (l, u) in res.items():
                stream.write("%s in [%s, %s]\n" % (p.name, l, u))
                #the upper and lower bound on the edges for parameters
                self.dict_dur_lower[p.name] = float(l)
                self.dict_dur_upper[p.name] = float(u)
        else:
            stream.write("The problem is unsatisfiable!\n")
        
        if bool(self.dict_dur_lower[p.name] and self.dict_dur_upper[p.name]):
            self.paramter_relate_edge()
            self.publish_robust = True
        	
        
        
    def stnCallback(self, msg):
        '''                                 
        write msg.data to textfile
        '''
        file = open(self.Esterel_plan_path,'w')
        file.write(msg.data)
        file.close()
        
        Esterel_plan_file = open(self.Esterel_plan_path,'r')
        #print("plan path:"+self.Esterel_plan_path)


        #number of parameters added to the stn_plan
        n = 0
        #counter on the number of the parameters added
        l = 1
        # esterel nodes dictioanry
        dict_esterel = dict()
        key = 0
        STN_node = 0
        for line in Esterel_plan_file:
            lineSplit = line.split(' ')
            if line[0].isdigit() and line[0]!='0':
                key = int(lineSplit[0][:-1])
                cleanLine = lineSplit[1][7:-1].split('_')
                item = ''
                for word in cleanLine:
                    if word != 'end' and word != 'start':
                        item = item + word +'_'
                dict_esterel[key] = item[:-1]
            elif key > 0:
                endln = ''
                for word1 in lineSplit[0][1:-4].split('"')[0].split(','):
                    endln = endln + word1 + ' '
                dict_esterel[key] = dict_esterel[key]+ ' ' +endln[:-1]
                key = 0
        
        # map esterel node to stn node dictionary
        for key in dict_esterel:
            if key % 2 ==1 :
                stn_key_start = 'n' + str(STN_node) + '.start'
                self.dict_stn[key] = stn_key_start
            if key % 2 ==0 :
                stn_key_end = 'n' + str(STN_node) + '.end'
                self.dict_stn[key] = stn_key_end
                STN_node += 1
            self.dict_stn[0] = '.zero'
        
        STN_node = 0
        stn_plan_file = open(self.STN_plan_path, 'w')
        for key in dict_esterel:
            if key % 2 == 1:
                stn_plan_file.write('durative-action instance n' + str(STN_node) + ' : (' + str(dict_esterel[key]) + ';\n')
                STN_node += 1
               
        Esterel_plan_file = open(self.Esterel_plan_path,'r')
        for line in Esterel_plan_file:
            if line[0] == '"' :
                lineSplit = line.split('"')
                # parameterizing all the start-end actions 
                if int(lineSplit[1]) % 2 ==1 and int(lineSplit[3]) == int(lineSplit[1]) +1 and dict_esterel[int(lineSplit[1])].split('_')[0] == 'goto':
                    default_value= lineSplit[5].split(',')[1].split(']')
                    stn_plan_file.write('parameter dur_' + str(l) + ' default' + str(default_value[0]) + '; \n')
                    stn_plan_file.write('c: ' + str(self.dict_stn[int(lineSplit[3])]) + ' - ' + str(self.dict_stn[int(lineSplit[1])]) + ' in [dur_' + str(l) + ',dur_' + str(l) + '];\n')
                    l+=1
                ##add parameters start from the first constraint:
                #if l < n:
                #add parameters to the nodes and start plan
                # if l < n and lineSplit[1] == '0':
                #     stn_plan_file.write('parameter dur_' + str(l) + ';\n')
                #     stn_plan_file.write('c: ' + str(self.dict_stn[int(lineSplit[3])]) + ' - ' + str(self.dict_stn[int(lineSplit[1])]) + ' in [dur_' + str(l) + ',dur_' + str(l) + '];\n')
                    
                #     l += 1
                # if line.find('inf') > 0:
                #     new_stn_line = 'c: ' + str(self.dict_stn[int(lineSplit[3])]) + ' - ' + str(self.dict_stn[int(lineSplit[1])]) + ' in ' + str(lineSplit[5]) + ';\n'
                #     #stn_plan_file.write(new_stn_line.replace('inf', str(sys.maxsize)))
                #     stn_plan_file.write(new_stn_line.replace('inf', '+inf'))
                #     # adding parameters
                else:
                    stn_plan_file.write('c: ' + str(self.dict_stn[int(lineSplit[3])]) + ' - ' + str(self.dict_stn[int(lineSplit[1])]) + ' in ' + str(lineSplit[5]) + ';\n')   
                #stn_plan_file.write('c: ' + str(self.dict_stn[int(lineSplit[3])]) + ' - ' + str(self.dict_stn[int(lineSplit[1])]) + ' in ' + str(lineSplit[5]) + ';\n') 
        stn_plan_file.close()

     # publishing the robutst plan    
    def republish_plan(self):
        # publish
        #if self.output_robust_plan_msg != None:

        while not rospy.is_shutdown():
        	if self.publish_robust:
        		self.pub_robust_plan.publish(self.output_robust_plan_msg)
        		self.publish_robust = False
        	self.loop_rate.sleep()
                   
        
    # writing the PDDL problem genrated by ROSPlan in a file       
    def problemCallback(self, msg):
        file = open(self.problem_path,'w')
        file.write(msg.data)
        file.close()  

    # writing the PDDL plan in a file : Just need it if we wanna validate the plan    
    def planCallback(self, msg):
        file = open(self.plan_path,'w')
        file.write(msg.data)
        file.close()        
 
    # def start_robust_envelope(self):
    #     # wait for user to press ctrl + c (prevent the node from dying)
    #     while not rospy.is_shutdown():
    #         # if self.esterel_plan_received == True:
    #         #     # lower flag
    #         #    self.esterel_plan_received = False
    #         #     # modify and publish msg
    #         #    self.republish_plan()
    #     	self.republish_plan()
    #     	self.loop_rate.sleep()

if __name__ == '__main__':
    rospy.init_node('robust_envelope_node', anonymous=False)
    robust_envelope_node = RobustEnvelope()
    # robust_envelope_node.start_robust_envelope()
    robust_envelope_node.republish_plan()
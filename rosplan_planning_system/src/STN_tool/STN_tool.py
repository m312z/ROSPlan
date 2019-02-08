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
    '''
    todo
    '''
    def __init__(self):
        rospy.loginfo('Updating the esterele plan bounds')
        # publications
        self.pub_EsterelBounds = rospy.Publisher('rosplan_parsing_interface/complete_plan', EsterelPlan , queue_size=10) # template stuff, TODO: fill
        rospy.loginfo('Starting robust envelope node')
        # setup the strings
        # setup paths
        rospack = rospkg.RosPack()
        
        # get path of pkg
        pkg_path = rospack.get_path('rosplan_planning_system')
        self.data_path = pkg_path + '/common/rosplan_planning_system/';
        self.domain_path = self.data_path + 'domain.pddl';
        self.problem_path = self.data_path + 'problem.pddl';
        self.plan_path = self.data_path + 'plan.pddl';
        self.STN_plan_path = self.data_path + 'STN_plan.stn';
        self.Esterel_plan_path = self.data_path + 'Esterel_plan.txt';
        self.Esterel_plan_msg_path = self.data_path + 'Esterel_plan_msg.txt';
        # subscriptions
        rospy.Subscriber('rosplan_planner_interface/planner_output', String, self.planCallback, queue_size=1)
        rospy.Subscriber('rosplan_problem_interface/problem_instance', String, self.problemCallback, queue_size=1)
        # I think we don't need this
        rospy.Subscriber('rosplan_plan_dispatcher/plan_graph', String, self.stnCallback, queue_size=1)
        rospy.Subscriber('rosplan_parsing_interface/complete_plan', EsterelPlan, self.esterelCallback, queue_size=1)
        rospy.logdebug('Ready to compute robust envelopes')
        
        # STN service offered by this node
        rospy.Service('run_STN', Empty, self.serviceCB)
        
        # uodating Esterel plan service offered by this node
        rospy.Service('Update_Esterel', Empty, self.serviceCB2)

    def serviceCB(self, req):
        # call STN python tool
        rospy.loginfo('Calling STN python tool')
        stream = sys.stdout
        res = compute_envelope_construct(self.domain_path,self.problem_path,self.STN_plan_path)
                               ##,debug=debug, splitting=args.splitting,
                               ##early_forall_elimination=args.early_elimination,
                               ##compact_encoding=compact_encoding,
                               ##solver=args.solver,
                               ##qelim_name=args.qelim,
                               ##epsilon=Fraction(args.epsilon),
                               ##simplify_effects=simplify_effects,
                               ##learn=not args.no_learning
                               ##)
        if res:
            for p, (l, u) in res.items():
                stream.write("%s in [%s, %s]\n" % (p.name, l, u))
        else:
            stream.write("The problem is unsatisfiable!\n")
                               

    def serviceCB2(self, req):

        # call STN python tool
        rospy.loginfo('Updateing the Esterel plan')  
    
        
    def problemCallback(self, msg):
        file = open(self.problem_path,'w')
        file.write(msg.data)
        file.close()
        
        
    def planCallback(self, msg):
        '''
        write msg.data to textfile
        '''
        file = open(self.plan_path,'w')
        file.write(msg.data)
        file.close()
        
        
    def esterelCallback(self, EsterelPlan):
        self.pub_EsterelBounds.publish(EsterelPlan)
        file = open(self.Esterel_plan_msg_path,'w')
        file.write(str(EsterelPlan))
        file.close()
  
       
    def stnCallback(self, msg):
        '''                                 
        write msg.data to textfile
        '''
        file = open(self.Esterel_plan_path,'w')
        file.write(msg.data)
        file.close()
        
        Esterel_plan_file = open(self.Esterel_plan_path,'r')

        #number of parameters added to the stn_plan
        n = 0
        #counter on the number of the parameters added
        l = 1
        # esterel nodes dictioanry
        dict_esterel = dict()
        key = 0
        STN_node = 0
        dict_stn = dict()
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
        #print (dict_esterel)
        
        # map esterel node to stn node dictionary
        for key in dict_esterel:
            if key % 2 ==1 :
                stn_key_start = 'n' + str(STN_node) + '.start'
                dict_stn[key] = stn_key_start
            if key % 2 ==0 :
                stn_key_end = 'n' + str(STN_node) + '.end'
                dict_stn[key] = stn_key_end
                STN_node += 1
            dict_stn[0] = '.zero'
        #print (dict_stn[0])
        
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
                ##add parameters start from the first constraint:
                #if l < n:
                #add parameters to the nodes and start plan
                if l < n and lineSplit[1] == '0':
                    stn_plan_file.write('parameter dur_' + str(l) + ';\n')
                    stn_plan_file.write('c: ' + str(dict_stn[int(lineSplit[3])]) + ' - ' + str(dict_stn[int(lineSplit[1])]) + ' in [dur_' + str(l) + ',dur_' + str(l) + '];\n')
                    l += 1
                if line.find('inf') > 0:
                    new_stn_line = 'c: ' + str(dict_stn[int(lineSplit[3])]) + ' - ' + str(dict_stn[int(lineSplit[1])]) + ' in ' + str(lineSplit[5]) + ';\n'
                    #stn_plan_file.write(new_stn_line.replace('inf', str(sys.maxsize)))
                    stn_plan_file.write(new_stn_line.replace('inf', '+inf'))
                    # adding parameters
                else:
                    stn_plan_file.write('c: ' + str(dict_stn[int(lineSplit[3])]) + ' - ' + str(dict_stn[int(lineSplit[1])]) + ' in ' + str(lineSplit[5]) + ';\n')
                
                    

    def start_robust_envelope(self):
        # wait for user to press ctrl + c (prevent the node from dying)
        rospy.spin()
        while not rospy.is_shutdown():
            self.pub_EsterelBounds.publish(msg)
            #if self.emotion_received == True:
                ## lower flag
                #self.emotion_received = False
                ## update mouth emotion
                #self.mouth_emotion_update()
                ## update eyes emotion
                #self.eyes_emotion_update()
            #self.loop_rate.sleep()
            
    

if __name__ == '__main__':
    rospy.init_node('robust_envelope_node', anonymous=False)
    robust_envelope_node = RobustEnvelope()
    robust_envelope_node.start_robust_envelope()

#!/usr/bin/env python
import rospkg
import rospy
import sys
import time

from std_srvs.srv import Empty, EmptyResponse
from rosplan_knowledge_msgs.srv import SetInt
from rosplan_dispatch_msgs.srv import DispatchService, DispatchServiceResponse

# get path of pkg
rospack = rospkg.RosPack()

problem_path = rospy.get_param('~/rosplan_STN_tool/problem_path', "problem.pddl")
experiment_batch = rospy.get_param('~/coordinator_non_adaptable/experiment_batch', '0')


goal_achieved = False
replans = 0
while not goal_achieved and replans<10:
    rospy.wait_for_service('/rosplan_problem_interface/problem_generation_server')
    rospy.wait_for_service('/rosplan_planner_interface/planning_server')
    rospy.wait_for_service('/rosplan_parsing_interface/parse_plan')
    rospy.wait_for_service('/run_STN')
    rospy.wait_for_service('/rosplan_plan_dispatcher/dispatch_plan')
    rospy.wait_for_service('/rosplan_knowledge_base/state/propositions')
    rospy.wait_for_service('/sim_clock/set_time_scale')    
    try:
        pg = rospy.ServiceProxy('/rosplan_problem_interface/problem_generation_server', Empty)
        if not pg():
            print('NO PROBLEM')
        
        #back time to 1
        pt = rospy.ServiceProxy('/sim_clock/set_time_scale', SetInt)
        pi = rospy.ServiceProxy('/rosplan_planner_interface/planning_server', Empty)
        if not pi():
            replans += 1
        else:
            pp = rospy.ServiceProxy('/rosplan_parsing_interface/parse_plan', Empty)
            pp()
            
            ps = rospy.ServiceProxy('/run_STN', Empty)
            ps()
            
            time.sleep(3)

            dp = rospy.ServiceProxy('/rosplan_plan_dispatcher/dispatch_plan', DispatchService)
            pt(10)
            dsr = dp()
            pt(1)

            goal_achieved = dsr.goal_achieved
            if not dsr.goal_achieved:
                replans += 1

    except rospy.ServiceException, e:
        print "Service call failed: %s"%e
        replans += 1

if goal_achieved:
    print "SUCCESS ", str(replans)
    result = open(problem_path[:-5] + '_result_batch' +str(experiment_batch) +'.txt', 'w')
    result.write('SUCCESS  '+ str(replans) + '\n')
else:
    print "FAILED ", str(replans)
    result = open(problem_path[:-5] + '_result_batch' + str(experiment_batch) +'.txt', 'w')
    result.write('FAILED  '+ str(replans) + '\n')

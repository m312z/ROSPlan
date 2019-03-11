#!/usr/bin/env python
import rospkg
import rospy
import sys
import time

from std_srvs.srv import Empty, EmptyResponse
from rosplan_dispatch_msgs.srv import DispatchService, DispatchServiceResponse

goal_achieved = False
replans = 0
while not goal_achieved and replans<10:
    rospy.wait_for_service('/rosplan_problem_interface/problem_generation_server')
    rospy.wait_for_service('/rosplan_planner_interface/planning_server')
    rospy.wait_for_service('/rosplan_parsing_interface/parse_plan')
    rospy.wait_for_service('/run_STN')
    rospy.wait_for_service('/rosplan_plan_dispatcher/dispatch_plan')
    rospy.wait_for_service('/rosplan_knowledge_base/state/propositions')
    try:
        pg = rospy.ServiceProxy('/rosplan_problem_interface/problem_generation_server', Empty)
        pg()

        pi = rospy.ServiceProxy('/rosplan_planner_interface/planning_server', Empty)
        pi()

        pp = rospy.ServiceProxy('/rosplan_parsing_interface/parse_plan', Empty)
        pp()

        ps = rospy.ServiceProxy('/run_STN', Empty)
        ps()

        time.sleep(3)

        dp = rospy.ServiceProxy('/rosplan_plan_dispatcher/dispatch_plan', DispatchService)
        dsr = dp()

        goal_achieved = dsr.goal_achieved
        if not dsr.goal_achieved:
            replans += 1

    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

if goal_achieved:
    print "SUCCESS ", str(replans)
else:
    print "FAILED ", str(replans)

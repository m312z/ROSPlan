#!/usr/bin/env python
import rospkg
import rospy
import sys
import time
import os

from std_srvs.srv import Empty, EmptyResponse
from rosplan_knowledge_msgs.srv import SetInt
from rosplan_dispatch_msgs.srv import DispatchService, DispatchServiceResponse

# get path of pkg
rospack = rospkg.RosPack()
rospy.init_node("coordinator_non_adaptable")

problem_path = rospy.get_param('/coordinator_non_adaptable/problem_path', "problem.pddl")
experiment_batch = rospy.get_param('/coordinator_non_adaptable/experiment_batch', '0')
use_stn_tool = rospy.get_param('/coordinator_non_adaptable/stn_tool', True)
action_timeout_fraction = rospy.get_param('/coordinator_non_adaptable/action_timeout_fraction', 0.0)
output_directory = rospy.get_param('/coordinator_non_adaptable/output_directory', 0.0)

print("Coordinator using STN tool: %i"%(use_stn_tool))

goal_achieved = False
replans = 0
snap = time.time()
while not goal_achieved and replans<10:

    rospy.wait_for_service('/rosplan_problem_interface/problem_generation_server')
    rospy.wait_for_service('/rosplan_planner_interface/planning_server')
    rospy.wait_for_service('/rosplan_parsing_interface/parse_plan')
    rospy.wait_for_service('/rosplan_plan_dispatcher/dispatch_plan')
    rospy.wait_for_service('/rosplan_knowledge_base/state/propositions')
    rospy.wait_for_service('/sim_clock/set_time_scale')
    if use_stn_tool:
        rospy.wait_for_service('/run_STN')

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

            if use_stn_tool:
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


tool = "stntool" if use_stn_tool else "vanilla"
fname = "%s_result_batch_%s_%s_%s" % (os.path.basename(problem_path)[:-5], experiment_batch, tool, action_timeout_fraction)
file_path = os.path.join((os.path.expanduser(output_directory), fname))
elapsed = time.time() - snap
elapsed_sim = rospy.get_time()
success = "SUCCESS" if goal_achieved else "FAILED"
line = "%s, %s, %s, %s, %f, %f, %s, %d\n" % (os.path.basename(problem_path),
                                             experiment_batch, tool,
                                             action_timeout_fraction,
                                             elapsed, elapsed_sim,
                                             success, replans)
with open(os.path.expanduser(file_path), 'wt') as result:
    result.write(line)
print(line)

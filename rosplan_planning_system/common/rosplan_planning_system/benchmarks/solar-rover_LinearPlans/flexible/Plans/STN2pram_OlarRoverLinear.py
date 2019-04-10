#!/usr/bin/env python

import sys
from sets import Set
import re
import itertools

#open the plan for reading 
plan_file = open(sys.argv[1],"r")



# check to make sure that an argument is provided
if len(sys.argv) < 2:
  print ("Usage: python "+sys.argv[0]+" [plan_file]")
  quit()

# open stn file for writing
stn_file = open(sys.argv[1] + "_4pram.stn", "w") 


action_count= 0
#list of actions and their durations
dict_action = dict()
dict_start_action = dict()

for line in plan_file:
	if (line[0].isdigit() and line.find('(') > 0):
		stn_file.write("durative-action instance n" +  str(action_count) +" : " + line[line.find('('): line.find(')')] + ");\n")
		pra1= line.index(':')
		start_action= int(float(line[0:pra1])) 
		dict_start_action[str(action_count)] = start_action
		#stn_file.write(str(line[0]))
		pra2= line.index('[')+1
		pra3= line.index(']')
		dur_action= int(float(line[pra2:pra3]))
		dict_action[str(action_count)] = dur_action
		action_count += 1
# total number of actions
total_action = len(dict_action)


# the first node for STN plan
stn_file.write("c: n0.end - n0.start in [" + str(dict_action["0"]) + ","  + str(dict_action["0"])  + "];\n")
stn_file.write("c: n0.start - .zero in [0,0];\n")


k = 5;

	
# ActionCount= 0
plan_file.close()





for key,value in sorted (dict_action.iteritems()):
	val1 = int(key)
	#print(dict_action)
	if key != "0" and val1 < total_action:
		#print(val1)
		#adding parameter
		val2 = val1 - 1
		val3 = float(dict_action[key])
		#action sepration
		stn_file.write("c: n" + str(val1) + ".start - n" + str(val2) + ".end in [0.001,0.001];\n")
		#connect each action node to the zero (as we don't have dependencies)

		if val1 < k:
			stn_file.write("parameter dur_" + str(val1)+ ";\n")
			stn_file.write("c: n" + str(val1) + ".end - n" + str(val1) + ".start in [dur_" + str(val1) + ",dur_" + str(val1) + "];\n")
		
		
		else:
			stn_file.write("c: n" + str(val1) + ".end - n" + str(val1) + ".start in [" + str(val3) + "," + str(val3) + "];\n")
		
stn_file.close()
  
	


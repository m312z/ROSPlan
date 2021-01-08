#!/usr/bin/env python

import rospy
from rosplan_knowledge_msgs.srv import KnowledgeUpdateServiceArray, KnowledgeUpdateServiceArrayRequest
from rosplan_knowledge_msgs.srv import GetDomainPredicateDetailsService, GetDomainPredicateDetailsServiceRequest
from rosplan_knowledge_msgs.srv import GetDomainOperatorDetailsService, GetDomainOperatorDetailsServiceRequest
from rosplan_knowledge_msgs.srv import GetDomainAttributeService
from rosplan_knowledge_msgs.srv import GetAttributeService, GetAttributeServiceRequest
from rosplan_knowledge_msgs.srv import GetInstanceService, GetInstanceServiceRequest
from rosplan_knowledge_msgs.srv import SetNamedBool, SetNamedBoolRequest
from rosplan_knowledge_msgs.msg import KnowledgeItem
from diagnostic_msgs.msg import KeyValue

class RPKnowledgeBaseLink():

    def __init__(self):

        # initialise clients and publishers
        rospy.wait_for_service('/rosplan_knowledge_base/update_array')
        self.update_kb_srv = rospy.ServiceProxy('/rosplan_knowledge_base/update_array', KnowledgeUpdateServiceArray)

        rospy.wait_for_service('/rosplan_knowledge_base/domain/predicate_details')
        self.get_predicates_srv = rospy.ServiceProxy('/rosplan_knowledge_base/domain/predicate_details', GetDomainPredicateDetailsService)

        rospy.wait_for_service('/rosplan_knowledge_base/domain/operator_details')
        self.get_operator_details_srv = rospy.ServiceProxy('/rosplan_knowledge_base/domain/operator_details', GetDomainOperatorDetailsService)

        rospy.wait_for_service('/rosplan_knowledge_base/domain/functions')
        self.get_functions_srv = rospy.ServiceProxy('/rosplan_knowledge_base/domain/functions', GetDomainAttributeService)

        rospy.wait_for_service('/rosplan_knowledge_base/state/instances')
        self.get_instances_srv = rospy.ServiceProxy('/rosplan_knowledge_base/state/instances', GetInstanceService)

        rospy.wait_for_service('/rosplan_knowledge_base/state/propositions')
        self.get_state_propositions_srv = rospy.ServiceProxy('/rosplan_knowledge_base/state/propositions', GetAttributeService)

        rospy.wait_for_service('/rosplan_knowledge_base/state/functions')
        self.get_state_functions_srv = rospy.ServiceProxy('/rosplan_knowledge_base/state/functions', GetAttributeService)

        self.sensed_predicates = []

    # ===================== #
    # action effect methods #
    # ===================== #    

    # effect time variables
    AT_START = 0
    AT_END = 1

    def kb_apply_action_effects(self, pddl_action_msg, effect_time):

        # request object for update
        kus = KnowledgeUpdateServiceArrayRequest()

        # fetch operator details
        operator_name = pddl_action_msg.name.split(" ")[0]
        operator_details = self.get_kb_operator_details(operator_name)
        if not operator_details:
            rospy.logerr('KCL: (RPKnowledgeBaseLink) error fetching operator details from KB: {}'.format(e.message))
            return

        # set up operator parameters for use in effects
        bound_parameters = {}
        for op_parameter in operator_details.formula.typed_parameters:
            found = False
            for i in range(0, len(pddl_action_msg.parameters)):
                if op_parameter.key == pddl_action_msg.parameters[i].key:
                    bound_parameters[pddl_action_msg.parameters[i].key] = pddl_action_msg.parameters[i].value
                    found = True
                    break
            if not found:
                rospy.logerr('KCL: ({}) aborting applying action effect due to missing parameter, missing {}'.format(rospy.get_name(), op_parameter.key))
                return

        kus.knowledge = []
        kus.update_type = []
        if effect_time == self.AT_START:
            # At start add effects
            for eff in operator_details.at_start_add_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.ADD_KNOWLEDGE)

            # At start del effects
            for eff in operator_details.at_start_del_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.REMOVE_KNOWLEDGE)

        if effect_time == self.AT_END:
            # At end add effects
            for eff in operator_details.at_end_add_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.ADD_KNOWLEDGE)

            # At end del effects
            for eff in operator_details.at_end_del_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.REMOVE_KNOWLEDGE)

        self.update_kb(kus)

    def kb_undo_action_effects(self, pddl_action_msg, effect_time):

        # request object for update
        kus = KnowledgeUpdateServiceArrayRequest()

        # fetch operator details
        operator_name = pddl_action_msg.name.split(" ")[0]
        operator_details = self.get_kb_operator_details(operator_name)
        if not operator_details:
            rospy.logerr('KCL: (RPKnowledgeBaseLink) error fetching operator details from KB: {}'.format(e.message))
            return

        # set up operator parameters for use in effects
        bound_parameters = {}
        for op_parameter in operator_details.formula.typed_parameters:
            found = False
            for i in range(0, len(pddl_action_msg.parameters)):
                if op_parameter.key == pddl_action_msg.parameters[i].key:
                    bound_parameters[pddl_action_msg.parameters[i].key] = pddl_action_msg.parameters[i].value
                    found = True
                    break
            if not found:
                rospy.logerr('KCL: ({}) aborting applying action effect due to missing parameter, missing {}'.format(rospy.get_name(), op_parameter.key))
                return

        kus.knowledge = []
        kus.update_type = []
        if effect_time == self.AT_START:
            # At start add effects
            for eff in operator_details.at_start_add_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.REMOVE_KNOWLEDGE)

            # At start del effects
            for eff in operator_details.at_start_del_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.ADD_KNOWLEDGE)

        if effect_time == self.AT_END:
            # At end add effects
            for eff in operator_details.at_end_add_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.REMOVE_KNOWLEDGE)

            # At end del effects
            for eff in operator_details.at_end_del_effects:

                # if predicate name is sensed predicate, continue
                if eff.name in self.sensed_predicates:
                    continue

                # add effect to update
                item = self.ground_simple_effect(eff, bound_parameters)
                kus.knowledge.append(item)
                kus.update_type.append(kus.ADD_KNOWLEDGE)

        self.update_kb(kus)

    def ground_simple_effect(self, effect, bound_parameters):

        # TODO fetch predicate labels

        # bind objects from action message to effect predicate
        item = KnowledgeItem()
        item.knowledge_type = KnowledgeItem.FACT
        item.attribute_name = effect.name
        for j in range(0, len(effect.typed_parameters)):
            # set key (parameter label in predicate) and value (object bound to operator)
            pair = KeyValue()
            pair.key = "TODO THE LABEL"# self.predicates[self.op.at_start_del_effects[i].name].typed_parameters[j].key
            pair.value = bound_parameters[effect.typed_parameters[j].key]
            item.values.append(pair)

        return item

    # ================================== #
    # update service(s) to knowldge base #
    # ================================== #
        
    def update_kb(self, knowledge_update_service_request):
        if len(knowledge_update_service_request.update_type) > 0:
            try:
                self.update_kb_srv.call(knowledge_update_service_request)
            except Exception as e:
                rospy.logerr("KCL (SensingInterface) Failed to update knowledge base: %s" % e.message)

    # =============================== #
    # request data from knowldge base #
    # =============================== #

    def get_kb_attribute(self, attribute_name):
        # TODO error catching
        request = GetAttributeServiceRequest(attribute_name)
        ret = self.get_state_propositions_srv.call(request)
        if len(ret.attributes) > 0:
            return ret.attributes
        return self.get_state_functions_srv.call(request).attributes

    def get_kb_operator_details(self, operator_name):
        # TODO error catching
        request = GetDomainOperatorDetailsServiceRequest(operator_name)
        ret = self.get_operator_details_srv.call(request)
        return ret.op

    def get_kb_predicate_details(self, predicate_name):
        # TODO error catching
        request = GetDomainPredicateDetailsService(predicate_name)
        ret = self.get_predicates_srv.call(request)
        return ret.predicate


    def get_kb_function_details(self, predicate_name):
        # TODO error catching
        request = GetDomainPredicateDetailsService(predicate_name)
        ret = self.get_functions_srv.call(request)
        return ret.predicate

    def get_kb_function_parameters(self, func_name):
        # TODO error catching
        functions = self.get_functions_srv.call()
        for i in functions.items:
            if i.name == func_name:
                return i
        return None

    def get_kb_instances(self, type_name):
        # TODO error catching
        request = GetInstanceServiceRequest(type_name)
        ret = self.get_instances_srv.call()
        return ret.instances

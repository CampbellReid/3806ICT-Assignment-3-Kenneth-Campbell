import rospy
from assignment3.srv import ValidatePlan, ValidatePlanResponse

def validate_plan(req):
    # Validate the current plan based on the state
    valid = True  # Replace with actual validation logic
    return ValidatePlanResponse(valid)

def plan_validator_server():
    rospy.init_node('plan_validator_node')
    service = rospy.Service('validate_plan', ValidatePlan, validate_plan)
    rospy.spin()

if __name__ == "__main__":
    plan_validator_server()

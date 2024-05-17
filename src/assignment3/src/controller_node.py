import rospy
from assignment3.srv import ExecutePlan, ExecutePlanResponse

def execute_plan(req):
    # Execute the plan by sending commands to the environment
    # Simulate success for now
    success = True
    return ExecutePlanResponse(success)

def controller_server():
    rospy.init_node('controller_node')
    service = rospy.Service('execute_plan', ExecutePlan, execute_plan)
    rospy.spin()

if __name__ == "__main__":
    controller_server()

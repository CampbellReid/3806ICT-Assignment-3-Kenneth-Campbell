import rospy
from assignment3.srv import CreatePlan, CreatePlanResponse
from assignment3.msg import Waypoint

def create_plan(req):
    # Create a new plan based on the state and goals
    waypoint = Waypoint()
    waypoint.position.x = 3.0
    waypoint.position.y = 4.0
    res = CreatePlanResponse()
    res.plan.waypoints.append(waypoint)
    return res

def planner_server():
    rospy.init_node('planner_node')
    service = rospy.Service('create_plan', CreatePlan, create_plan)
    rospy.spin()

if __name__ == "__main__":
    planner_server()

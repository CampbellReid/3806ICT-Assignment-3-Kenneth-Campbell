import rospy
from assignment3.srv import UpdateGoals, UpdateGoalsResponse
from assignment3.msg import Goal

def update_goals(req):
    # Update and prioritize goals based on feedback
    goal = Goal()
    goal.description = "New goal"
    goal.priority = 1
    res = UpdateGoalsResponse()
    res.goals.primary_goals.append(goal)
    return res

def goal_manager_server():
    rospy.init_node('goal_manager_node')
    service = rospy.Service('update_goals', UpdateGoals, update_goals)
    rospy.spin()

if __name__ == "__main__":
    goal_manager_server()

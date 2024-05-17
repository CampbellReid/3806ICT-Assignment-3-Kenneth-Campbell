;; Auto-generated. Do not edit!


(when (boundp 'assignment3::CreatePlan)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'CreatePlan (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::CREATEPLAN")
  (make-package "ASSIGNMENT3::CREATEPLAN"))
(unless (find-package "ASSIGNMENT3::CREATEPLANREQUEST")
  (make-package "ASSIGNMENT3::CREATEPLANREQUEST"))
(unless (find-package "ASSIGNMENT3::CREATEPLANRESPONSE")
  (make-package "ASSIGNMENT3::CREATEPLANRESPONSE"))

(in-package "ROS")





(defclass assignment3::CreatePlanRequest
  :super ros::object
  :slots (_state _goals ))

(defmethod assignment3::CreatePlanRequest
  (:init
   (&key
    ((:state __state) (instance assignment3::State :init))
    ((:goals __goals) (instance assignment3::Goals :init))
    )
   (send-super :init)
   (setq _state __state)
   (setq _goals __goals)
   self)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:goals
   (&rest __goals)
   (if (keywordp (car __goals))
       (send* _goals __goals)
     (progn
       (if __goals (setq _goals (car __goals)))
       _goals)))
  (:serialization-length
   ()
   (+
    ;; assignment3/State _state
    (send _state :serialization-length)
    ;; assignment3/Goals _goals
    (send _goals :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/State _state
       (send _state :serialize s)
     ;; assignment3/Goals _goals
       (send _goals :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/State _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;; assignment3/Goals _goals
     (send _goals :deserialize buf ptr-) (incf ptr- (send _goals :serialization-length))
   ;;
   self)
  )

(defclass assignment3::CreatePlanResponse
  :super ros::object
  :slots (_plan ))

(defmethod assignment3::CreatePlanResponse
  (:init
   (&key
    ((:plan __plan) (instance assignment3::Plan :init))
    )
   (send-super :init)
   (setq _plan __plan)
   self)
  (:plan
   (&rest __plan)
   (if (keywordp (car __plan))
       (send* _plan __plan)
     (progn
       (if __plan (setq _plan (car __plan)))
       _plan)))
  (:serialization-length
   ()
   (+
    ;; assignment3/Plan _plan
    (send _plan :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/Plan _plan
       (send _plan :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/Plan _plan
     (send _plan :deserialize buf ptr-) (incf ptr- (send _plan :serialization-length))
   ;;
   self)
  )

(defclass assignment3::CreatePlan
  :super ros::object
  :slots ())

(setf (get assignment3::CreatePlan :md5sum-) "f5bba44cc5e16145329a21e1c3c0c658")
(setf (get assignment3::CreatePlan :datatype-) "assignment3/CreatePlan")
(setf (get assignment3::CreatePlan :request) assignment3::CreatePlanRequest)
(setf (get assignment3::CreatePlan :response) assignment3::CreatePlanResponse)

(defmethod assignment3::CreatePlanRequest
  (:response () (instance assignment3::CreatePlanResponse :init)))

(setf (get assignment3::CreatePlanRequest :md5sum-) "f5bba44cc5e16145329a21e1c3c0c658")
(setf (get assignment3::CreatePlanRequest :datatype-) "assignment3/CreatePlanRequest")
(setf (get assignment3::CreatePlanRequest :definition-)
      "State state
Goals goals

================================================================================
MSG: assignment3/State
geometry_msgs/Point current_position
Map environment_map

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: assignment3/Map
geometry_msgs/Point[] obstacle_positions

================================================================================
MSG: assignment3/Goals
Goal[] primary_goals
Goal[] secondary_goals

================================================================================
MSG: assignment3/Goal
string description
int32 priority
geometry_msgs/Point[] waypoints
---
Plan plan


================================================================================
MSG: assignment3/Plan
Waypoint[] waypoints

================================================================================
MSG: assignment3/Waypoint
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get assignment3::CreatePlanResponse :md5sum-) "f5bba44cc5e16145329a21e1c3c0c658")
(setf (get assignment3::CreatePlanResponse :datatype-) "assignment3/CreatePlanResponse")
(setf (get assignment3::CreatePlanResponse :definition-)
      "State state
Goals goals

================================================================================
MSG: assignment3/State
geometry_msgs/Point current_position
Map environment_map

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: assignment3/Map
geometry_msgs/Point[] obstacle_positions

================================================================================
MSG: assignment3/Goals
Goal[] primary_goals
Goal[] secondary_goals

================================================================================
MSG: assignment3/Goal
string description
int32 priority
geometry_msgs/Point[] waypoints
---
Plan plan


================================================================================
MSG: assignment3/Plan
Waypoint[] waypoints

================================================================================
MSG: assignment3/Waypoint
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :assignment3/CreatePlan "f5bba44cc5e16145329a21e1c3c0c658")



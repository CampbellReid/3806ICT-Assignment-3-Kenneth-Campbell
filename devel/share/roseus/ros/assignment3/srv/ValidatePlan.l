;; Auto-generated. Do not edit!


(when (boundp 'assignment3::ValidatePlan)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'ValidatePlan (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::VALIDATEPLAN")
  (make-package "ASSIGNMENT3::VALIDATEPLAN"))
(unless (find-package "ASSIGNMENT3::VALIDATEPLANREQUEST")
  (make-package "ASSIGNMENT3::VALIDATEPLANREQUEST"))
(unless (find-package "ASSIGNMENT3::VALIDATEPLANRESPONSE")
  (make-package "ASSIGNMENT3::VALIDATEPLANRESPONSE"))

(in-package "ROS")





(defclass assignment3::ValidatePlanRequest
  :super ros::object
  :slots (_plan _state ))

(defmethod assignment3::ValidatePlanRequest
  (:init
   (&key
    ((:plan __plan) (instance assignment3::Plan :init))
    ((:state __state) (instance assignment3::State :init))
    )
   (send-super :init)
   (setq _plan __plan)
   (setq _state __state)
   self)
  (:plan
   (&rest __plan)
   (if (keywordp (car __plan))
       (send* _plan __plan)
     (progn
       (if __plan (setq _plan (car __plan)))
       _plan)))
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; assignment3/Plan _plan
    (send _plan :serialization-length)
    ;; assignment3/State _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/Plan _plan
       (send _plan :serialize s)
     ;; assignment3/State _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/Plan _plan
     (send _plan :deserialize buf ptr-) (incf ptr- (send _plan :serialization-length))
   ;; assignment3/State _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(defclass assignment3::ValidatePlanResponse
  :super ros::object
  :slots (_valid ))

(defmethod assignment3::ValidatePlanResponse
  (:init
   (&key
    ((:valid __valid) nil)
    )
   (send-super :init)
   (setq _valid __valid)
   self)
  (:valid
   (&optional (__valid :null))
   (if (not (eq __valid :null)) (setq _valid __valid)) _valid)
  (:serialization-length
   ()
   (+
    ;; bool _valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass assignment3::ValidatePlan
  :super ros::object
  :slots ())

(setf (get assignment3::ValidatePlan :md5sum-) "3d213886e8ff3dea48868fcfa2e522da")
(setf (get assignment3::ValidatePlan :datatype-) "assignment3/ValidatePlan")
(setf (get assignment3::ValidatePlan :request) assignment3::ValidatePlanRequest)
(setf (get assignment3::ValidatePlan :response) assignment3::ValidatePlanResponse)

(defmethod assignment3::ValidatePlanRequest
  (:response () (instance assignment3::ValidatePlanResponse :init)))

(setf (get assignment3::ValidatePlanRequest :md5sum-) "3d213886e8ff3dea48868fcfa2e522da")
(setf (get assignment3::ValidatePlanRequest :datatype-) "assignment3/ValidatePlanRequest")
(setf (get assignment3::ValidatePlanRequest :definition-)
      "Plan plan
State state

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

================================================================================
MSG: assignment3/State
geometry_msgs/Point current_position
Map environment_map

================================================================================
MSG: assignment3/Map
geometry_msgs/Point[] obstacle_positions
---
bool valid

")

(setf (get assignment3::ValidatePlanResponse :md5sum-) "3d213886e8ff3dea48868fcfa2e522da")
(setf (get assignment3::ValidatePlanResponse :datatype-) "assignment3/ValidatePlanResponse")
(setf (get assignment3::ValidatePlanResponse :definition-)
      "Plan plan
State state

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

================================================================================
MSG: assignment3/State
geometry_msgs/Point current_position
Map environment_map

================================================================================
MSG: assignment3/Map
geometry_msgs/Point[] obstacle_positions
---
bool valid

")



(provide :assignment3/ValidatePlan "3d213886e8ff3dea48868fcfa2e522da")



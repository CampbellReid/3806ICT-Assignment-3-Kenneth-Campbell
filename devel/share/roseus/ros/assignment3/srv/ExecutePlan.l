;; Auto-generated. Do not edit!


(when (boundp 'assignment3::ExecutePlan)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'ExecutePlan (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::EXECUTEPLAN")
  (make-package "ASSIGNMENT3::EXECUTEPLAN"))
(unless (find-package "ASSIGNMENT3::EXECUTEPLANREQUEST")
  (make-package "ASSIGNMENT3::EXECUTEPLANREQUEST"))
(unless (find-package "ASSIGNMENT3::EXECUTEPLANRESPONSE")
  (make-package "ASSIGNMENT3::EXECUTEPLANRESPONSE"))

(in-package "ROS")





(defclass assignment3::ExecutePlanRequest
  :super ros::object
  :slots (_plan ))

(defmethod assignment3::ExecutePlanRequest
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

(defclass assignment3::ExecutePlanResponse
  :super ros::object
  :slots (_success ))

(defmethod assignment3::ExecutePlanResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass assignment3::ExecutePlan
  :super ros::object
  :slots ())

(setf (get assignment3::ExecutePlan :md5sum-) "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(setf (get assignment3::ExecutePlan :datatype-) "assignment3/ExecutePlan")
(setf (get assignment3::ExecutePlan :request) assignment3::ExecutePlanRequest)
(setf (get assignment3::ExecutePlan :response) assignment3::ExecutePlanResponse)

(defmethod assignment3::ExecutePlanRequest
  (:response () (instance assignment3::ExecutePlanResponse :init)))

(setf (get assignment3::ExecutePlanRequest :md5sum-) "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(setf (get assignment3::ExecutePlanRequest :datatype-) "assignment3/ExecutePlanRequest")
(setf (get assignment3::ExecutePlanRequest :definition-)
      "Plan plan

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
---
bool success

")

(setf (get assignment3::ExecutePlanResponse :md5sum-) "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(setf (get assignment3::ExecutePlanResponse :datatype-) "assignment3/ExecutePlanResponse")
(setf (get assignment3::ExecutePlanResponse :definition-)
      "Plan plan

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
---
bool success

")



(provide :assignment3/ExecutePlan "eaee7ab4e67b6b1fb802cc08dec8e9d9")



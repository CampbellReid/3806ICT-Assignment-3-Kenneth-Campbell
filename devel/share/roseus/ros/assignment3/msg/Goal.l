;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Goal)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Goal (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::GOAL")
  (make-package "ASSIGNMENT3::GOAL"))

(in-package "ROS")
;;//! \htmlinclude Goal.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::Goal
  :super ros::object
  :slots (_description _priority _waypoints ))

(defmethod assignment3::Goal
  (:init
   (&key
    ((:description __description) "")
    ((:priority __priority) 0)
    ((:waypoints __waypoints) ())
    )
   (send-super :init)
   (setq _description (string __description))
   (setq _priority (round __priority))
   (setq _waypoints __waypoints)
   self)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:priority
   (&optional __priority)
   (if __priority (setq _priority __priority)) _priority)
  (:waypoints
   (&rest __waypoints)
   (if (keywordp (car __waypoints))
       (send* _waypoints __waypoints)
     (progn
       (if __waypoints (setq _waypoints (car __waypoints)))
       _waypoints)))
  (:serialization-length
   ()
   (+
    ;; string _description
    4 (length _description)
    ;; int32 _priority
    4
    ;; geometry_msgs/Point[] _waypoints
    (apply #'+ (send-all _waypoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;; int32 _priority
       (write-long _priority s)
     ;; geometry_msgs/Point[] _waypoints
     (write-long (length _waypoints) s)
     (dolist (elem _waypoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _priority
     (setq _priority (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point[] _waypoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoints (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _waypoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get assignment3::Goal :md5sum-) "1536c8d5a376720204f5d100ab20ac1d")
(setf (get assignment3::Goal :datatype-) "assignment3/Goal")
(setf (get assignment3::Goal :definition-)
      "string description
int32 priority
geometry_msgs/Point[] waypoints

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :assignment3/Goal "1536c8d5a376720204f5d100ab20ac1d")



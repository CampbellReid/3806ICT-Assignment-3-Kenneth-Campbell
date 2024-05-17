;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Plan)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Plan (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::PLAN")
  (make-package "ASSIGNMENT3::PLAN"))

(in-package "ROS")
;;//! \htmlinclude Plan.msg.html


(defclass assignment3::Plan
  :super ros::object
  :slots (_waypoints ))

(defmethod assignment3::Plan
  (:init
   (&key
    ((:waypoints __waypoints) ())
    )
   (send-super :init)
   (setq _waypoints __waypoints)
   self)
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
    ;; assignment3/Waypoint[] _waypoints
    (apply #'+ (send-all _waypoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/Waypoint[] _waypoints
     (write-long (length _waypoints) s)
     (dolist (elem _waypoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/Waypoint[] _waypoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoints (let (r) (dotimes (i n) (push (instance assignment3::Waypoint :init) r)) r))
     (dolist (elem- _waypoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get assignment3::Plan :md5sum-) "ad845bc5f5576ca4f988307129e2452d")
(setf (get assignment3::Plan :datatype-) "assignment3/Plan")
(setf (get assignment3::Plan :definition-)
      "Waypoint[] waypoints

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



(provide :assignment3/Plan "ad845bc5f5576ca4f988307129e2452d")



;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Waypoint)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Waypoint (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::WAYPOINT")
  (make-package "ASSIGNMENT3::WAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude Waypoint.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::Waypoint
  :super ros::object
  :slots (_position ))

(defmethod assignment3::Waypoint
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get assignment3::Waypoint :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get assignment3::Waypoint :datatype-) "assignment3/Waypoint")
(setf (get assignment3::Waypoint :definition-)
      "geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :assignment3/Waypoint "e7bb0ef028c744b081acdc57743b11d8")



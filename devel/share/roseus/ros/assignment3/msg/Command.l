;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Command)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Command (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::COMMAND")
  (make-package "ASSIGNMENT3::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude Command.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::Command
  :super ros::object
  :slots (_target_position _target_speed ))

(defmethod assignment3::Command
  (:init
   (&key
    ((:target_position __target_position) (instance geometry_msgs::Point :init))
    ((:target_speed __target_speed) 0.0)
    )
   (send-super :init)
   (setq _target_position __target_position)
   (setq _target_speed (float __target_speed))
   self)
  (:target_position
   (&rest __target_position)
   (if (keywordp (car __target_position))
       (send* _target_position __target_position)
     (progn
       (if __target_position (setq _target_position (car __target_position)))
       _target_position)))
  (:target_speed
   (&optional __target_speed)
   (if __target_speed (setq _target_speed __target_speed)) _target_speed)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _target_position
    (send _target_position :serialization-length)
    ;; float32 _target_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _target_position
       (send _target_position :serialize s)
     ;; float32 _target_speed
       (sys::poke _target_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _target_position
     (send _target_position :deserialize buf ptr-) (incf ptr- (send _target_position :serialization-length))
   ;; float32 _target_speed
     (setq _target_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get assignment3::Command :md5sum-) "b6e48e0f01c18d28e055fd89413db754")
(setf (get assignment3::Command :datatype-) "assignment3/Command")
(setf (get assignment3::Command :definition-)
      "geometry_msgs/Point target_position
float32 target_speed

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :assignment3/Command "b6e48e0f01c18d28e055fd89413db754")



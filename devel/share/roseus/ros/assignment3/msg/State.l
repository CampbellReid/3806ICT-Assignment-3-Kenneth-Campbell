;; Auto-generated. Do not edit!


(when (boundp 'assignment3::State)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'State (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::STATE")
  (make-package "ASSIGNMENT3::STATE"))

(in-package "ROS")
;;//! \htmlinclude State.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::State
  :super ros::object
  :slots (_current_position _environment_map ))

(defmethod assignment3::State
  (:init
   (&key
    ((:current_position __current_position) (instance geometry_msgs::Point :init))
    ((:environment_map __environment_map) (instance assignment3::Map :init))
    )
   (send-super :init)
   (setq _current_position __current_position)
   (setq _environment_map __environment_map)
   self)
  (:current_position
   (&rest __current_position)
   (if (keywordp (car __current_position))
       (send* _current_position __current_position)
     (progn
       (if __current_position (setq _current_position (car __current_position)))
       _current_position)))
  (:environment_map
   (&rest __environment_map)
   (if (keywordp (car __environment_map))
       (send* _environment_map __environment_map)
     (progn
       (if __environment_map (setq _environment_map (car __environment_map)))
       _environment_map)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _current_position
    (send _current_position :serialization-length)
    ;; assignment3/Map _environment_map
    (send _environment_map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _current_position
       (send _current_position :serialize s)
     ;; assignment3/Map _environment_map
       (send _environment_map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _current_position
     (send _current_position :deserialize buf ptr-) (incf ptr- (send _current_position :serialization-length))
   ;; assignment3/Map _environment_map
     (send _environment_map :deserialize buf ptr-) (incf ptr- (send _environment_map :serialization-length))
   ;;
   self)
  )

(setf (get assignment3::State :md5sum-) "9ed7a5ab0f77624d96ff4cc104c195a8")
(setf (get assignment3::State :datatype-) "assignment3/State")
(setf (get assignment3::State :definition-)
      "geometry_msgs/Point current_position
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

")



(provide :assignment3/State "9ed7a5ab0f77624d96ff4cc104c195a8")



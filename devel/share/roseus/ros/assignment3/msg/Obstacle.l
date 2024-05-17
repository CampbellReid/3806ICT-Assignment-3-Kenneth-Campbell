;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Obstacle)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Obstacle (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::OBSTACLE")
  (make-package "ASSIGNMENT3::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude Obstacle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::Obstacle
  :super ros::object
  :slots (_position _size ))

(defmethod assignment3::Obstacle
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:size __size) 0.0)
    )
   (send-super :init)
   (setq _position __position)
   (setq _size (float __size))
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; float32 _size
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; float32 _size
       (sys::poke _size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float32 _size
     (setq _size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get assignment3::Obstacle :md5sum-) "726a1872b6a225d0af03b0427f4f8d20")
(setf (get assignment3::Obstacle :datatype-) "assignment3/Obstacle")
(setf (get assignment3::Obstacle :definition-)
      "geometry_msgs/Point position
float32 size

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :assignment3/Obstacle "726a1872b6a225d0af03b0427f4f8d20")



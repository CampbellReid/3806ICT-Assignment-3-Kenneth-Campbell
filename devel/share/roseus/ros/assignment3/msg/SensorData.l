;; Auto-generated. Do not edit!


(when (boundp 'assignment3::SensorData)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'SensorData (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::SENSORDATA")
  (make-package "ASSIGNMENT3::SENSORDATA"))

(in-package "ROS")
;;//! \htmlinclude SensorData.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::SensorData
  :super ros::object
  :slots (_position _speed _obstacles ))

(defmethod assignment3::SensorData
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:speed __speed) 0.0)
    ((:obstacles __obstacles) ())
    )
   (send-super :init)
   (setq _position __position)
   (setq _speed (float __speed))
   (setq _obstacles __obstacles)
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; float32 _speed
    4
    ;; assignment3/Obstacle[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; assignment3/Obstacle[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; assignment3/Obstacle[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance assignment3::Obstacle :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get assignment3::SensorData :md5sum-) "a03770c3aed274e9b2c5466968320a9b")
(setf (get assignment3::SensorData :datatype-) "assignment3/SensorData")
(setf (get assignment3::SensorData :definition-)
      "geometry_msgs/Point position
float32 speed
Obstacle[] obstacles

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: assignment3/Obstacle
geometry_msgs/Point position
float32 size

")



(provide :assignment3/SensorData "a03770c3aed274e9b2c5466968320a9b")



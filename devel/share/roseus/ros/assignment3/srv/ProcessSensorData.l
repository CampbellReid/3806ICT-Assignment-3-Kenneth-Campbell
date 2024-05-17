;; Auto-generated. Do not edit!


(when (boundp 'assignment3::ProcessSensorData)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'ProcessSensorData (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::PROCESSSENSORDATA")
  (make-package "ASSIGNMENT3::PROCESSSENSORDATA"))
(unless (find-package "ASSIGNMENT3::PROCESSSENSORDATAREQUEST")
  (make-package "ASSIGNMENT3::PROCESSSENSORDATAREQUEST"))
(unless (find-package "ASSIGNMENT3::PROCESSSENSORDATARESPONSE")
  (make-package "ASSIGNMENT3::PROCESSSENSORDATARESPONSE"))

(in-package "ROS")





(defclass assignment3::ProcessSensorDataRequest
  :super ros::object
  :slots (_data ))

(defmethod assignment3::ProcessSensorDataRequest
  (:init
   (&key
    ((:data __data) (instance assignment3::SensorData :init))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; assignment3/SensorData _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/SensorData _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/SensorData _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(defclass assignment3::ProcessSensorDataResponse
  :super ros::object
  :slots (_state ))

(defmethod assignment3::ProcessSensorDataResponse
  (:init
   (&key
    ((:state __state) (instance assignment3::State :init))
    )
   (send-super :init)
   (setq _state __state)
   self)
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
    ;; assignment3/State _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/State _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/State _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(defclass assignment3::ProcessSensorData
  :super ros::object
  :slots ())

(setf (get assignment3::ProcessSensorData :md5sum-) "c62a3bb50e5a12b840b3112c4065ba79")
(setf (get assignment3::ProcessSensorData :datatype-) "assignment3/ProcessSensorData")
(setf (get assignment3::ProcessSensorData :request) assignment3::ProcessSensorDataRequest)
(setf (get assignment3::ProcessSensorData :response) assignment3::ProcessSensorDataResponse)

(defmethod assignment3::ProcessSensorDataRequest
  (:response () (instance assignment3::ProcessSensorDataResponse :init)))

(setf (get assignment3::ProcessSensorDataRequest :md5sum-) "c62a3bb50e5a12b840b3112c4065ba79")
(setf (get assignment3::ProcessSensorDataRequest :datatype-) "assignment3/ProcessSensorDataRequest")
(setf (get assignment3::ProcessSensorDataRequest :definition-)
      "SensorData data

================================================================================
MSG: assignment3/SensorData
geometry_msgs/Point position
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
---
State state


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
")

(setf (get assignment3::ProcessSensorDataResponse :md5sum-) "c62a3bb50e5a12b840b3112c4065ba79")
(setf (get assignment3::ProcessSensorDataResponse :datatype-) "assignment3/ProcessSensorDataResponse")
(setf (get assignment3::ProcessSensorDataResponse :definition-)
      "SensorData data

================================================================================
MSG: assignment3/SensorData
geometry_msgs/Point position
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
---
State state


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
")



(provide :assignment3/ProcessSensorData "c62a3bb50e5a12b840b3112c4065ba79")



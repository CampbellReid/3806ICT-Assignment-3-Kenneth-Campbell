;; Auto-generated. Do not edit!


(when (boundp 'assignment3::CollectData)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'CollectData (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::COLLECTDATA")
  (make-package "ASSIGNMENT3::COLLECTDATA"))
(unless (find-package "ASSIGNMENT3::COLLECTDATAREQUEST")
  (make-package "ASSIGNMENT3::COLLECTDATAREQUEST"))
(unless (find-package "ASSIGNMENT3::COLLECTDATARESPONSE")
  (make-package "ASSIGNMENT3::COLLECTDATARESPONSE"))

(in-package "ROS")





(defclass assignment3::CollectDataRequest
  :super ros::object
  :slots ())

(defmethod assignment3::CollectDataRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass assignment3::CollectDataResponse
  :super ros::object
  :slots (_data ))

(defmethod assignment3::CollectDataResponse
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

(defclass assignment3::CollectData
  :super ros::object
  :slots ())

(setf (get assignment3::CollectData :md5sum-) "0b05c236c4d2e3f6f6d7b02102165372")
(setf (get assignment3::CollectData :datatype-) "assignment3/CollectData")
(setf (get assignment3::CollectData :request) assignment3::CollectDataRequest)
(setf (get assignment3::CollectData :response) assignment3::CollectDataResponse)

(defmethod assignment3::CollectDataRequest
  (:response () (instance assignment3::CollectDataResponse :init)))

(setf (get assignment3::CollectDataRequest :md5sum-) "0b05c236c4d2e3f6f6d7b02102165372")
(setf (get assignment3::CollectDataRequest :datatype-) "assignment3/CollectDataRequest")
(setf (get assignment3::CollectDataRequest :definition-)
      "---
SensorData data


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
")

(setf (get assignment3::CollectDataResponse :md5sum-) "0b05c236c4d2e3f6f6d7b02102165372")
(setf (get assignment3::CollectDataResponse :datatype-) "assignment3/CollectDataResponse")
(setf (get assignment3::CollectDataResponse :definition-)
      "---
SensorData data


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
")



(provide :assignment3/CollectData "0b05c236c4d2e3f6f6d7b02102165372")



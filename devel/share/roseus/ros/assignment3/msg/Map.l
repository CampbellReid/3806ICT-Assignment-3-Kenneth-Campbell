;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Map)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Map (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::MAP")
  (make-package "ASSIGNMENT3::MAP"))

(in-package "ROS")
;;//! \htmlinclude Map.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass assignment3::Map
  :super ros::object
  :slots (_obstacle_positions ))

(defmethod assignment3::Map
  (:init
   (&key
    ((:obstacle_positions __obstacle_positions) ())
    )
   (send-super :init)
   (setq _obstacle_positions __obstacle_positions)
   self)
  (:obstacle_positions
   (&rest __obstacle_positions)
   (if (keywordp (car __obstacle_positions))
       (send* _obstacle_positions __obstacle_positions)
     (progn
       (if __obstacle_positions (setq _obstacle_positions (car __obstacle_positions)))
       _obstacle_positions)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _obstacle_positions
    (apply #'+ (send-all _obstacle_positions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _obstacle_positions
     (write-long (length _obstacle_positions) s)
     (dolist (elem _obstacle_positions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _obstacle_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacle_positions (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _obstacle_positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get assignment3::Map :md5sum-) "e5fca51cc9da81dd3cbc4f12a389770c")
(setf (get assignment3::Map :datatype-) "assignment3/Map")
(setf (get assignment3::Map :definition-)
      "geometry_msgs/Point[] obstacle_positions

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :assignment3/Map "e5fca51cc9da81dd3cbc4f12a389770c")



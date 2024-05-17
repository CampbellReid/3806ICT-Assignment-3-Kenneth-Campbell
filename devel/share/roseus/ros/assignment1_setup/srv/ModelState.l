;; Auto-generated. Do not edit!


(when (boundp 'assignment1_setup::ModelState)
  (if (not (find-package "ASSIGNMENT1_SETUP"))
    (make-package "ASSIGNMENT1_SETUP"))
  (shadow 'ModelState (find-package "ASSIGNMENT1_SETUP")))
(unless (find-package "ASSIGNMENT1_SETUP::MODELSTATE")
  (make-package "ASSIGNMENT1_SETUP::MODELSTATE"))
(unless (find-package "ASSIGNMENT1_SETUP::MODELSTATEREQUEST")
  (make-package "ASSIGNMENT1_SETUP::MODELSTATEREQUEST"))
(unless (find-package "ASSIGNMENT1_SETUP::MODELSTATERESPONSE")
  (make-package "ASSIGNMENT1_SETUP::MODELSTATERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass assignment1_setup::ModelStateRequest
  :super ros::object
  :slots ())

(defmethod assignment1_setup::ModelStateRequest
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

(defclass assignment1_setup::ModelStateResponse
  :super ros::object
  :slots (_header _location _covariance _success _status_message ))

(defmethod assignment1_setup::ModelStateResponse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:location __location) (instance geometry_msgs::Point :init))
    ((:covariance __covariance) ())
    ((:success __success) nil)
    ((:status_message __status_message) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _location __location)
   (setq _covariance __covariance)
   (setq _success __success)
   (setq _status_message (string __status_message))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:location
   (&rest __location)
   (if (keywordp (car __location))
       (send* _location __location)
     (progn
       (if __location (setq _location (car __location)))
       _location)))
  (:covariance
   (&rest __covariance)
   (if (keywordp (car __covariance))
       (send* _covariance __covariance)
     (progn
       (if __covariance (setq _covariance (car __covariance)))
       _covariance)))
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:status_message
   (&optional __status_message)
   (if __status_message (setq _status_message __status_message)) _status_message)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _location
    (send _location :serialization-length)
    ;; geometry_msgs/Vector3[] _covariance
    (apply #'+ (send-all _covariance :serialization-length)) 4
    ;; bool _success
    1
    ;; string _status_message
    4 (length _status_message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _location
       (send _location :serialize s)
     ;; geometry_msgs/Vector3[] _covariance
     (write-long (length _covariance) s)
     (dolist (elem _covariance)
       (send elem :serialize s)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _status_message
       (write-long (length _status_message) s) (princ _status_message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; geometry_msgs/Vector3[] _covariance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _covariance (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _covariance)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _status_message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status_message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignment1_setup::ModelState
  :super ros::object
  :slots ())

(setf (get assignment1_setup::ModelState :md5sum-) "62bdec03e9c27985cd2c0808e297c5db")
(setf (get assignment1_setup::ModelState :datatype-) "assignment1_setup/ModelState")
(setf (get assignment1_setup::ModelState :request) assignment1_setup::ModelStateRequest)
(setf (get assignment1_setup::ModelState :response) assignment1_setup::ModelStateResponse)

(defmethod assignment1_setup::ModelStateRequest
  (:response () (instance assignment1_setup::ModelStateResponse :init)))

(setf (get assignment1_setup::ModelStateRequest :md5sum-) "62bdec03e9c27985cd2c0808e297c5db")
(setf (get assignment1_setup::ModelStateRequest :datatype-) "assignment1_setup/ModelStateRequest")
(setf (get assignment1_setup::ModelStateRequest :definition-)
      "---
Header header                        # Standard metadata for higher-level stamped data types.
                                     # * header.seq holds the number of requests since the plugin started
                                     # * header.stamp timestamp related to the pose
                                     # * header.frame_id not used but currently filled with the relative_entity_name
geometry_msgs/Point location         # The position of the robot
geometry_msgs/Vector3[] covariance   # The covariance matrix [[XX, XY, XZ], [YX, YY, YZ], [ZX, ZY, ZZ]]
bool success                         # return true if successful
string status_message                # comments if available


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get assignment1_setup::ModelStateResponse :md5sum-) "62bdec03e9c27985cd2c0808e297c5db")
(setf (get assignment1_setup::ModelStateResponse :datatype-) "assignment1_setup/ModelStateResponse")
(setf (get assignment1_setup::ModelStateResponse :definition-)
      "---
Header header                        # Standard metadata for higher-level stamped data types.
                                     # * header.seq holds the number of requests since the plugin started
                                     # * header.stamp timestamp related to the pose
                                     # * header.frame_id not used but currently filled with the relative_entity_name
geometry_msgs/Point location         # The position of the robot
geometry_msgs/Vector3[] covariance   # The covariance matrix [[XX, XY, XZ], [YX, YY, YZ], [ZX, ZY, ZZ]]
bool success                         # return true if successful
string status_message                # comments if available


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :assignment1_setup/ModelState "62bdec03e9c27985cd2c0808e297c5db")



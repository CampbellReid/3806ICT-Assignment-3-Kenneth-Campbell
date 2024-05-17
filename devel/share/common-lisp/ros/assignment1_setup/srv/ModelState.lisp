; Auto-generated. Do not edit!


(cl:in-package assignment1_setup-srv)


;//! \htmlinclude ModelState-request.msg.html

(cl:defclass <ModelState-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ModelState-request (<ModelState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModelState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModelState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1_setup-srv:<ModelState-request> is deprecated: use assignment1_setup-srv:ModelState-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModelState-request>) ostream)
  "Serializes a message object of type '<ModelState-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModelState-request>) istream)
  "Deserializes a message object of type '<ModelState-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModelState-request>)))
  "Returns string type for a service object of type '<ModelState-request>"
  "assignment1_setup/ModelStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelState-request)))
  "Returns string type for a service object of type 'ModelState-request"
  "assignment1_setup/ModelStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModelState-request>)))
  "Returns md5sum for a message object of type '<ModelState-request>"
  "62bdec03e9c27985cd2c0808e297c5db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModelState-request)))
  "Returns md5sum for a message object of type 'ModelState-request"
  "62bdec03e9c27985cd2c0808e297c5db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModelState-request>)))
  "Returns full string definition for message of type '<ModelState-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModelState-request)))
  "Returns full string definition for message of type 'ModelState-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModelState-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModelState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ModelState-request
))
;//! \htmlinclude ModelState-response.msg.html

(cl:defclass <ModelState-response> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (location
    :reader location
    :initarg :location
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (covariance
    :reader covariance
    :initarg :covariance
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3)))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (status_message
    :reader status_message
    :initarg :status_message
    :type cl:string
    :initform ""))
)

(cl:defclass ModelState-response (<ModelState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModelState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModelState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1_setup-srv:<ModelState-response> is deprecated: use assignment1_setup-srv:ModelState-response instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ModelState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-srv:header-val is deprecated.  Use assignment1_setup-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <ModelState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-srv:location-val is deprecated.  Use assignment1_setup-srv:location instead.")
  (location m))

(cl:ensure-generic-function 'covariance-val :lambda-list '(m))
(cl:defmethod covariance-val ((m <ModelState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-srv:covariance-val is deprecated.  Use assignment1_setup-srv:covariance instead.")
  (covariance m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ModelState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-srv:success-val is deprecated.  Use assignment1_setup-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'status_message-val :lambda-list '(m))
(cl:defmethod status_message-val ((m <ModelState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-srv:status_message-val is deprecated.  Use assignment1_setup-srv:status_message instead.")
  (status_message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModelState-response>) ostream)
  "Serializes a message object of type '<ModelState-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'covariance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'covariance))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status_message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status_message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModelState-response>) istream)
  "Deserializes a message object of type '<ModelState-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'covariance) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'covariance)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status_message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModelState-response>)))
  "Returns string type for a service object of type '<ModelState-response>"
  "assignment1_setup/ModelStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelState-response)))
  "Returns string type for a service object of type 'ModelState-response"
  "assignment1_setup/ModelStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModelState-response>)))
  "Returns md5sum for a message object of type '<ModelState-response>"
  "62bdec03e9c27985cd2c0808e297c5db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModelState-response)))
  "Returns md5sum for a message object of type 'ModelState-response"
  "62bdec03e9c27985cd2c0808e297c5db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModelState-response>)))
  "Returns full string definition for message of type '<ModelState-response>"
  (cl:format cl:nil "Header header                        # Standard metadata for higher-level stamped data types.~%                                     # * header.seq holds the number of requests since the plugin started~%                                     # * header.stamp timestamp related to the pose~%                                     # * header.frame_id not used but currently filled with the relative_entity_name~%geometry_msgs/Point location         # The position of the robot~%geometry_msgs/Vector3[] covariance   # The covariance matrix [[XX, XY, XZ], [YX, YY, YZ], [ZX, ZY, ZZ]]~%bool success                         # return true if successful~%string status_message                # comments if available~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModelState-response)))
  "Returns full string definition for message of type 'ModelState-response"
  (cl:format cl:nil "Header header                        # Standard metadata for higher-level stamped data types.~%                                     # * header.seq holds the number of requests since the plugin started~%                                     # * header.stamp timestamp related to the pose~%                                     # * header.frame_id not used but currently filled with the relative_entity_name~%geometry_msgs/Point location         # The position of the robot~%geometry_msgs/Vector3[] covariance   # The covariance matrix [[XX, XY, XZ], [YX, YY, YZ], [ZX, ZY, ZZ]]~%bool success                         # return true if successful~%string status_message                # comments if available~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModelState-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     4 (cl:length (cl:slot-value msg 'status_message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModelState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ModelState-response
    (cl:cons ':header (header msg))
    (cl:cons ':location (location msg))
    (cl:cons ':covariance (covariance msg))
    (cl:cons ':success (success msg))
    (cl:cons ':status_message (status_message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ModelState)))
  'ModelState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ModelState)))
  'ModelState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelState)))
  "Returns string type for a service object of type '<ModelState>"
  "assignment1_setup/ModelState")
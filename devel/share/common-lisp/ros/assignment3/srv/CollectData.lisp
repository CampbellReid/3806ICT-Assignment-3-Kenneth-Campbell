; Auto-generated. Do not edit!


(cl:in-package assignment3-srv)


;//! \htmlinclude CollectData-request.msg.html

(cl:defclass <CollectData-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CollectData-request (<CollectData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CollectData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CollectData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<CollectData-request> is deprecated: use assignment3-srv:CollectData-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CollectData-request>) ostream)
  "Serializes a message object of type '<CollectData-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CollectData-request>) istream)
  "Deserializes a message object of type '<CollectData-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CollectData-request>)))
  "Returns string type for a service object of type '<CollectData-request>"
  "assignment3/CollectDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CollectData-request)))
  "Returns string type for a service object of type 'CollectData-request"
  "assignment3/CollectDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CollectData-request>)))
  "Returns md5sum for a message object of type '<CollectData-request>"
  "0b05c236c4d2e3f6f6d7b02102165372")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CollectData-request)))
  "Returns md5sum for a message object of type 'CollectData-request"
  "0b05c236c4d2e3f6f6d7b02102165372")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CollectData-request>)))
  "Returns full string definition for message of type '<CollectData-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CollectData-request)))
  "Returns full string definition for message of type 'CollectData-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CollectData-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CollectData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CollectData-request
))
;//! \htmlinclude CollectData-response.msg.html

(cl:defclass <CollectData-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type assignment3-msg:SensorData
    :initform (cl:make-instance 'assignment3-msg:SensorData)))
)

(cl:defclass CollectData-response (<CollectData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CollectData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CollectData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<CollectData-response> is deprecated: use assignment3-srv:CollectData-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <CollectData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:data-val is deprecated.  Use assignment3-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CollectData-response>) ostream)
  "Serializes a message object of type '<CollectData-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CollectData-response>) istream)
  "Deserializes a message object of type '<CollectData-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CollectData-response>)))
  "Returns string type for a service object of type '<CollectData-response>"
  "assignment3/CollectDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CollectData-response)))
  "Returns string type for a service object of type 'CollectData-response"
  "assignment3/CollectDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CollectData-response>)))
  "Returns md5sum for a message object of type '<CollectData-response>"
  "0b05c236c4d2e3f6f6d7b02102165372")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CollectData-response)))
  "Returns md5sum for a message object of type 'CollectData-response"
  "0b05c236c4d2e3f6f6d7b02102165372")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CollectData-response>)))
  "Returns full string definition for message of type '<CollectData-response>"
  (cl:format cl:nil "SensorData data~%~%~%================================================================================~%MSG: assignment3/SensorData~%geometry_msgs/Point position~%float32 speed~%Obstacle[] obstacles~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Obstacle~%geometry_msgs/Point position~%float32 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CollectData-response)))
  "Returns full string definition for message of type 'CollectData-response"
  (cl:format cl:nil "SensorData data~%~%~%================================================================================~%MSG: assignment3/SensorData~%geometry_msgs/Point position~%float32 speed~%Obstacle[] obstacles~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Obstacle~%geometry_msgs/Point position~%float32 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CollectData-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CollectData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CollectData-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CollectData)))
  'CollectData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CollectData)))
  'CollectData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CollectData)))
  "Returns string type for a service object of type '<CollectData>"
  "assignment3/CollectData")
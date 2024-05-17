; Auto-generated. Do not edit!


(cl:in-package assignment3-srv)


;//! \htmlinclude ProcessSensorData-request.msg.html

(cl:defclass <ProcessSensorData-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type assignment3-msg:SensorData
    :initform (cl:make-instance 'assignment3-msg:SensorData)))
)

(cl:defclass ProcessSensorData-request (<ProcessSensorData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessSensorData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessSensorData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<ProcessSensorData-request> is deprecated: use assignment3-srv:ProcessSensorData-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ProcessSensorData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:data-val is deprecated.  Use assignment3-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessSensorData-request>) ostream)
  "Serializes a message object of type '<ProcessSensorData-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessSensorData-request>) istream)
  "Deserializes a message object of type '<ProcessSensorData-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessSensorData-request>)))
  "Returns string type for a service object of type '<ProcessSensorData-request>"
  "assignment3/ProcessSensorDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessSensorData-request)))
  "Returns string type for a service object of type 'ProcessSensorData-request"
  "assignment3/ProcessSensorDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessSensorData-request>)))
  "Returns md5sum for a message object of type '<ProcessSensorData-request>"
  "c62a3bb50e5a12b840b3112c4065ba79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessSensorData-request)))
  "Returns md5sum for a message object of type 'ProcessSensorData-request"
  "c62a3bb50e5a12b840b3112c4065ba79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessSensorData-request>)))
  "Returns full string definition for message of type '<ProcessSensorData-request>"
  (cl:format cl:nil "SensorData data~%~%================================================================================~%MSG: assignment3/SensorData~%geometry_msgs/Point position~%float32 speed~%Obstacle[] obstacles~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Obstacle~%geometry_msgs/Point position~%float32 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessSensorData-request)))
  "Returns full string definition for message of type 'ProcessSensorData-request"
  (cl:format cl:nil "SensorData data~%~%================================================================================~%MSG: assignment3/SensorData~%geometry_msgs/Point position~%float32 speed~%Obstacle[] obstacles~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Obstacle~%geometry_msgs/Point position~%float32 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessSensorData-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessSensorData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessSensorData-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude ProcessSensorData-response.msg.html

(cl:defclass <ProcessSensorData-response> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type assignment3-msg:State
    :initform (cl:make-instance 'assignment3-msg:State)))
)

(cl:defclass ProcessSensorData-response (<ProcessSensorData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessSensorData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessSensorData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<ProcessSensorData-response> is deprecated: use assignment3-srv:ProcessSensorData-response instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <ProcessSensorData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:state-val is deprecated.  Use assignment3-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessSensorData-response>) ostream)
  "Serializes a message object of type '<ProcessSensorData-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessSensorData-response>) istream)
  "Deserializes a message object of type '<ProcessSensorData-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessSensorData-response>)))
  "Returns string type for a service object of type '<ProcessSensorData-response>"
  "assignment3/ProcessSensorDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessSensorData-response)))
  "Returns string type for a service object of type 'ProcessSensorData-response"
  "assignment3/ProcessSensorDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessSensorData-response>)))
  "Returns md5sum for a message object of type '<ProcessSensorData-response>"
  "c62a3bb50e5a12b840b3112c4065ba79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessSensorData-response)))
  "Returns md5sum for a message object of type 'ProcessSensorData-response"
  "c62a3bb50e5a12b840b3112c4065ba79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessSensorData-response>)))
  "Returns full string definition for message of type '<ProcessSensorData-response>"
  (cl:format cl:nil "State state~%~%~%================================================================================~%MSG: assignment3/State~%geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessSensorData-response)))
  "Returns full string definition for message of type 'ProcessSensorData-response"
  (cl:format cl:nil "State state~%~%~%================================================================================~%MSG: assignment3/State~%geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessSensorData-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessSensorData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessSensorData-response
    (cl:cons ':state (state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ProcessSensorData)))
  'ProcessSensorData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ProcessSensorData)))
  'ProcessSensorData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessSensorData)))
  "Returns string type for a service object of type '<ProcessSensorData>"
  "assignment3/ProcessSensorData")
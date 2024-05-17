; Auto-generated. Do not edit!


(cl:in-package assignment3-srv)


;//! \htmlinclude ValidatePlan-request.msg.html

(cl:defclass <ValidatePlan-request> (roslisp-msg-protocol:ros-message)
  ((plan
    :reader plan
    :initarg :plan
    :type assignment3-msg:Plan
    :initform (cl:make-instance 'assignment3-msg:Plan))
   (state
    :reader state
    :initarg :state
    :type assignment3-msg:State
    :initform (cl:make-instance 'assignment3-msg:State)))
)

(cl:defclass ValidatePlan-request (<ValidatePlan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidatePlan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidatePlan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<ValidatePlan-request> is deprecated: use assignment3-srv:ValidatePlan-request instead.")))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <ValidatePlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:plan-val is deprecated.  Use assignment3-srv:plan instead.")
  (plan m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <ValidatePlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:state-val is deprecated.  Use assignment3-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidatePlan-request>) ostream)
  "Serializes a message object of type '<ValidatePlan-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'plan) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidatePlan-request>) istream)
  "Deserializes a message object of type '<ValidatePlan-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'plan) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidatePlan-request>)))
  "Returns string type for a service object of type '<ValidatePlan-request>"
  "assignment3/ValidatePlanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidatePlan-request)))
  "Returns string type for a service object of type 'ValidatePlan-request"
  "assignment3/ValidatePlanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidatePlan-request>)))
  "Returns md5sum for a message object of type '<ValidatePlan-request>"
  "3d213886e8ff3dea48868fcfa2e522da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidatePlan-request)))
  "Returns md5sum for a message object of type 'ValidatePlan-request"
  "3d213886e8ff3dea48868fcfa2e522da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidatePlan-request>)))
  "Returns full string definition for message of type '<ValidatePlan-request>"
  (cl:format cl:nil "Plan plan~%State state~%~%================================================================================~%MSG: assignment3/Plan~%Waypoint[] waypoints~%~%================================================================================~%MSG: assignment3/Waypoint~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/State~%geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidatePlan-request)))
  "Returns full string definition for message of type 'ValidatePlan-request"
  (cl:format cl:nil "Plan plan~%State state~%~%================================================================================~%MSG: assignment3/Plan~%Waypoint[] waypoints~%~%================================================================================~%MSG: assignment3/Waypoint~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/State~%geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidatePlan-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'plan))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidatePlan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidatePlan-request
    (cl:cons ':plan (plan msg))
    (cl:cons ':state (state msg))
))
;//! \htmlinclude ValidatePlan-response.msg.html

(cl:defclass <ValidatePlan-response> (roslisp-msg-protocol:ros-message)
  ((valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ValidatePlan-response (<ValidatePlan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidatePlan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidatePlan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<ValidatePlan-response> is deprecated: use assignment3-srv:ValidatePlan-response instead.")))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <ValidatePlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:valid-val is deprecated.  Use assignment3-srv:valid instead.")
  (valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidatePlan-response>) ostream)
  "Serializes a message object of type '<ValidatePlan-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidatePlan-response>) istream)
  "Deserializes a message object of type '<ValidatePlan-response>"
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidatePlan-response>)))
  "Returns string type for a service object of type '<ValidatePlan-response>"
  "assignment3/ValidatePlanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidatePlan-response)))
  "Returns string type for a service object of type 'ValidatePlan-response"
  "assignment3/ValidatePlanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidatePlan-response>)))
  "Returns md5sum for a message object of type '<ValidatePlan-response>"
  "3d213886e8ff3dea48868fcfa2e522da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidatePlan-response)))
  "Returns md5sum for a message object of type 'ValidatePlan-response"
  "3d213886e8ff3dea48868fcfa2e522da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidatePlan-response>)))
  "Returns full string definition for message of type '<ValidatePlan-response>"
  (cl:format cl:nil "bool valid~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidatePlan-response)))
  "Returns full string definition for message of type 'ValidatePlan-response"
  (cl:format cl:nil "bool valid~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidatePlan-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidatePlan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidatePlan-response
    (cl:cons ':valid (valid msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ValidatePlan)))
  'ValidatePlan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ValidatePlan)))
  'ValidatePlan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidatePlan)))
  "Returns string type for a service object of type '<ValidatePlan>"
  "assignment3/ValidatePlan")
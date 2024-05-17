; Auto-generated. Do not edit!


(cl:in-package assignment3-srv)


;//! \htmlinclude ExecutePlan-request.msg.html

(cl:defclass <ExecutePlan-request> (roslisp-msg-protocol:ros-message)
  ((plan
    :reader plan
    :initarg :plan
    :type assignment3-msg:Plan
    :initform (cl:make-instance 'assignment3-msg:Plan)))
)

(cl:defclass ExecutePlan-request (<ExecutePlan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutePlan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutePlan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<ExecutePlan-request> is deprecated: use assignment3-srv:ExecutePlan-request instead.")))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <ExecutePlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:plan-val is deprecated.  Use assignment3-srv:plan instead.")
  (plan m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutePlan-request>) ostream)
  "Serializes a message object of type '<ExecutePlan-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'plan) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutePlan-request>) istream)
  "Deserializes a message object of type '<ExecutePlan-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'plan) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutePlan-request>)))
  "Returns string type for a service object of type '<ExecutePlan-request>"
  "assignment3/ExecutePlanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlan-request)))
  "Returns string type for a service object of type 'ExecutePlan-request"
  "assignment3/ExecutePlanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutePlan-request>)))
  "Returns md5sum for a message object of type '<ExecutePlan-request>"
  "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutePlan-request)))
  "Returns md5sum for a message object of type 'ExecutePlan-request"
  "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutePlan-request>)))
  "Returns full string definition for message of type '<ExecutePlan-request>"
  (cl:format cl:nil "Plan plan~%~%================================================================================~%MSG: assignment3/Plan~%Waypoint[] waypoints~%~%================================================================================~%MSG: assignment3/Waypoint~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutePlan-request)))
  "Returns full string definition for message of type 'ExecutePlan-request"
  (cl:format cl:nil "Plan plan~%~%================================================================================~%MSG: assignment3/Plan~%Waypoint[] waypoints~%~%================================================================================~%MSG: assignment3/Waypoint~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutePlan-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'plan))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutePlan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutePlan-request
    (cl:cons ':plan (plan msg))
))
;//! \htmlinclude ExecutePlan-response.msg.html

(cl:defclass <ExecutePlan-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ExecutePlan-response (<ExecutePlan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutePlan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutePlan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<ExecutePlan-response> is deprecated: use assignment3-srv:ExecutePlan-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ExecutePlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:success-val is deprecated.  Use assignment3-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutePlan-response>) ostream)
  "Serializes a message object of type '<ExecutePlan-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutePlan-response>) istream)
  "Deserializes a message object of type '<ExecutePlan-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutePlan-response>)))
  "Returns string type for a service object of type '<ExecutePlan-response>"
  "assignment3/ExecutePlanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlan-response)))
  "Returns string type for a service object of type 'ExecutePlan-response"
  "assignment3/ExecutePlanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutePlan-response>)))
  "Returns md5sum for a message object of type '<ExecutePlan-response>"
  "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutePlan-response)))
  "Returns md5sum for a message object of type 'ExecutePlan-response"
  "eaee7ab4e67b6b1fb802cc08dec8e9d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutePlan-response>)))
  "Returns full string definition for message of type '<ExecutePlan-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutePlan-response)))
  "Returns full string definition for message of type 'ExecutePlan-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutePlan-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutePlan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutePlan-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecutePlan)))
  'ExecutePlan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecutePlan)))
  'ExecutePlan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlan)))
  "Returns string type for a service object of type '<ExecutePlan>"
  "assignment3/ExecutePlan")
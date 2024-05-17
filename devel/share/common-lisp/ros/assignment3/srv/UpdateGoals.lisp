; Auto-generated. Do not edit!


(cl:in-package assignment3-srv)


;//! \htmlinclude UpdateGoals-request.msg.html

(cl:defclass <UpdateGoals-request> (roslisp-msg-protocol:ros-message)
  ((feedback
    :reader feedback
    :initarg :feedback
    :type assignment3-msg:Feedback
    :initform (cl:make-instance 'assignment3-msg:Feedback)))
)

(cl:defclass UpdateGoals-request (<UpdateGoals-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdateGoals-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdateGoals-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<UpdateGoals-request> is deprecated: use assignment3-srv:UpdateGoals-request instead.")))

(cl:ensure-generic-function 'feedback-val :lambda-list '(m))
(cl:defmethod feedback-val ((m <UpdateGoals-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:feedback-val is deprecated.  Use assignment3-srv:feedback instead.")
  (feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdateGoals-request>) ostream)
  "Serializes a message object of type '<UpdateGoals-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdateGoals-request>) istream)
  "Deserializes a message object of type '<UpdateGoals-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdateGoals-request>)))
  "Returns string type for a service object of type '<UpdateGoals-request>"
  "assignment3/UpdateGoalsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateGoals-request)))
  "Returns string type for a service object of type 'UpdateGoals-request"
  "assignment3/UpdateGoalsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdateGoals-request>)))
  "Returns md5sum for a message object of type '<UpdateGoals-request>"
  "efc5b6996c038d80435f5da349a26d95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdateGoals-request)))
  "Returns md5sum for a message object of type 'UpdateGoals-request"
  "efc5b6996c038d80435f5da349a26d95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdateGoals-request>)))
  "Returns full string definition for message of type '<UpdateGoals-request>"
  (cl:format cl:nil "Feedback feedback~%~%================================================================================~%MSG: assignment3/Feedback~%bool action_success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdateGoals-request)))
  "Returns full string definition for message of type 'UpdateGoals-request"
  (cl:format cl:nil "Feedback feedback~%~%================================================================================~%MSG: assignment3/Feedback~%bool action_success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdateGoals-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdateGoals-request>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdateGoals-request
    (cl:cons ':feedback (feedback msg))
))
;//! \htmlinclude UpdateGoals-response.msg.html

(cl:defclass <UpdateGoals-response> (roslisp-msg-protocol:ros-message)
  ((goals
    :reader goals
    :initarg :goals
    :type assignment3-msg:Goals
    :initform (cl:make-instance 'assignment3-msg:Goals)))
)

(cl:defclass UpdateGoals-response (<UpdateGoals-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdateGoals-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdateGoals-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<UpdateGoals-response> is deprecated: use assignment3-srv:UpdateGoals-response instead.")))

(cl:ensure-generic-function 'goals-val :lambda-list '(m))
(cl:defmethod goals-val ((m <UpdateGoals-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:goals-val is deprecated.  Use assignment3-srv:goals instead.")
  (goals m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdateGoals-response>) ostream)
  "Serializes a message object of type '<UpdateGoals-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goals) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdateGoals-response>) istream)
  "Deserializes a message object of type '<UpdateGoals-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goals) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdateGoals-response>)))
  "Returns string type for a service object of type '<UpdateGoals-response>"
  "assignment3/UpdateGoalsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateGoals-response)))
  "Returns string type for a service object of type 'UpdateGoals-response"
  "assignment3/UpdateGoalsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdateGoals-response>)))
  "Returns md5sum for a message object of type '<UpdateGoals-response>"
  "efc5b6996c038d80435f5da349a26d95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdateGoals-response)))
  "Returns md5sum for a message object of type 'UpdateGoals-response"
  "efc5b6996c038d80435f5da349a26d95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdateGoals-response>)))
  "Returns full string definition for message of type '<UpdateGoals-response>"
  (cl:format cl:nil "Goals goals~%~%~%================================================================================~%MSG: assignment3/Goals~%Goal[] primary_goals~%Goal[] secondary_goals~%~%================================================================================~%MSG: assignment3/Goal~%string description~%int32 priority~%geometry_msgs/Point[] waypoints~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdateGoals-response)))
  "Returns full string definition for message of type 'UpdateGoals-response"
  (cl:format cl:nil "Goals goals~%~%~%================================================================================~%MSG: assignment3/Goals~%Goal[] primary_goals~%Goal[] secondary_goals~%~%================================================================================~%MSG: assignment3/Goal~%string description~%int32 priority~%geometry_msgs/Point[] waypoints~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdateGoals-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goals))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdateGoals-response>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdateGoals-response
    (cl:cons ':goals (goals msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'UpdateGoals)))
  'UpdateGoals-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'UpdateGoals)))
  'UpdateGoals-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateGoals)))
  "Returns string type for a service object of type '<UpdateGoals>"
  "assignment3/UpdateGoals")
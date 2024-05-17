; Auto-generated. Do not edit!


(cl:in-package assignment3-srv)


;//! \htmlinclude CreatePlan-request.msg.html

(cl:defclass <CreatePlan-request> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type assignment3-msg:State
    :initform (cl:make-instance 'assignment3-msg:State))
   (goals
    :reader goals
    :initarg :goals
    :type assignment3-msg:Goals
    :initform (cl:make-instance 'assignment3-msg:Goals)))
)

(cl:defclass CreatePlan-request (<CreatePlan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CreatePlan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CreatePlan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<CreatePlan-request> is deprecated: use assignment3-srv:CreatePlan-request instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <CreatePlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:state-val is deprecated.  Use assignment3-srv:state instead.")
  (state m))

(cl:ensure-generic-function 'goals-val :lambda-list '(m))
(cl:defmethod goals-val ((m <CreatePlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:goals-val is deprecated.  Use assignment3-srv:goals instead.")
  (goals m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CreatePlan-request>) ostream)
  "Serializes a message object of type '<CreatePlan-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goals) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CreatePlan-request>) istream)
  "Deserializes a message object of type '<CreatePlan-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goals) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CreatePlan-request>)))
  "Returns string type for a service object of type '<CreatePlan-request>"
  "assignment3/CreatePlanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreatePlan-request)))
  "Returns string type for a service object of type 'CreatePlan-request"
  "assignment3/CreatePlanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CreatePlan-request>)))
  "Returns md5sum for a message object of type '<CreatePlan-request>"
  "f5bba44cc5e16145329a21e1c3c0c658")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CreatePlan-request)))
  "Returns md5sum for a message object of type 'CreatePlan-request"
  "f5bba44cc5e16145329a21e1c3c0c658")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CreatePlan-request>)))
  "Returns full string definition for message of type '<CreatePlan-request>"
  (cl:format cl:nil "State state~%Goals goals~%~%================================================================================~%MSG: assignment3/State~%geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%================================================================================~%MSG: assignment3/Goals~%Goal[] primary_goals~%Goal[] secondary_goals~%~%================================================================================~%MSG: assignment3/Goal~%string description~%int32 priority~%geometry_msgs/Point[] waypoints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CreatePlan-request)))
  "Returns full string definition for message of type 'CreatePlan-request"
  (cl:format cl:nil "State state~%Goals goals~%~%================================================================================~%MSG: assignment3/State~%geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%================================================================================~%MSG: assignment3/Goals~%Goal[] primary_goals~%Goal[] secondary_goals~%~%================================================================================~%MSG: assignment3/Goal~%string description~%int32 priority~%geometry_msgs/Point[] waypoints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CreatePlan-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goals))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CreatePlan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CreatePlan-request
    (cl:cons ':state (state msg))
    (cl:cons ':goals (goals msg))
))
;//! \htmlinclude CreatePlan-response.msg.html

(cl:defclass <CreatePlan-response> (roslisp-msg-protocol:ros-message)
  ((plan
    :reader plan
    :initarg :plan
    :type assignment3-msg:Plan
    :initform (cl:make-instance 'assignment3-msg:Plan)))
)

(cl:defclass CreatePlan-response (<CreatePlan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CreatePlan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CreatePlan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-srv:<CreatePlan-response> is deprecated: use assignment3-srv:CreatePlan-response instead.")))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <CreatePlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-srv:plan-val is deprecated.  Use assignment3-srv:plan instead.")
  (plan m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CreatePlan-response>) ostream)
  "Serializes a message object of type '<CreatePlan-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'plan) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CreatePlan-response>) istream)
  "Deserializes a message object of type '<CreatePlan-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'plan) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CreatePlan-response>)))
  "Returns string type for a service object of type '<CreatePlan-response>"
  "assignment3/CreatePlanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreatePlan-response)))
  "Returns string type for a service object of type 'CreatePlan-response"
  "assignment3/CreatePlanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CreatePlan-response>)))
  "Returns md5sum for a message object of type '<CreatePlan-response>"
  "f5bba44cc5e16145329a21e1c3c0c658")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CreatePlan-response)))
  "Returns md5sum for a message object of type 'CreatePlan-response"
  "f5bba44cc5e16145329a21e1c3c0c658")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CreatePlan-response>)))
  "Returns full string definition for message of type '<CreatePlan-response>"
  (cl:format cl:nil "Plan plan~%~%~%================================================================================~%MSG: assignment3/Plan~%Waypoint[] waypoints~%~%================================================================================~%MSG: assignment3/Waypoint~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CreatePlan-response)))
  "Returns full string definition for message of type 'CreatePlan-response"
  (cl:format cl:nil "Plan plan~%~%~%================================================================================~%MSG: assignment3/Plan~%Waypoint[] waypoints~%~%================================================================================~%MSG: assignment3/Waypoint~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CreatePlan-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'plan))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CreatePlan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CreatePlan-response
    (cl:cons ':plan (plan msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CreatePlan)))
  'CreatePlan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CreatePlan)))
  'CreatePlan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreatePlan)))
  "Returns string type for a service object of type '<CreatePlan>"
  "assignment3/CreatePlan")
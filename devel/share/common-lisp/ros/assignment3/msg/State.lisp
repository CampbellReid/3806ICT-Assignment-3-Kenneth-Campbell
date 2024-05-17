; Auto-generated. Do not edit!


(cl:in-package assignment3-msg)


;//! \htmlinclude State.msg.html

(cl:defclass <State> (roslisp-msg-protocol:ros-message)
  ((current_position
    :reader current_position
    :initarg :current_position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (environment_map
    :reader environment_map
    :initarg :environment_map
    :type assignment3-msg:Map
    :initform (cl:make-instance 'assignment3-msg:Map)))
)

(cl:defclass State (<State>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <State>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'State)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-msg:<State> is deprecated: use assignment3-msg:State instead.")))

(cl:ensure-generic-function 'current_position-val :lambda-list '(m))
(cl:defmethod current_position-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-msg:current_position-val is deprecated.  Use assignment3-msg:current_position instead.")
  (current_position m))

(cl:ensure-generic-function 'environment_map-val :lambda-list '(m))
(cl:defmethod environment_map-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-msg:environment_map-val is deprecated.  Use assignment3-msg:environment_map instead.")
  (environment_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <State>) ostream)
  "Serializes a message object of type '<State>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'current_position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'environment_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <State>) istream)
  "Deserializes a message object of type '<State>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'current_position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'environment_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<State>)))
  "Returns string type for a message object of type '<State>"
  "assignment3/State")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'State)))
  "Returns string type for a message object of type 'State"
  "assignment3/State")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<State>)))
  "Returns md5sum for a message object of type '<State>"
  "9ed7a5ab0f77624d96ff4cc104c195a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'State)))
  "Returns md5sum for a message object of type 'State"
  "9ed7a5ab0f77624d96ff4cc104c195a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<State>)))
  "Returns full string definition for message of type '<State>"
  (cl:format cl:nil "geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'State)))
  "Returns full string definition for message of type 'State"
  (cl:format cl:nil "geometry_msgs/Point current_position~%Map environment_map~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: assignment3/Map~%geometry_msgs/Point[] obstacle_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <State>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'current_position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'environment_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <State>))
  "Converts a ROS message object to a list"
  (cl:list 'State
    (cl:cons ':current_position (current_position msg))
    (cl:cons ':environment_map (environment_map msg))
))

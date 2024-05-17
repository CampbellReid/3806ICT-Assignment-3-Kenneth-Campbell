; Auto-generated. Do not edit!


(cl:in-package assignment1_setup-msg)


;//! \htmlinclude Sonars.msg.html

(cl:defclass <Sonars> (roslisp-msg-protocol:ros-message)
  ((distance0
    :reader distance0
    :initarg :distance0
    :type cl:fixnum
    :initform 0)
   (distance1
    :reader distance1
    :initarg :distance1
    :type cl:fixnum
    :initform 0)
   (distance2
    :reader distance2
    :initarg :distance2
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Sonars (<Sonars>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sonars>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sonars)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1_setup-msg:<Sonars> is deprecated: use assignment1_setup-msg:Sonars instead.")))

(cl:ensure-generic-function 'distance0-val :lambda-list '(m))
(cl:defmethod distance0-val ((m <Sonars>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-msg:distance0-val is deprecated.  Use assignment1_setup-msg:distance0 instead.")
  (distance0 m))

(cl:ensure-generic-function 'distance1-val :lambda-list '(m))
(cl:defmethod distance1-val ((m <Sonars>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-msg:distance1-val is deprecated.  Use assignment1_setup-msg:distance1 instead.")
  (distance1 m))

(cl:ensure-generic-function 'distance2-val :lambda-list '(m))
(cl:defmethod distance2-val ((m <Sonars>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1_setup-msg:distance2-val is deprecated.  Use assignment1_setup-msg:distance2 instead.")
  (distance2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sonars>) ostream)
  "Serializes a message object of type '<Sonars>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance2)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sonars>) istream)
  "Deserializes a message object of type '<Sonars>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance2)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sonars>)))
  "Returns string type for a message object of type '<Sonars>"
  "assignment1_setup/Sonars")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sonars)))
  "Returns string type for a message object of type 'Sonars"
  "assignment1_setup/Sonars")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sonars>)))
  "Returns md5sum for a message object of type '<Sonars>"
  "5579dba5245fa13e51014a8affff95eb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sonars)))
  "Returns md5sum for a message object of type 'Sonars"
  "5579dba5245fa13e51014a8affff95eb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sonars>)))
  "Returns full string definition for message of type '<Sonars>"
  (cl:format cl:nil "uint16 distance0~%uint16 distance1~%uint16 distance2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sonars)))
  "Returns full string definition for message of type 'Sonars"
  (cl:format cl:nil "uint16 distance0~%uint16 distance1~%uint16 distance2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sonars>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sonars>))
  "Converts a ROS message object to a list"
  (cl:list 'Sonars
    (cl:cons ':distance0 (distance0 msg))
    (cl:cons ':distance1 (distance1 msg))
    (cl:cons ':distance2 (distance2 msg))
))

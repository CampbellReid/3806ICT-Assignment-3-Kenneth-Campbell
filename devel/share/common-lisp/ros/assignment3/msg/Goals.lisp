; Auto-generated. Do not edit!


(cl:in-package assignment3-msg)


;//! \htmlinclude Goals.msg.html

(cl:defclass <Goals> (roslisp-msg-protocol:ros-message)
  ((primary_goals
    :reader primary_goals
    :initarg :primary_goals
    :type (cl:vector assignment3-msg:Goal)
   :initform (cl:make-array 0 :element-type 'assignment3-msg:Goal :initial-element (cl:make-instance 'assignment3-msg:Goal)))
   (secondary_goals
    :reader secondary_goals
    :initarg :secondary_goals
    :type (cl:vector assignment3-msg:Goal)
   :initform (cl:make-array 0 :element-type 'assignment3-msg:Goal :initial-element (cl:make-instance 'assignment3-msg:Goal))))
)

(cl:defclass Goals (<Goals>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goals>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goals)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment3-msg:<Goals> is deprecated: use assignment3-msg:Goals instead.")))

(cl:ensure-generic-function 'primary_goals-val :lambda-list '(m))
(cl:defmethod primary_goals-val ((m <Goals>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-msg:primary_goals-val is deprecated.  Use assignment3-msg:primary_goals instead.")
  (primary_goals m))

(cl:ensure-generic-function 'secondary_goals-val :lambda-list '(m))
(cl:defmethod secondary_goals-val ((m <Goals>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment3-msg:secondary_goals-val is deprecated.  Use assignment3-msg:secondary_goals instead.")
  (secondary_goals m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goals>) ostream)
  "Serializes a message object of type '<Goals>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'primary_goals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'primary_goals))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'secondary_goals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'secondary_goals))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goals>) istream)
  "Deserializes a message object of type '<Goals>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'primary_goals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'primary_goals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'assignment3-msg:Goal))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'secondary_goals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'secondary_goals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'assignment3-msg:Goal))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goals>)))
  "Returns string type for a message object of type '<Goals>"
  "assignment3/Goals")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goals)))
  "Returns string type for a message object of type 'Goals"
  "assignment3/Goals")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goals>)))
  "Returns md5sum for a message object of type '<Goals>"
  "3b0a5f299fb224ecfcef24f4184c3f6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goals)))
  "Returns md5sum for a message object of type 'Goals"
  "3b0a5f299fb224ecfcef24f4184c3f6d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goals>)))
  "Returns full string definition for message of type '<Goals>"
  (cl:format cl:nil "Goal[] primary_goals~%Goal[] secondary_goals~%~%================================================================================~%MSG: assignment3/Goal~%string description~%int32 priority~%geometry_msgs/Point[] waypoints~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goals)))
  "Returns full string definition for message of type 'Goals"
  (cl:format cl:nil "Goal[] primary_goals~%Goal[] secondary_goals~%~%================================================================================~%MSG: assignment3/Goal~%string description~%int32 priority~%geometry_msgs/Point[] waypoints~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goals>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'primary_goals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'secondary_goals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goals>))
  "Converts a ROS message object to a list"
  (cl:list 'Goals
    (cl:cons ':primary_goals (primary_goals msg))
    (cl:cons ':secondary_goals (secondary_goals msg))
))

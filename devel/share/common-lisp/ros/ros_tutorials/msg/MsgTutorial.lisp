; Auto-generated. Do not edit!


(cl:in-package ros_tutorials-msg)


;//! \htmlinclude MsgTutorial.msg.html

(cl:defclass <MsgTutorial> (roslisp-msg-protocol:ros-message)
  ((radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MsgTutorial (<MsgTutorial>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgTutorial>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgTutorial)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_tutorials-msg:<MsgTutorial> is deprecated: use ros_tutorials-msg:MsgTutorial instead.")))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <MsgTutorial>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_tutorials-msg:radius-val is deprecated.  Use ros_tutorials-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <MsgTutorial>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_tutorials-msg:velocity-val is deprecated.  Use ros_tutorials-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <MsgTutorial>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_tutorials-msg:direction-val is deprecated.  Use ros_tutorials-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgTutorial>) ostream)
  "Serializes a message object of type '<MsgTutorial>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'direction) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgTutorial>) istream)
  "Deserializes a message object of type '<MsgTutorial>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'direction) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgTutorial>)))
  "Returns string type for a message object of type '<MsgTutorial>"
  "ros_tutorials/MsgTutorial")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgTutorial)))
  "Returns string type for a message object of type 'MsgTutorial"
  "ros_tutorials/MsgTutorial")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgTutorial>)))
  "Returns md5sum for a message object of type '<MsgTutorial>"
  "a2a72e9fb638e09d22ae8b75214c3711")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgTutorial)))
  "Returns md5sum for a message object of type 'MsgTutorial"
  "a2a72e9fb638e09d22ae8b75214c3711")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgTutorial>)))
  "Returns full string definition for message of type '<MsgTutorial>"
  (cl:format cl:nil "float32 radius~%float32 velocity~%bool direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgTutorial)))
  "Returns full string definition for message of type 'MsgTutorial"
  (cl:format cl:nil "float32 radius~%float32 velocity~%bool direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgTutorial>))
  (cl:+ 0
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgTutorial>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgTutorial
    (cl:cons ':radius (radius msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':direction (direction msg))
))

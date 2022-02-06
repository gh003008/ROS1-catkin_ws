;; Auto-generated. Do not edit!


(when (boundp 'ros_tutorials::MsgTutorial)
  (if (not (find-package "ROS_TUTORIALS"))
    (make-package "ROS_TUTORIALS"))
  (shadow 'MsgTutorial (find-package "ROS_TUTORIALS")))
(unless (find-package "ROS_TUTORIALS::MSGTUTORIAL")
  (make-package "ROS_TUTORIALS::MSGTUTORIAL"))

(in-package "ROS")
;;//! \htmlinclude MsgTutorial.msg.html


(defclass ros_tutorials::MsgTutorial
  :super ros::object
  :slots (_radius _velocity _direction ))

(defmethod ros_tutorials::MsgTutorial
  (:init
   (&key
    ((:radius __radius) 0.0)
    ((:velocity __velocity) 0.0)
    ((:direction __direction) nil)
    )
   (send-super :init)
   (setq _radius (float __radius))
   (setq _velocity (float __velocity))
   (setq _direction __direction)
   self)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; float32 _radius
    4
    ;; float32 _velocity
    4
    ;; bool _direction
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _direction
       (if _direction (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _direction
     (setq _direction (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ros_tutorials::MsgTutorial :md5sum-) "a2a72e9fb638e09d22ae8b75214c3711")
(setf (get ros_tutorials::MsgTutorial :datatype-) "ros_tutorials/MsgTutorial")
(setf (get ros_tutorials::MsgTutorial :definition-)
      "float32 radius
float32 velocity
bool direction

")



(provide :ros_tutorials/MsgTutorial "a2a72e9fb638e09d22ae8b75214c3711")



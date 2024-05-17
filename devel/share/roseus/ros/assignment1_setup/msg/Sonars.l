;; Auto-generated. Do not edit!


(when (boundp 'assignment1_setup::Sonars)
  (if (not (find-package "ASSIGNMENT1_SETUP"))
    (make-package "ASSIGNMENT1_SETUP"))
  (shadow 'Sonars (find-package "ASSIGNMENT1_SETUP")))
(unless (find-package "ASSIGNMENT1_SETUP::SONARS")
  (make-package "ASSIGNMENT1_SETUP::SONARS"))

(in-package "ROS")
;;//! \htmlinclude Sonars.msg.html


(defclass assignment1_setup::Sonars
  :super ros::object
  :slots (_distance0 _distance1 _distance2 ))

(defmethod assignment1_setup::Sonars
  (:init
   (&key
    ((:distance0 __distance0) 0)
    ((:distance1 __distance1) 0)
    ((:distance2 __distance2) 0)
    )
   (send-super :init)
   (setq _distance0 (round __distance0))
   (setq _distance1 (round __distance1))
   (setq _distance2 (round __distance2))
   self)
  (:distance0
   (&optional __distance0)
   (if __distance0 (setq _distance0 __distance0)) _distance0)
  (:distance1
   (&optional __distance1)
   (if __distance1 (setq _distance1 __distance1)) _distance1)
  (:distance2
   (&optional __distance2)
   (if __distance2 (setq _distance2 __distance2)) _distance2)
  (:serialization-length
   ()
   (+
    ;; uint16 _distance0
    2
    ;; uint16 _distance1
    2
    ;; uint16 _distance2
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _distance0
       (write-word _distance0 s)
     ;; uint16 _distance1
       (write-word _distance1 s)
     ;; uint16 _distance2
       (write-word _distance2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _distance0
     (setq _distance0 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _distance1
     (setq _distance1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _distance2
     (setq _distance2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get assignment1_setup::Sonars :md5sum-) "5579dba5245fa13e51014a8affff95eb")
(setf (get assignment1_setup::Sonars :datatype-) "assignment1_setup/Sonars")
(setf (get assignment1_setup::Sonars :definition-)
      "uint16 distance0
uint16 distance1
uint16 distance2

")



(provide :assignment1_setup/Sonars "5579dba5245fa13e51014a8affff95eb")



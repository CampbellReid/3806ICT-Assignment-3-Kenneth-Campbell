;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Feedback)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Feedback (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::FEEDBACK")
  (make-package "ASSIGNMENT3::FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude Feedback.msg.html


(defclass assignment3::Feedback
  :super ros::object
  :slots (_action_success ))

(defmethod assignment3::Feedback
  (:init
   (&key
    ((:action_success __action_success) nil)
    )
   (send-super :init)
   (setq _action_success __action_success)
   self)
  (:action_success
   (&optional (__action_success :null))
   (if (not (eq __action_success :null)) (setq _action_success __action_success)) _action_success)
  (:serialization-length
   ()
   (+
    ;; bool _action_success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _action_success
       (if _action_success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _action_success
     (setq _action_success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get assignment3::Feedback :md5sum-) "f80c0f2f2bc7be57a86c32c39edc051b")
(setf (get assignment3::Feedback :datatype-) "assignment3/Feedback")
(setf (get assignment3::Feedback :definition-)
      "bool action_success

")



(provide :assignment3/Feedback "f80c0f2f2bc7be57a86c32c39edc051b")



;; Auto-generated. Do not edit!


(when (boundp 'assignment3::Goals)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'Goals (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::GOALS")
  (make-package "ASSIGNMENT3::GOALS"))

(in-package "ROS")
;;//! \htmlinclude Goals.msg.html


(defclass assignment3::Goals
  :super ros::object
  :slots (_primary_goals _secondary_goals ))

(defmethod assignment3::Goals
  (:init
   (&key
    ((:primary_goals __primary_goals) ())
    ((:secondary_goals __secondary_goals) ())
    )
   (send-super :init)
   (setq _primary_goals __primary_goals)
   (setq _secondary_goals __secondary_goals)
   self)
  (:primary_goals
   (&rest __primary_goals)
   (if (keywordp (car __primary_goals))
       (send* _primary_goals __primary_goals)
     (progn
       (if __primary_goals (setq _primary_goals (car __primary_goals)))
       _primary_goals)))
  (:secondary_goals
   (&rest __secondary_goals)
   (if (keywordp (car __secondary_goals))
       (send* _secondary_goals __secondary_goals)
     (progn
       (if __secondary_goals (setq _secondary_goals (car __secondary_goals)))
       _secondary_goals)))
  (:serialization-length
   ()
   (+
    ;; assignment3/Goal[] _primary_goals
    (apply #'+ (send-all _primary_goals :serialization-length)) 4
    ;; assignment3/Goal[] _secondary_goals
    (apply #'+ (send-all _secondary_goals :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/Goal[] _primary_goals
     (write-long (length _primary_goals) s)
     (dolist (elem _primary_goals)
       (send elem :serialize s)
       )
     ;; assignment3/Goal[] _secondary_goals
     (write-long (length _secondary_goals) s)
     (dolist (elem _secondary_goals)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/Goal[] _primary_goals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _primary_goals (let (r) (dotimes (i n) (push (instance assignment3::Goal :init) r)) r))
     (dolist (elem- _primary_goals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; assignment3/Goal[] _secondary_goals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _secondary_goals (let (r) (dotimes (i n) (push (instance assignment3::Goal :init) r)) r))
     (dolist (elem- _secondary_goals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get assignment3::Goals :md5sum-) "3b0a5f299fb224ecfcef24f4184c3f6d")
(setf (get assignment3::Goals :datatype-) "assignment3/Goals")
(setf (get assignment3::Goals :definition-)
      "Goal[] primary_goals
Goal[] secondary_goals

================================================================================
MSG: assignment3/Goal
string description
int32 priority
geometry_msgs/Point[] waypoints

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :assignment3/Goals "3b0a5f299fb224ecfcef24f4184c3f6d")



;; Auto-generated. Do not edit!


(when (boundp 'assignment3::UpdateGoals)
  (if (not (find-package "ASSIGNMENT3"))
    (make-package "ASSIGNMENT3"))
  (shadow 'UpdateGoals (find-package "ASSIGNMENT3")))
(unless (find-package "ASSIGNMENT3::UPDATEGOALS")
  (make-package "ASSIGNMENT3::UPDATEGOALS"))
(unless (find-package "ASSIGNMENT3::UPDATEGOALSREQUEST")
  (make-package "ASSIGNMENT3::UPDATEGOALSREQUEST"))
(unless (find-package "ASSIGNMENT3::UPDATEGOALSRESPONSE")
  (make-package "ASSIGNMENT3::UPDATEGOALSRESPONSE"))

(in-package "ROS")





(defclass assignment3::UpdateGoalsRequest
  :super ros::object
  :slots (_feedback ))

(defmethod assignment3::UpdateGoalsRequest
  (:init
   (&key
    ((:feedback __feedback) (instance assignment3::Feedback :init))
    )
   (send-super :init)
   (setq _feedback __feedback)
   self)
  (:feedback
   (&rest __feedback)
   (if (keywordp (car __feedback))
       (send* _feedback __feedback)
     (progn
       (if __feedback (setq _feedback (car __feedback)))
       _feedback)))
  (:serialization-length
   ()
   (+
    ;; assignment3/Feedback _feedback
    (send _feedback :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/Feedback _feedback
       (send _feedback :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/Feedback _feedback
     (send _feedback :deserialize buf ptr-) (incf ptr- (send _feedback :serialization-length))
   ;;
   self)
  )

(defclass assignment3::UpdateGoalsResponse
  :super ros::object
  :slots (_goals ))

(defmethod assignment3::UpdateGoalsResponse
  (:init
   (&key
    ((:goals __goals) (instance assignment3::Goals :init))
    )
   (send-super :init)
   (setq _goals __goals)
   self)
  (:goals
   (&rest __goals)
   (if (keywordp (car __goals))
       (send* _goals __goals)
     (progn
       (if __goals (setq _goals (car __goals)))
       _goals)))
  (:serialization-length
   ()
   (+
    ;; assignment3/Goals _goals
    (send _goals :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; assignment3/Goals _goals
       (send _goals :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; assignment3/Goals _goals
     (send _goals :deserialize buf ptr-) (incf ptr- (send _goals :serialization-length))
   ;;
   self)
  )

(defclass assignment3::UpdateGoals
  :super ros::object
  :slots ())

(setf (get assignment3::UpdateGoals :md5sum-) "efc5b6996c038d80435f5da349a26d95")
(setf (get assignment3::UpdateGoals :datatype-) "assignment3/UpdateGoals")
(setf (get assignment3::UpdateGoals :request) assignment3::UpdateGoalsRequest)
(setf (get assignment3::UpdateGoals :response) assignment3::UpdateGoalsResponse)

(defmethod assignment3::UpdateGoalsRequest
  (:response () (instance assignment3::UpdateGoalsResponse :init)))

(setf (get assignment3::UpdateGoalsRequest :md5sum-) "efc5b6996c038d80435f5da349a26d95")
(setf (get assignment3::UpdateGoalsRequest :datatype-) "assignment3/UpdateGoalsRequest")
(setf (get assignment3::UpdateGoalsRequest :definition-)
      "Feedback feedback

================================================================================
MSG: assignment3/Feedback
bool action_success
---
Goals goals


================================================================================
MSG: assignment3/Goals
Goal[] primary_goals
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

(setf (get assignment3::UpdateGoalsResponse :md5sum-) "efc5b6996c038d80435f5da349a26d95")
(setf (get assignment3::UpdateGoalsResponse :datatype-) "assignment3/UpdateGoalsResponse")
(setf (get assignment3::UpdateGoalsResponse :definition-)
      "Feedback feedback

================================================================================
MSG: assignment3/Feedback
bool action_success
---
Goals goals


================================================================================
MSG: assignment3/Goals
Goal[] primary_goals
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



(provide :assignment3/UpdateGoals "efc5b6996c038d80435f5da349a26d95")



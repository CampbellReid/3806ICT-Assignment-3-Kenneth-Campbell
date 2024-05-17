
(cl:in-package :asdf)

(defsystem "assignment3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Command" :depends-on ("_package_Command"))
    (:file "_package_Command" :depends-on ("_package"))
    (:file "Feedback" :depends-on ("_package_Feedback"))
    (:file "_package_Feedback" :depends-on ("_package"))
    (:file "Goal" :depends-on ("_package_Goal"))
    (:file "_package_Goal" :depends-on ("_package"))
    (:file "Goals" :depends-on ("_package_Goals"))
    (:file "_package_Goals" :depends-on ("_package"))
    (:file "Map" :depends-on ("_package_Map"))
    (:file "_package_Map" :depends-on ("_package"))
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
    (:file "Plan" :depends-on ("_package_Plan"))
    (:file "_package_Plan" :depends-on ("_package"))
    (:file "SensorData" :depends-on ("_package_SensorData"))
    (:file "_package_SensorData" :depends-on ("_package"))
    (:file "State" :depends-on ("_package_State"))
    (:file "_package_State" :depends-on ("_package"))
    (:file "Waypoint" :depends-on ("_package_Waypoint"))
    (:file "_package_Waypoint" :depends-on ("_package"))
  ))
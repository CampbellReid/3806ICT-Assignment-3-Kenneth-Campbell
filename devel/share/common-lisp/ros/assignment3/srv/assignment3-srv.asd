
(cl:in-package :asdf)

(defsystem "assignment3-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :assignment3-msg
)
  :components ((:file "_package")
    (:file "CollectData" :depends-on ("_package_CollectData"))
    (:file "_package_CollectData" :depends-on ("_package"))
    (:file "CreatePlan" :depends-on ("_package_CreatePlan"))
    (:file "_package_CreatePlan" :depends-on ("_package"))
    (:file "ExecutePlan" :depends-on ("_package_ExecutePlan"))
    (:file "_package_ExecutePlan" :depends-on ("_package"))
    (:file "ProcessSensorData" :depends-on ("_package_ProcessSensorData"))
    (:file "_package_ProcessSensorData" :depends-on ("_package"))
    (:file "UpdateGoals" :depends-on ("_package_UpdateGoals"))
    (:file "_package_UpdateGoals" :depends-on ("_package"))
    (:file "ValidatePlan" :depends-on ("_package_ValidatePlan"))
    (:file "_package_ValidatePlan" :depends-on ("_package"))
  ))
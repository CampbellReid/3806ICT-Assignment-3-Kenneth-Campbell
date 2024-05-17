
(cl:in-package :asdf)

(defsystem "assignment1_setup-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ModelState" :depends-on ("_package_ModelState"))
    (:file "_package_ModelState" :depends-on ("_package"))
  ))
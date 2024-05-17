
(cl:in-package :asdf)

(defsystem "assignment1_setup-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Sonars" :depends-on ("_package_Sonars"))
    (:file "_package_Sonars" :depends-on ("_package"))
  ))
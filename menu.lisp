(in-package :cl-user)

(ql:quickload "cl-gobject-introspection")
;; (load "~/AAA/gir/menu.lisp")

(defvar *gio* (gir:ffi "Gio"))
(defvar *gobject* (gir:ffi "GObject"))
(defvar *gtk* (gir:ffi "Gtk" "4.0"))

(defun main ()
  (let ((stat nil)
        (app (gir:invoke (*gtk* "Application" 'new)
                         "com.example.menu"
                         (gir:nget *gio* "ApplicationFlags" :flags_none))))
    (setf stat (gir:invoke (app 'run) nil))
    (gir:invoke (*gobject* "Object" 'unref) app)
    stat))

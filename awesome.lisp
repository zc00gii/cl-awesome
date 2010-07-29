(defpackage :cl-awesome
  (:use :cl :cl-ppcre)
  (:import-from :trivial-shell :shell-command))

(in-package :cl-awesome)

(defun run-raw-lua (lua)
  (shell-command (format nil "echo ~a | awesome-client"
			 (regex-replace "(\\()"
					(regex-replace-all "(\\))"
							   (regex-replace-all "(\\|)" lua "\\\\\\1") "\\\\\\1") "\\\\\\1")))
  t)

(defun toggle-awesome-menu ()
 (run-raw-lua "mymainmenu:toggle()"))

(defun restart-awesome ()
  (run-raw-lua "awesome:restart()"))

(defun quit-awesome ()
  (run-raw-lua "awesome:quit()"))

(defun go-to-workspace (number)
  (run-raw-lua (format nil "awful.tag.viewonly(tags[mouse.screen][~a])" number)))

(defun move-to-workspace (number)
  (run-raw-lua (format nil "awful.client.movetotag(tags[client.focus.screen][~a])" number)))

(defun toggle-workspace (number)
  (run-raw-lua (format nil "awful.tag.viewtoggle(tags[mouse.screen][~a])" number)))

(defun switch-window (which-way)
  (run-raw-lua (format nil "awful.client.focus.byidx(~a)" which-way)))

(defun move-mouse-and-focus (where)
  (run-raw-lua (format nil "awful.screen.focus_relative(~a)" where)))

(defun move-window (where)
  (run-raw-lua (format nil "awful.client.swap.byidx(~a)" where)))

(defun toggle-maximize-window ()
  (run-raw-lua "client.focus.maximized_vertical = not client.focus.maximized_vertical")
  (run-raw-lua "client.focus.maximized_horizontal = not client.focus.maximized_horizontal"))

(defun toggle-fullscreen-window ()
  (run-raw-lua "client.focus.fullscreen = not client.focus.fullscreen"))

(defun run-raw-lua (lua)
  (slime-eval `(cl-awesome::run-raw-lua ,lua)))

(defun toggle-awesome-menu ()
 (run-raw-lua "mymainmenu:toggle()"))

(defun restart-awesome ()
  (run-raw-lua "awesome:restart()"))

(defun quit-awesome ()
  (run-raw-lua "awesome:quit()"))

(defun go-to-workspace (number)
  (run-raw-lua (format "awful.tag.viewonly(tags[mouse.screen][%s])" number)))

(defun move-to-workspace (number)
  (run-raw-lua (format "awful.client.movetotag(tags[client.focus.screen][%s])" number)))

(defun toggle-workspace (number)
  (run-raw-lua (format "awful.tag.viewtoggle(tags[mouse.screen][%s])" number)))

(defun switch-window (which-way)
  (run-raw-lua (format "awful.client.focus.byidx(%s)" which-way)))

(defun move-mouse-and-focus (where)
  (run-raw-lua (format "awful.screen.focus_relative(%s)" where)))

(defun move-window (where)
  (run-raw-lua (format "awful.client.swap.byidx(%s)" where)))
(provide 'awesome)

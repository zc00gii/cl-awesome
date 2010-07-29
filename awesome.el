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

;; Awesome little metaprogramming hack to bind C-x 4 i where i is the awesome workspace number
(loop for i in '(1 2 3 4 5 6 7 8) do (global-set-key (eval `(kbd ,(format "C-x 4 %s" i)))
						     `(lambda ()
						       (interactive)
							 (make-frame)
							 (move-to-workspace ,i))))

(provide 'awesome)

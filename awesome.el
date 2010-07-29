(defun run-raw-lua (lua)
  (slime-eval `(cl-awesome::run-raw-lua ,lua)))

(defmacro define-awesome-function (function args)
  (if (null args)
      `(defun ,function ()
	 ,(multiple-value-bind (name) (read-from-string
				       (format "(slime-eval '(cl-awesome::%s))" function)) name))
    `(defun ,function ,args
       ,(multiple-value-bind (name) (read-from-string
				     (format "(slime-eval `(cl-awesome::%s %s))" function
					     (let ((return-string ""))
					       (loop for i in args do
						     (setq return-string
							   (format "%s ,%s" return-string i)))
					       return-string))) name))))

(define-awesome-function toggle-awesome-menu ())
(define-awesome-function restart-awesome ())
(define-awesome-function quit-awesome ())
(define-awesome-function go-to-workspace (number))
(define-awesome-function move-to-workspace (number))
(define-awesome-function toggle-workspace (number))
(define-awesome-function switch-window (which-way))
(define-awesome-function move-mouse-and-focus (where))
(define-awesome-function move-window (where))
(define-awesome-function maximize-window ())
(define-awesome-function toggle-fullscreen-window ())

(loop for i in '(1 2 3 4 5 6 7 8) do (global-set-key (eval `(kbd ,(format "C-x 4 %s" i)))
						     `(lambda ()
						       (interactive)
							 (make-frame)
							 (move-to-workspace ,i))))

(provide 'awesome)

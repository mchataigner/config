(iswitchb-mode 1)

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(global-linum-mode 1)
(global-visual-line-mode 1)
;(global-whitespace-mode 1)
;(global-highlight-changes-mode 1)

(xterm-mouse-mode 1)

(defun sd-mousewheel-scroll-up (event)
  "Scroll window under mouse up by five lines."
  (interactive "e")
  (let ((current-window (selected-window)))
    (unwind-protect
	(progn
	    (select-window (posn-window (event-start event)))
	      (scroll-up 5))
      (select-window current-window))))
(defun sd-mousewheel-scroll-down (event)
  "Scroll window under mouse down by five lines."
  (interactive "e")
  (let ((current-window (selected-window)))
    (unwind-protect
	(progn
	    (select-window (posn-window (event-start event)))
	      (scroll-down 5))
      (select-window current-window))))

 (global-set-key (kbd "<mouse-5>") 'sd-mousewheel-scroll-up)
 (global-set-key (kbd "<mouse-4>") 'sd-mousewheel-scroll-down)




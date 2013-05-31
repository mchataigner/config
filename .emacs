(iswitchb-mode 1)

(load-theme 'moot t)

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(global-linum-mode 1)
(global-visual-line-mode 1)
;(global-whitespace-mode 1)
;(global-highlight-changes-mode 1)

(setq make-backup-files nil)

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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("cc99d0e2f3ef0c87ccdd9bc7d1fe50d2ad8a9b532a8d87fc5e629d1843d3d166" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

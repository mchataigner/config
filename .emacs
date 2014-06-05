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

(add-to-list 'load-path "~/.emacs.d/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(speedbar 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (moot)))
 '(custom-safe-themes (quote ("aa74186764f2d91356b4a98aa56cb931cbd7f6e82e25a84ce212b254e4415cb5" "3b7be316994a76189bc9bc7c5416dcb3bb5cf1f1255e8c7ed2151c481a6cd5b4" "cc99d0e2f3ef0c87ccdd9bc7d1fe50d2ad8a9b532a8d87fc5e629d1843d3d166" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-comment-tag ((t (:foreground "color-238"))))
 '(custom-group-tag ((t (:inherit variable-pitch :foreground "color-26" :weight bold :height 1.2))))
 '(custom-variable-tag ((t (:foreground "color-63" :weight bold))))
 '(ensime-compile-warnline ((t (:foreground "LightBlue4"))))
 '(error ((t (:foreground "Pink3" :weight bold))))
 '(escape-glyph ((t (:foreground "chocolate1"))))
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue4"))))
 '(font-lock-constant-face ((t (:foreground "Aquamarine3"))))
 '(font-lock-string-face ((t (:foreground "chocolate1"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen4"))))
 '(font-lock-variable-name-face ((t (:foreground "chocolate2"))))
 '(fringe ((t (:background "grey45"))))
 '(info-node ((t (:foreground "pink3" :slant italic :weight bold))))
 '(info-title-2 ((t (:foreground "lightblue4" :weight bold))))
 '(isearch-fail ((t (:background "palevioletred4"))))
 '(minimap-font-face ((t (:background "white" :height 1 :family "DejaVu Sans Mono"))) t)
 '(popup-menu-selection-face ((t (:background "steelblue" :foreground "brightwhite"))))
 '(popup-scroll-bar-foreground-face ((t (:background "gray28"))))
 '(region ((t (:background "lightblue"))))
 '(shadow ((t (:foreground "grey40"))))
 '(speedbar-directory-face ((t (:foreground "light blue3")))))

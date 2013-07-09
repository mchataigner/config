;;; kwin-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (inferior-kwin-mode kwin-minor-mode) "kwin" "kwin.el"
;;;;;;  (20954 61460))
;;; Generated autoloads from kwin.el

(autoload 'kwin-minor-mode "kwin" "\
KWin minor mode for interaction with KWin.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When this minor mode is enabled, some commands become available
to send current code area (as understood by c-mark-function) or
region or buffer to the current KWin process.

The following keys are bound in this minor mode:

\\{kwin-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'inferior-kwin-mode "kwin" "\
Major mode for displaying KWin responses.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("kwin-pkg.el") (20954 61460 73648))

;;;***

(provide 'kwin-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; kwin-autoloads.el ends here

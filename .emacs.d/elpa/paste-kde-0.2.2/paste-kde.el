;;; paste-kde.el --- paste text to KDE's pastebin service

;; Copyright (C) 2012-2013 Diogo F. S. Ramos

;; Author: Diogo F. S. Ramos <diogofsr@gmail.com>
;; Version: 0.2.2
;; Package-Requires: ((web "0.3.6"))
;; Keywords: comm, convenience, tools

;; This file is NOT part of GNU Emacs.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

;;; Commentary:

;; To post the current buffer to KDE's pastebin service, use the
;; procedure `paste-kde-buffer'. To post a region, `paste-kde-region'.

;; paste-kde will try to figure out the language of the code using the
;; buffer's major mode and an internal table. If there isn't a match,
;; paste-kde will post the code as Text.

;; After posting the code, the post's url will be open using
;; `browser-url'.

;;; Code:

(require 'web)
(require 'cl-lib)

(defgroup paste-kde nil
  "Paste text to paste.kde.org"
  :tag "Paste KDE"
  :group 'applications
  :version "24.2")

(defvar *paste-kde-langs*
  '((4cs-mode 4cs "GADV 4CS")
    (6502acme-mode 6502acme "ACME Cross Asm")
    (6502kickass-mode 6502kickass "Kick Asm")
    (6502tasm-mode 6502tasm "TASM/64TASS 1.46 Asm")
    (68000devpac-mode 68000devpac "HiSoft Devpac ST 2 Asm")
    (abap-mode abap "ABAP")
    (actionscript-mode actionscript "ActionScript")
    (actionscript3-mode actionscript3 "ActionScript 3")
    (ada-mode ada "Ada")
    (algol68-mode algol68 "ALGOL 68")
    (apache-mode apache "Apache configuration")
    (applescript-mode applescript "AppleScript")
    (apt-mode apt "sources - Apt sources")
    (asm-mode asm "ASM")
    (asp-mode asp "ASP")
    (autoconf-mode autoconf "Autoconf")
    (autohotkey-mode autohotkey "Autohotkey")
    (autoit-mode autoit "AutoIt")
    (avisynth-mode avisynth "AviSynth")
    (awk-mode awk "awk")
    (bash-mode bash "Bash")
    (basic4gl-mode basic4gl "Basic4GL")
    (bf-mode bf "Brainfuck")
    (bibtex-mode bibtex "BibTeX")
    (blitzbasic-mode blitzbasic "BlitzBasic")
    (bnf-mode bnf "bnf")
    (boo-mode boo "Boo")
    (c-mode c "C")
    (c-mode c "loadrunner - C (LoadRunner)")
    (c-mode c "mac - C (Mac)")
    (caddcl-mode caddcl "CAD DCL")
    (cadlisp-mode cadlisp "CAD Lisp")
    (cfdg-mode cfdg "CFDG")
    (cfm-mode cfm "ColdFusion")
    (chaiscript-mode chaiscript "ChaiScript")
    (cil-mode cil "CIL")
    (clojure-mode clojure "Clojure")
    (cmake-mode cmake "CMake")
    (cobol-mode cobol "COBOL")
    (c++-mode cpp "C++")
    (c++-mode cpp "qt -   C++ (Qt)")
    (csharp-mode csharp "C#")
    (css-mode css "CSS")
    (cuesheet-mode cuesheet "Cuesheet")
    (d-mode d "D")
    (dcs-mode dcs "DCS")
    (delphi-mode delphi "Delphi")
    (diff-mode diff "Diff")
    (div-mode div "DIV")
    (dos-mode dos "DOS")
    (dot-mode dot "dot")
    (e-mode e "E")
    (ecmascript-mode ecmascript "ECMAScript")
    (eiffel-mode eiffel "Eiffel")
    (email-mode email "eMail (mbox)")
    (emacs-lisp-mode lisp "Emacs Lisp")
    (epc-mode epc "EPC")
    (erlang-mode erlang "Erlang")
    (f1-mode f1 "Formula One")
    (falcon-mode falcon "Falcon")
    (fo-mode fo "FO (abas-ERP)")
    (fortran-mode fortran "Fortran")
    (freebasic-mode freebasic "FreeBasic")
    (fsharp-mode fsharp "F#")
    (fundamental-mode text "Fundamental Mode")
    (gambas-mode gambas "GAMBAS")
    (gdb-mode gdb "GDB")
    (genero-mode genero "genero")
    (genie-mode genie "Genie")
    (gettext-mode gettext "GNU Gettext")
    (glsl-mode glsl "glSlang")
    (gml-mode gml "GML")
    (gnuplot-mode gnuplot "Gnuplot")
    (go-mode go "Go")
    (groovy-mode groovy "Groovy")
    (gwbasic-mode gwbasic "GwBasic")
    (haskell-mode haskell "Haskell")
    (hicest-mode hicest "HicEst")
    (hq9plus-mode hq9plus "HQ9+")
    (html4strict-mode html4strict "HTML")
    (icon-mode icon "Icon")
    (idl-mode idl "Uno Idl")
    (conf-unix-mode ini "INI")
    (inno-mode inno "Inno")
    (intercal-mode intercal "INTERCAL")
    (io-mode io "Io")
    (j-mode j "J")
    (java-mode java "Java")
    (java5-mode java5 "J2SE")
    (js-mode javascript "Javascript")
    (jquery-mode jquery "jQuery")
    (kixtart-mode kixtart "KiXtart")
    (klonec-mode klonec "KLone C")
    (klonecpp-mode klonecpp "KLone C++")
    (latex-mode latex "LaTeX")
    (lb-mode lb "Liberty BASIC")
    (lisp-mode lisp "Lisp")
    (lisp-interaction-mode lisp "Lisp Interaction")
    (locobasic-mode locobasic "Locomotive Basic")
    (logtalk-mode logtalk "Logtalk")
    (lolcode-mode lolcode "LOLcode")
    (lotusformulas-mode lotusformulas "Lotus Notes")
    (lotusscript-mode lotusscript "LotusScript")
    (lscript-mode lscript "LScript")
    (lsl2-mode lsl2 "LSL2")
    (lua-mode lua "Lua")
    (m68k-mode m68k "Motorola 68000 Asm")
    (magiksf-mode magiksf "MagikSF")
    (make-mode make "GNU make")
    (makefile-automake-mode make "Makefile.am")
    (mapbasic-mode mapbasic "MapBasic")
    (matlab-mode matlab "Matlab M")
    (mirc-mode mirc "mIRC Scripting")
    (mmix-mode mmix "MMIX")
    (modula2-mode modula2 "Modula-2")
    (modula3-mode modula3 "Modula-3")
    (mpasm-mode mpasm "Microchip Asm")
    (mxml-mode mxml "MXML")
    (mysql-mode mysql "MySQL")
    (newlisp-mode newlisp "newlisp")
    (nsis-mode nsis "NSIS")
    (oberon2-mode oberon2 "Oberon-2")
    (objc-mode objc "Objective-C")
    (objeck-mode objeck "Objeck")
    (ocaml-mode ocaml "OCaml")
    (ocaml-mode ocaml "brief -   OCaml (brief)")
    (octave-mode matlab "Octave")
    (oobas-mode oobas "OpenOffice.org Basic")
    (oracle11-mode oracle11 "Oracle 11 SQL")
    (oracle8-mode oracle8 "Oracle 8 SQL")
    (oxygene-mode oxygene "Oxygene (Delphi Prism)")
    (oz-mode oz "OZ")
    (pascal-mode pascal "Pascal")
    (pcre-mode pcre "PCRE")
    (per-mode per "per")
    (perl-mode perl "Perl")
    (perl6-mode perl6 "Perl 6")
    (pf-mode pf "OpenBSD Packet Filter")
    (php-mode php "PHP")
    (php-mode php "brief -   PHP (brief)")
    (pic16-mode pic16 "PIC16")
    (pike-mode pike "Pike")
    (pixelbender-mode pixelbender "Pixel Bender 1.0")
    (plsql-mode plsql "PL/SQL")
    (postgresql-mode postgresql "PostgreSQL")
    (povray-mode povray "POVRAY")
    (powerbuilder-mode powerbuilder "PowerBuilder")
    (powershell-mode powershell "PowerShell")
    (progress-mode progress "Progress")
    (prolog-mode prolog "Prolog")
    (properties-mode properties "PROPERTIES")
    (providex-mode providex "ProvideX")
    (purebasic-mode purebasic "PureBasic")
    (python-mode python "Python")
    (q-mode q "q/kdb+")
    (qbasic-mode qbasic "QBasic/QuickBASIC")
    (rails-mode rails "Rails")
    (rebol-mode rebol "REBOL")
    (reg-mode reg "Microsoft Registry")
    (robots-mode robots "robots.txt")
    (rpmspec-mode rpmspec "RPM Specification File")
    (rsplus-mode rsplus "R / S+")
    (ruby-mode ruby "Ruby")
    (sas-mode sas "SAS")
    (scala-mode scala "Scala")
    (scheme-mode scheme "Scheme")
    (scilab-mode scilab "SciLab")
    (sdlbasic-mode sdlbasic "sdlBasic")
    (smalltalk-mode smalltalk "Smalltalk")
    (smarty-mode smarty "Smarty")
    (sql-mode sql "SQL")
    (systemverilog-mode systemverilog "SystemVerilog")
    (tcl-mode tcl "TCL")
    (teraterm-mode teraterm "Tera Term Macro")
    (thinbasic-mode thinbasic "thinBasic")
    (tsql-mode tsql "T-SQL")
    (typoscript-mode typoscript "TypoScript")
    (unicon-mode unicon "Unicon")
    (vala-mode vala "Vala")
    (vb-mode vb "Visual Basic")
    (vbnet-mode vbnet "VB.NET")
    (verilog-mode verilog "Verilog")
    (vhdl-mode vhdl "VHDL")
    (vim-mode vim "Vim Script")
    (visualfoxpro-mode visualfoxpro "Visual Fox Pro")
    (visualprolog-mode visualprolog "Visual Prolog")
    (whitespace-mode whitespace "Whitespace")
    (whois-mode whois "Whois (RPSL format)")
    (winbatch-mode winbatch "Winbatch")
    (xbasic-mode xbasic "XBasic")
    (xml-mode xml "XML")
    (xorg-mode xorg "conf - Xorg configuration")
    (xpp-mode xpp "X++")
    (z80-mode z80 "ZiLOG Z80 Asm")
    (zxbasic-mode zxbasic "ZXBasic")))

(defconst *paste-kde-url* "http://paste.kde.org/"
  "KDE's pastebin service url for pasting text")

(defcustom paste-kde-user user-login-name
  "Defines the alias to be used in the post"
  :group 'paste-kde
  :type '(string))

(defcustom paste-kde-expire 604800
  "Number of seconds after which the paste will be deleted in the server.
Set this value to 0 to disable this feature. The default is set
to 7 days."
  :group 'paste-kde
  :type '(integer))

(defcustom paste-kde-open-browser t
  "Whenever the posted text should be opened using a browser."
  :group 'paste-kde
  :type '(boolean))

(defcustom paste-kde-kill-ring-save-url-p t
  "After pasting, should the url be saved to the kill ring?"
  :group 'paste-kde
  :type '(boolean))

(defun paste-kde-lang-name (item)
  (nth 2 item))

(defun paste-kde-lang-symbol (item)
  (nth 1 item))

(defun paste-kde-lang-mode (item)
  (nth 0 item))

(defun paste-kde-list-of-possible-langs ()
  (mapcar #'paste-kde-lang-name *paste-kde-langs*))

(defun paste-kde-langs-name (name)
  (cl-find name
           *paste-kde-langs*
           :key 'paste-kde-lang-name
           :test 'string-equal))

(defun paste-kde-langs-mode (mode)
  (cl-find mode
           *paste-kde-langs*
           :key 'paste-kde-lang-mode
           :test 'eq))

(defun paste-kde-pick-lang ()
  (let ((item (paste-kde-langs-mode major-mode)))
    (if (null item)
        "text"
      (symbol-name (paste-kde-lang-symbol item)))))

(defun paste-kde-post-id (alist)
  (cdr (assoc 'id (assoc 'result alist))))

(defun paste-kde-parse-post-url (response-alist)
  (concat *paste-kde-url* (paste-kde-post-id response-alist)))

(defun paste-kde-make-post-alist (data lang)
  (list
   (cons 'paste_data data)
   (cons 'paste_lang lang)
   (cons 'api_submit "true")
   (cons 'mode "json")
   (cons 'paste_user paste-kde-user)
   (cons 'paste_expire (int-to-string paste-kde-expire))))

(defun paste-kde-post (data lang)
  (message "Pasting...")
  (web-json-post
   (lambda (data &rest _stuff)
     (let ((url (paste-kde-parse-post-url data)))
       (when paste-kde-kill-ring-save-url-p (kill-new url))
       (when paste-kde-open-browser (browse-url url))
       (message "%s" url)))
   :url *paste-kde-url*
   :data (paste-kde-make-post-alist data lang)
   :logging nil))

(defun paste-kde-user-pick-lang (prefix)
  (if prefix
      (completing-read "Choose the language: "
                       (paste-kde-list-of-possible-langs)
                       nil t)
    (paste-kde-pick-lang)))

;;;###autoload
(defun paste-kde-buffer (lang)
  "Paste the current buffer

If called with a prefix, you will be able to fill LANG. Without a prefix, LANG will be choosen automatically."
  (interactive
   (list (paste-kde-user-pick-lang current-prefix-arg)))
  (paste-kde-region (point-min) (point-max) lang))

;;;###autoload
(defun paste-kde-region (start end lang)
  "Paste the current region

If called with a prefix, you will be able to fill LANG. Without a prefix, LANG will be choosen automatically."
  (interactive
   (let ((string (paste-kde-user-pick-lang current-prefix-arg)))
     (list (region-beginning) (region-end) string)))
  (paste-kde-post (buffer-substring-no-properties start end) lang))

(provide 'paste-kde)

;; Local Variables:
;; lexical-binding: t
;; End:

;;; paste-kde.el ends here

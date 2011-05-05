;;_________________________________________________________
;;;;    System Customizations 

;; Misc customizations
(fset 'yes-or-no-p 'y-or-n-p)           ;replace y-e-s by y
(setq inhibit-startup-message t)        ;no splash screen
;(setq make-backup-files nil)
(setq backup-inhibited t)
(defconst query-replace-highlight t)    ;highlight during query
(defconst search-highlight t)           ;highlight incremental search
(setq ls-lisp-dirs-first t)             ;display dirs first in dired
(global-font-lock-mode t)               ;colorize all buffers

;; Dired customizations

;; Set the name of the host and current path/file in title bar:
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(column-number-mode t)		        ;column number in modeline (status)
(line-number-mode t)		        ;line number in modeline (status bar)

;; Grab possible word completions from all active sessions
(defconst dabbrev-always-check-other-buffers t)
(defconst dabbrev-abbrev-char-regexp "\\sw\\|\\s_")

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	try-expand-whole-kill))

;;__________________________________________________________________________
;;;;    Standard Key Overrides

(keyboard-translate ?\( ?\[)
(keyboard-translate ?\[ ?\()
(keyboard-translate ?\) ?\])
(keyboard-translate ?\] ?\))

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))
(global-set-key "\C-x\C-p" 'other-window-backward)
(global-set-key "\C-x\C-n" 'other-window)

(defalias 'scroll-ahead 'scroll-up) 
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-lines-ahead (&optional n) 
  "Scroll ahead N lines (1 by default)." 
  (interactive "P") 
  (scroll-ahead (prefix-numeric-value n))) 
(defun scroll-n-lines-behind (&optional n) 
  "Scroll behind N lines (1 by default)." 
  (interactive "P") 
  (scroll-behind (prefix-numeric-value n)))
(global-set-key "\C-q" 'scroll-n-lines-behind) 
(global-set-key "\C-z" 'scroll-n-lines-ahead) 

(global-set-key "\C-x\C-q" 'quoted-insert) 

(defun point-to-top ()
  "Put point on top line of window." 
  (interactive) 
  (move-to-window-line 0)) 

(global-set-key (kbd "C-M-q") 'point-to-top)

(global-set-key "\M-q" 'indent-pp-sexp)

(defun point-to-bottom () 
  "Put point at beginning of last visible line." 
  (interactive) 
  (move-to-window-line -1)) 
(global-set-key (kbd "C-M-z") 'point-to-bottom) 

(defun line-to-top () 
  "Move current line to top of window." 
  (interactive) 
  (recenter 0)) 
(global-set-key "\M-!" 'line-to-top) 

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; This binds word completions
(global-set-key [(control /)] 'hippie-expand)

;; Match parentheses
(global-set-key [(control \])] 'goto-match-paren)

;; Mouse 
(global-set-key [down-mouse-2] 'imenu)
;; Disable mouse-2 event that was appending text into documents
(global-set-key [mouse-2] nil)


;; Prevent accidentally killing emacs.
(global-set-key [(control x) (control c)]
		'(lambda ()
		   (interactive)
		   (if (y-or-n-p-with-timeout "Do you really want to exit Emacs ? " 4 nil)
		       (save-buffers-kill-emacs))))

;;__________________________________________________________________________
;;;;lisp    Programming - Common Lisp

;; Specify modes for lisp file extensions
(setq auto-mode-alist
      (append '(
		("\\.emacs$" . emacs-lisp-mode)
		("\\.lisp$" . lisp-mode)
		("\\.cl$" . lisp-mode)
		)auto-mode-alist))

(require 'mic-paren)

(paren-activate)

(setf paren-priority 'close)

(require 'parenface)




(provide 'basic-customization)
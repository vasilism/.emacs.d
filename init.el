;; init script
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
(require 'gentooish)
(if window-system 
    (color-theme-gentooish)
  (color-theme-dark-laptop))
(color-theme-gentooish)

(require 'basic-customization)
(require 'clojure-setup)
(require 'org-mode-setup)
(require 'mail-setup)

(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix) 

(custom-set-variables
 '(tooltip-mode nil)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil))

(provide 'init)
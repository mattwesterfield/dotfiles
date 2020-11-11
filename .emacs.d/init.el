;; Setting the theme and turning off the menu bar
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote manoj-dark))
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (lua-mode xclip markdown-mode))))

;; Disabling the start-up message
(setq inhibit-startup-message t)

;; Enabling line numbers
(global-linum-mode t)

;; Disabling automatic back-up and lock files
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; Set tabbing for C/C++
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; Enable copy/pasta with external applications
(setq select-enable-clipboard t)
(setq x-select-enable-clipboard t)
(add-to-list 'load-path "~/.emacs.d/elpa/xclip-1.10/")
(require 'xclip)
(xclip-mode 1)

;; TODO: MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Setting the theme and turning off the menu bar
(custom-set-variables
 ' (custom-enabled-themes (quote manoj-dark))
 ' (menu-bar-mode nil))

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

;; TODO: MELPA

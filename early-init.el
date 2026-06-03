;;;; early-init.el --- Early initialization configuration   -*- lexical-binding: t -*-

;;; Code

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

;; Restore value after startup
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 50 1024 1024))))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Zanate Emacs loaded in %s."
                     (emacs-init-time))))


;; Disable automatic package initialization. This is handled later.
(setq package-enable-at-startup nil)

;; Do not check mtimes on elisp bytcode.
(setq load-prefer-newer noninteractive)

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; Disable unnecessary GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(push '(undecorated . t) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

;; Setting the face in here prevents flashes of
;; color as the theme gets activated
(push '(ns-transparent-titlebar . t) default-frame-alist)

;; Swap modeline to header
(setq-default header-line-format mode-line-format
              mode-line-format nil)

;;; early-init.el ends here

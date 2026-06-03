;;;; init-base.el --- Default configuration options   -*- lexical-binding: t -*-

;; Garbage Collector Magic Hack
(use-package gcmh
  :diminish
  :hook (emacs-startup . gcmh-mode)
  :init
  (setq gcmh-idle-delay 'auto
        gcmh-auto-idle-delay-factor 10
        gcmh-high-cons-threshold #x1000000)) ; 16MB

;;; Basic preferences

(use-package emacs
  :init
  (setq inhibit-startup-message t     ; Don't show the splash screen
     ;; visible-bell t                ; Flash when alert bell sounds
        make-backup-files nil         ; Disable backup files
        auto-save-default nil         ; Disable auto save
        use-dialog-box nil            ; No dialog boxes
        history-length 25)            ; Remember minibuffer inputs

  ;; Place custom variables in another file 
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))

  ;; Gradual scroll instead of sudden jumps
  (setq scroll-step 1)
  (setq scroll-margin 1)

  :config
  ;; Remember recent files
  (recentf-mode 1)

  ;; Remember and restore the cursor position of opened files
  (save-place-mode 1)

  (load custom-file)

  ;; Revert buffers when the underlying file has changed
  (global-auto-revert-mode 1)

  :bind (("<escape>" . 'keyboard-escape-quit)))

(provide 'init-base)
;;; init-base.el ends here

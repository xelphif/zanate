;;;; init-base.el --- Default configuration options   -*- lexical-binding: t -*-


;;; Basic preferences

(setq inhibit-startup-message t     ; Don't show the splash screen
      ;; visible-bell t                ; Flash when alert bell sounds
      make-backup-files nil         ; Disable backup files
      auto-save-default nil)        ; Disable auto save

;; Always show line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Remember recent files
(recentf-mode 1)

;; Remember minibuffer inputs
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the cursor position of opened files
(save-place-mode 1)

;; Place custom variables in another file 
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; No dialog boxes
(setq use-dialog-box nil)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Make escape quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(provide 'init-base)


;;; init-base.el ends here

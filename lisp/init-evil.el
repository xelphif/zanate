;;;; init-evil.el --- Evil mode coniguration   -*- lexical-binding: t -*-

;; vi-style bindings
(use-package evil
  :demand t
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil)

  :config
  (evil-mode 1)

  (evil-set-leader nil (kbd ";"))

  ;; Set undo system to native commands
  (evil-set-undo-system 'undo-redo)
  
  ;; Use visual line motions even outside of `visual-line-mode' buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)

  :bind (:map evil-insert-state-map
              ("C-g" . evil-normal-state)
	          ("C-h" . evil-delete-backward-char-and-join)

         :map evil-normal-state-map
              ("<leader>ee" . find-file)
              ("<leader>ew" . find-file-other-window)
              ("<leader>er" . find-file-read-only)
              ("<leader>eR" . find-file-read-only-other-window)))

(use-package evil-collection
  :after evil
  :demand t
  :config
  (evil-collection-init))

(provide 'init-evil)
;;; init-evil.el ends here

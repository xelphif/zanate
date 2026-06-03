;;;; init-evil.el --- Evil mode coniguration   -*- lexical-binding: t -*-

;; Sophisticated undo behavior
(use-package undo-tree)

;; Vim keys
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
  
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)

  :bind (:map evil-insert-state-map
	("C-g" . evil-normal-state)
	("C-h" . evil-delete-backward-char-and-join)))

(use-package evil-collection
  :after (evil magit)
  :config
  (evil-collection-init))

(use-package evil-easymotion
  :after evil
  :init
  (evilem-default-keybindings "SPC"))

(provide 'init-evil)
;;; init-evil.el ends here

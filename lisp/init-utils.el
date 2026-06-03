;;;; init-utils.el --- Utility configuration    -*- lexical-binding: t -*-

;;; Code

;; Command hints
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; File tree
(use-package neotree
  :after evil
  :config
  (setq neo-theme 'ascii)
  :bind (:map evil-normal-state-map
              ("<leader>e" . 'neotree-toggle))
  :hook (neotree-mode . (lambda ()
		       (evil-local-set-key 'normal (kbd "RET") 'neotree-enter)
		       (evil-local-set-key 'normal (kbd "SPC") 'neotree-enter)
		       (evil-local-set-key 'normal (kbd "TAB") 'neotree-quick-look)
		       (evil-local-set-key 'normal (kbd "s")   'neotree-enter-vertical-split)
		       (evil-local-set-key 'normal (kbd "S")   'neotree-enter-horizontal-split)
		       (evil-local-set-key 'normal (kbd "a")   'neotree-create-node)
		       (evil-local-set-key 'normal (kbd "d")   'neotree-delete-node)
		       (evil-local-set-key 'normal (kbd "H")   'neotree-select-previous-sibling-node)
		       (evil-local-set-key 'normal (kbd "J")   'neotree-select-down-node)
		       (evil-local-set-key 'normal (kbd "K")   'neotree-select-up-node)
		       (evil-local-set-key 'normal (kbd "L")   'neotree-select-next-sibling-node)
		       (evil-local-set-key 'normal (kbd "r")   'neotree-rename-node)
		       (evil-local-set-key 'normal (kbd ".")   'neotree-change-root)
		       (evil-local-set-key 'normal (kbd ",")   'neotree-hidden-file-toggle)
		       (evil-local-set-key 'normal (kbd "gr")  'neotree-refresh))))

;; Enable Vertico.
(use-package vertico
  :init
  (vertico-mode)
  :config
  (vertico-flat-mode 1)
  (setq vertico-cylcle t))

(use-package consult
  :demand t
  :bind (:map evil-normal-state-map
              ("<leader>f" . 'consult-find)))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic substring)))

(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(provide 'init-utils)
;;; init-utils.el ends here

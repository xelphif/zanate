;;; init-prog.el --- Programming configuration      -*- lexical-binding: t -*-

;;; Code

;; TODO: Use dired
;; Git integration
(use-package magit
  :demand t)

;; LSP + Completion
(use-package corfu
  :demand t
  :config
  (global-corfu-mode))

(use-package cape
  :bind ("C-c p" . cape-prefix-map)
  :hook ((completion-at-point-function . cape-dabbrev)
         (completion-at-point-function . cape-file)
         (completion-at-point-function . cape-elisp-block)))

(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)
  
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq indent-line-function 'insert-tab)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p)
    
  :hook ((prog-mode . electric-pair-mode)
         (prog-mode . display-line-numbers-mode)
         (prog-mode . flymake-mode)
         (prog-mode . eglot-ensure)))

(provide 'init-prog)
;;; init-prog.el ends here

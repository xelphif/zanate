;;; init-prog.el --- Programming configuration      -*- lexical-binding: t -*-

;;; Code

;; TODO: Use dired
;; Git integration
(use-package magit)

;; LSP + Completion
(use-package corfu
  :demand t
  :config
  (global-corfu-mode))

(use-package cape
  :bind ("C-c p" . cape-prefix-map)
  :hook ((completion-at-point-function . cape-dabbrev)
         (completion-at-point-function . cape-file)
         (completion-at-point-function . cape-history)
         (completion-at-point-function . cape-elisp-block)))

(use-package eglot
  :ensure nil

  :init
  (setq eglot-autoshutdown t
        eglot-extend-to-xref t
        eglot-autoreconnect t)
  
  :bind (("C-c e e" . eglot)
         ("C-c e x" . eglot-reconnect)
         ("C-c e m" . eglot-menu)
         ("C-c e i" . eglot-find-implementation)
         ("C-c e f" . eglot-format-buffer)
         ("C-c e r" . eglot-rename)
         ("C-c e a" . eglot-code-actions)
         ("C-c e h" . eglot-inlay-hints-mode)))

(use-package flymake
  :ensure nil
  :bind (("C-c e d" . flymake-mode)
         ("C-c e n" . flymake-goto-next-error)
         ("C-c e p" . flymake-goto-prev-error)
         ("C-c e l" . flymake-show-buffer-diagnostics)))

(use-package emacs
  :init

  ;;; Formatting

  ;; Use spaces instead of tabs.
  (setq-default indent-tabs-mode nil
                tab-width 4
                tab-always-indent nil)

  ;; Enable word wrapping at whitespace but truncate lines by default.
  (setq-default word-wrap t
                truncate-lines t)

  (setq truncate-partial-width-windows nil)

  ;; Consider a period followed by a space as the end of a sentence.
  (setq sentence-end-double-space nil)

  ;; Automatically add newline to the end of a file.
  (setq require-final-newline t)

  ;;; Clipboard

  ;; Use system clipboard
  (setq select-enable-clipboard t
        select-enable-primary t)

  ;; Deduplicate kill-ring
  (setq kill-do-not-save-duplicates t)

  :custom
  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p)
    
  :hook ((prog-mode . electric-pair-mode)
         (prog-mode . display-line-numbers-mode)

         (c-ts-mode . eglot-ensure)
         (rust-ts-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure)
         (markdown-mode . eglot-esnure)
         (html-ts-mode . eglot-ensure)
         (css-ts-mode . eglot-ensure)
         (sh-mode . eglot-ensure)

         (before-save . eglot-format-buffer)

         ;; (lisp-data-mode . flymake-mode)

         (text-mode . visual-line-mode)))

(provide 'init-editor)
;;; init-prog.el ends here

;;;; init-editor.el --- Programming configuration      -*- lexical-binding: t -*-

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
         ("C-c e p" . flymake-goto-prev-error)))

;; Command hints
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package avy
  :after evil
  :config
  (setq avy-timeout-seconds 0.3)
  :bind (("M-s c" . avy-goto-char-timer)
         ("M-g g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)

         :map evil-normal-state-map
         ("<leader>x" . 'avy-goto-char-timer)
         ("<leader>s" . 'avy-goto-line)
         ("<leader>w" . 'avy-goto-word-1)))

(use-package vertico
  :init
  (setq vertico-cycle t)
  (vertico-mode))

(use-package consult
  :bind (("C-x M-:" . 'consult-complex-command)
         ("C-x b" . 'consult-buffer)
         ("C-x r b" . 'consult-bookmark)
         ("C-x r C-r" . 'consult-register)
         ("C-c e l" . 'consult-flymake)
         ("C-y" . 'consult-yank-pop)
         ("M-g m" . 'consult-mark)
         ("M-g o" . 'consult-outline)

         ("M-g i" . 'consult-imenu)
         ("M-g I" . 'consult-imenu-multi)
         ("M-s f" . 'consult-fd)
         ("M-s F" . 'consult-locate)
         ("M-s r" . 'consult-recent-file)
         ("M-s g" . 'consult-ripgrep)
         ("M-s G" . 'consult-git-grep)
         ("M-s h" . 'consult-isearch-history)

         :map evil-normal-state-map
              ("<leader>cb" . 'consult-bookmark)
              ("<leacer>cy" . 'consult-yank-pop)
              ("<leader>cm" . 'consult-mark)
              ("<leader>co" . 'consult-outline)
              ("<leader>b" . 'consult-buffer)
              ("<leader>B" . 'consult-buffer-other-window)
              ("<leader>i" . 'consult-imenu)
              ("<leader>I" . 'consult-imenu-multi)
              ("<leader>ff" . 'consult-fd)
              ("<leader>fl" . 'consult-locate)
              ("<leader>fr" . 'consult-recent-file)
              ("<leader>g" . 'consult-ripgrep)
              ("<leader>G" . 'consult-git-grep)
              ("<leader>h" . 'consult-isearch-history)))

(use-package marginalia
  :init
  (marginalia-mode)

  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic substring)))

(use-package emacs
  :init

  ;;; Behavior

  ;; Gradual scroll instead of sudden jumps
  (setq scroll-step 1
        scroll-margin 1)

  ;;; Formatting

  ;; Favor spaces over tabs.
  (setq-default indent-tabs-mode nil
                tab-width 4
                tab-always-indent nil)

  ;; Enable word wrapping at whitespace but truncate lines by default.
  (setq-default word-wrap t
                truncate-lines t)

  (setq truncate-partial-width-windows nil
        sentence-end-double-space nil
        require-final-newline t)

  ;;; Clipboard

  ;; Use system clipboard.
  (setq select-enable-clipboard t
        select-enable-primary t)

  (setq kill-do-not-save-duplicates t)

  :custom

  ;;; Minibuffer
  (context-menu-mode t)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)

  ;; Hide commands in M-x which do not work in the current mode.
  (read-extended-command-predicate #'command-completion-default-include-p)

  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))

  ;; Disable Ispell completion function.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.
  (read-extended-command-predicate #'command-completion-default-include-p)

  :config

  ;; Map prog-modes to their respective ts-modes.
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
  (add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  (add-to-list 'major-mode-remap-alist '(markdown-mode . markdown-ts-mode))
  (add-to-list 'major-mode-remap-alist '(html-mode . html-ts-mode))
  (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))
    
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

         (lisp-data-mode . flymake-mode)

         (text-mode . visual-line-mode)))

(provide 'init-editor)
;;; init-editor.el ends here

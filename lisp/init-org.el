;;;; init-org.el --- Org mode configuration    -*- lexical-binding: t -*-

;;; Code

;; Org configuration
(use-package org
  :init
  (setq org-agenda-files '("~/org")
        org-refile-targets '((org-agenda-files :maxlevel . 2))
        org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil

        org-log-into-drawer t
        org-log-done 'time
        org-log-redeadline 'time
        org-log-reschedule 'time)

  (setq org-todo-keywords '((sequence "TODO(t)" "PROG(p!)" "|" "DONE(d)"))

        org-todo-keyword-faces '(("TODO" . (:inherit org-todo))
                                 ("PROG" . (:inherit warning :weight bold))
                                 ("DONE" . (:inherit org-done)))

        org-capture-templates '(("t" "Task" entry
                                 (file "~/org/inbox.org")
                                 "* TODO %?\n")))

  (setq org-return-follows-link t
        org-adapt-indentation t
        org-hide-emphasis-markers t
        org-pretty-entities nil
        org-ellipsis "  ·")
  :config
  ;; Associate all org files with org mode
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  :bind (("C-c l" . #'org-store-link)
         ("C-c a" . #'org-agenda)
         ("C-c c" . #'org-capture))

  :hook ((org-mode . org-indent-mode)      ; Make the indentation look nicer

         (org-mode . (lambda ()
                       (evil-local-set-key 'normal (kbd "RET") 'org-return)))))

;; Zettelkasten for org
(use-package org-roam
  :custom (org-roam-directory (file-truename "~/notes"))
  :config
  (org-roam-db-autosync-mode)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)))

;; PDF viewer
(use-package pdf-tools
  :ensure nil       ; managed by guix
  :custom (pdf-annot-minor-mode-map-prefix "a")
  :init
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)

  :hook ((pdf-view-mode . pdf-view-themed-minor-mode)
         (pdf-view-mode . (lambda ()
                            (setq-local evil-normal-state-cursor '(nil))))))

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package auctex
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)
  :hook (TeX-after-compilation-finished-functions . TeX-revert-document-buffer))

(provide 'init-org)
;;; init-org.el ends here

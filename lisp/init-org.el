;;;; init-org.el --- Org mode configuration    -*- lexical-binding: t -*-


;; Org configuration
(use-package org 
  :ensure nil
  :config
  (setq org-agenda-files '("~/org")
        org-log-done 'time
        org-return-follows-link t)

  ;; Associate all org files with org mode
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  ;; Make the indentation look nicer
  (add-hook 'org-mode-hook 'org-indent-mode)
  ;; Wrap the lines in org mode so that things are easier to read
  (add-hook 'org-mode-hook 'visual-line-mode)

  :bind (("C-c l" . #'org-store-link)
         ("C-c a" . #'org-agenda)
         ("C-c c" . #'org-capture)))


(use-package org-roam
  :custom (org-roam-directory (file-truename "~/notes"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  (org-roam-db-autosync-mode))

(provide 'init-org)


;;; init-org.el ends here

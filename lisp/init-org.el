;;;; init-org.el --- Org mode configuration    -*- lexical-binding: t -*-


;; Org configuration
(use-package org 
  :ensure nil
  :init 
  (setq org-agenda-files '("~/org")
        org-log-done 'time
        org-return-follows-link t
        org-adapt-indentation t
        org-hide-emphasis-markers t
        org-pretty-entities t
	    org-ellipsis "  ·")
  :config
  ;; Associate all org files with org mode
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  :bind (("C-c l" . #'org-store-link)
         ("C-c a" . #'org-agenda)
         ("C-c c" . #'org-capture))
  :hook ((org-mode . org-indent-mode)      ; Make the indentation look nicer
         (org-mode . visual-line-mode)     ; Wrap the lines in org mode so that things are easier to read
         (org-mode . olivetti-mode)))   

;; Zettelkasten for org
(use-package org-roam
  :custom (org-roam-directory (file-truename "~/notes"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  (org-roam-db-autosync-mode))

(use-package mixed-pitch
  :hook (text-mode . mixed-pitch-mode))

;; Nice writing mode
(use-package olivetti
  :diminish
  :init (setq olivetti-body-width 0.6)
  :bind ("C-c o" . olivetti-mode))

(provide 'init-org)


;;; init-org.el ends here

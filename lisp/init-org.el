;;;; init-org.el --- Org mode configuration    -*- lexical-binding: t -*-

(use-package emacs
  :init
  (setq calendar-latitude    33.992611
	calendar-longitude  -83.720169))

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
  :config
  (org-roam-db-autosync-mode)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)))

(use-package mixed-pitch
  :hook (text-mode . mixed-pitch-mode))

;; Nice writing mode
(use-package olivetti
  :diminish
  :init (setq olivetti-body-width 100)
  :bind ("C-c o" . olivetti-mode))

;; PDF viewer
(use-package pdf-tools
  :custom (pdf-annot-minor-mode-map-prefix "a")
  :init
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  :bind (:map pdf-view-mode-map
              ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
	      ("g"  . pdf-view-first-page)
	      ("G"  . pdf-view-last-page)
	      ("l"  . image-forward-hscroll)
	      ("h"  . image-backward-hscroll)
	      ("j"  . pdf-view-next-page)
              ("k"  . pdf-view-previous-page)
              ("e"  . pdf-view-goto-page)
              ("u"  . pdf-view-revert-buffer)
              ("y"  . pdf-view-kill-ring-save)
              ("i"  . pdf-misc-display-metadata)
              ("s"  . pdf-occur)
              ("b"  . pdf-view-set-slice-from-bounding-box)
	      ("r"  . pdf-view-reset-slice)))

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

;;;; init.el --- Simple, modular emacs configuration    -*- lexical-binding: t -*-

;;
;;           ++
;;         #####+++
;;        ######
;;       ########-
;;       ##########
;;        ##########
;;         #######+##
;;          ########+
;;        #++- #+####+
;;        +-. #   #####
;;         --.     ##+
;;          ---.   ####
;;           ----
;;
;;      ZANATE EMACS

;; Add "lisp" to the beginning of `load-path`
(defun update-load-path (&rest _)
  "Update the `load-path` to prioritize personal configurations."
  (dolist (dir '("lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

;; Ensure function is called after `package-initialize`
(advice-add #'package-initialize :after #'update-load-path)

;; Initialize load paths explicitly
(update-load-path)

;;; Load modules

;; `use-package' initialization
(require 'init-package)

;; Preferences
(require 'init-base)
(require 'init-evil)
(require 'init-utils)
(require 'init-org)
(require 'init-editor)
(require 'init-ui)
;;; init.el ends here

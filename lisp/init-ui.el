;;;; init-ui.el --- UI configuration    -*- lexical-binding: t -*-


;; Theme
(use-package solarized-theme
  :demand t
  :init 
  (setq solarized-high-contrast-mode-line t)
  :config
  (load-theme 'solarized-light))

;; Padding
(use-package spacious-padding
  :demand t
  :config 
  (spacious-padding-mode 1))

(provide 'init-ui)


;; init-ui.el ends here

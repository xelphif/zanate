;;;; init-ui.el --- UI configuration    -*- lexical-binding: t -*-

;; Font
(set-face-font 'default "Mononoki Nerd Font Mono")
(set-face-font 'variable-pitch "LMRoman12")
(copy-face 'default 'fixed-pitch)

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
  :init
  (setq spacious-padding-widths
    '( :internal-border-width 15
       :header-line-width 4
       :mode-line-width 6
       :tab-width 4
       :right-divider-width 15
       :scroll-bar-width 8
       :fringe-width 8))
  :config 
  (spacious-padding-mode 1))

;; (use-package doom-nano-modeline
;;   :vc (:url "https://github.com/ronisbr/doom-nano-modeline")
;;   :demand t
;;   :config
;;     (doom-nano-modeline-mode 1))

(provide 'init-ui)
;;; init-ui.el ends here

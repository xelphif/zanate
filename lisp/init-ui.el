;;;; init-ui.el --- UI configuration    -*- lexical-binding: t -*-

;;; Font
(use-package emacs
  :config
  (set-face-attribute 'default nil
                      :font (font-spec :family "mononoki" :size 18 :weight 'regular))

  (set-face-attribute 'variable-pitch nil
                      :font (font-spec :family "NewComputerModern10" :size 20 :weight 'regular)))

(use-package mixed-pitch
  :diminish
  :init
  (setq mixed-pitch-set-height 1))

;; Theme
(use-package solarized-theme
  :demand t
  :init
  (setq solarized-high-contrast-mode-line t))

;; Theme based on sun
(use-package circadian
  :demand t
  :after solarized-theme
  :init
  (setq circadian-themes '((:sunrise . solarized-light)
                           (:sunset  . solarized-dark)))
  :config
  (circadian-setup))

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

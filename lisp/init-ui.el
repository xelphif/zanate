;;;; init-ui.el --- UI configuration    -*- lexical-binding: t -*-

;;; Font
(use-package emacs
  :init

  ;;; Modeline
  (setq mode-line-percent-position nil)
  (setq mode-line-collapse-minor-modes '(not flymake-mode
                                             overwrite-mode))
  (setq mode-line-collapse-minor-modes-to "[+]")

  (setq pgtk-wait-for-event-timeout 0)

  (setq calendar-latitude    11.856720
        calendar-longitude  -86.240158)

  :config

  ;;; Modeline
  (column-number-mode)

  ;;; Fonts
  (set-face-attribute 'default nil
                      :font (font-spec :family "mononoki" :size 18 :weight 'regular))

  (set-face-attribute 'variable-pitch nil
                      :font (font-spec :family "NewComputerModern10" :size 20 :weight 'regular)))

(use-package mixed-pitch
  :diminish
  :init
  (setq mixed-pitch-set-height 1)

  :bind ("C-c u m" . mixed-pitch-mode))

;; Nice writing mode
(use-package olivetti
  :diminish
  :init (setq olivetti-body-width 100)
  :bind ("C-c u o" . olivetti-mode))

;;; Theme
(use-package solarized-theme
  :demand t
  :init
  (add-hook 'enable-theme-functions
            (lambda (_theme)
              (dolist (buf (buffer-list))
                (with-current-buffer buf
                  (when (derived-mode-p 'pdf-view-mode)
                    (pdf-view-themed-minor-mode 1))))))

  (setq solarized-high-contrast-mode-line t
        solarized-highlight-numbers t
        solarized-scale-org-headlines nil
        solarized-use-variable-pitch nil))

;; Theme based on sun
(use-package circadian
  :demand t
  :after solarized-theme
  :init
  (setq circadian-themes '((:sunrise . solarized-light)
                           (:sunset  . solarized-dark)))
  :config
  (circadian-setup))

;;; Padding
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

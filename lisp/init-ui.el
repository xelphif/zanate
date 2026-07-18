;;;; init-ui.el --- UI configuration    -*- lexical-binding: t -*-

;;; Font
(defun zanate/configure-fonts (frame)
  "Configure font when graphical FRAME is created."
  (with-selected-frame frame
    (when (display-graphic-p)
      (set-face-attribute 'default nil
                          :font (font-spec
                                 :family "mononoki"
                                 :size 18
                                 :weight 'regular))
      (set-face-attribute 'variable-pitch nil
                          :font (font-spec
                                 :family "NewComputerModern10"
                                 :size 20
                                 :weight 'regular)))))

(use-package emacs
  :init

  ;;; Modeline
  (setq mode-line-percent-position nil)
  (setq mode-line-collapse-minor-modes '(not flymake-mode
                                             overwrite-mode))
  (setq mode-line-collapse-minor-modes-to "[+]")

  (setq pgtk-wait-for-event-timeout 0)

  (unless (daemonp)
    (zanate/configure-fonts (selected-frame)))

  (add-hook 'after-make-frame-functions #'zanate/configure-fonts)

  :config

  ;;; Modeline
  (column-number-mode))

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
  (setq solarized-high-contrast-mode-line t
        solarized-highlight-numbers t
        solarized-scale-org-headlines nil
        solarized-use-variable-pitch nil)

  (load-theme 'solarized-light t))

;; Theme based on sun

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

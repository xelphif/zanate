;;;; init-utils.el --- Utility configuration    -*- lexical-binding: t -*-


;; Command hints
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(provide 'init-utils)


;;; init-utils.el ends here

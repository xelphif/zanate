;;;; early-init.el --- Early initialization configuration   -*- lexical-binding: t -*-

;; Disable unnecessary GUI elements
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

;; Swap modeline to header
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)
;;; early-init.el ends here

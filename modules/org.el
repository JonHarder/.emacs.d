;;; org --- Summary
;; All things related or org mode configuration.

;;; Commentary:

;;; Code:

(setq org-agenda-files
      '("~/Org")
      org-src-fontify-natively t
      org-archive-location (concat user-emacs-directory
				   "archive/%s.archive::"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook
	    (lambda ()
	      (org-bullets-mode 1))))

(provide 'org)
;;; org.el ends here

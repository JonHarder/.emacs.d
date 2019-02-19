;;; org --- Summary
;; All things related or org mode configuration.

;;; Commentary:

;;; Code:

(setq org-agenda-files '("~/Org")
      org-src-fontify-natively t
      org-archive-location (concat user-emacs-directory
                                   "archive/%s.archive::")
      org-agenda-timegrid-use-ampm t)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)
   (python . t)))


(use-package org-journal
  :ensure t
  :init
  (setq org-journal-dir "~/Org/journal/"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook
      (lambda ()
        (org-bullets-mode 1))))

(setq org-todo-keywords
      '((sequence
           "TODO(t)"
           "WAIT(w@/!)"
           "|"
           "DONE(d!)"
           "CANCELED(c@)")))

(provide 'org)
;;; org.el ends here

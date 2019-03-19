;;; core --- Summary
;; Core configuration setup

;;; Commentary:
;; This sets up the basics of the configuration including use-package,
;; and basic settings (or things that I can't find a better place to put them into)

;;; Code:
(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; core settings behavior
(setq inhibit-startup-message t
      initial-scratch-message ""
      dired-listing-switches "-alh"
      ring-bell-function 'ignore
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))


(when (eq system-type 'darwin)
  (setq mac-option-modifier nil
        mac-command-modifier 'meta))


(show-paren-mode 1)
(electric-pair-mode 1)

(add-hook 'prog-mode-hook (lambda ()
                           (display-line-numbers-mode 1)
                           (setq display-line-numbers 'relative)))


(defun alist-keys (alist)
  "Get list of keys in the ALIST."
  (mapcar #'car alist))


(use-package dockerfile-mode
  :ensure t
  :mode "\\.Dockerfile")


(use-package dashboard
  :ensure t
  :preface
  (defun jh/dashboard-banner ()
    "Set a dashboard banner including information on package initialization."
    (setq dashboard-banner-logo-title
      (format "Emacs ready in %.2f seconds with %d garbage collections."
        (float-time (time-subtract after-init-time before-init-time)) gcs-done)))
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'jh/dashboard-banner)
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))


(use-package dash
  :ensure t)


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc"))


(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1))


(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package yaml-mode
  :ensure t)

(use-package ansible
  :ensure t)


(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


(provide 'jh-core)
;;; jh-core.el ends here
;;; core --- Summary
;; Core configuration setup

;;; Commentary:
;; This sets up the basics of the configuration including use-package,
;; and basic settings (or things that I can't find a better place to put them into)

;;; Code:
(defun jh/prog-mode-hook ()
  "Settings that should be enabled or disabled for all programming modes."
  (setq-default whitespace-style '(face tabs space-before-tab line-tail empty space-after-tab tab-mark))
  (hl-line-mode)
  (whitespace-mode 1))


(defun modules/core--load (config)
  "Load general core features, configure programming hook using CONFIG."
  

  (setq epa-pinentry-mode 'loopback)

  (use-package indent-guide
    :hook ((prog-mode . indent-guide-mode)
           (hcl-mode . indent-guide-mode)))

  (add-hook 'prog-mode-hook #'jh/prog-mode-hook)

  (straight-use-package 'dash)
  (straight-use-package 'ag)

  (use-package helpful)

  (use-package rg)
    

  (straight-use-package 'fireplace)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)


  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (use-package origami
    :config
    (global-origami-mode))

  (use-package flycheck
    :config
    (setq-default flycheck-emacs-lisp-load-path 'inherit)
    (add-hook 'after-init-hook #'global-flycheck-mode))

  (use-package avy)

  (use-package editorconfig
    :config
    (editorconfig-mode 1))
  
  
  (straight-use-package 'yaml-mode)
  
  (use-package markdown-mode
    :commands (markdown-mode gfm-mode)
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :custom
    (markdown-command "pandoc")))

(provide 'jh-core)
;;; jh-core.el ends here

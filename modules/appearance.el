;;; appearance --- Summary

;;; Commentary:

;;; Code:

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(defvar jh/color-themes nil "The available color themes, use in conjunction with jh/set-color-theme.")

(defconst system-themes
  '("adwaita"
    "deeper-blue"
    "dichromacy"
    "leuven"
    "light-blue"
    "manoj-dark"
    "misterioso"
    "tango"
    "tango-dark"
    "tsdh-light"
    "tsdh-dark"
    "wheatgrass"
    "whiteboard"
    "wombat"))


(setq jh/color-themes
  (append system-themes
    '("solarized-dark"
      "solarized-light"
      "birds-of-paradise-plus"
      "doom-solarized-light"
      "doom-challenger-deep"
      "doom-tomorrow-night"
      "doom-tomorrow-day"
      "doom-dracula"
      "spacemacs-dark"
      "spacemacs-light"
      "material"
      "material-light"
      "kooten"
      "dracula"
      "cyberpunk"
      "zenburn"
      "tango-plus"
      "twilight-bright")))


(defun jh/set-color-theme (theme)
  "Set the color theme to THEME."
  (interactive (list (completing-read "Theme: " jh/color-themes)))
  (cond
   ((member theme system-themes)
    (load-theme (intern theme) t))
   ((string-match (rx bol "doom-" (zero-or-more anything)) theme)
    (use-package doom-themes
      :ensure t
      :init
      (pcase theme
        ("doom-solarized-light" (setq doom-solarized-light-brighter-comments t))
        ("doom-challenger-deep" (setq doom-challenger-deep-brighter-comments t))
        ("doom-dracula" (setq doom-dracula-brighter-comments t)))
      :config
      (load-theme (intern theme) t)))
   ((string-match (rx bol "material" (zero-or-more anything)) theme)
    (use-package material-theme
      :ensure t
      :config
      (load-theme (intern theme) t)))
   ((member theme '("solarized-light" "solarized-dark"))
    (use-package solarized-theme
      :ensure t
      :config
      (load-theme (intern theme) t)))
   ((string-equal theme "birds-of-paradise-plus")
    (use-package birds-of-paradise-plus-theme
      :ensure t
      :config
      (load-theme 'birds-of-paradise-plus t)))
   ((string-equal theme "dracula")
    (use-package dracula-theme
      :ensure t
      :config
      (load-theme 'dracula t)))
   ((string-equal theme "twilight-bright")
    (use-package twilight-bright-theme
      :ensure t
      :config
      (load-theme 'twilight-bright t)))
   ((string-equal theme "cyberpunk")
    (use-package cyberpunk-theme
      :ensure t
      :config
      (load-theme 'cyberpunk t)))
   ((string-equal theme "tango-plus")
    (use-package tango-plus-theme
      :ensure t
      :config
      (load-theme 'tango-plus t)))
   ((string-equal theme "zenburn")
    (use-package zenburn-theme
      :ensure t
      :config
      (load-theme (intern theme) t)))
   ((member theme '("spacemacs-dark" "spacemacs-light"))
    (use-package spacemacs-theme
      :defer t
      :config
      (setq spacemacs-theme-org-highlight t
            spacemacs-theme-underline-parens t)
      :init (load-theme 'spacemacs-dark t)))
   ((string-equal theme "kooten")
    (use-package kooten-theme
      :ensure t
      :config
      (load-theme 'kooten t)))))


(provide 'appearance)
;;; appearance.el ends here

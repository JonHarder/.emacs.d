(defun modules/docker--load (config)
  "Use CONFIG to load Dockerfile syntax and an interactive docker UI."

  (use-package dockerfile-mode
    :mode "\\.Dockerfile")

  (use-package docker
    :defer 2
    :config
    (dolist (mode '(docker-image-mode
                    docker-container-mode
                    docker-network-mode
                    docker-volume-mode))
      (add-to-list 'evil-emacs-state-modes mode))))
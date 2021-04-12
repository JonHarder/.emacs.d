(defun modules/rss--load (config)
  "Configure any rss settings using CONFIG."
  (use-package elfeed
    :defer 3
    :config
    (setq-default
     elfeed-feeds '("https://martinfowler.com/feed.atom"
                    "http://reddit.com/r/emacs/.rss"
                    "https://emacsredux.com/atom.xml"))))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      clojure-mode
                      clojure-test-mode
                      auto-complete
                      yasnippet
                      color-theme-solarized)
  "A list of packages to ensure are installed at launch.")


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
(load "~/.emacs.d/user.el")

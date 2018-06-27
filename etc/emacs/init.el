; We must initialize package first here, so we will evaluate the config with the correct version of org mode
(require 'package)
(add-to-list 'package-archives 
               '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(require 'org)

(org-babel-load-file "~/.emacs.d/configuration.org")


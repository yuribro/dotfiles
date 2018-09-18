(package-initialize)

;; Hide stuff on init
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Basic UI
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(column-number-mode t)
(show-paren-mode t)

;; Package Manager

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Theme

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-default-dark t))

;; Configure ivy & friends
(use-package ivy
  :ensure t
  :config
  (progn
    (ivy-mode 1)

    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    ))

(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

;; Company mode for completion
(use-package company
  :ensure t
  :config
  (company-mode))

;; Some UI enhancments

;; Set default font
(set-face-attribute 'default nil
                    :family "Fantasque Sans Mono"
                    :height 130
                    :weight 'normal
                    :width 'normal)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Trying some stuff
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package fzf
  :ensure t)

;; Python
(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package flymake-python-pyflakes
  :ensure t
  :config
  (add-hook 'find-file-hook 'flymake-find-file-hook))

;; Git
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))


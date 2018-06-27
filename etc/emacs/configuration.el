
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; Don't need to check every time.
;(when (not package-archive-contents)
;   (package-refresh-contents))
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq gc-cons-threshold 20000000)

(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs 'y-or-n-p)

(setq sentence-end-double-space nil)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


  ;(use-package saveplace :ensure t :init)
  ;(setq-default save-place t)

  (when window-system
    (setq frame-title-format '(buffer-file-name "%b (%f)" ("%b"))))

  (global-auto-revert-mode 1)
  (setq echo-keystrokes 0.1)
  (auto-compression-mode t)
  (global-font-lock-mode t)

  (setq locale-coding-system 'utf-8) ; pretty
  (set-terminal-coding-system 'utf-8) ; pretty
  (set-keyboard-coding-system 'utf-8) ; pretty
  (set-selection-coding-system 'utf-8) ; please
  (prefer-coding-system 'utf-8) ; with sugar on top

  ; TODO
  (setq shift-select-mode nil)

  ;(bind-keys*
  ; ("M-/" . hippie-expand)
  ; ("C-s" . isearch-forward-regexp)
  ; ("C-r" . isearch-backward-regexp)
  ; ("C-M-s" . isearch-forward)
  ; ("C-M-r" . isearch-backward))


   ;(load "~/.emacs.d/themes/color-theme-molokai.el")
   (load "~/.emacs.d/themes/subdued-theme.el")

  (dolist (hook '(org-mode-hook))
    (add-hook hook (lambda () (flyspell-mode 1))))

  ; (load-file '"funcs.el")
  (put 'erase-buffer 'disabled nil)

  (setq-default indicate-buffer-boundaries 'left)
  (setq-default indicate-empty-lines +1)

  (setq redisplay-dont-pause t
        scroll-margin 1
        scroll-step 1
        scroll-conservatively 10000
        scroll-preserve-screen-position 1)


  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  ; (setq custom-file "~/.emacs.d/custom.el")
  ; (load custom-file)

  (use-package smex)
  (global-set-key (kbd "M-x") 'smex)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq myfont "Fantasque Sans Mono")
(set-face-attribute 'default nil :font myfont :height 120)
;(print (font-family-list))

(set-fontset-font "fontset-default" nil 
                   (font-spec :size 20 :name "Hack"))

(setq display-time-day-and-date t
                display-time-format "     T: %a %b %d %R "
                display-time-interval 60
                display-time-default-load-average nil)
(display-time)

(setq battery-mode-line-format "   Bat: %b%p%% Left: %t")
(display-battery-mode t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(when window-system
  (scroll-bar-mode -1))

(global-prettify-symbols-mode t)

(show-paren-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)

(setq-default cursor-type 'box)
(blink-cursor-mode -1)

(use-package powerline)
(powerline-default-theme)

(setq org-directory "~/org")


(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))
(setq org-index-file (org-file-path "index.org"))

(setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

(setq org-agenda-files (list org-index-file))

(use-package org-bullets)
(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode t)))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

; (use-package ox-confluence)

(setq calendar-week-start-day 0)
(setq org-agenda-start-on-weekday 0)

(setq org-startup-indented t)
(setq org-startup-folded "showall")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("g" "Guardicore Issue" entry (file+headline "~/org/Guardicore.org" "General Tasks")
         "* TODO %?\n %i\n Branch: %^{prompt|branch}\n Issue: https://guardicore.atlassian.net/browse/GC-%^{prompt|issue-number}")))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-k t)

(setq org-catch-invisible-edits t)

(setq org-todo-keywords
      '((sequence "TODO" "NEXT" "WAITING" "|" "DONE")
        (sequence "|" "CANCELED")))

(setq org-log-done 'time)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (gnuplot . t)
   (ledger . t))
 )

; (setq org-confirm-babel-evaluate nil)

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

; (setq org-ellipsis "⤵")

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(use-package ido-completing-read+)

(use-package ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package diff-hl)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(use-package magit)

(use-package exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))

  (add-hook 'python-mode-hook 'my/python-mode-hook)

(use-package  ledger-mode)
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode -1)

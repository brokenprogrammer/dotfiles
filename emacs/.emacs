; Setup packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

; Always install packages
(require 'use-package)
(setq use-package-always-ensure t)

; Enable line hightlighting 
(global-hl-line-mode 1)
; (set-face-background 'hl-line "light blue")

; Prevent emacs from losing undo information
; By setting a high limit for undo buffers.
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Turn off annoying toolbars
(scroll-bar-mode -1)
(tool-bar-mode 0)

; Set font
(add-to-list 'default-frame-alist `(font . ,"Liberation Mono-10"))
(set-face-attribute 'default t :font "Liberation Mono-10")

; Turn of bell on windows
(setq visible-bell 1)

; Always show line numbers
(global-linum-mode 1)

; Show column number in modeline
(column-number-mode)

; no screwing with my middle mouse button
(global-unset-key [mouse-2])

; Smooth scroll
(setq scroll-step 3)

; Clock
(display-time)

; Don't use tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; C Style conventions
(setq-default c-basic-offset 4)
(c-set-offset 'case-label '+)
(setq c-default-style "bsd")

; Setup ivy package which gives some nice autocomplete in minibuffer
(use-package ivy
  :init (ivy-mode 1)
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill)))

; UI to narrow down ivy suggestions
(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook))
  shell-mode-hook
  eshell-mode-hook
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" default))
 '(package-selected-packages '(counsel ivy-rich use-package gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Load theme
(setq custom-safe-themes t)
(load-theme 'gruvbox-dark-medium)

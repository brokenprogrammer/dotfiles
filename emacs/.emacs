; Allow to use melpa packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

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
(set-face-attribute 'default t :font "Liberation Mono-10")

; Turn of bell on windows
(setq visible-bell 1)

; Always show line numbers
(global-linum-mode 1)

; no screwing with my middle mouse button
(global-unset-key [mouse-2])

; Smooth scroll
(setq scroll-step 3)

; Clock
(display-time)

; Don't use tabs
(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" default))
 '(package-selected-packages '(gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Load theme
(setq custom-safe-themes t)
(load-theme 'gruvbox-dark-medium)

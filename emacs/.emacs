; Initialize MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(unless package-archive-contents (package-refresh-contents))
(package-initialize)

; Install Fsharp-mode
(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))
(require 'fsharp-mode)


; Prevent emacs from losing undo informatio
; By setting a high limit for undo buffers.
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Turn off annoying toolbars
(scroll-bar-mode -1)
(tool-bar-mode 0)
()

; TODO: Detect operating system.
; TODO: Add compilation shortcut command or something
; TODO: Add folder structure plugin.
; TODO: Add c++ formatting..

; Set file extensions and their modes
(setq auto-mode-alist
      (append
       '(("\\.cpp$" . c++-mode)
	 ("\\.h$"   . c++-mode)
	 ("\\.c$"   . c++-mode)
	 ("\\.fs"   . fsharp-mode)
	 ("\\.fsx"  . fsharp-mode)
       ) auto-mode-alist))

; Keybindings
(define-key global-map [C-right] 'forward-word)
(define-key global-map [C-left] 'backward-word)
(define-key global-map [C-up] 'previous-blank-line)
(define-key global-map [C-down] 'next-blank-line)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(define-key global-map [pgup] 'forward-page)
(define-key global-map [pgdown] 'backward-page)
(define-key global-map [C-next] 'scroll-other-window)
(define-key global-map [C-prior] 'scroll-other-window-down)

; Clock
(display-time)

(set-foreground-color "burlywood3")
(set-background-color "#161616")
(set-cursor-color "#40FF40")

; Functions to maximize window
(defun maximize-frame ()
  "Mazimize the current frame"
  (interactive)
  (w32-send-sys-command 61488))

(defun post-load ()
  (interactive)
  (menu-bar-mode -1)
  (maximize-frame)
  )
(add-hook 'window-setup-hook 'post-load t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (fsharp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

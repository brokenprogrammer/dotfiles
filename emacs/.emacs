; Initialize MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(unless package-archive-contents (package-refresh-contents))
(package-initialize)

; List of my installed packages
(defvar my-packages '(clojure-mode
		      fsharp-mode
		      haskell-mode
		      cider
		      rainbow-delimiters))

; Install missing packages
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

; Prevent emacs from losing undo informatio
; By setting a high limit for undo buffers.
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Turn off annoying toolbars
(scroll-bar-mode -1)
(tool-bar-mode 0)

; Turn of bell on windows
(setq visible-bell 1)

; Always show line numbers
(global-linum-mode 1)

; TODO: Detect operating system.
; TODO: Add compilation shortcut command or something

; Set file extensions and their modes
(setq auto-mode-alist
      (append
       '(("\\.cpp$" . c++-mode)
	 ("\\.h$"   . c++-mode)
	 ("\\.c$"   . c++-mode)
	 ("\\.clj$" . clojure-mode)
	 ("\\.hs$"  . haskell-mode)
	 ("\\.fs"   . fsharp-mode)
	 ("\\.fsx"  . fsharp-mode)
       ) auto-mode-alist))

; File mode hooks
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

; Newline indents, semi-colon doesn't
(define-key c++-mode-map "\C-m" 'newline-and-indent)
(setq c-hanging-semi&comma-criteria '((lambda () 'stop)))

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
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1"))))
 )

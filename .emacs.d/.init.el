;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;                ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;  Emacs Config  ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;                ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(custom-set-variables
 ;; custom-set-variables  added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("1ba61848d0d8c78e037867c26f118875705c20f5ad64949a8cee8c8059e5c50f" "3190b71fa04debee96a8d00b795498a12a6f3002a4e66daaad09f65e48e519db" "c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" "e52718d4b950106873fed00c469941ad8db20f02392d2c7ac184c6defe37ad2c" default)))
 '(fringe-mode 0 nil (fringe))
 '(org-agenda-files (quote ("~/1.org" "~/test.org")))
 '(package-selected-packages
   (quote
    (multi-term eterm-256color eterm-color web-mode git-gutter-fringe+ diff-hl git-gutter emojify emmet-mode impatient-mode evil-magit magit flycheck evil-surround org-bullets all-the-icons zoom processing-mode processing2-emacs ox-twbs rainbow-delimiters rainbow-mode fiplr evil-collection evil-leader evil use-package helm)))
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style nil nil (uniquify)))
(custom-set-faces
 '(default ((t (:family "Hasklug Nerd Font Mono" :height 100 :width normal)))))

;;;;;;;;;;;;  Add to list ;;;;;;;;;;;;; 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/lisp" )

;; No more start Up screen 
(setq inhibit-startup-screen -1)

;; Removing Menu/Tool/scroll > Bars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;set line numbre to be always on
(global-linum-mode t)

;;line highlight mode
(global-hl-line-mode t)
 
;;Changing the cursor type
(set-default 'cursor-type 'hbar)

;; Molokai theme
(load-theme 'molokai t)

;; VISUAL LINE (Wrapping mode)
(global-visual-line-mode 1)

;;;;;;;;;;;; ORG  ;;;;;;;;;;;
;; org Bullets :D
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;;;;;;;;; mode line ;;;;;;;;;
;; FORMAT
(setq-default mode-line-format
  (list

   '(:eval (propertize "%b" 'face '(:weight bold)))
   '(:eval (if (buffer-modified-p)
               (propertize " ✖ " 'face '(:foreground "#ff0087"))
             (propertize "  " 'face '(:foreground "#87ff00"))))
   '(:eval (propertize "%m" 'face '(:weight bold)))
   '(:eval (propertize "  " 'face '(:foreground "#ff8700")))
   '(:eval (propertize "%l" 'face '(:weight bold)))
   '(:eval (propertize "✖" 'face '(:foreground "#1b1d1e")))
   ))
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (face-remap-add-relative
             'mode-line '(( :background "#1b1d1e") mode-line))))
;;;;;; Auto Insert ;;;;

(setq auto-insert-alist
      '(((ruby-mode . "Ruby program") nil
         "#!/usr/bin/env ruby\n\n"
         "# File: " (file-name-nondirectory buffer-file-name) "\n"
         "# Time-stamp: <>\n"
         "# Copyright (C) " (substring (current-time-string) -4) " " auto-insert-copyright "\n"
         "# Description: " _ "\n\n")
	((emacs-lisp-mode . "Emacs lisp mode") nil
         ";;; " (file-name-nondirectory buffer-file-name) " --- " _ "\n\n"
         ";; Time-stamp: <>\n"
         ";; Copyright (C) " (substring (current-time-string) -4) " " auto-insert-copyright "\n\n"
         ";;; Commentary:\n\n"
         ";;; Code:\n\n"
         ";;; " (file-name-nondirectory buffer-file-name) " ends here\n")

	((c-mode . "C program") nil
	 "/* FILE: \t" (file-name-nondirectory buffer-file-name) "\n"
	 " * AUTHOR: \tHamdaoui Hamza\n"
	 " * DESCRIPTION:\tNULL\n"
	 " * \n"
	 " * CREATION:\t" (insert-date) "\n"
	 " * MODIFIED:\t" (insert-date) "\n */\n\n"
	 "/* ---------- headers ---------- */\n"
	 "#include <stdio.h>\n#include <stdlib.h>\n\n"
	 "/* ---------- types ---------- */\n\n"
	 "/* ---------- prototypes ---------- */\n\n"
	 "/* ---------- main entry ---------- */\N"
	 "int main(int argc, char **argv) {\n"
	 "  return 0;\n"
	 "}\n\n"
	 "/* ---------- implementations ---------- */\n"
	 )
        ((shell-mode . "Shell script") nil
         "#!/bin/bash\n\n"
         " # File: " (file-name-nondirectory buffer-file-name) "\n"
         " # Time-stamp: <>\n"
         " # Copyright (C) " (substring
			      (current-time-string) -4) " "
			      auto-insert-copyright "\n"
			      " # Description: " _ "\n\n")
	((cperl-mode . "Perl") nil
	 "#!/usr/bin/perl"
	 "\n#======================================================="
	 "========================"
	 "\n#"
	 "\n#         FILE: " (file-name-nondirectory buffer-file-name)
	 "\n#"
	 "\n#        USAGE: ./" (file-name-nondirectory buffer-file-name)
	 "\n#"
	 "\n#  DESCRIPTION: ---"
	 "\n#"
	 "\n#      OPTIONS: ---"
	 "\n# REQUIREMENTS: ---"
	 "\n#         BUGS: ---"
	 "\n#        NOTES: ---"
	 "\n#       AUTHOR: Anas Rchid (0x0584) <rchid.anas@gmail.com>"
	 "\n# ORGANIZATION: ---"
	 "\n#      VERSION: 1.0"
	 "\n#      CREATED: " (insert-date)
	 "\n#     REVISION: ---"
	 "\n#========================================================"
	 "=======================")
	)) 

;; Disable mouse mode 
(define-minor-mode disable-mouse-mode
  "A minor-mode that disables all mouse keybinds."
  :global t
  :lighter " 🐭"
  :keymap (make-sparse-keymap))

(dolist (type '(mouse down-mouse drag-mouse
                      double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    ;; Yes, I actually HAD to go up to 7 here.
    (dotimes (n 7)
      (let ((k (format "%s%s-%s" prefix type n)))
        (define-key disable-mouse-mode-map
          (vector (intern k)) #'ignore)))))

(disable-mouse-mode 1) ;; activate the mode


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;               ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;      EOF      ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;               ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

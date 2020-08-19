;; Add melpa-stable to package-archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") :t)

;; Initialise the packages, avoiding a re-initialisation.
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Make sure `use-package' is available.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; If `configuration.el' file is exists then load the file. Otherwise build and
;; load the `.el' file from the `.org' file.
;; (use-package org)
;; (let* ((conf "~/.emacs.d/configuration")
;;        (el (concat conf ".el"))
;;        (org (concat conf ".org")))
;;   (if (file-exists-p el)
;;       (load-file el)
;;     (org-babel-load-file org)))

(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(company yasnippet yaml-mode which-key use-package undo-tree
						 treemacs smex rainbow-delimiters paredit org-cliplink
						 org-bullets move-text magit gruvbox-theme golden-ratio
						 flx-ido editorconfig diminish diff-hl delight
						 all-the-icons-dired))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

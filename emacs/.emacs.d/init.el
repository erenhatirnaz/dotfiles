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


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))

(load custom-file)

(org-babel-load-file "~/.emacs.d/configuration.org")

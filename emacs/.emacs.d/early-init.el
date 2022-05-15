;; Initialise installed packages
(setq package-enable-at-startup t)

;; Define `user-cache-directory' variable
;; Create the directory If it's not exists
(defvar user-cache-directory
  "~/.cache/emacs/"
  "The directory where place persistent data files.")
(unless (file-directory-p user-cache-directory)
  (make-directory user-cache-directory))

;; Set cache directory for native compilation files
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
	  (expand-file-name  "eln-cache/" user-emacs-directory))))

;; Allow loading from the package cache.
(setq package-quickstart t
      package-quickstart-file (expand-file-name "package-quickstart.el" user-cache-directory))

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

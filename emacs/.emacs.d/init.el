(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(package-selected-packages
	 (quote
		(edit-indirect yasnippet yaml-mode white-sand-theme which-key use-package unicode-fonts undo-tree typescript-mode sparql-mode spacemacs-theme smex rainbow-delimiters projectile php-mode paredit origami org-cliplink org-bullets multi-term move-text moody markdown-preview-mode magit indent-guide imenu-list htmlize highlight-indent-guides helm gruvbox-theme golden-ratio go-mode gitignore-mode gitconfig-mode flx-ido fill-column-indicator engine-mode elfeed editorconfig doom-modeline diminish diff-hl darktooth-theme company cask avy async-await ag 2048-game)))
 )

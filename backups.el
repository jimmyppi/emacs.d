 ;; ==== Place Backup Files in Specific Directory ====

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

(require 'cl-lib)

(require 'package)
(add-to-list 'package-archives                                                  
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

; defvar is the correct way to declare global variables
; you might see setq as well, but setq is supposed to be use just to set
; variables, not create them.
(defvar required-packages
  '(
    base16-theme
    helm
    auto-complete
    magit
    highlight-indentation
    ido-completing-read+
    idomenu
    iedit
    flycheck
    py-autopep8
    auto-virtualenv
    elpy
    use-package
    mmm-mode
    markdown-mode
    kotlin-mode
    flycheck-kotlin
    groovy-mode
  ) "a list of packages to ensure are installed at launch.")

(defun required-packages-installed-p ()
  (cl-every 'package-installed-p required-packages))


; if not all packages are installed, check one by one and install the
; missing ones.
(unless (required-packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `required-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x required-packages))
                            (not (package-built-in-p x))
                            (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))

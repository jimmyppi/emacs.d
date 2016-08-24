(require 'cl-lib)

(require 'package)
(add-to-list 'package-archives                                                  
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


; defvar is the correct way to declare global variables
; you might see setq as well, but setq is supposed to be use just to set
; variables, not create them.
(defvar required-packages
  '(
    helm
    elpy
    auto-complete
    ein
    flymake
    flymake-cursor
    flycheck
    highlight-indentation
    ido-ubiquitous
    idomenu
    iedit
    base16-theme
    py-autopep8
    flymake-easy
    flymake-puppet
    puppet-mode
    matlab-mode
    php-mode
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

; todo: uninstall packages that aren't in the required list?

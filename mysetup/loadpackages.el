; Theming
(load-theme 'base16-solarized-dark t)

; Completion helper - successor to anything
(require 'helm)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(electric-pair-mode 1)

; Faster than the default scp
(setq tramp-default-method "ssh")

(require 'auto-complete-config)
(ac-config-default)

(global-flycheck-mode)

; C-; for sublime multi-cursor-edit
(require 'iedit)

; Elpy - Python in Emacs
(elpy-enable)
(setq-default elpy-modules
  (remove 'elpy-module-highlight-indentation elpy-modules))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default column-number-mode 1)

; requires pip install autopep8
(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=79")) ; <- Does not seem to work
; Use C-c p to apply pep8 formatting automatically
(add-hook 'python-mode-hook
  (lambda() 
    (local-set-key  (kbd "C-c p") 'py-autopep8))) 

;;;; rst mode for python doc strings
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(mmm-add-classes
 '((python-rst
    :submode rst-mode
    :front "^ *[ru]?\"\"\"[^\"]*$"
    :back "^ *\"\"\""
    :include-front t
    :include-back t
    :end-not-begin t)))
(mmm-add-mode-ext-class 'python-mode nil 'python-rst)

;(add-to-list 'load-path "~/.emacs.d/external/python-docstring-mode")
;(require 'python-docstring)
;(add-hook 'python-mode-hook (lambda () (python-docstring-mode t)))

; IPython Notebook - M-x ein:<tab> for commands
; Requires a notebook server (run "ipython notebook")
(require 'ein) 
(setq ein:use-auto-complete t)

; Start puppet-mode when editing a .pp file
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;(require 'php-mode)
;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(require 'flycheck-kotlin)
(flycheck-kotlin-setup)

;; ---------------------------------------
;; load elscreen (tabs)
;; requires apt-get install elscreen
;; ---------------------------------------
(load "elscreen" "ElScreen" t)

; matlab
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

; Dockerfile
(add-to-list 'load-path "~/.emacs.d/external/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

; yaml
(add-to-list 'load-path "~/.emacs.d/external/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

; Unlike python-mode, this mode follows the Emacs convention of not
; binding the ENTER key to `newline-and-indent'.  To get this
; behavior, add the key definition to `yaml-mode-hook':

(add-hook 'yaml-mode-hook
 '(lambda ()
   (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

; gradle
(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

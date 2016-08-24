; install packages
(load "~/.emacs.d/mysetup/packages.el")

; Theming
(load-theme 'base16-solarized-dark t)

; Completion helper - successor to anything
(require 'helm)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'auto-complete-config)
(ac-config-default)

(global-flycheck-mode)

; C-; for sublime multi-cursor-edit
(require 'iedit)

; Elpy - Python in Emacs
; requires pip install elpy rope
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;enable pep8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To enable pep8 check
;; install pep8 checker with one of those commands
;; sudo apt-get install pep8
;; or
;; sudo pip install pep8

(when (load "flymake" t)
 (defun flymake-pylint-init ()
   (let* ((temp-file (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
          (local-file (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
         (list "pep8" (list "--repeat" local-file))))

 (add-to-list 'flymake-allowed-file-name-masks
              '("\\.py\\'" flymake-pylint-init)))

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)


;;;; rst mode for python doc strings
;(require 'mmm-mode)
;(setq mmm-global-mode 'maybe)
;(mmm-add-classes
; '((python-rst
;    :submode rst-mode
;    :front "^ *[ru]?\"\"\"[^\"]*$"
;    :back "^ *\"\"\""
;    :include-front t
;    :include-back t
;    :end-not-begin t)))
;(mmm-add-mode-ext-class 'python-mode nil 'python-rst)


; IPython Notebook - M-x ein:<tab> for commands
; Requires a notebook server (run "ipython notebook")
(require 'ein) 
(setq ein:use-auto-complete t)

(require 'flymake-cursor) ; See flymake messages for cursor position
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))


;C/C++ convenience
;(add-hook 'c-mode-common-hook
;  (lambda() 
;    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
;
;(add-hook 'c-mode-common-hook
;  (lambda() 
;    (local-set-key  (kbd "C-c C-c") 'recompile)))
;
;(setq compile-command "scons")


; Tramp
(setq tramp-default-method "ssh")

; Start puppet-mode when editing a .pp file
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(require 'flymake-puppet)
(add-hook 'puppet-mode-hook 'flymake-puppet-load)

(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

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
(add-to-list 'load-path "~/.emacs.d/mysetup/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

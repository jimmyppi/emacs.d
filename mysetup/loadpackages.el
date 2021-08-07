; Theming
(load-theme 'base16-solarized-dark t)

;;;; Completion helper - successor to anything
(require 'helm)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

; auto-pair certain characters
(electric-pair-mode 1)

; Faster than the default scp
(setq tramp-default-method "ssh")

(require 'auto-complete-config)
(ac-config-default)

; C-; for sublime multi-cursor-edit
(require 'iedit)

;;;; Kotlin checker
; flycheck-kotlin requires ktlint: https://github.com/pinterest/ktlint#installation
(eval-after-load 'flycheck
 '(progn
    (require 'flycheck-kotlin)
    (flycheck-kotlin-setup)))

(global-flycheck-mode)
(setq-default flycheck-python-flake8-executable "flake8")
(setq-default flycheck-python-mypy-executable "mypy")

(require 'auto-virtualenv)
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)

;;;; Elpy - Python in Emacs
(elpy-enable)
(setq-default elpy-modules
  (remove 'elpy-module-highlight-indentation elpy-modules))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default column-number-mode 1)
(setq-default elpy-rpc-virtualenv-path 'default)
(setq-default elpy-test-runner 'elpy-test-pytest-runner)

; use flycheck instead of flymake
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;;; rst mode for python doc strings:
; https://emacs.stackexchange.com/questions/21086/python-docstrings-only-allow-two-indent-levels/21087#21087

(use-package mmm-mode
  :ensure t
  :defer t
  :commands mmm-mode
  :init
  (add-hook 'python-mode-hook 'mmm-mode)
  :config

  ;; Add python + rst major mode configuration.
  (defun rst-python-statement-is-docstring (begin)
    "Return true if beginning of statement is BEGIN."
    (save-excursion
      (save-match-data
        (python-nav-beginning-of-statement)
        (looking-at-p begin))))

  (defun rst-python-front-verify ()
    "Verify that we're looking at a python docstring."
    (rst-python-statement-is-docstring (match-string 0)))

  (setq mmm-parse-when-idle 't)
  (add-to-list 'mmm-save-local-variables 'adaptive-fill-regexp)
  (add-to-list 'mmm-save-local-variables 'fill-paragraph-function)

  (mmm-add-classes
   '((rst-python-docstrings
      :submode rst-mode
      :face mmm-comment-submode-face
      :front "u?\\(\"\"\"\\|\'\'\'\\)"
      :front-verify rst-python-front-verify
      :back "~1"
      :end-not-begin t
      :save-matches 1
      :insert ((?d embdocstring nil @ "u\"\"\"" @ _ @ "\"\"\"" @))
      :delimiter-mode nil)))

  (mmm-add-mode-ext-class 'python-mode nil 'rst-python-docstrings))

;; ---------------------------------------
;; load elscreen (tabs)
;; requires apt-get install elscreen
;; ---------------------------------------
(load "elscreen" "ElScreen" t)

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

(load "~/.emacs.d/mysetup/modifygui.el")
(load "~/.emacs.d/mysetup/backups.el")
(load "~/.emacs.d/mysetup/installpackages.el")
(load "~/.emacs.d/mysetup/loadpackages.el")

(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/mysetup/keybindings.el")
))

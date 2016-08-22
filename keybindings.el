;; Ctrl-c c creates a new elscreen, Ctrl-c d kills it
(global-set-key (kbd "C-c c") 'elscreen-create)
(global-set-key (kbd "C-c d") 'elscreen-kill)

;; Ctrl-c n/m switches between elscreens
(global-set-key (kbd "C-c m") 'elscreen-previous)
(global-set-key (kbd "C-c n") 'elscreen-next)

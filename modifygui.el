;; Remove scrollbars, menu bars, and toolbars
; when is a special form of "if", with no else clause, it reads:
; (when <condition> <code-to-execute-1> <code-to-execute2> ...)
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; todo: what does this do?
(setq url-http-attempt-keepalives nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(show-paren-mode 1)
(setq frame-title-format (list "%b - " invocation-name))

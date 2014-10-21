 ;;; .emacs --- Just my emacs stuff
;;; Commentary:

;;; Code:
(setq server-socket-dir "~/.emacs.d/")
(server-start)

(setenv "PATH" (concat (getenv "PATH") ":" (mapconcat 'identity '("/usr/local/opt/go/libexec/bin" "/usr/local/bin" "/opt/local/bin/" "/Users/brian/go/bin") ":")))
(setq exec-path (append exec-path '("/usr/local/opt/go/libexec/bin" "/Usr/local/bin" "/opt/local/bin" "/Users/brian/go/bin")))
(setenv "GOPATH" "$HOME/go/" 'true)


;; install el-get if not present
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))


;; list of packages we use straight from official recipes
(el-get 'sync)
(el-get 'sync '(
    asciidoc
    emacs-goodies-el
    sicp
    auto-dictionary
    puppet-mode
    go-mode
    go-autocomplete
    rect-mark
    crontab-mode
    markdown-mode
    color-theme-solarized
    tomorrow-theme
    base16
    yaml-mode
    jade-mode
    whitespace
    python-pep8
    python-mode
    virtualenvwrapper
    dash ;; virtualenvwrapper dep
    s ;; virtualenvwrapper dep
    yasnippet
    auto-complete
    auto-complete-yasnippet
    ac-python
    auto-complete-css
    ;jinja2-mode
    web-mode
    jedi
    ;rope
    ;ropemacs
    ;ropemode
    ;pymacs ;; prefer jedi

))


(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "/Users/brian/.virtualenvs")

;(ido-mode t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;Pesky backupfiles - go away
(setq backup-inhibited t)


; tramp mode
(require 'tramp)
(setq tramp-default-method "scpc")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(load-theme 'tomorrow-night-bright t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)



; go stuff
(require 'go-autocomplete)
(require 'auto-complete-config)

;; note to self
;;; C-c C-j (godef-jump) jumps to symbol
;;; C-c <left> jumps back (buffer based)
;;; C-C C-c compile
(defun brian-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; show line numbers

  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (setq gofmt-command "goimports")

  ; compile shortcut
  (local-set-key (kbd "C-c C-c") 'compile)
  ;(go-oracle-mode)
)

(add-hook 'go-mode-hook 'brian-go-mode-hook)
;(load "~/go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")

(add-hook 'go-mode-hook 'linum-mode)
(add-hook 'sh-mode-hook 'linum-mode)
(add-hook 'css-mode-hook 'linum-mode)
(add-hook 'html-mode-hook 'linum-mode)

(add-hook 'markdown-mode-hook 'auto-fill-mode)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq ring-bell-function 'ignore)

(set-default-font "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-15-*-*-*-m-0-iso10646-1")
(tool-bar-mode -1)
(column-number-mode 1)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;; completion stuff
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

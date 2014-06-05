;;; .emacs --- Just my emacs stuff
;;; Commentary:

;;; Code:
(setq server-socket-dir "~/.emacs.d/server/")
(server-start)

(setenv "PATH" (concat (getenv "PATH") ":" (mapconcat 'identity '("/usr/local/opt/go/libexec/bin" "/usr/local/bin" "/opt/local/bin/" "/Users/brs/go/bin") ":")))
(setq exec-path (append exec-path '("/usr/local/opt/go/libexec/bin" "/Usr/local/bin" "/opt/local/bin" "/Users/brs/go/bin")))
(setenv "GOPATH" "$HOME/go/")

;; set this _before_ loading packages
;;(setq jedi:setup-keys t)
;;(setq jedi:complete-on-dot t)
(defun virtualenvs (dir)
  "Find all directories in DIR."
  (unless (file-directory-p dir)
    (error "Not a directory `%s'" dir))
    (let ((dir (directory-file-name dir))
          (dirs '())
          (files (directory-files dir nil nil t)))
        (dolist (file files)
          (unless (member file '("." ".."))
            (let ((file (concat dir "/" file)))
              (when (file-directory-p file)
                (setq dirs (append (list "--virtual-env" (expand-file-name file)) dirs))
              )
            )
          )
        )
       dirs))

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
    yaml-mode
    jade-mode
    whitespace
    python-pep8
    python-mode
    yasnippet
    auto-complete
    auto-complete-yasnippet
    ac-python
    auto-complete-css
    ;jinja2-mode
    web-mode
    ;rope
    ;ropemacs
    ;ropemode
    ;pymacs ;; prefer jedi

))


;(ido-mode t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;Pesky backupfiles - go away
(setq backup-inhibited t)

; tramp mode
(require 'tramp)
(setq tramp-default-method "scpc")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(color-theme-solarized-dark)

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
(defun brs-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (setq gofmt-command "goimports")

  ; compile shortcut
  (local-set-key (kbd "C-c C-c") 'compile)
  ;(go-oracle-mode)
)

(add-hook 'go-mode-hook 'brs-go-mode-hook)
;(load "~/go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")





(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq ring-bell-function 'ignore)

(set-default-font "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-15-*-*-*-m-0-iso10646-1")
(tool-bar-mode -1)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;; completion stuff
(put 'upcase-region 'disabled nil)

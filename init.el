;;;;; emacs-easy-ide (EIDE)

;; emacs-easy-ide is a self-documenting emacs configuration, it aims easy to
;; use and cross platform.

;;;; Use cask and pallet for package management

(package-initialize)
(require 'cask (expand-file-name "$HOME/.cask/cask.el"))
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;;; Setup directory structure

(require 'f)
(eval-when-compile
  (defconst eide-conf-dir (f-expand "conf/" user-emacs-directory)
    "Eide conf directory.")
  (defconst eide-etc-dir (f-expand "etc/" user-emacs-directory)
    "Eide etc directory.")
  (add-to-list 'load-path eide-conf-dir))

;;;; Setup the way emacs loading files

(setq load-prefer-newer t)

;;;; Editor Core

(require 'eide-environment)          ;; Environment
(require 'eide-extension)            ;; Extension library
(require 'eide-editing-mode)         ;; (V), (E) and (A)
(require 'eide-ui)                   ;; User interface
(require 'eide-editor)               ;; Editor configuration
(require 'eide-enable)               ;; For enable emacs command
(require 'eide-cvs)                  ;; CVS
(require 'eide-key-bindings)         ;; Key bindings sheet
(require 'eide-context-menu)         ;; Context menu

;;;; Programming Language

(require 'eide-prog)                 ;; All programming languages
(require 'eide-text)                 ;; All text languages

(require 'eide-elisp)                ;; elisp

(require 'eide-c)                    ;; C
(require 'eide-c++)                  ;; C++
(require 'eide-objc)                 ;; Objc
(require 'eide-swift)                ;; swift

(require 'eide-python)               ;; python
(require 'eide-ruby)                 ;; ruby
(require 'eide-php)                  ;; PHP

(require 'eide-javascript)           ;; javaScript
(require 'eide-typescript)           ;; typeScript
(require 'eide-coffeescript)         ;; coffeeScript

(require 'eide-html)                 ;; HTML
(require 'eide-slim)                 ;; slim
(require 'eide-haml)                 ;; haml
(require 'eide-erb)                  ;; erb

(require 'eide-css)                  ;; CSS
(require 'eide-sass)                 ;; Sass
(require 'eide-scss)                 ;; SCSS syntax Sass
(require 'eide-less)                 ;; Less

(require 'eide-yaml)                 ;; yaml
(require 'eide-json)                 ;; JSON

(require 'eide-make)                 ;; Makefile

;;;; Applicaiton Framework

(require 'eide-rails)                ;; For rails framework

;;;; Operating System

(require 'eide-shell)                ;; bash

;;;; GTD

(require 'eide-org)                  ;; Org

;;;; Life and health

(require 'eide-health)               ;; Health

;;;; Fixed up

(require 'eide-fixup)                ;; Fix the playsound feature of emacs

;;;; Custom

(when (file-exists-p custom-file) (load custom-file))

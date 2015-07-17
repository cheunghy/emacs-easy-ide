;; Ruby

(require 'ruby-mode)

;; ruby file extensions
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Beanfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Podfile\\'" . ruby-mode))

;; compilation
(require 'ruby-compilation)

;; inferior ruby
(require 'inf-ruby)
(require 'ac-inf-ruby)
(add-hook 'inf-ruby-mode-hook (lambda ()
                                (ac-inf-ruby-enable)
                                (auto-complete-mode)))

;; ri documentation
(require 'yari)
(global-set-key (kbd "C-h y") 'yari-helm)

;; yaml
(require 'yaml-mode)

;; rails
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'rails-new)

;; mini test
(require 'minitest)
(setq minitest-keymap-prefix (kbd "C-c t"))
(eval-after-load 'minitest
  '(minitest-install-snippets))

;; rspec
(require 'rspec-mode)
(setq rspec-key-command-prefix (kbd "C-c t"))
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; yasnippet
(add-hook 'ruby-mode-hook 'yas-minor-mode-on)


;; syntax
(add-hook 'ruby-mode-hook
          '(lambda ()
             (modify-syntax-entry ?$ "w")
             (modify-syntax-entry ?@ "w")
             (modify-syntax-entry ?: ".")

             ;; indent guide
             (indent-guide-mode)
             ;; (setq indent-guide-recursive t)

             ))

;; support yard syntax
(require 'yard-mode)
(add-hook 'ruby-mode-hook 'yard-mode)


;; whitespace cleaning
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq-local whitespace-style '(empty indentation::space
                                                  space-befure-tab::space
                                                  trailing
                                                  whitespace-style::space))
             (add-hook 'before-save-hook 'whitespace-cleanup)))

;; do not deep indent
(setq ruby-deep-indent-paren nil)

;; guard
;; (require 'ruby-guard)

(provide 'ruby-bundle)
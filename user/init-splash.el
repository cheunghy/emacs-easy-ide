;; Disable tool bar
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))

;; 



(add-hook 'emacs-startup-hook 'show-initial-screen)
(defun show-initial-screen ()
  "show the initial screen for the easy omni ide"
  (let ((ide-buffer (get-buffer-create "IDE-Start-Up")))
    (with-current-buffer ide-buffer
      (insert "Select An IDE")
      (insert "\n")
      (insert-button "C IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "C++ IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "Objective-C IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "Ruby IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert " Only Ruby IDE is being implementing")
      (insert "\n")
      (insert-button "Python IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "PHP IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "Go IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "Javascript IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "Swift IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (insert-button "Shell-script IDE" 'action (lambda (x) (show-ruby-initial-screen)))
      (insert "\n")
      (switch-to-buffer ide-buffer))))

(defun show-ruby-initial-screen ()
  "show the ruby initial screen for the easy omni ide"
  (let ((ruby-buffer (get-buffer-create "Welcome to Ruby IDE")))
    (with-current-buffer ruby-buffer
      (insert-button "Create a project" 'action (lambda (x) (find-file user-init-file)))
      (insert "\n")
      (insert "Visit a last opened project\n")
      (insert-button "Old project" 'action (lambda (x) (find-file user-init-file)))
      (insert "\n")
      (insert-button "Old project" 'action (lambda (x) (find-file user-init-file)))
      (insert "\n")
      (insert-button "Old project" 'action (lambda (x) (find-file user-init-file)))
      (insert "\n")
      (insert-button "Old project" 'action (lambda (x) (find-file user-init-file)))
      (insert "\n")
      (insert-button "Open Another project" 'action (lambda (x) (find-file user-init-file)))
      (insert "\n")
      (switch-to-buffer ruby-buffer))))

(provide 'init-splash.el)

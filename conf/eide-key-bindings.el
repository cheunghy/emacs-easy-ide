;;;;; Key Definition Sheet

;; The design of key strokes of this emacs configuration is combine the best of
;; Emacs and modern text editors such as Sublime Text, TextMate and Atom.

;; It should be as efficient as Emacs, as convinient as modern text editors.

;; Most of commands has two equivalent key bindings, one for terminal Emacs,
;; one for window system Emacs. Which means: it should work on terminal as plain
;; emacs, it should work on window system as modern text editor.

;; On different operation systems, the system default key bindings differ, this
;; key bindings react to mimic the default system key binding, makes emacs more
;; seamless with the underlying operating system.

;;;; Command modifiers

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;;;; Prefix keys

;; Use C-z as prefix key

(define-prefix-command 'eide-c-z)
(global-set-key (kbd "C-z") 'eide-c-z)

;; Use s-g as prefix key

(define-prefix-command 'eide-s-g)
(global-set-key (kbd "s-g") 'eide-s-g)

;; Use s-k as prefix key for window manipulation

(define-prefix-command 'eide-s-k)
(global-set-key (kbd "s-k") 'eide-s-k)

;;;; Cancel

;; Use C-g to cancel

;; Esc doesn't work well for cancel

;;;; Exit

;; Use C-x C-s to exit

;; Use s-q to exit on OS X, too

(global-set-key (kbd "s-q") 'save-buffers-kill-emacs)

;;;; Suspend

;; Use C-x C-z to suspend

;; Use s-m to suspend on OS X, too

(global-set-key (kbd "s-m") 'iconify-frame)

;;;; Toggle full screen

;; Use f11 to toggle full screen

;; Use C-s-f to toggle full screen on OS X, too

(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)

;;;; Configuration

;; Use `customize' to customize.

;; Use C-z c i to go to user init file

(global-set-key (kbd "C-z c i") 'eide-goto-init-file)

;; Use C-z c c to go to a configuration file

(global-set-key (kbd "C-z c c") 'eide-goto-conf-file)

;; Use C-z c k to go to key binding file

(global-set-key (kbd "C-z c k") 'eide-goto-key-bindings-file)

;;;; Command Palette (smex)

;; M-x to open command palette (emacs way)

(global-set-key [remap execute-extended-command] 'smex)

;; s-S-p to open command palette (sublime text way)

(global-set-key (kbd "s-P") 'smex)

;; M-S-x for major mode commands

(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;;; Menu

;; Use M-` to open menu bar

(define-key global-map (kbd "M-`") 'menu-bar-open)

;;;; Help

;; C-h k to get usage of key

;; C-h c to get usage of key too but not verbose

;; C-h f to get usage of function

;; C-h v to get usage of variable

;; C-h a to get command match predicate

;; C-h d to get everything match predicate

;; C-h b to get all key bindings

;; C-h m to get usage of current mode

;; C-h e to go to message buffer to see what's going on

;; C-h i to read manual

;; C-h D to dash about thing at point

(global-set-key (kbd "C-h D") 'dash-at-point)



;;;; Cursor, mark and selection

;; Cursor is the most important to editing, all your insertion, deletion and
;; modification occurs on cursor. Every cursor has a corresponding mark, a
;; cursor and a mark define a selection.
;;
;; Most of the time, you need only one cursor, additional cursors are very
;; helpful in some cases.
;;
;; You can add cursor and remove cursor however you can not remove the only
;; cursor.

;; Use M-space to set mark

(global-set-key (kbd "M-SPC") 'set-mark-command)

;; Use C-x C-x to exchange cursor and mark

;; TODO: Remove multiple cursors section, multiple cursors should feel like
;; just normal.

;;; Cursors

(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-D") 'mc/skip-to-next-like-this)
(global-set-key (kbd "s-g s-d") 'mc/unmark-next-like-this)
(global-set-key (kbd "s-e") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-E") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "s-g s-e") 'mc/unmark-previous-like-this)
(global-set-key (kbd "s-g l") 'mc/mark-all-dwim)
(global-set-key (kbd "s-g a") 'mc/mark-all-like-this)

(global-set-key (kbd "s-g d") 'mc/mark-all-like-this-in-defun)

(global-set-key [s-mouse-1] 'mc/add-cursor-on-click)

;; From active region to multiple cursors:
(global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c c c") 'mc/edit-lines)
(global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

;;; Basic selection

;; C-x h and s-a to select all

(global-set-key (kbd "s-a") 'mark-whole-buffer)

;;; Expand region

;; s-L to expand current region

(global-set-key (kbd "s-L") 'er/expand-region)

;;; Expand line

;; s-l to expand line

(global-set-key (kbd "s-l") 'turn-on-expand-line-mode)

;;;; Movement

;;; Basic move

;; C-b, C-f, C-n, C-p same as arrows

;; C-a smart move to beginning of line

(global-set-key (kbd "C-a") 'eide-smart-beginning-of-line)

;; C-e move to end of line

;; M-r place cursor mid, top and bot of line

;;; Move to absolute position

;; M-g g go to line

;; M-g c go to char

;;; Move to exact somewhere in screen (ace-jump)

;; C-; to jump to char

(global-unset-key (kbd "C-;"))
(define-key global-map (kbd "C-;") 'ace-jump-char-mode)

;; C-S-; to jump to word

(define-key global-map (kbd "C-:") 'ace-jump-word-mode)

;; C-M-; to jump to line

(define-key global-map (kbd "C-M-;") 'ace-jump-line-mode)

;;; Move by screen

;; C-v scroll up

;; M-v scroll down

;;; Symbol move

;; M-n and M-p to navigate to another appearence of current symbol

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;;; Move with mark

;; s-y to set mark, s-u to return to that mark

(global-set-key (kbd "s-y") 'eide-push-mark)
(global-set-key (kbd "s-u") 'eide-pop-mark)

;;; Swoop

;; C-z z to swoop
;; TODO: change swoop's keybinding

(global-set-key (kbd "C-z z") 'helm-swoop)

;;;; Insertion

;;; Basic insertion

;; Most keys insert themselves through `self-insert-command'.

;; s-return to ignore current line and open new line

(global-set-key [s-return] 'eide-just-open-new-line)

;;; Hippie expand

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "s-'") 'hippie-expand)

;;; auto complete

;; auto complete will automatically trigger, use C-g to cancel

;;; Insertion by copy and paste

(if (string= emacs-distribution "emacs-mac")
    (progn
      (global-set-key (kbd "s-c") 'kill-ring-save)
      (global-set-key (kbd "s-v") 'yank)
      (global-set-key (kbd "s-x") 'kill-region)))

;;;; Deletion

;;; Basic deletion

;; C-d to delete forward, backspace to delete backward

;; C-k to kill to end of line

;; s-backspace just kill to indentation

(global-set-key (kbd "s-<backspace>") 'eide-kill-back-to-indentation)

;;;; Modification

;;; Uppercase and lowercase

;; M-u to upcase word

;; M-l to downcase word

;; M-c to capitalize word

;;; Search and replace

;; C-s and C-r : isearch-forward and isearch-backward
;; C-M-s and C-M-r : isearch-forward-regexp and isearch-backward-regexp
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

(global-set-key (kbd "s-f") 'isearch-forward)
(global-set-key (kbd "s-F") 'isearch-forward-regexp)
(global-set-key (kbd "s-g s-f") 'projectile-grep)
(global-set-key (kbd "s-r") 'anzu-query-replace)
(global-set-key (kbd "s-R") 'anzu-query-replace-regexp)
(global-set-key (kbd "s-g s-r") 'projectile-replace)

;;; Code comment

;; M-; comment
;; s-; comment do what i mean
(global-set-key (kbd "s-;") 'comment-dwim)



;;;; Buffer

;;; Open file

;; C-x C-f to open a file

;; s-o to open a file

(global-set-key (kbd "s-o") 'ido-find-file)

;; s-O to open a recent file

(define-key recentf-mode-map (kbd "s-O") 'recentf-ido-find-file)

;;; Save file

;; C-x C-s to save current buffer

;; s-s to save current buffer

(global-set-key (kbd "s-s") 'save-buffer)

;; C-x C-w to write file

;; s-S to write file

(global-set-key (kbd "s-S") 'ido-write-file)

;;; Close file

;; s-w to close current file

(global-set-key (kbd "s-w") 'kill-this-buffer)

;; s-M-w to kill last buffer

(global-set-key (kbd "s-M-w") 'eide-kill-last-buffer)
(global-set-key (kbd "s-M-∑") 'eide-kill-last-buffer)

;;; Switch buffer

;; C-x b to switch buffer

;;; Bookmarking

;; s-T to set bookmark

(global-set-key (kbd "s-T") 'bookmark-set)

;; s-t to goto bookmark

(global-set-key (kbd "s-t") 'bookmark-jump)

;; s-g t to show bookmark list

(global-set-key (kbd "s-g t") 'bookmark-bmenu-list)


;;;; Window

;; C-x o to cycle window

;; C-x 3 to split window right
;; s-k C-f to split window right

(global-set-key (kbd "s-k C-f") 'split-window-right)

;; C-x 2 to split window below
;; s-k C-n to split window below

(global-set-key (kbd "s-k C-n") 'split-window-below)

;; C-x 0 to close current window

;;;; Frame

;; C-x 5 o to cycle frame
;; s-` to cycle frame

(global-set-key (kbd "s-`") 'other-frame)



;;;; Undo and Redo

;;; Undo and redo for editing

;; Use s-z to undo

(global-set-key (kbd "s-z") 'undo-tree-undo)

;; Use s-Z to redo

(global-set-key (kbd "s-Z") 'undo-tree-redo)

;; Use C-x u to visualize undo tree

;;; Undo and redo for buffer, window, and frame (aka workspace)

;; TODO: Add undo redo for these things



;;;; Visual coding

;;; Code folding

;; s-g f to fold

(define-key hs-minor-mode-map (kbd "s-g f") 'hs-hide-block)
(define-key origami-mode-map (kbd "s-g f") 'origami-close-node)

;; s-g s to show

(define-key hs-minor-mode-map (kbd "s-g s") 'hs-show-block)
(define-key origami-mode-map (kbd "s-g s") 'origami-open-node)

;; s-g F to fold all

(define-key hs-minor-mode-map (kbd "s-g F") 'hs-hide-all)
(define-key origami-mode-map (kbd "s-g F") 'origami-close-all-nodes)

;; s-g S to show all

(define-key hs-minor-mode-map (kbd "s-g S") 'hs-show-all)
(define-key origami-mode-map (kbd "s-g S") 'origami-open-all-nodes)

;;;; Miscellaneous

;;; Project

;; most with projectile

;; C-z p p to switch project (emacs way)
;; C-s-p   to switch project (sublime text way)
(global-set-key [C-s-268632080] 'projectile-switch-project)
(global-set-key (kbd "C-s-p") 'projectile-switch-project)

;; C-z p f to switch file in project (emacs way)
;; s-p     to switch file in project (sublime text way)
(global-set-key (kbd "s-p") 'projectile-find-file)
;; C-z p 4 f  switch file in project new window

;; C-z p g   to switch file at point in project
;; C-z p 4 g to switch file at point in project new window

;; C-z p d   to switch dir in project
;; C-z p 4 d to switch dir in project new window
;; C-z p D   to open root dir

;; C-z p b   to switch to opened file in project
;; C-z p 4 b to switch to opened file in project

;; C-z p a   to switch file with same name diff ext
;; C-z p 4 a to swtich file with same name diff ext

;; C-z p T   to display a list of test files

;; C-z p o   runs multi-occur on all project buffers currently open

;; C-z p k   kill all this project buffer

;; C-z p e   show list of recently visited project files

;; C-z p C-h show projectile help

;; Project query and replace see Search and replace above

;;; CVS

;; C-z g g or M-f12 to view git status
(global-set-key (kbd "C-z g g") 'magit-status)
(global-set-key [(meta f12)] 'magit-status)
;; C-z g b to blame
(global-set-key (kbd "C-z g b") 'magit-blame-popup)
;; C-z g b to browse the file on github
(global-set-key (kbd "C-z g C-g") 'github-browse-file)
;; C-z g l to browse the file on github with blame
(global-set-key (kbd "C-z g C-b") 'github-browse-file-blame)
;; C-z g c to clone repo from github
(global-set-key (kbd "C-z g c") 'github-clone)
;; yagist not bind anything yet
;; gist not bind anything yet

;;;; Search web

(global-set-key (kbd "C-z q b") 'eide-search-bing)
(global-set-key (kbd "C-z q g") 'eide-search-google)

;;;; Open with external app

(global-set-key (kbd "C-z o f") 'eide-open-with-finder)
(global-set-key (kbd "C-z o s") 'eide-open-with-sublime-text)
(global-set-key (kbd "C-z o t") 'eide-open-with-textmate)
(global-set-key (kbd "C-z o a") 'eide-open-with-atom)

;;;; Package

(global-set-key [f9] 'package-install)
(global-set-key [M-f9] 'package-list-packages)
(global-set-key [s-f9] 'package-list-packages-no-fetch)

;;;; Org GTD

;; C-z [ to org-capture
(global-set-key (kbd "C-z [") 'org-capture)

;; C-z ] to cycle org files
(global-set-key (kbd "C-z ]") 'org-cycle-agenda-files)

;; C-z \ to open agenda menu
(global-set-key (kbd "C-z \\") 'org-agenda)

(provide 'eide-key-bindings)

; ------------- ;
; Package Setup ;
; ------------- ;

; straight.el Setup
; -----------------

; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; Setup use-package to use straight.el
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(require 'use-package)

; ------- ;
; Visuals ;
; ------- ;

(use-package solarized-theme
  :init (load-theme 'solarized-light t))

; Fonts
(defconst monospace-family "Menlo")
(defconst variable-family "ETBembo")

(setq-default line-spacing 0.1)
(set-face-attribute 'default nil :family monospace-family :height 180)
(set-face-attribute 'fixed-pitch nil :family monospace-family :inherit 'default)
(set-face-attribute 'variable-pitch nil :family variable-family :inherit 'default)

; Highlight current line
(global-hl-line-mode t)

; Show line numbers and parentheses in prog mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)

; Disable scroll and toolbar. Disable menu bar, except on osx, where
; it is always visible.
(unless (string-equal system-type "darwin") (menu-bar-mode -1))
(scroll-bar-mode -1)
(tool-bar-mode -1)

; Setup modeline
(use-package simple-modeline
  :config
  (defun m/evil-mode-segment () evil-mode-line-tag)
  (defun m/maybe-org-outline ()
    (if (string-equal major-mode "org-mode")
        (list " ❯ " (org-display-outline-path nil t " ❯ " t))))

  (setq simple-modeline-segments
        '((m/evil-mode-segment
           simple-modeline-segment-modified
           simple-modeline-segment-buffer-name
           m/maybe-org-outline)
          (simple-modeline-segment-misc-info)))
  (simple-modeline-mode t))

; ------ ;
; Tweaks ;
; ------ ;

; Keep temporary files out of the way
(setq backup-directory-alist `(("." . ,(expand-file-name "backup/" user-emacs-directory)))
      auto-save-list-file-prefix (expand-file-name "autosave/list-" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "autosave/" user-emacs-directory) t))
      lock-file-name-transforms `((".*" ,(expand-file-name "lock/" user-emacs-directory) t))
      desktop-path (list user-emacs-directory)
      desktop-base-file-name "emacs.desktop"
      desktop-base-lock-name "emacs.desktop.lock")

; Separate customize code from init.el
(setq custom-file (expand-file-name "customize.el" user-emacs-directory))
(load custom-file 1)

; Save current session, useful since we only really use emacs for org
(desktop-save-mode 1)

; Prefer vertical splits to split windows when possible
(setq split-height-threshold nil)

; Use ivy for autocompletion
(use-package ivy :config (ivy-mode))

; Editing Behavior
; ----------------

; Don't use tabs, but if they are present, display them as 4 spaces
(setq-default indent-tabs-mode nil
              tab-width 4)

; Don't paste to clipboard by default
(setq select-enable-clipboard nil)

; Reload buffer when file changes on disk
(global-auto-revert-mode)

; Persist undo history in tmp files
(use-package undo-tree
  :init (setq evil-undo-system 'undo-tree)
  :config
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist
        `(("." . ,(expand-file-name "undo/" user-emacs-directory))))
  (global-undo-tree-mode))

; -------- ;
; Keybinds ;
; -------- ;

; Use general to define keybinds, which-key to help me remember them.
(use-package general)
(use-package which-key :config (which-key-mode))

; Use a leader and localleader, since I am used to it from vim.
(setq leader "SPC"
      localleader "\\")

(general-create-definer leader-map
  :prefix leader
  :states 'motion
  :keymaps 'override)

; Can't live without vim keybinds
(use-package evil
  :init (setq evil-want-keybinding nil)
  :config (evil-mode t))

(use-package evil-escape
  :init
  (setq evil-escape-key-sequence "fj"
        evil-escape-unordered-key-sequence t)
  :config (evil-escape-mode))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode 1))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

; Use option as meta on macos
(when (string-equal system-type "darwin")
  (setq mac-command-modifier 'super
        mac-option-modifier 'meta))

; Always use the clipboard when using the system keys to yank/kill/copy
(defun call-fun-with-clipboard (fun)
   (let ((prev select-enable-clipboard))
     (setq select-enable-clipboard t)
     (funcall fun)
     (setq select-enabble-clipboard prev)))

(general-define-key
  "s-v" (lambda () (interactive) (call-fun-with-clipboard #'yank))
  "s-c" (lambda () (interactive) (call-fun-with-clipboard #'ns-copy-including-secondary))
  "s-x" (lambda () (interactive) (call-fun-with-clipboard #'kill-region)))

; Misc mappings
(leader-map "q" 'keyboard-quit
            "w" 'save-buffer
            "b" 'ivy-switch-buffer
            "f" 'find-file
            "y" (general-simulate-key  "\"+y" :lookup nil)
            "d" (general-simulate-key  "\"+d" :lookup nil)
            "p" (general-simulate-key  "\"+p" :lookup nil)
            "hv" 'describe-variable
            "hf" 'describe-function
            "hk" 'describe-key)

; Window Management
; -----------------

; Move between windows and create them with <leader>m + hjkl
(require 'windmove)

(defun move-window-or-create (direction)
  (if (window-in-direction direction)
      (cond ((eq direction 'above) (windmove-up))
            ((eq direction 'below) (windmove-down))
            ((eq direction 'left) (windmove-left))
            ((eq direction 'right) (windmove-right)))
      (cond ((eq direction 'above) (split-window-vertically) (windmove-up))
            ((eq direction 'below) (split-window-vertically) (windmove-down))
            ((eq direction 'left) (split-window-horizontally) (windmove-left))
            ((eq direction 'right) (split-window-horizontally) (windmove-right)))))

(defun move-or-create-up    () (interactive) (move-window-or-create 'above))
(defun move-or-create-down  () (interactive) (move-window-or-create 'below))
(defun move-or-create-left  () (interactive) (move-window-or-create 'left))
(defun move-or-create-right () (interactive) (move-window-or-create 'right))

(leader-map "mh" 'move-or-create-left
            "mj" 'move-or-create-down
            "mk" 'move-or-create-up
            "ml" 'move-or-create-right
            "mx" 'delete-window)

; ----- ;
; Elisp ;
; ----- ;

; Use rainbow parens for elisp
(use-package rainbow-delimiters
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

; -------- ;
; Org mode ;
; -------- ;

(use-package org :straight (:type built-in))

; File Locations
; --------------

(defconst m-org-main-dir     (expand-file-name "~/NextCloud/org/"))
(defconst m-org-archive-dir  (expand-file-name "archive" m-org-main-dir))

(defconst m-org-capture-todo     (expand-file-name "todo.org" m-org-main-dir))
(defconst m-org-capture-notes    (expand-file-name "notes.org" m-org-main-dir))
(defconst m-org-capture-meetings (expand-file-name "meetings.org" m-org-main-dir))

(setq org-directory m-org-main-dir
      org-default-note-file m-org-capture-todo
      org-agenda-files (list m-org-main-dir)
      org-archive-location (expand-file-name "%s.archive::" m-org-archive-dir))

; Tweaks
; ------

; Don't let org automatically add bookmarks
(setq org-bookmark-names-plist '())

; I often use underscores. Require {} to interpret them as subscript.
(setq org-use-sub-superscripts "{}"
      org-export-with-sub-superscripts "{}")

; Enable link abbreviations to be expanded inside property drawers.
; https://list.orgmode.org/PAXPR06MB7760CE05D2326E8A853E885DC6FA9@PAXPR06MB7760.eurprd06.prod.outlook.com/
(defun m/org-open-at-point-consider-alist (orig-fun &rest args)
  (let ((org-link-abbrev-alist (append org-link-abbrev-alist org-link-abbrev-alist-local)))
    (apply orig-fun args)))

(advice-add 'org-open-at-point-global :around 'm/org-open-at-point-consider-alist)

; Keybinds
; --------

(setq org-special-ctrl-a t)

; Global
(leader-map "oa" 'org-agenda
            "oc" 'org-capture
            "vk"  'dired)

; Capture
(general-define-key
  :states  'normal
  :prefix  localleader
  :keymaps 'org-capture-mode-map

  "r" 'org-capture-refile
  "w" 'org-capture-finalize
  "q" 'org-capture-kill)

; Agenda
(eval-after-load 'org-agenda
  '(progn
    ; Override all existing agenda keybinds
    (setq org-agenda-mode-map (make-sparse-keymap))

    (general-define-key
      :states  'emacs
      :keymaps 'org-agenda-mode-map

      "s" 'org-agenda-schedule
      "d" 'org-agenda-deadline

      "f" 'org-agenda-later
      "b" 'org-agenda-earlier
      "g" 'org-agenda-goto-date
      "." 'org-agenda-goto-today
      "j" 'org-agenda-next-line
      "k" 'org-agenda-previous-line


      "a" 'org-agenda
      "l" 'org-agenda-log-mode
      "v" 'org-agenda-view-mode-dispatch
      "/" 'org-agenda-filter-by-tag

      "u" 'org-agenda-undo
      "r" 'org-agenda-redo
      "t" 'org-agenda-todo

      "q" 'org-agenda-quit
      "w" 'org-save-all-org-buffers
      "<RET>" 'org-agenda-goto

      "SPC mh" 'move-or-create-left
      "SPC mj" 'move-or-create-down
      "SPC mk" 'move-or-create-up
      "SPC ml" 'move-or-create-right
      "SPC mx" 'org-agenda-quit

      "ci" 'org-agenda-clock-in
      "co" 'org-agenda-clock-out
      "cx" 'org-agenda-clock-cancel
      "cr" 'org-agenda-clockreport-mode)))

; Calendar
(general-define-key
  :keymaps 'org-read-date-minibuffer-local-map
  ; Make all bindings to move the calendar in org's date picker use alt
  ; for use alt for consistency. Use q to quit easily.
  "M-." (lambda () (interactive) (org-eval-in-calendar '(calendar-goto-today)))
  "M-<" (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-month 1)))
  "M->" (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-month 1)))
  "M-q" 'minibuffer-keyboard-quit
  "q" 'minibuffer-keyboard-quit)

; Local
(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (evil-org-set-key-theme '(navigation additional textobjects todo return)))

(general-define-key
  :states  'normal
  :keymaps 'org-mode-map
  :prefix  localleader

  "d" 'org-deadline
  "s" 'org-schedule
  "t" 'org-set-tags-command

  "r" 'org-refile
  "a" 'org-archive-subtree

  "y" 'org-time-stamp
  "Y" 'org-time-stamp-inactive

  "l" 'org-open-at-point
  "L" 'org-insert-link

  "C" 'org-columns
  "f" 'org-sparse-tree
  "x" 'org-edit-special
  "p" 'org-set-property
  "e" 'org-export-dispatch
  "*" 'org-toggle-heading
  localleader 'org-ctrl-c-ctrl-c

  "ci" 'org-clock-in
  "cI" 'org-clock-in-last
  "co" 'org-clock-out
  "cg" 'org-clock-goto
  "cx" 'org-clock-cancel
  "cr" 'org-clock-display

  "zw" 'widen
  "zt" 'org-narrow-to-subtree
  "zb" 'org-narrow-to-block
  "ze" 'org-narrow-to-element

  "N" (lambda () (interactive) (org-insert-subheading nil) (evil-insert 0))
  "n" (lambda () (interactive) (org-insert-heading-respect-content) (evil-insert 0)))

(general-define-key :states 'normal :keymaps 'org-mode-map "C-o" 'org-mark-ring-goto)

; Workflow
; --------

(setq org-todo-keywords
      '((sequence
          "TODO(t/!)"
          "WAIT(w!/!)"
          "|"
          "DONE(d!/!)"
          "NOPE(n!/!)"))
      org-tag-alist
      '((:startgroup . nil)
        ("work" . ?w)
        ("personal" . ?p)
        ("meta" . ?m)
        (:endgroup . nil))
      org-capture-templates
      `(("t" "Create a task" entry
         (file ,m-org-capture-todo)
         "* TODO %?")
        ("n" "Make a note" entry
          (file ,m-org-capture-notes)
          "* %U %?")
        ("m" "Start a meeting note" entry
          (file ,m-org-capture-meetings)
          "* %^T %^{Meeting Name}\n%?"))
      org-agenda-custom-commands
      '(("t" "All TODO and WAIT entries"
         ((todo "TODO") (todo "WAIT")))
        ("p" "All personal TODO and WAIT entries"
         ((tags-todo "work+TODO=\"TODO\"")
          (tags-todo "work+TODO=\"WAIT\"")))
        ("w" "All work-related TODO and WAIT entries"
         ((tags-todo "work+TODO=\"TODO\"")
          (tags-todo "work+TODO=\"WAIT\"")))))

(add-hook 'org-capture-mode-hook 'evil-insert-state)

(setq org-startup-folded t

      org-enforce-todo-dependencies t
      org-use-property-inheritance t

      org-log-done 'time
      org-log-redeadline 'time
      org-log-reschedule 'time
      org-log-into-drawer t

      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0

      calendar-week-start-day 1

      org-agenda-skip-deadline-prewarning-if-scheduled t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-deadline-warning-days 7

      org-agenda-time-grid nil
      org-agenda-start-with-log-mode t
      org-fold-show-context-detail '((default . ancestors))

      org-refile-targets '((org-agenda-files :maxlevel . 5))
      org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm)

; Visuals
; -------

(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)

(setq org-ellipsis " [+]"
      org-startup-indented t
      org-src-fontify-natively t
      org-auto-align-tags nil
      org-tags-column 0)

(set-face-attribute 'org-checkbox nil :box nil)
(set-face-attribute 'org-level-1 nil :height 1.25)

(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :height 0.8 :inherit '(fixed-pitch shadow))
(set-face-attribute 'org-verbatim nil :height 0.8 :inherit '(fixed-pitch shadow))
(set-face-attribute 'org-block nil :inherit 'fixed-pitch)
(set-face-attribute 'org-ellipsis nil :inherit 'fixed-pitch)

(use-package org-modern
  :after org
  :init
  (add-hook 'org-mode-hook 'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook 'org-modern-agenda)
  :config
  (set-face-attribute 'org-modern-radio-target nil :inherit '(variable-pitch org-modern-done))
  (set-face-attribute 'org-modern-internal-target nil :inherit '(variable-pitch org-modern-done))
  (set-face-attribute 'org-modern-label nil :height 0.9 :inherit 'fixed-pitch)
  (setq org-modern-list '((?* . "◦") (?- . "•")(?+ . "‣"))
        org-modern-table nil
        org-modern-keyword nil
        org-modern-todo-faces
        ; These match the backgrounds of org-modern-todo and org-modern-done
        '(("NOPE" :foreground "red"    :background "gray90")
          ("WAIT" :foreground "yellow" :background "#2aa198"))))

(use-package org-appear
  :after org
  :init
  (add-hook 'org-mode-hook 'org-appear-mode)
  (setq org-hide-emphasis-markers t
        org-link-descriptive t
        org-pretty-entities t
        org-appear-autolinks t
        org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autoentities t))


;;;;;;;;;;;;;;;;;;;;;;;
;;(server-start)

(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(defvar outline-minor-mode-prefix "\M-\"")


(setq-default indent-tabs-mode nil)
(setq custom-tab-width 4)
(require 'package)
(package-initialize)

(add-to-list 'package-archives (cons "melpa" (concat "http://melpa.org/packages/")) t)
(require 'use-package)

(add-to-list 'load-path "/lisp/")


;;;;;; for exwm ;;;;;;;

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)
;; (exwm-enable)

;; affichage de l'heure
(setq display-time-24hr-format t)
(display-time-mode 1)

(setq column-number-mode t)
(elpy-enable)

;;no startup message
(setq inhibit-startup-message t)

(setq timeclock-mode-line-display t)
;;(global-linum-mode t) ;; enable line numbers globally
;;ido mode
;;(require 'ido)
;;(ido-mode t)

;; utf8 pour tout
(prefer-coding-system 'utf-8)

;;(add-to-list 'default-frame-alist '(fullscreen . fullscreen))


(if window-system
    (tool-bar-mode -1))

(if window-system
    (menu-bar-mode -1))

(if window-system
    (scroll-bar-mode -1))

;; delete what is selected when typing
(delete-selection-mode 1)

;; current line highlighted
(global-hl-line-mode t)


;; Save whatever’s in the current (system) clipboard before
;; replacing it with the Emacs’ text.
;; https://github.com/dakrone/eos/blob/master/eos.org
(setq save-interprogram-paste-before-kill t)


(add-to-list 'load-path "/usr/share/emacs/26.1/site-lisp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--stats" "-C")))
 '(ag-ignore-list (quote ("i18n/")))
 '(counsel-ag-base-command "ag --nocolor --nogroup %s")
 '(counsel-etags-update-tags-backend (quote projectile-regenerate-tags))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(default-frame-alist (quote ((vertical-scroll-bars))))
 '(elpy-syntax-check-command "flake8")
 '(global-hl-line-mode nil)
 '(ibuffer-formats
   (quote
    ((mark " "
           (name 16 -1)
           " " filename)
     (mark modified read-only locked " "
           (name 18 18 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process))))
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(org-download-method (quote directory))
 '(package-selected-packages
   (quote
    (jabber stumpwm-mode bookmark+ bookmark-plus ivy-hydra hydra persp-mode ibuffer-vc vc-msg git-gutter company-jedi ripgrep org-bullets org-bullet multi-term multiterm ivy-rich winnow smart-mode-line wgrep-ag diff-hl dumb-jump expand-region hungry-delete org-download wgrep which-key ace-window try use-package swiper-helm csv-mode ag swiper ggtags magit ahungry-theme js2-mode company-flx flx-isearch all-the-icons-ivy counsel counsel-codesearch counsel-etags ivy aggressive-indent flx-ido projectile sudo-edit solarized-theme seq realgud neotree isend-mode elpygen elpy color-theme-solarized better-shell)))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "l10n*" "i18n*")))
 '(projectile-tags-command "ctags -Re --tag-relative=always -f \"%s\" %s \"%s\"")
 '(projectile-tags-file-name ".TAGS")
 '(realgud-safe-mode nil)
 '(realgud:ipdb-command-name "ipdb3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(whitespace-tab ((t (:foreground "#636363")))))


(load-theme 'solarized-dark)






;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("home"
         ("JS" (filename . ".js"))

         ("Python" (filename . ".py"))
         ("XML" (filename . ".xml"))
         ("ag" (name . "\*ag"))
      ("Magit" (name . "\magit"))
      ("Dired" (mode . dired-mode))
      ("Firefox" (name . "\Firefox:"))
      ("Org" (or (mode . org-mode)
                 (filename . "OrgMode")))
      ("Terminal" (name . "\Tilda"))
      ("Kitchen" (or (name . "\.emacs")
                       (filename . ".emacs.d")
                       (filename . "emacs-config")
                       (name . "\*Warnings\*")
                       (name . "\*Warnings\*")
                       (name . "\*Backtrace\*")
                       (name . "\*scratch\*")))
      ("Help" (or (name . "\*Help\*")
                  (name . "\*Apropos\*")
                     (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "home")))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)





(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)


;;projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)






;; (use-package ivy-rich
;;   :after ivy
;;   :ensure t
;;   :init
;;   (ivy-rich-mode 1)
;;   :custom
;;   (ivy-rich--display-transformers-list
;;         (quote
;;          (ivy-switch-buffer
;;           (:columns
;;            ((ivy-rich-candidate
;;              (:width 30))
;;             (ivy-rich-switch-buffer-indicators
;;              (:width 4 :face error :align right))
;;             (ivy-rich-switch-buffer-major-mode
;;              (:width 12 :face warning))
;;             (ivy-rich-switch-buffer-project
;;              (:width 15 :face success))
;;             (ivy-rich-switch-buffer-path
;;              (:width
;;               (lambda
;;                 (x)
;;                 (ivy-rich-switch-buffer-shorten-path x
;;                                                      (ivy-rich-minibuffer-width 0.3)))
;;               )))
;;            :predicate
;;            (lambda
;;              (cand)
;;              (get-buffer cand)))
;;           counsel-M-x
;;           (:columns
;;            ((counsel-M-x-transformer
;;              (:width 40))
;;             (ivy-rich-counsel-function-docstring
;;              (:face font-lock-doc-face))))
;;           counsel-describe-function
;;           (:columns
;;            ((counsel-describe-function-transformer
;;              (:width 40))
;;             (ivy-rich-counsel-function-docstring
;;              (:face font-lock-doc-face))))
;;           counsel-describe-variable
;;           (:columns
;;            ((counsel-describe-variable-transformer
;;              (:width 40))
;;             (ivy-rich-counsel-variable-docstring
;;              (:face font-lock-doc-face))))
;;           counsel-recentf
;;           (:columns
;;            ((ivy-rich-candidate
;;              (:width 0.8))
;;             (ivy-rich-file-last-modified-time
;;              (:face font-lock-comment-face)))))))

;;   ;; (ivy-virtual-abbreviate 'full
;;   ;;                          ivy-rich-switch-buffer-align-virtual-buffer t
;;   ;;                          ivy-rich-path-style 'abbrev)
;;   :config
;;   (ivy-set-display-transformer 'ivy-switch-buffer
;;                                'ivy-rich--ivy-switch-buffer-transformer)

;;           )
  ;; (setq ivy-rich--display-transformers-list
  ;;       '(ivy-switch-buffer
  ;;         (:columns
  ;;          ((ivy-rich-candidate (:width 30))  ; return the candidate itself
  ;;           (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
  ;;           (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
  ;;           (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
  ;;           (ivy-rich-switch-buffer-path
  ;;            (:width (lambda (x)
  ;;                      (ivy-rich-switch-buffer-shorten-path
  ;;                       x
  ;;                       (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
  ;;          :predicate
  ;;          (lambda (cand) (get-buffer cand)))
  ;;         counsel-M-x
  ;;         (:columns
  ;;          ((counsel-M-x-transformer (:width 40))  ; thr original transfomer
  ;;           (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))  ; return the docstring of the command
  ;;         counsel-describe-function
  ;;         (:columns
  ;;          ((counsel-describe-function-transformer (:width 40))  ; the original transformer
  ;;           (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))  ; return the docstring of the function
  ;;         counsel-describe-variable
  ;;         (:columns
  ;;          ((counsel-describe-variable-transformer (:width 40))  ; the original transformer
  ;;           (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face))))  ; return the docstring of the variable
  ;;         ))



; Use Enter on a directory to navigate into the directory, not open it with dired.
(define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)




;; flx for search in documents
;;(global-set-key (kbd "C-s") #'flx-isearch-forward)
;;(global-set-key (kbd "C-r") #'flx-isearch-backward)

;; flx ido
;;(require 'flx-ido)
;;(ido-mode 1)
;;(ido-everywhere 1)
;;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;;(setq ido-enable-flex-matching t)
;;(setq ido-use-faces nil)
;;(setq flx-ido-threshold 10000)

(use-package undo-tree
  :ensure t
  :config
  (defadvice undo-tree-make-history-save-file-name
      (after undo-tree activate)
    (setq ad-return-value (concat ad-return-value ".gz")))
  :init
  (global-undo-tree-mode))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c l") 'org-store-link)

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . ng2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; met les fichiers temporaires dans le dossier .emacs
;; https://stackoverflow.com/a/22176971


(defvar my-auto-save-folder "~/.emacs.d/auto-save/")
(setq tramp-auto-save-directory my-auto-save-folder); auto-save tramp files in local directory
(setq auto-save-list-file-prefix "~/.emacs.d/auto-save/.saves-"); set prefix for auto-saves 
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t)))


(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))


    ;; scroll one line at a time (less "jumpy" than defaults)
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    (setq mouse-wheel-progressive-speed t) ;; don't accelerate scrolling
    
    (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;;sublimity
;;(add-to-list 'load-path "/home/odoo/.emacs.d/sublimity/")
;;(require 'sublimity)
;; (require 'sublimity-scroll)
;; (require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)

(use-package ace-window
  :ensure t
  :config
  (setq aw-dispatch-always 't)
  :init
  (progn
    (global-set-key "\M-o" 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))


(use-package which-key
:ensure t
:config
(which-key-mode))

(use-package org-download
:ensure t
:config
(which-key-mode))


(use-package wgrep
:ensure t
:config
(progn
(which-key-mode)
(setq wgrep-enable-key "r")))

(use-package swiper
:ensure try
:config
(progn
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-h i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "C-h u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq projectile-completion-system 'ivy)
; Let ivy use flx for fuzzy-matching
(require 'flx)
(setq ivy-height 16)
(setq ivy-re-builders-alist
      '((swiper . ivy--regex-plus)
        (t      . ivy--regex-fuzzy)))
(global-set-key (kbd "M-x") 'counsel-M-x)

))

; deletes all the whitespace when you hit backspace or delete
;; (use-package hungry-delete
;;   :ensure t
;;   :config
;;   (global-hungry-delete-mode))

; expand the marked region in semantic increments (negative prefix to reduce region)
(use-package expand-region
:ensure t
:config
(global-set-key (kbd "C-=") 'er/expand-region))

(setq org-todo-keywords
  '((sequence "TODO" "QUESTION" "NO PROBLEM FOR ME" "|" "DONE" "ABANDONED" "NO PROBLEM")))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g b" . dumb-jump-back)
         ("M-g z" . dumb-jump-go-prefer-external-other-window)
         )
   :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))

(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'

(global-whitespace-mode) ; Enable whitespace mode everywhere

(use-package wgrep-ag
  :ensure t)


(use-package winnow
  :ensure t
  :config
(add-hook 'compilation-mode-hook 'winnow-mode))

;; (use-package perspective
;;   :ensure t
;;   :config
;;   (persp-mode))


;; (use-package outshine
;;   :ensure t
;;   :init
;;   (progn
;;     (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
;;     (add-hook 'python-mode-hook 'outline-minor-mode)
;;     (setq outshine-use-speed-commands t))
;; )

(use-package outline-magic
  :ensure t
  :init
  (progn
  (add-hook 'outline-mode-hook
          (lambda ()
            (require 'outline-cycle)))
  (add-hook 'outline-minor-mode-hook
          (lambda ()
            (require 'outline-magic)
            (define-key outline-minor-mode-map  (kbd "<C-tab>") 'outline-cycle)))
  (add-hook 'python-mode-hook 'outline-minor-mode)
))

(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))

(use-package counsel-projectile
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))


(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/bin/bash"))

(use-package realgud
  :ensure t)

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
)

(use-package counsel-etags
  :ensure t
  :bind
  ("M-?" . counsel-etags-find-tag-at-point)
  ("C-c k" . counsel-etags-find-tag))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(use-package git-gutter
  :ensure t)

(use-package vc-msg
  :ensure t)


(use-package eyebrowse
  :ensure t
  :config
  (progn
  (eyebrowse-mode t)
  (setq eyebrowse-new-workspace t))
  :bind
  ("<M-right>" . eyebrowse-next-window-config)
  ("<M-left>" . eyebrowse-prev-window-config)
  ("M-n" . eyebrowse-create-window-config)
  )

(use-package ibuffer-vc
  :ensure t
  )



(defun ivy-default-view-name ()
  "Return default name for new view."
  (let* ((default-view-name
          (concat "<> "
                  (mapconcat #'identity
                             (sort
                              (mapcar (lambda (w)
                                        (let* ((b (window-buffer w))
                                               (f (buffer-file-name b)))
                                          (if f
                                              (file-name-nondirectory f)
                                            (buffer-name b))))
                                      (window-list))
                              #'string-lessp)
                             " | ")))
         (view-name-re (concat "\\`"
                               (regexp-quote default-view-name)
                               " \\([0-9]+\\)"))
         old-view)
    (cond ((setq old-view
                 (cl-find-if
                  (lambda (x)
                    (string-match view-name-re (car x)))
                  ivy-views))
           (format "%s %d"
                   default-view-name
                   (1+ (string-to-number
                        (match-string 1 (car old-view))))))
          ((assoc default-view-name ivy-views)
           (concat default-view-name " 1"))
          (t
           default-view-name))))

(defun custom-save-ivy-views ()
(interactive)
(with-temp-file "~/.emacs.d/ivy-views"
(prin1 ivy-views (current-buffer))
(message "save ivy-views to ~/.emacs.d/ivy-views")))
(global-set-key (kbd "C-c s") 'custom-save-ivy-views)
(global-set-key (kbd "C-c C-v") 'ivy-switch-view)

(defun custom-load-ivy-views ()
(interactive)
(setq ivy-views
(with-temp-buffer
(insert-file-contents "~/.emacs.d/ivy-views")
(read (current-buffer))))
(message "load ivy-views"))

(custom-load-ivy-views)


;; (use-package persp-mode
;;   :ensure t
;;   :init
;;   (persp-mode)
;;   (setq persp-save-dir (concat "~/.emacs.d" "/persp-confs/")
;;         persp-auto-save-opt 0)
;;   :config
;;   (add-hook 'kill-emacs-hook 'persp/close-perspective)
;;   :bind
;;   ("C-x p p" . persp/switch-to-current-branch-persp))

(use-package hydra
  :ensure t
  :config
  (progn
  (defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _v_iew           _m_ark             _(_ details        _i_nsert-subdir    wdired
_C_opy             _O_ view other   _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q : edit
_D_elete           _o_pen other     _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
_R_ename           _M_ chmod        _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
_Y_ rel symlink    _G_ chgrp        _E_xtension mark   _s_ort             _=_ pdiff
_S_ymlink          ^ ^              _F_ind marked      _._ toggle hydra   \\ flyspell
_r_sync            ^ ^              ^ ^                ^ ^                _?_ summary
_z_ compress-file  _A_ find regexp
_Z_ compress       _Q_ repl regexp

T - tag prefix
"
  ("\\" dired-do-ispell)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("+" dired-create-directory)
  ("=" diredp-ediff)         ;; smart diff
  ("?" dired-summary)
  ("$" diredp-hide-subdir-nomove)
  ("A" dired-do-find-regexp)
  ("C" dired-do-copy)        ;; Copy all marked files
  ("D" dired-do-delete)
  ("E" dired-mark-extension)
  ("e" dired-ediff-files)
  ("F" dired-do-find-marked-files)
  ("G" dired-do-chgrp)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("i" dired-maybe-insert-subdir)
  ("l" dired-do-redisplay)   ;; relist the marked or singel directory
  ("M" dired-do-chmod)
  ("m" dired-mark)
  ("O" dired-display-file)
  ("o" dired-find-file-other-window)
  ("Q" dired-do-find-regexp-and-replace)
  ("R" dired-do-rename)
  ("r" dired-do-rsynch)
  ("S" dired-do-symlink)
  ("s" dired-sort-toggle-or-edit)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
  ("w" dired-kill-subdir)
  ("Y" dired-do-relsymlink)
  ("z" diredp-compress-this-file)
  ("Z" dired-do-compress)
  ("q" nil)
  ("." nil :color blue))

;;  (define-key dired-mode-map "." 'hydra-dired/body)
  ))

(use-package ivy-hydra
  :ensure t
  :config
  (define-key ivy-minibuffer-map (kbd "C-o") 'hydra-ivy/body))


;; (use-package bookmark+
;;   :ensure t)

'(require
'jabber)


;;;; Below are configurations for EXWM.

;; Add paths (not required if EXWM is installed from GNU ELPA).
;(add-to-list 'load-path "/path/to/xelb/")
;(add-to-list 'load-path "/path/to/exwm/")

;; Load EXWM.
(require 'exwm)

;; Fix problems with Ido (if you use it).
(require 'exwm-config)
;;(exwm-config-ido)

;; Set the initial number of workspaces (they can also be created later).
(setq exwm-workspace-number 4)

;; All buffers created in EXWM mode are named "*EXWM*". You may want to
;; change it in `exwm-update-class-hook' and `exwm-update-title-hook', which
;; are run when a new X window class name or title is available.  Here's
;; some advice on this topic:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + For applications with multiple windows (e.g. GIMP), the class names of
;    all windows are probably the same.  Using window titles for them makes
;;   more sense.
;; In the following example, we use class names for all windows expect for
;; Java applications and GIMP.
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

;; Global keybindings can be defined with `exwm-input-global-keys'.
;; Here are a few examples:
(setq exwm-input-global-keys
      `(
        ;; Bind "s-r" to exit char-mode and fullscreen mode.
        ([?\s-r] . exwm-reset)
        ;; Bind "s-w" to switch workspace interactively.
        ([?\s-w] . exwm-workspace-switch)
        ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))
        ;; Bind "s-&" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ([?\s-&] . (lambda (command)
		     (interactive (list (read-shell-command "$ ")))
		     (start-process-shell-command command nil command)))
        ;; Bind "s-<f2>" to "slock", a simple X display locker.
        ([s-f2] . (lambda ()
		    (interactive)
		    (start-process "" nil "/usr/bin/slock")))))

;; To add a key binding only available in line-mode, simply define it in
;; `exwm-mode-map'.  The following example shortens 'C-c q' to 'C-q'.
(define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;; The following example demonstrates how to use simulation keys to mimic
;; the behavior of Emacs.  The value of `exwm-input-simulation-keys` is a
;; list of cons cells (SRC . DEST), where SRC is the key sequence you press
;; and DEST is what EXWM actually sends to application.  Note that both SRC
;; and DEST should be key sequences (vector or string).
(setq exwm-input-simulation-keys
      '(
        ;; movement
        ([?\C-b] . [left])
        ([?\M-b] . [C-left])
        ([?\C-f] . [right])
        ([?\M-f] . [C-right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])
        ;; cut/paste.
        ([?\C-w] . [?\C-x])
        ([?\M-w] . [?\C-c])
        ([?\C-y] . [?\C-v])
        ;; search
        ([?\C-s] . [?\C-f])
        ;; refresh
        ([?\C-r] . [<f5>])
        ))

;; You can hide the minibuffer and echo area when they're not used, by
;; uncommenting the following line.
;;(setq exwm-workspace-minibuffer-position 'bottom)

;; Do not forget to enable EXWM. It will start by itself when things are
;; ready.  You can put it _anywhere_ in your configuration.
(exwm-enable)

(defun exwm-rename-buffer ()
  (interactive)
  (exwm-workspace-rename-buffer
   (concat exwm-class-name ":"
           (if (<= (length exwm-title) 50) exwm-title
             (concat (substring exwm-title 0 49) "...")))))

;; Add these hooks in a suitable place (e.g., as done in exwm-config-default)
(add-hook 'exwm-update-class-hook 'exwm-rename-buffer)
(add-hook 'exwm-update-title-hook 'exwm-rename-buffer)

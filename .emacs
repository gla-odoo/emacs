(server-start)

(require 'package)
(package-initialize)
(add-to-list 'package-archives (cons "melpa" (concat "http://melpa.org/packages/")) t)

; no startup message
(setq inhibit-startup-message t)

(setq timeclock-mode-line-display t)


; ido mode
(require 'ido)
(ido-mode t)


; utf-8 pour tout
(prefer-coding-system 'utf-8)

(add-to-list 'default-frame-alist '(fullscreen . fullscreen))
(if window-system
   (tool-bar-mode -1))

(if window-system

    (menu-bar-mode -1))
(if window-system

    (scroll-bar-mode -1))




(setq org-export-with-sub-superscripts '{})



;; pretty fontification of code in org
;;(defface org-block-begin-line
;;  '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
;;  "Face used for the line delimiting the begin of source blocks.")

;; (defface org-block-background
;;  '((t (:background "#FFFFEA")))
;;  "Face used for the source block background.")

;; (defface org-block-end-line
;;  '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
;;  "Face used for the line delimiting the end of source blocks.")


;; to use plantuml in babel/org-mode
;; active Org-babel languages
;;(org-babel-do-load-languages
;; 'org-babel-load-languages
;; '(;; other Babel languages
;;   (plantuml . t)))

;;(setq org-plantuml-jar-path
;;      (expand-file-name "~/org/plantuml.jar"))



(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desi(setq org-src-fontify-natively t)    red

  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--stats" "-C")))
 '(ag-ignore-list (quote ("i18n")))
 '(company-backends
   (quote
    (company-irony company-bbdb company-nxml company-css company-eclim company-semantic company-xcode company-cmake company-capf company-files
		   (company-dabbrev-code company-gtags company-etags company-keywords)
		   company-oddmuse company-dabbrev company-clang
		   (company-tern :with company-yasnippet))))
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(helm-dash-browser-func (quote eww))
 '(org-agenda-files (quote ("~/bubmake/rapport2.org")))
 '(package-selected-packages
   (quote
    (outline-magic counsel-projectile wgrep-ag minimap ac-etags counsel ivy smart-mode-line which-key expand-region use-package magit dante ghc ghci-completion slime slime-company ng2-mode angular-mode angular-snippets racket-mode vue-mode vue-html-mode neotree lorem-ipsum company-web web-completion-data web-mode sudo-edit indium js3-mode ag xref-js2 js2-refactor company-tern c-eldoc irony-eldoc company-irony irony 0blayout helm-dash company-c-headers company-php company-rtags company-quickhelp elpy yasnippet-snippets simple-httpd skewer-mode js2-mode company company-emacs-eclim eclim org-ref solarized-theme ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-dark)
(require 'org-ref)
(setq helm-bibtex-bibliography '("/home/geof/bubmake/biblio3.bib"))
(setq reftex-default-bibliography '("/home/geof/bubmake/biblio3.bib"))


(setq org-latex-pdf-process
    '("pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
	"pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"))

;;(setq org-latex-pdf-process '("pdflatex %f" "bibtex %b" "pdflatex %f" "pdflatenx %f"))
(setq org-src-fontify-natively t)    


(setq org-export-latex-listings t)
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-packages-alist '("" "color"))
;;(add-to-list 'org-latex-packages-alist '("" "listingsutf8"))
  (setq org-latex-minted-options 
        '(("frame" "leftline")("linenos=false") ("xrightmargin=5pt") ("fontfamily=courier")("xleftmargin=5pt") ("fontsize" "\\small") ("breaklines=true")))






(require 'ob-ditaa)


;; '(org-latex-minted-langs (quote ((emacs-lisp "Lisp") (lisp "Lisp") (clojure "Lisp") (c "C") (cc "C++") (fortran "fortran") (perl "Perl") (cperl "Perl") (python "Python") (ruby "Ruby") (html "HTML") (xml "XML") (tex "TeX") (latex "TeX") (shell-script "bash") (gnuplot "Gnuplot") (ocaml "Caml") (caml "Caml") (sql "SQL") (sqlite "sql") (R-mode "R"))))

(setq org-alphabetical-lists t)

;; Explicitly load required exporters




(setq org-ditaa-jar-path "/home/geof/org/ditaa.jar")
(setq org-plantuml-jar-path "~/org/plantuml.jar")

;;(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)


; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
	 (C . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (shell . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))



;=====================================
;eclim
;======================================

;(require 'eclim)
;(global-eclim-mode)

;(require 'eclimd)

;(require 'eclim)
;(global-eclim-mode)



;(require 'company)
;(require 'company-emacs-eclim)
;(company-emacs-eclim-setup)
;(global-company-mode t)


;======================================



;; javascript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


(setq browse-url-browser-function 'browse-url-firefox)


(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;          python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

					;elpy
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

;;company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)



;; company quickhelpn
(company-quickhelp-mode)
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))



;;keybindings company
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; javascript support for company
(require 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
			   (tern-mode)
			   (company-mode)))
;; Company integration for tern (js)







;; C
(require 'company-irony)
(require 'company-php)
(require 'company-web)



(add-hook 'c-mode-hook 'irony-mode)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-to-list 'company-backends '(company-tern :with company-yasnippet))

(add-to-list 'company-backends 'company-web-html)

(add-hook 'after-init-hook 'show-paren-mode)
;;(add-hook 'php-mode 'company-php)





(define-minor-mode disable-mouse-mode
  "A minor-mode that disables all mouse keybinds."
  :global t
  :lighter "M"
  :keymap (make-sparse-keymap))

(dolist (type '(mouse down-mouse drag-mouse
                      double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    ;; Yes, I actually HAD to go up to 7 here.
    (dotimes (n 7)
      (let ((k (format "%s%s-%s" prefix type n)))
        (define-key disable-mouse-mode-map
          (vector (intern k)) #'ignore)))))

(disable-mouse-mode 1)




;; Run C programs directly from within emacs
(defun execute-c-program (args)
    (save-buffer)
  (interactive "sArguments : ")
  (defvar foo)

  (setq foo (concat "gcc " (buffer-name) " && ./a.out " args))
  (shell-command foo))


(global-set-key [C-f1] 'execute-c-program)
(define-key c-mode-map (kbd "C-x C-m") 'execute-c-program)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; supprime php-mode de la liste des associations des modes majeurs
;;(setq auto-mode-alist (rassq-delete-all 'php-mode auto-mode-alist))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scm\\'" . racket-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . ng2-mode))
;;(require 'geiser)
;;(setq geiser-default-implementation 'racket)

(setq inferior-lisp-program "/usr/bin/sbcl")

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  )

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region)
  :init
  (delete-selection-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package ag
  :ensure t
  :config
  (progn (setq ag-highlight-search t)))

(use-package wgrep-ag
  :ensure t
)
  
        
  



   (use-package counsel
:ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   ("C-c k" . counsel-ag)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))




  (use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy)
  )


  (use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package wgrep-ag
  :ensure t)
	     


(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))

(use-package counsel-projectile
  :ensure t
  :bind
  ("C-c k" . counsel-projectile-ag))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

(use-package winnow
  :ensure t
  :config
  (add-hook 'compilation-mode-hook 'winnow-mode))

(use-package eyebrowse
  :ensure t
  :init
  (setq eyebrowse-keymap-prefix (kbd "C-x x"))
  :config
  (eyebrowse-mode t)
  (setq eyebrowse-new-workspace t))

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


))

;;; Adapted from Sebastian Rose's org publishing tutorial at 
;;; http://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
;;; (load "~/.emacs") ;; commented by jp


(require 'org-publish)
(setq org-export-allow-BIND t)

;;; =================
;;;  Custom Settings
;;; =================
;;; alternative 
;;; #+BIND: org-export-html-protect-char-alist (("&" . "&"))
;;; doesn't work for the &copy; symbol in the #+AUTHOR: line 
;;; see http://lists.gnu.org/archive/html/emacs-orgmode/2011-02/msg01218.html
(setq org-export-html-protect-char-alist '(("&" . "&")))

 ; (require 'htmlize)
 ; (load "~/emacs/lisp/htmlize/htmlize.el")
 ; the script is running from the parent directory
;; (load-file "./htmlize.el")

(setq load-path
      (append '("lib/emacs/lisp/org-8.0.7/lisp/"
		"lib/emacs/lisp/org-8.0.7/contrib/lisp"
		"elisp"
		)
	      load-path))

(require 'my-postamble)

;; (require 'my-org-bib)

(setq org-export-html-postamble t)
(setq org-html-postamble t)

;;; tangle code before publishing
;; (add-hook 'org-publish-before-export-hook 'org-babel-tangle 'append)


;;; default-dir is the directory from where the emacs to run
;;; this script is called.
(defvar base-dir default-directory)


;;; destination directory which  publish populates
(defvar pub-dir (concat base-dir "build/"))


(defvar src-dir (concat base-dir "src/"))

;;; org-source-base-dir defined in postamble.el
(setq my-postamble-org-source-base-dir src-dir)

;;; directory where src 
(defvar top-dir src-dir)
(defvar audience-dir (concat src-dir "audience/"))
(defvar experiments-dir (concat src-dir "experiments/"))
(defvar feedback-dir (concat src-dir "feedback/"))
(defvar courses-aligned-dir (concat src-dir "courses-aligned/"))
(defvar prerequisite-dir (concat src-dir "prerequisite/"))
(defvar images-dir (concat src-dir "images/"))
(defvar styles-dir (concat src-dir "styles/"))


(defvar top
`("top"
 :base-directory ,top-dir
 :base-extension "org"
 :publishing-directory ,pub-dir
 :recursive nil
 :publishing-function org-publish-org-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))

(defvar audience
`("audience"
 :base-directory ,audience-dir
 :base-extension "org"
 :publishing-directory ,(concat pub-dir "audience/")
 :recursive t
 :publishing-function org-publish-org-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))

(defvar experiments
`("experiments"
 :base-directory ,experiments-dir
 :base-extension "org"
 :publishing-directory ,(concat pub-dir "experiments/")
 :recursive t
 :publishing-function org-publish-org-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))


(defvar courses-aligned
`("courses-aligned"
 :base-directory ,courses-aligned-dir
 :base-extension "org"
 :publishing-directory ,(concat pub-dir "courses-aligned/")
 :recursive t
 :publishing-function org-publish-org-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))


(defvar prerequisite
`("prerequisite"
 :base-directory ,prerequisite-dir
 :base-extension "org"
 :publishing-directory ,(concat pub-dir "prerequisite/")
 :recursive t
 :publishing-function org-publish-org-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))


(defvar feedback
`("feedback"
 :base-directory ,feedback-dir
 :base-extension "org"
 :publishing-directory ,(concat pub-dir "feedback/")
 :recursive t
 :publishing-function org-publish-org-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))


(defvar images 
`("images"
  :base-directory ,images-dir
  :base-extension "png"
  :publishing-directory ,(concat pub-dir "images/")
  :recursive t
  :publishing-function org-publish-org-to-html
  ))


(defvar styles 
`("styles"
  :base-directory ,styles-dir
  :base-extension "css"
  :publishing-directory ,(concat pub-dir "styles/")
  :recursive t
  :publishing-function org-publish-attachment
  ))


(defvar prj '("prj" :components ("top" "audience" "experiments" "feedback" "prerequisite" "courses-aligned" "images" "styles")))

(setq org-publish-project-alist 
      (list prj 
	    top 
	    audience
	    experiments
	    feedback
	    prerequisite
	    courses-aligned
	    images
	    styles))


(org-publish-project 
 prj  ; project name
 t ; force
 )


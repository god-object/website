;; tests/lisp/lint-intent-test.lisp — tests for scripts/lint-intent
(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
(ql:quickload '(:cl-ppcre :parachute) :silent t)

(set-dispatch-macro-character #\# #\!
  (lambda (s c n) (declare (ignore c n)) (read-line s) (values)))

(load (make-pathname :name "lint-intent" :type nil
                     :defaults (uiop:merge-pathnames* "scripts/" (uiop:getcwd))))

(defpackage :test/lint-intent
  (:use :cl :parachute)
  (:import-from :cl-user
    #:count-added-lines #:has-comment-p #:find-bare-todos #:file-extension))
(in-package :test/lint-intent)

(define-test count-added-lines/basic
  (is = 2 (count-added-lines (format nil "+foo~%+bar~%-baz~%")))
  (is = 0 (count-added-lines (format nil "-foo~%-bar~%")))
  (is = 0 (count-added-lines (format nil "++ header~%+++ also-header~%")))
  (is = 1 (count-added-lines (format nil "+only-one~%"))))

(define-test count-added-lines/ignores-diff-header
  (is = 1 (count-added-lines (format nil "++ diff --git~%+actual addition~%"))))

(define-test has-comment-p/detects-python
  (true  (has-comment-p (format nil "+# a comment~%+some code~%") '("#")))
  (false (has-comment-p (format nil "+some code~%+more code~%") '("#"))))

(define-test has-comment-p/detects-js
  (true  (has-comment-p (format nil "+// a comment~%") '("//" "/*" "*")))
  (true  (has-comment-p "+ /* block */" '("//" "/*" "*")))
  (false (has-comment-p (format nil "+const x = 1;~%") '("//" "/*" "*"))))

(define-test has-comment-p/detects-lisp
  (true  (has-comment-p (format nil "+;; a comment~%") '(";")))
  (false (has-comment-p (format nil "+(defun foo ())~%") '(";"))))

(define-test has-comment-p/skips-non-additions
  (false (has-comment-p (format nil "-# removed comment~%") '("#"))))

(define-test find-bare-todos/flags-untagged
  (let ((result (find-bare-todos (format nil "+ TODO: fix this~%"))))
    (is = 1 (length result))
    (true (search "TODO" (first result)))))

(define-test find-bare-todos/allows-tagged
  (is equal '() (find-bare-todos (format nil "+ TODO(demo-abc-1): fix this~%")))
  (is equal '() (find-bare-todos (format nil "+ TODO: demo-abc-1 covers this~%"))))

(define-test find-bare-todos/ignores-non-additions
  (is equal '() (find-bare-todos (format nil "- TODO: removed~%"))))

(define-test file-extension/basic
  (is equal ".js"   (file-extension "src/foo.js"))
  (is equal ".lisp" (file-extension "scripts/bootstrap.lisp"))
  (is equal ".md"   (file-extension "README.md"))
  (is equal ""      (file-extension "Makefile")))

(test 'test/lint-intent)

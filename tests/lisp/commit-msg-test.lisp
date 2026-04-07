;; tests/lisp/commit-msg-test.lisp — tests for scripts/commit-msg
(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
(ql:quickload '(:cl-ppcre :yason :parachute) :silent t)

(set-dispatch-macro-character #\# #\!
  (lambda (s c n) (declare (ignore c n)) (read-line s) (values)))

(load (make-pathname :name "commit-msg" :type nil
                     :defaults (uiop:merge-pathnames* "scripts/" (uiop:getcwd))))

(defpackage :test/commit-msg
  (:use :cl :parachute)
  (:import-from :cl-user #:lowercase-first #:strip-trailing-punct #:derive-scope))
(in-package :test/commit-msg)

(define-test lowercase-first
  (is equal "hello"  (lowercase-first "Hello"))
  (is equal "hello"  (lowercase-first "hello"))
  (is equal ""       (lowercase-first ""))
  (is equal "a"      (lowercase-first "A"))
  (is equal "fOO"    (lowercase-first "FOO")))

(define-test strip-trailing-punct
  (is equal "foo"     (strip-trailing-punct "foo."))
  (is equal "foo"     (strip-trailing-punct "foo!"))
  (is equal "foo"     (strip-trailing-punct "foo?"))
  (is equal "foo"     (strip-trailing-punct "foo..."))
  (is equal "foo bar" (strip-trailing-punct "foo bar"))
  (is equal ""        (strip-trailing-punct "")))

(define-test derive-scope/common-dir
  (is equal "src" (derive-scope '("src/foo.js" "src/bar.js" "tests/baz.js"))))

(define-test derive-scope/no-dirs
  (is equal "" (derive-scope '("foo.js" "bar.js"))))

(define-test derive-scope/empty
  (is equal "" (derive-scope '())))

(define-test derive-scope/tie
  (let ((result (derive-scope '("src/a.js" "tests/b.js"))))
    (true (member result '("src" "tests") :test #'string=))))

(test 'test/commit-msg)

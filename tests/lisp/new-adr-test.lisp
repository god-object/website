;; tests/lisp/new-adr-test.lisp — tests for scripts/new-adr
(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
(ql:quickload '(:cl-ppcre :parachute) :silent t)

(set-dispatch-macro-character #\# #\!
  (lambda (s c n) (declare (ignore c n)) (read-line s) (values)))

(load (make-pathname :name "new-adr" :type nil
                     :defaults (uiop:merge-pathnames* "scripts/" (uiop:getcwd))))

(defpackage :test/new-adr
  (:use :cl :parachute)
  (:import-from :cl-user #:slugify #:next-adr-number))
(in-package :test/new-adr)

(defun temp-dir (suffix)
  (uiop:ensure-directory-pathname
    (merge-pathnames (format nil "test-~a-~a/" suffix (get-universal-time))
                     (uiop:temporary-directory))))

(define-test slugify
  (is equal "foo-bar"     (slugify "Foo Bar"))
  (is equal "hello-world" (slugify "Hello, World!"))
  (is equal "test-adr"    (slugify "--Test ADR--"))
  (is equal "test-001"    (slugify "Test 001"))
  (is equal "a"           (slugify "a")))

(define-test next-adr-number/empty-dir
  ;; Returns 1 when no ADRs exist yet.
  (let ((dir (temp-dir "adrs-empty")))
    (ensure-directories-exist dir)
    (is = 1 (next-adr-number dir))
    (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore)))

(define-test next-adr-number/increments
  ;; Returns max+1 when ADRs already exist.
  (let ((dir (temp-dir "adrs-inc")))
    (ensure-directories-exist dir)
    (dolist (name '("ADR-001-foo.md" "ADR-003-bar.md" "ADR-002-baz.md"))
      (with-open-file (f (merge-pathnames name dir) :direction :output
                         :if-does-not-exist :create)
        (write-string "" f)))
    (is = 4 (next-adr-number dir))
    (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore)))

(test 'test/new-adr)

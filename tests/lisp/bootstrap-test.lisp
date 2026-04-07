;; tests/lisp/bootstrap-test.lisp — tests for scripts/bootstrap
(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
(ql:quickload '(:cl-ppcre :parachute) :silent t)

(set-dispatch-macro-character #\# #\!
  (lambda (s c n) (declare (ignore c n)) (read-line s) (values)))

(load (make-pathname :name "bootstrap" :type nil
                     :defaults (uiop:merge-pathnames* "scripts/" (uiop:getcwd))))

(defpackage :test/bootstrap
  (:use :cl :parachute)
  (:import-from :cl-user #:extract-mission #:find-proposal-adrs))
(in-package :test/bootstrap)

(defun temp-dir (suffix)
  (uiop:ensure-directory-pathname
    (merge-pathnames (format nil "test-~a-~a/" suffix (get-universal-time))
                     (uiop:temporary-directory))))

(define-test extract-mission/basic
  (let ((lines '("# My Project" "" "## Mission" "We build great software." "" "## Goals" "- ship fast")))
    (is equal "We build great software." (extract-mission lines))))

(define-test extract-mission/multi-line
  (let ((lines '("# Project" "## Mission" "First sentence." "Second sentence." "## Next Section")))
    (is equal "First sentence. Second sentence." (extract-mission lines))))

(define-test extract-mission/stops-at-next-header
  (let ((lines '("## Mission" "The mission text." "## Something Else" "Not mission.")))
    (false (search "Not mission" (extract-mission lines)))))

(define-test extract-mission/no-mission-section
  (let ((lines '("# Project" "## Goals" "- thing")))
    (is equal "" (extract-mission lines))))

(define-test find-proposal-adrs/none
  (let ((dir (temp-dir "adrs-none")))
    (ensure-directories-exist dir)
    (with-open-file (f (merge-pathnames "ADR-001-accepted.md" dir)
                       :direction :output :if-does-not-exist :create)
      (write-string (format nil "# ADR-001: Accepted~%~%**Status:** Accepted~%") f))
    (is equal '() (find-proposal-adrs dir))
    (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore)))

(define-test find-proposal-adrs/finds-proposed
  (let ((dir (temp-dir "adrs-proposed")))
    (ensure-directories-exist dir)
    (with-open-file (f (merge-pathnames "ADR-001-foo.md" dir)
                       :direction :output :if-does-not-exist :create)
      (write-string (format nil "# ADR-001: Foo~%~%**Status:** Proposed~%") f))
    (let ((results (find-proposal-adrs dir)))
      (is = 1 (length results))
      (is equal "ADR-001: Foo" (second (first results)))
      (false (third (first results))))
    (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore)))

(define-test find-proposal-adrs/extracts-blocked-task
  (let ((dir (temp-dir "adrs-blocked")))
    (ensure-directories-exist dir)
    (with-open-file (f (merge-pathnames "ADR-002-bar.md" dir)
                       :direction :output :if-does-not-exist :create)
      (write-string (format nil "# ADR-002: Bar~%~%**Status:** Proposed~%**Blocked task:** demo-1.3~%") f))
    (let ((results (find-proposal-adrs dir)))
      (is equal "demo-1.3" (third (first results))))
    (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore)))

(test 'test/bootstrap)

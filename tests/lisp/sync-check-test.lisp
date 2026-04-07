;; tests/lisp/sync-check-test.lisp — tests for scripts/sync-check
(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
(ql:quickload '(:cl-ppcre :yason :parachute) :silent t)

(set-dispatch-macro-character #\# #\!
  (lambda (s c n) (declare (ignore c n)) (read-line s) (values)))

(load (make-pathname :name "sync-check" :type nil
                     :defaults (uiop:merge-pathnames* "scripts/" (uiop:getcwd))))

(defpackage :test/sync-check
  (:use :cl :parachute)
  (:import-from :cl-user #:extract-tagged-scenarios-from-lines))
(in-package :test/sync-check)

(define-test extract-tagged-scenarios-from-lines/basic
  (let* ((lines '("Feature: Homepage"
                  ""
                  "@co-1"
                  "Scenario: visitor sees the hero section"
                  "  Given the homepage is open"
                  ""
                  "@co-2"
                  "Scenario: visitor clicks the CTA"
                  "  Given the homepage is open"))
         (result (extract-tagged-scenarios-from-lines lines)))
    (is = 2 (length result))
    (is equal "@co-1" (car (first result)))
    (is equal "visitor sees the hero section" (cdr (first result)))
    (is equal "@co-2" (car (second result)))
    (is equal "visitor clicks the CTA" (cdr (second result)))))

(define-test extract-tagged-scenarios-from-lines/scenario-outline
  (let* ((lines '("@co-3" "Scenario Outline: visitor sees <thing>" "  Given something"))
         (result (extract-tagged-scenarios-from-lines lines)))
    (is = 1 (length result))
    (is equal "visitor sees <thing>" (cdr (first result)))))

(define-test extract-tagged-scenarios-from-lines/orphaned-tag-reset
  (let* ((lines '("@co-1" "  Given some step" "@co-2" "Scenario: valid scenario"))
         (result (extract-tagged-scenarios-from-lines lines)))
    (is = 1 (length result))
    (is equal "@co-2" (car (first result)))))

(define-test extract-tagged-scenarios-from-lines/ignores-untagged
  ;; @wip (no digit) should not be captured.
  (let* ((lines '("@wip" "Scenario: wip scenario" "@co-1" "Scenario: tagged scenario"))
         (result (extract-tagged-scenarios-from-lines lines)))
    (is = 1 (length result))
    (is equal "@co-1" (car (first result)))))

(define-test extract-tagged-scenarios-from-lines/empty
  (is equal '() (extract-tagged-scenarios-from-lines '())))

(test 'test/sync-check)

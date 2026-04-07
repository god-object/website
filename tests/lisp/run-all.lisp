#!/usr/bin/env ros
;; tests/lisp/run-all.lisp — run all Common Lisp unit tests
;;
;; Usage: tests/lisp/run-all.lisp
;; Exit code: 0 if all tests pass, 1 if any fail.

(ql:quickload '(:cl-ppcre :yason :parachute) :silent t)

;; Allow (load ...) of scripts that start with a #!/bin/sh shebang line.
(set-dispatch-macro-character #\# #\!
  (lambda (s c n) (declare (ignore c n)) (read-line s) (values)))

(defun load-test (name)
  (load (merge-pathnames name *load-pathname*)))

(load-test "new-adr-test.lisp")
(load-test "commit-msg-test.lisp")
(load-test "lint-intent-test.lisp")
(load-test "bootstrap-test.lisp")
(load-test "sync-check-test.lisp")

(let ((results (parachute:test '(test/new-adr
                                 test/commit-msg
                                 test/lint-intent
                                 test/bootstrap
                                 test/sync-check)
                               :report 'parachute:plain)))
  (uiop:quit (if (eq :passed (parachute:status results)) 0 1)))

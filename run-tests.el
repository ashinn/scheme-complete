(require 'scheme-complete)

(defmacro should-complete (where expected)
  `(progn
     (goto-char ,where)
     (should (equal ,expected
                    (apply #'try-completion (scheme-get-completions))))))

(ert-deftest sc-test-scheme-base ()
  "Tests basic (scheme base) completion"
  (scheme-with-find-file "tests/t-albatross.scm"
    (should-complete 29 "define")
    (should-complete 45 "number->string")
    (should-complete 101 "len")
    ))

(ert-deftest sc-test-scheme-small ()
  "Tests other R7RS libraries"
  (scheme-with-find-file "tests/t-barracuda.scm"
    (should-complete 112 "process-context")
    (should-complete 120 "infinite?")
    (should-complete 129 "make-rectangular")
    (should-complete 134 "open-")
    ))

(ert-deftest sc-test-string-cursor ()
  "Tests disjoint string-cursor"
  (scheme-with-find-file "tests/t-coyote.scm"
    (should-complete 227 "colon")
    (should-complete 229 "len")
    (should-complete 237 "len")))

(ert-deftest sc-test-enclosing-2-sexp-prefixes ()
  "Tests scheme-enclosing-2-sexp-prefixes bug"
  (scheme-with-find-file "tests/t-dolphin.scm"
    (should-complete 210 "remainder")))

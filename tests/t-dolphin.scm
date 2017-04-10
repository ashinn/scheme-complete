(import (scheme base) (srfi 69))

(define lookup (make-hash-table eq?))

(for-each
 (lambda (c)
   (let ((key (car c))
         (value (cadr c)))
     (hash-table-set! lookup key value)))

 `((+ ,+)
   (% ,rem

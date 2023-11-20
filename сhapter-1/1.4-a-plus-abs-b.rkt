#lang sicp
(#%require rackunit)

; ********** ex. 1.4 **********

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 2 2) 4 "Positive b")
(check-equal? (a-plus-abs-b 2 -2) 4 "Positive b")
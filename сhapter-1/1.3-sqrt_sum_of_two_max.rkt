#lang sicp
(#%require rackunit)

; ********** ex. 1.3 **********

(define (sqrt n) (* n n))

(define (sqrt_sum a b) (+ (sqrt a) (sqrt b)))

(define (sqrt_sum_of_two_max a b c)
  (cond [(and (< a b) (< a c)) (sqrt_sum b c)]
        [(and (< b a) (< b c)) (sqrt_sum a c)]
        [else (sqrt_sum a b)])
)

(check-equal? (sqrt_sum_of_two_max 1 2 3) 13 "arg 1 2 3")
(check-equal? (sqrt_sum_of_two_max 2 3 1) 13 "arg 2 3 1")
(check-equal? (sqrt_sum_of_two_max 3 1 2) 13 "arg 3 1 2")
(check-equal? (sqrt_sum_of_two_max 3 2 1) 13 "arg 3 2 1")

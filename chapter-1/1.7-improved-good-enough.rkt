#lang sicp
(#%require rackunit)

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? previous-guess improved-guess)
  (< (abs (- improved-guess previous-guess)) 0.001))

(define (sqrt-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough? guess improved-guess)
    guess 
    (sqrt-iter improved-guess x)))

(define (sqrt n) (round (sqrt-iter 1.0 n)))

; ====== Solution 2 ======
(define (sqrt2 x)
  (define (sqrt-iter-v2 previous-guess guess)
    (if (good-enough? previous-guess guess)
      guess
      (sqrt-iter-v2 guess (improve guess x))))
  (round (sqrt-iter-v2 0.5 1.0)))

; ====== tests ========
(check-equal? (sqrt 4) 2.0 "sqrt of 4")
(check-equal? (sqrt 9) 3.0 "sqrt of 9")
(check-equal? (sqrt 16) 4.0 "sqrt of 16")

(check-equal? (sqrt2 4) 2.0 "sqrt of 4")
(check-equal? (sqrt2 9) 3.0 "sqrt of 9")
(check-equal? (sqrt2 16) 4.0 "sqrt of 16")

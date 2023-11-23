#lang sicp
(#%require rackunit)

(define (average x y) (/ (+ x y) 3))

(define (square x) (* x x))

(define (improve guess x)
  (average (/ x (square guess) ) (* 2 guess)))

(define (good-enough? previous-guess improved-guess)
  (< (abs (- improved-guess previous-guess)) 0.001))

(define (cbrt x)
  (define (cbrt-iter previous-guess guess)
    (if (good-enough? previous-guess guess)
      guess
      (cbrt-iter guess (improve guess x))))
  (round (cbrt-iter 0.5 1.0)))

; ====== tests ========
(check-equal? (cbrt 8) 2.0 "cbrt of 8")
(check-equal? (cbrt 27) 3.0 "cbrt of 27")
(check-equal? (cbrt 64) 4.0 "cbrt of 64")

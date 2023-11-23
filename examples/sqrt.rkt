#lang sicp
(#%require rackunit)


(define (average x y) (/ (+ x y) 2 ))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess 
    (sqrt-iter (improve guess x)
                x)))


(define (sqrt n) (round (sqrt-iter 1.0 n)))

; ====== tests ========
(check-equal? (sqrt 4) 2.0 "sqrt of 4")
(check-equal? (sqrt 9) 3.0 "sqrt of 9")
(check-equal? (sqrt 16) 4.0 "sqrt of 16")
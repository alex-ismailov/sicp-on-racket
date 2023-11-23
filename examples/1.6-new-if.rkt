#lang sicp
(#%require rackunit)

(define (average x y) (/ (+ x y) 2 ))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
  (else else-clause)))

(define (new-if-fixed predicate then-clause else-clause)
  (if predicate
    (then-clause)
    (else-clause)))

(define (sqrt-iter guess x)
  (new-if-fixed (good-enough? guess x)
    guess 
    (sqrt-iter (improve guess x)
                x)))


(define (sqrt n) (round (sqrt-iter 1.0 n)))

; ====== tests ========
; (check-equal? (sqrt 4) 2.0 "sqrt of 4")

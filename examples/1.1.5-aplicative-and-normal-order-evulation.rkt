#lang sicp
; (#%require rackunit)


(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))


; ****** апликативная (substitution) model ******
(f 5)

(sum-of-squares (+ a 1) (* a 2))

(sum-of-squares (+ 5 1) (* 5 2))

(+ (square 6) (square 10))

(+ (* 6 6) (* 10 10))

(+ 36 100)

; => 136

; ****** normal-order (полная подстановка) evaluation model ******
(f 5)

(sum-of-squares (+ 5 1) (* 5 2))

(+ (square (+ 5 1)) square((* 5 2)))

(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))

(+ (* 6 6) (* 10 10))

(+ 36 100)

; => 136
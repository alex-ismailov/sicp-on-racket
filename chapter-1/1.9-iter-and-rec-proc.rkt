#lang sicp
(#%require rackunit)

; linear recursive process
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; linear recursive process illustration
; (+ 2 3)
(inc (+ (dec 2) 3))
(inc (inc (+ (dec 2) 3)))
(inc (inc (3)))
(inc 4)
5

; ****************************

; linear iterative process
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; linear iterative process illustration
(+ (dec 2) (inc 3))
((+ (dec 1) (inc 4)))
(((5)))
((5))
(5)
5

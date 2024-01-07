#lang sicp
(#%require rackunit)

; Euclid’s Algorithm
; a <- b, b <- (% a b)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; ====== tests ========
(check-equal? (gcd 40 6) 2 "gcd 40 6")
(check-equal? (gcd 16 28) 4 "gcd 16 28")

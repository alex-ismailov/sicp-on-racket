#lang sicp
(#%require rackunit)

; ******* Exercise 1.17 ******* 
; The exponentiation algorithms in this section are based on performing exponentiation
; by means of repeated multiplication. In a similar way, one can perform integer multiplication by
; means of repeated addition. The following multiplication procedure (in which it is assumed that our
; language can only add, not multiply) is analogous to the expt procedure:

; (define (* a b)
;   (if (= b 0)
;       0
;       (+ a (* a (- b 1)))))

; This algorithm takes a number of steps that is linear in b. Now suppose we include, together with
; addition, operations double, which doubles an integer, and halve, which divides an (even) integer
; by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic
; number of steps.
; *****************************

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (* multiplicand multiplier)
  (cond ((= multiplier 0) 0)
        ((even? multiplier) (* (double multiplicand) (halve multiplier)))
        (else (+ multiplicand (* multiplicand (- multiplier 1))))))

; ====== tests ========
(check-equal? (* 2 1) 2 "2 * 1")
(check-equal? (* 2 2) 4 "2 * 2")
(check-equal? (* 2 4) 8 "2 * 4")
(check-equal? (* 2 5) 10 "2 * 5")
(check-equal? (* 3 3) 9 "3 * 3")
(check-equal? (* 17 23) 391 "17 * 23")

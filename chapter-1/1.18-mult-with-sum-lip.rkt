#lang sicp
(#%require rackunit)

; ********** Exercise 1.18 ********** 
; Using the results of Exercise 1.16 and Exer- cise 1.17, devise a procedure
; that generates an iterative pro- cess for multiplying two integers in terms of adding, dou- bling,
; and halving and uses a logarithmic number of steps.

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (* multiplicand multiplier)
  (define (iter acc md mr)
    (cond ((= mr 0) acc)
          ((even? mr) (iter acc (double md) (halve mr)))
          (else (iter (+ acc md) md (- mr 1)))))
  (iter 0 multiplicand multiplier))

; ====== tests ========
(check-equal? (* 2 1) 2 "2 * 1")
(check-equal? (* 2 2) 4 "2 * 2")
(check-equal? (* 2 4) 8 "2 * 4")
(check-equal? (* 2 5) 10 "2 * 5")
(check-equal? (* 3 3) 9 "3 * 3")
(check-equal? (* 17 23) 391 "17 * 23")

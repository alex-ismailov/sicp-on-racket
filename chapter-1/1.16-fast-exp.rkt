#lang sicp
(#%require rackunit)

(define (square x) (* x x))

; even? n: | acc <- acc,      |  b <- (square b) |  exp <- (/ exp 2)
;  odd? n: | acc <- (* acc b) |  b <- b          |  exp <- (- exp 1) 

(define (fast-expt base n)
  (define (iter acc b exponent)
    (cond ((= exponent 0) acc)
          ((even? exponent) (iter acc (square b) (/ exponent 2)))
          (else (iter (* acc b) b (- exponent 1)))))
  (iter 1 base n))


(check-equal? (fast-expt 2 4) 16 "2 to the power of 4")
(check-equal? (fast-expt 2 5) 32 "2 to the power of 5")
(check-equal? (fast-expt 3 3) 27 "2 to the power of 5")

; (fast-expt 2 4)

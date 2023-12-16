#lang sicp
(#%require rackunit)

; ******* ex. 1.19-fib-lip-log.rkt *******

; ========= Transformations =========
; if even?
;   a <- a
;   b <- b
;   p <- (+ (square p) (square q))
;   q <- (+ (* 2 p q) (square q))
;   c <- (/ count 2)
; if odd? 
;   a <- (+ (* b q) (* a q) (* a p))
;   b <- (+ (* b p) (* a q))
;   p <- p
;   q <- q
;   c <- (- count 1)
; ====================================

(define (square x) (* x x))

(define (fib-log n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; ======= fib-lrp tests =========
(check-equal? (fib-log 5) 5 "fib-log 5")
(check-equal? (fib-log 8) 21 "fib-log 8")
(check-equal? (fib-log 16) 987 "fib-log 16")

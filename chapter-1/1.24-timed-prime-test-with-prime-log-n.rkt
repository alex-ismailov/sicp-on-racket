#lang sicp
(#%require rackunit)

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; ===================================================

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (fast-prime? n 3)
    (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (search-for-primes from to)
  (define (iter count to)
    (cond ((and (= count to) (even? count)))
          ((= count to)
            (timed-prime-test count))
          ((even? count) (iter (+ count 1) to))
          (else
            (timed-prime-test count)
            (iter (+ count 1) to))))
  (iter from to))

; (search-for-primes 1000 2000)
; 1009 *** 2
; 1013 *** 2
; 1019 *** 2

; (search-for-primes 10000 11000)
; 10007 *** 3
; 10009 *** 2
; 10037 *** 2

; (search-for-primes 100000 101000)
; 100003 *** 3
; 100019 *** 3
; 100043 *** 3

(search-for-primes 1000000 1001000)
; 1000003 *** 4
; 1000033 *** 3
; 1000037 *** 3

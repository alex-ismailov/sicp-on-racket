#lang sicp
(#%require rackunit)

(define (square x) (* x x))

(define (divides? n td)
  (= (remainder n td) 0))

; ===== θ(√n) =====
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

; ===================================================

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
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

; (search-for-primes 1000 10000) ; 2
; 7993 *** 2
; 8009 *** 2
; 8011 *** 2

; (search-for-primes 10000 11000) ; 4
; 10007 *** 2
; 10009 *** 2
; 10037 *** 2

; (search-for-primes 100000 101000) ; 16
; 100003 *** 5
; 100019 *** 5
; 100043 *** 6

(search-for-primes 1000000 1001000) ; 256
; 1000003 *** 16
; 1000033 *** 17
; 1000037 *** 17

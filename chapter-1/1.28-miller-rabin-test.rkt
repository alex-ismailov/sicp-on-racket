#lang sicp
(#%require rackunit)

(define (square x) (* x x))

(define (check-non-trivial-sqrt x sq mod)
  (if (and (= sq 1)
           (not (= x 1))
           (not (= x (- mod 1))))
      0
      sq))

(define (squaremod-with-check x mod)
  (check-non-trivial-sqrt x (remainder (square x) mod) mod))

(define (expmod-mr base exp mod)
  (cond ((= exp 0) 1)
        ((even? exp) (squaremod-with-check (expmod-mr base (/ exp 2) mod) mod))
        (else (remainder (* base (expmod-mr base (- exp 1) mod)) mod))))

(define (try-it n times)
  (define res (expmod-mr (+ 1 (random (- n 1))) (- n 1) n))
  (cond ((= times 0) #t)
        ((and (not (= res 0)) (= res 1)) (try-it n (- times 1)))
        (else #f)))

(define (miller-rabin-test n)
  (try-it n 3))

; ======= tests =======
(check-equal? (miller-rabin-test 4) #f "expmod-mr 4")
(check-equal? (miller-rabin-test 7) #t "expmod-mr 7")
(check-equal? (miller-rabin-test 13) #t "expmod-mr 13")
(check-equal? (miller-rabin-test 561) #f "expmod-mr 561")
(check-equal? (miller-rabin-test 1729) #f "expmod-mr 1729")

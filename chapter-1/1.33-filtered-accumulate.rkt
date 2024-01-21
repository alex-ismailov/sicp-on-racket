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

(define (prime? n)
  (= (expmod-mr
       (+ 1 (random (- n 1)))
       (- n 1)
       n)
     1))

(define (run-test n times)
  (cond ((= times 0) true)
        ((prime? n) (run-test n (- times 1)))
        (else false)))

(define (miller-rabin-test n)
  (run-test n 3))

; ===============================================================

(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (iter acc value)
    (cond ((> value b) acc)
          ((predicate value) (iter (combiner acc (term value)) (next value)))
          (else (iter acc (next value)))))
  (iter null-value a))


; ======= tests =======
(check-equal?
  (filtered-accumulate miller-rabin-test + 0 square 2 inc 4)
  13
  "filtered-accumulate miller-rabin-test + 0 square 2 inc 4")

(check-equal?
  (filtered-accumulate miller-rabin-test + 0 square 2 inc 5)
  38
  "filtered-accumulate miller-rabin-test + 0 square 2 inc 5")

(check-equal?
  (filtered-accumulate miller-rabin-test + 0 square 2 inc 8)
  87
  "filtered-accumulate miller-rabin-test + 0 square 2 inc 8")
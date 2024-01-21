#lang sicp
(#%require rackunit)

(define (cude x) (* x x x))

(define (inc x) (+ x 1))

(define (identity x) x)

; *** solutuin 1 ***
(define (sum acc term a next b)
  (if (> a b) acc
      (sum (+ acc (term a)) term (next a) next b)))

; *** solutuin 2 ***
(define (sum2 term a next b)
  (define (iter acc value)
    (if (> value b) acc
        (iter (+ acc (term value)) (next value))))
  (iter 0 a))


; ======= tests =======
(check-equal? (sum 0 identity 1 inc 10) 55 "sum 0 identity 1 inc 10")
(check-equal? (sum2 identity 1 inc 10) 55 "sum2 identity 1 inc 10")

(check-equal? (sum 0 cude 1 inc 10) 3025 "sum 0 cude 1 inc 10")
(check-equal? (sum2 cude 1 inc 10) 3025 "sum2 cude 1 inc 10")

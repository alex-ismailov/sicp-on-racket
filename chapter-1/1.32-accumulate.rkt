#lang sicp
(#%require rackunit)

(define (inc x) (+ x 1))

(define (identity x) x)

(define (accumulate-lip combiner null-value term a next b)
  (define (iter acc value)
    (if (> value b)
          acc
          (iter (combiner acc (term value)) (next value))))
  (iter null-value a))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; ======= tests =======
(check-equal? (accumulate-lip + 0 identity 1 inc 10) 55 "(accumulate-lip + 0 identity 1 inc 10)")
(check-equal? (accumulate-lip * 1 identity 1 inc 5) 120 "(accumulate-lip * 1 identity 1 inc 5)")

(check-equal? (accumulate + 0 identity 1 inc 10) 55 "(accumulate + 0 identity 1 inc 10)")
(check-equal? (accumulate * 1 identity 1 inc 5) 120 "(accumulate * 1 identity 1 inc 5)")

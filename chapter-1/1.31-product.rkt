#lang sicp
(#%require rackunit)

(define (cude x) (* x x x))

(define (inc x) (+ x 1))

(define (identity x) x)

; linear iterative process
(define (product-lip term a next b)
  (define (iter acc value)
    (if (> value b)
          acc
          (iter (* acc (term value)) (next value))))
  (iter 1 a))

; linear recursive process
(define (product-lrp term a next b)
  (if (> a b)
        1
        (* (term a) (product-lrp term (next a) next b))))

; ======= tests =======
(check-equal? (product-lip identity 1 inc 4) 24 "product-lip identity 1 inc 4")
(check-equal? (product-lip identity 1 inc 5) 120 "product-lip identity 1 inc 4")

(check-equal? (product-lrp identity 1 inc 4) 24 "product-lrp identity 1 inc 4")
(check-equal? (product-lrp identity 1 inc 3) 6 "product-lrp identity 1 inc 3")

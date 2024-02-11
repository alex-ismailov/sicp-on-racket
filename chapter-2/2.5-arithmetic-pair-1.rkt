#lang sicp
(#%require rackunit)

(define (cons x y) (* (expt 2 x) (expt 3 y)))

(define (find-expt z exp)
  (define (iter num count)
    (if (zero? (remainder num exp))
        (iter (quotient num exp) (+ count 1))
        count))
  (iter z 0))

(define (car z) (find-expt z 2))
(define (cdr z) (find-expt z 3))


; ======= tests =======
(define first-pair (cons 3 5))
(define second-pair (cons 5 7))

(check-equal? (car first-pair) 3)
(check-equal? (cdr first-pair) 5)

(check-equal? (car second-pair) 5)
(check-equal? (cdr second-pair) 7)

; ====
(define x (cons 1 2))
(define y (cons 3 4))
(define coord (cons x y))

(check-equal? (car (car coord)) 1)
(check-equal? (cdr (car coord)) 2)
(check-equal? (car (cdr coord)) 3)
(check-equal? (cdr (cdr coord)) 4)

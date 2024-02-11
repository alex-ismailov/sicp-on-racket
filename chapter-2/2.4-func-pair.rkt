#lang sicp
(#%require rackunit)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

; ======= tests =======
(define half (cons 1 2))

(check-equal? (car half) 1)
(check-equal? (cdr half) 2)

(define x (cons 3 4))
(define y (cons 5 7))
(define coord (cons x y))

(check-equal? (car (car coord)) 3)
(check-equal? (cdr (car coord)) 4)
(check-equal? (car (cdr coord)) 5)
(check-equal? (cdr (cdr coord)) 7)

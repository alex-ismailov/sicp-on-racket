#lang sicp
(#%require rackunit)

(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))


(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (avg a b) (/ (+ a b) 2))
(define (is-equal-points point-1 point-2)
  (if (and (= (x-point point-1) (x-point point-2))
           (= (y-point point-1) (y-point point-2)))
      true
      false))

; ((x1 + x2) / 2, (y1 + y2) / 2)
(define (midpoint-segment segment)
  (make-point
    (avg
      (x-point (start-segment segment))
      (x-point (end-segment segment)))
    (avg
      (y-point (start-segment segment))
      (y-point (end-segment segment)))))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; ======= tests =======
(define segment-1-start-point (make-point 1.0 1.0))
(define segment-1-end-point (make-point 3.0 3.0))
(define segment-1 (make-segment segment-1-start-point segment-1-end-point))
(define mid-point (midpoint-segment segment-1))

(print-point mid-point)

(define expected-point (make-point 2.0 2.0))
(check-equal? (is-equal-points mid-point expected-point)
  true
  "midpoint-segment segment-1")

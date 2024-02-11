#lang sicp
(#%require rackunit)

(define (square x) (* x x))

; =============================
(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

; =============================
(define (make-triangle a-point b-point c-point)
  (cons a-point
        (cons b-point
              (cons c-point nil))))

(define (get-a-point triangle)
  (car triangle))
(define (get-b-point triangle)
  (car (cdr triangle)))
(define (get-c-point triangle)
  (car (cdr (cdr triangle))))

; =============================
; d = sqrt((x2 - x1)² + (y2 - y1)²)
(define (get-length point-1 point-2)
  (sqrt (+ (square (- (x-point point-2) (x-point point-1)))
           (square (- (y-point point-2) (y-point point-1))))))

(define (triangle-perimetr triangle)
  (let ((ab (get-length (get-a-point triangle) (get-b-point triangle)))
        (bc (get-length (get-b-point triangle) (get-c-point triangle)))
        (ca (get-length (get-c-point triangle) (get-a-point triangle))))
        (+ ab bc ca)))

; ======= tests =======
(define a-point (make-point 1.0 1.0))
(define b-point (make-point 2.5 4.0))
(define c-point (make-point 4.0 1.0))
(define triangle-1 (make-triangle a-point b-point c-point))

(check-equal? (triangle-perimetr triangle-1) 9.70820393249937)

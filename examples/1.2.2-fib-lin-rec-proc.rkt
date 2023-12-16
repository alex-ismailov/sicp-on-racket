#lang sicp
(#%require rackunit)

(define (fib-lrp n)
  (cond [(or (= n 0) (= n 1)) n]
        [else (+ (fib-lrp (- n 1)) (fib-lrp (- n 2)))]))

; (define (fib-lip n)
;   (define (iter a b count)
;     (if (= count 0)
;       a
;       (iter b (+ a b) (- count 1))))
;   (iter 0 1 n))

(define (fib-lip n)
  (define (iter a b count)
    (if (= count 0)
      b
      (iter (+ a b) a (- count 1))))
  (iter 1 0 n))

; ======= fib-lrp tests =========
(check-equal? (fib-lrp 8) 21 "fib-lrp 8")
(check-equal? (fib-lrp 16) 987 "fib-lrp 8")


; ======= fib-lrp tests =========
(check-equal? (fib-lip 8) 21 "fib-lrp 8")
(check-equal? (fib-lip 16) 987 "fib-lrp 8")


(define (iter a d acc)
  (cond [(= d 0) (acc)]
        [(= a 0) (iter )]))
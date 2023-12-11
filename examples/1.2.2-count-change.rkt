#lang sicp
(#%require rackunit)

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (count-change-lrp amount)
  (define (iter amount kinds-of-coins acc)
    (cond ((= amount 0) (+ acc 1))
          ((or (< amount 0) (= kinds-of-coins 0)) acc)
          (else (iter (- amount (first-denomination kinds-of-coins))
                      kinds-of-coins
                      (+ acc (iter amount (- kinds-of-coins 1) 0))))))

  (iter amount 5 0))

; (check-equal? (count-change-lrp 100) 292 "100 cents")


; DRAFT
(define (count-change-lip amount)
  (define (iter inner-amount kinds-of-coins acc)
    (cond ((= kinds-of-coins 0) acc)
          ((= inner-amount 0) (iter amount (- kinds-of-coins 1) (+ acc 1)))
          ((< inner-amount 0) (iter amount (- kinds-of-coins 1) acc))
          (else (iter (- inner-amount (first-denomination kinds-of-coins))
                      kinds-of-coins
                      acc))))

  (iter amount 5 0))


(check-equal? (count-change-lip 10) 4 "count-change-lip - 10 cents")
(check-equal? (count-change-lip 100) 292 "count-change-lip - 100 cents")

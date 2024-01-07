#lang sicp
(#%require rackunit)

(define (square x) (* x x))

; prime(n) if (a^n mod n) = a

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; ====== tests ========
(check-equal? (fast-prime? 561 3) #t "fast-prime? 561")
(check-equal? (fast-prime? 1105 3) #t "fast-prime? 1105")
(check-equal? (fast-prime? 1729 3) #t "fast-prime? 1729")
(check-equal? (fast-prime? 2465 3) #t "fast-prime? 2465")
(check-equal? (fast-prime? 2821 3) #t "fast-prime? 2821")
(check-equal? (fast-prime? 6601 3) #t "fast-prime? 6601")

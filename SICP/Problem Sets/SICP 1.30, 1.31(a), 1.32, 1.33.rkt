
; helper function 
(define (calc start op term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (op result (term a)))))
  (iter a start))

; 1.30
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum2 term a next b)
  (calc 0 + term a next b))

; 1.31 A
(define (prod term a next b)
  (calc 1 * term a next b))

; 1.31 A: factorial
(define (factorial a b)
  (prod (lambda (x) x) a (lambda (x) (+ x 1)) b))

; 1.31 A: pi
(define (pi-calc)
  (define (inc x) (+ x 2))
  (define (term x) (/ (/ (* x x) (- x 1)) (+ x 1)))
  (* 2 (prod term 2 inc 10000)))

; 1.32
; i already did this with my calc function, writing sum and product using calc 
; 1.32 B: writing a recursive process for calc/accumulate
(define (accumulate2 start op term a next b)
  (if (> a b)
      start
      (op (term a) (accumulate2 start op term (next a) next b))))

; 1.33
(define (filtered-accumulate filter start op term a next b)
  (cond ((or (> a b)) start)
        ((not (filter a)) (filtered-accumulate filter start op term (next a) next b))
        (else (op (term a) (filtered-accumulate filter start op term (next a) next b)))))
; accumulating with a filter
; 1.33 A: sum of odd numbers
(define (odd-accumulate a b)
  (filtered-accumulate odd? 0 + (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b))

; 1.33 B: product of numbers less than n that are relatively prime to n
(define (divisible? n x)
  (zero? (remainder n x)))

(define (rel-prime-accumulate n)
  (define (rel-prime? x)
  (define (iter divisor)
    (cond ((> divisor x) #t)
          ((and (divisible? n divisor) (divisible? x divisor)) #f)
          (else (iter (+ 1 divisor)))))
  (iter 2))
  (filtered-accumulate rel-prime? 1 * (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

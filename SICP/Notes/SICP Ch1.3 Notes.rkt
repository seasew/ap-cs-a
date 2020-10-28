; Procedural abstraction - assigning names to commom patterns and then work in terms of the abstractions
; Procedurs that maipulate procedures are called higher-order procedures

(define (square x) (* x x))
(define (identity x) x)
(define (1+ a) (+ a 1))
(define (2+ a) (+ a 2))

(define (sum a b)
  (cond ((> a b) 0)
        (else (+ a (sum + a 1) b))))


; higher order procedures; uses 'next' procedure
(define (sum2 a next b)
  (cond ((> a b) 0)
        (else (+ a (sum2 (next a) next b)))))
; (sum2 1 1+ 5); sum of 1...5
; (sum2 1 (lambda (x) (+ x 3)) 5)
; lambda must have parantheses around parameters -- think of it like f(x)



; use another procedure 'term' to define what to do to the numbers, such as squaring every number from 1 to 5
(define (sum3 term a next b)
  (cond ((> a b) 0)
        (else (+ (term a) (sum3 term (next a) next b)))))
; (sum3 identity 1 1+ 5)
; (sum3 square 1 1+ 5)
; (sum3 (lambda (x) (/ x 2)) 1 1+ 5)



; now use yet another procedure (operator) that determnes which operation
; for example, lets say you wanted to mutliply the terms together
(define (accumulate op id term a next b)
  (cond ((> a b) id)
        (else (op (term a) (accumulate op id term (next a) next b)))))
; calculating 5! (accumulate * 1 identity 1 1+ 5)


; but accumulate is ugly; wrap accumulate in a factorial function
(define (factorial n)
  (accumulate * 1 identity 1 1+ n))


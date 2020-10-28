(#%require racket/trace)

; better to simplfy this program by removing redundant x's already in scope
(define (square-root x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (square a)
    (* a a))
  (define (average a b)
    (/ (+ a b) 2))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (trace sqrt-iter)
  (sqrt-iter 1.0 x))
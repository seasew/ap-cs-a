(define (sumsquares x y) (+ (* x x) (* y y)))
(define (larger x y) (if (> x y) x y))
(define (largersq a b c)
    (cond
      ((and (> a b) (> a c)) (sumsquares a (larger b c)))
      ((and (> b a) (> b c)) (sumsquares b (larger a c)))
      (else (sumsquares c (larger (a b))))))
> (define (double x) (+ x x ))
> (define (average x y) (/ (+ x y) 2))

; normal
> (double (average 2 4)) ; don't evaluate average yet!
> (+ (average 2 4) (average 2 4))
> (+ (/ (+ 2 4) 2) (average 2 4)) ;now you have to evaluate the 1st average
> (+ (/ (+ 2 4) 2) (/ (+ 2 4) 2)) 
> (+ (/ 6 2) (/ (+ 2 4) 2))
> (+ 3 (/ (+ 2 4) 2))
> (+ 3 (/ 6 2))
> (+ 3 3)
> 6
> 
; applicative
(double (average 2 4)) ; average instantly evaluated
(double (/ (+ 2 4) 2))
(double (/ 6 2))
(double 3)
(+ 3 3)
6
; Week 15

; Mutable Lists
(define x (list 'a 'b))

; change cdr of x to '(1 2)
(set-car! (cdr x) (list 1 2))
; set-cdr!
x


; Eq vs equal
(define a '(1 2 3))
(define b '(1 2 3))
(define c a)

; (= a b) --> needs to compare numbers
(equal? a b) ; equal? tests content
(eq? a b) ; eq? tests object in memory
(eq? a c)

; changes the a object, a & c still the same
(set-car! a 4)
(eq? a c)
a
c

; changes what a points to, a & c different
(set! a 5)
(eq? a c)
a
c


(display 'append-testing)
; testing how append works
(define a '(1 2 3))
(define b '(7 8 9))

(define d (append a b))
d

(set-car! a 4)
a
d

(set-car! b 5)
b
d
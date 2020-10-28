; Abstraction
; SICP ch2 notes

; for public use
; pairs are used in abstraction to represent objects
; 1 . 2

(define (make-rat n d)
  (cons n d))

(define z (make-rat 1 2))
(define y (make-rat 1 4))

(define (numer rat) (car rat))
(define (denom rat) (cdr rat)) ; like getters

; takes in two rats, not two pairs
; for adding two fractions to make another fraction
(define (add-rat r1 r2)
  (let ((n (+ (* (numer r1) (denom r2)) (* (numer r2) (denom r1))))
        (d (* (denom r1) (denom r2))))
  (make-rat n d)))

(add-rat y z)


; display rat
(define (print-r rat)
  (display (numer rat)) (display "/") (display (denom rat)) (newline))
(print-r y)
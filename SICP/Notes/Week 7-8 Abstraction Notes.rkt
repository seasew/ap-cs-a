
; abstraction practice w/ complex #'s
(define (make-comp a b) (cons a b))

(define (get-a comp-num) (car comp-num))

(define (get-b comp-num) (cdr comp-num))

(define (print-comp comp-num)
  (display (get-a comp-num))
  (cond
    ((>= (get-b comp-num) 0) (display "+"))
    ((< (get-b comp-num) 0) (display "")))
  (display (get-b comp-num)) (display "i") (newline))

(define x (make-comp 3 -2))
(define y (make-comp 1 7))
;(print-comp x)
;(print-comp y)

(define (add-complex c1 c2) (make-comp (+ (get-a c1) (get-a c2)) (+ (get-b c1) (get-b c2)))) 

(define (multiply-complex c1 c2)
  (make-comp
   (- (* (get-a c1) (get-a c2)) (* (get-b c1) (get-b c2)))
   (+ (* (get-a c1) (get-b c2)) (* (get-b c1) (get-a c2)))))

;(print-comp (add-complex x y))
;(print-comp (multiply-complex x y))


; message passing notes
; another way to define abstraction
(define (make-pt x y)
  (lambda (msg)
    (cond ((= msg 0) x)
    ((= msg 1) y)
    (else (error "argument not 0 or 1" msg)))))

(define (x-val pt)
  (pt 0))

(define (y-val pt)
  (pt 1))

; more msg passing
; redefiing cons
(define (cons2 x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1" m))))
  dispatch)




; circle abstraction classwork
;helper functions and definitions

(define (square x) (* x x))

(define pi 3.141592653)

(define (make-point x y)

  (cons x y))

(define (getX point)

  (car point))


(define (getY point)

  (cdr point))

 

; Complete the Circle Abstraction

(define (circle center radius)
  (cons center radius))

(define c (circle (make-point 3 5) 5))
 
(define (get-center circle)
  (getX circle))

;(get-center c)
 
(define (get-radius circle)
  (getY circle))

;(get-radius c)

(define (area circle)
  (* pi (square (get-radius circle))))

;(area c)

(define (circumference circle)
  (* pi 2 (get-radius circle)))

;(circumference c)


; Quest 5
(define (make-point x y)
  (list x y))

(define (x-coord point) (car point))

(define (y-coord point) (car (cdr point)))

(define (make-rectangle top-left-point bottom-right-point)
  (lambda (message)
    (cond ((= message 0) top-left-point)
          ((= message 1) bottom-right-point))))

(define (top-left rectangle)     ; return the top-left point of the rectangle

  (rectangle 0))

(define (bottom-right rectangle) ; return the bottom-right point of the rect

  (rectangle 1))

(define (left rectangle)   ; return x-coordinate of top-left point

  (x-coord (top-left rectangle)))

(define (top rectangle)    ; return y-coordinate of top-left point

  (y-coord (top-left rectangle)))
(define (right rectangle)  ; return x-coordinate of bottom-right point

  (x-coord (bottom-right rectangle)))

(define (bottom rectangle) ; return y-coordinate of bottom-right point

  (y-coord (bottom-right rectangle)))

(define (width rectangle)

  (- (right rectangle) (left rectangle)))

(define (height rectangle)

  (- (top rectangle) (bottom rectangle)))

(define (area rectangle)

  (* (width rectangle) (height rectangle)))

(define (perimeter rectangle)

  (* 2 (+ (width rectangle) (height rectangle))))


(define p1 (make-point 0 10))
(define p2 (make-point 4 5))
(define rr (make-rectangle p1 p2))
;(top rr)
;(left rr)
(width rr)
(height rr)
(area rr)
(perimeter rr)



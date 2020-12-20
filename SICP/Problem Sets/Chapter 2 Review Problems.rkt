; 2
; define every-other
(define (every-other x . y)
  (define (r-helper lyst)
  (if (<= (length lyst) 1)
      '()
      (cons (cadr lyst) (r-helper (cddr lyst)))))
  (cons x (r-helper y)))

(every-other 1 2 3 4 5 6 7)
(every-other 1 2 3 4)
(every-other 1 2)


; 3
; deep-filter
(define (deep-filter pred lyst)
  
  (cond
    ((null? lyst) '())
    ((not (pair? (car lyst)))
         (if (or (null? (car lyst)) (pred (car lyst)))
             (cons (car lyst) (deep-filter pred (cdr lyst)))
             (deep-filter pred (cdr lyst))))
    (else
         (cons (deep-filter pred (car lyst)) (deep-filter pred (cdr lyst))))))

(deep-filter even? '(0 1 2 () 3 4 5 (6 7 8) 9))
(deep-filter number? '(A (B ((3) D)) 5))


; 4
; flatten
(define (flatten lyst)
  (cond ((null? lyst) '())
        ((list? lyst)
         (append (flatten (car lyst)) (flatten (cdr lyst))))
        (else (list lyst))))

(flatten '(1 2 3))
(flatten '(1 (2 3)))


; 5
; valid-infix?

(define (valid-infix? lyst)
  (let ((symbols '(+ - * /)))
    (cond ((null? lyst) #t)
          ((= (length lyst) 1)
           (cond ((number? (car lyst)) #t)
                 ((list? (car lyst)) (valid-infix? (car lyst)))
                 (else #f)))
          ((number? (car lyst))
           (and (member (cadr lyst) symbols) (valid-infix? (cddr lyst))))
          ((list? (car lyst))
           (and (member (cadr lyst) symbols) (valid-infix? (car lyst)) (valid-infix? (cddr lyst))))
          (else #f))))

(valid-infix? '(4 + 3 * (5 - 2)))
(valid-infix? '(4 + 3 * (5 2)))
(valid-infix? '(4 + 3 * (5 – 2) +))

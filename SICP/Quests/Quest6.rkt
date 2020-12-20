(define (dictionarify f lst)
  (define (d-helper index result)
    (if (< index 0) result
        (d-helper (- index 1)
         (cons
          (list (list-ref lst index) (f (list-ref lst index))) result))))
  (d-helper (- (length lst) 1) '()))


(dictionarify (lambda (x) (* x x)) '(2 3 4))
; '((2 4) (3 9) (4 16))
(dictionarify (lambda (x) (* 2 x)) '(2 3 4))
; '((2 4) (3 6) (4 8))

(define (dictionarify f lst)
  (define (d-helper new-lst accumulated)
    (if (null? new-lst)
        accumulated
        (d-helper (cdr new-lst) (append accumulated (list (list (car new-lst) (f (car new-lst))))))))
  (d-helper lst '()))
        
    

(dictionarify (lambda (x) (* x x)) '(2 3 4))
; '((2 4) (3 9) (4 16))
(dictionarify (lambda (x) (* 2 x)) '(2 3 4))
; '((2 4) (3 6) (4 8))
      

(define (dictionarify f lst)
  (define (d-helper new-lst accumulated)
    (if (null? new-lst)
        accumulated
        (d-helper (cdr new-lst) (cons (list (list (car new-lst) (f (car new-lst)))) accumulated))))
  (d-helper lst '()))
        
    
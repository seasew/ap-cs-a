; SICP 3.12, 3.15, 3.16, 3.17


; 3.16
; infinite loop
(define a (cons 1 2))
(set-cdr! a a)
(define x (list a a))
;(define x (list 1 2 x))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
;(count-pairs x)


; 3.17 count pairs

(define (cp pair)
  (let ((visited '()))
    (define (visited? pair vl)
      (cond
        ((null? vl) #f)
        ((eq? (car vl) pair) #t)
        (else (visited? pair (cdr vl)))))
    (define (cp2 pair)
      (cond ((not (pair? pair)) 0)
            ((visited? pair visited) 0)
            (else (set! visited (cons pair visited))
                  (+ 1 (cp2 (car pair)) (cp2 (cdr pair))))))
    (cp2 pair)))

(cp (list 1 2 3))
(define a (list 1 2))
(define b (cons a a))
(define c (cons b b))
(cp a)
(cp b)
(cp c)
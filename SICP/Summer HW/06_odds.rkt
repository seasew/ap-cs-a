(define odds (lambda (lst)
                 (if (odd? (car lst))
                     (+ 1 (if (null? (cdr lst)) 0 (odds (cdr lst))))
                     (if (null? (cdr lst)) 0 (odds (cdr lst))))))
(define filter (lambda (pred list)
                   (if (pred (car list))
                       (cons
                        (car list)
                        (if (null? (cdr list))
                                 '() (filter pred (cdr list))))
                       (if (null? (cdr list))
                                 '() (filter pred (cdr list))))))
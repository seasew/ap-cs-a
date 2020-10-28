(define lastelem (lambda (mylist) (if (null? (cdr mylist)) (car mylist) (lastelem (cdr mylist)))))

(define removelast (lambda (mylist)
                       (if (null? (cdr mylist)) '()
                       (cons (car mylist) (removelast (cdr mylist))))))

(define reversefunc (lambda (mylist)
                        (if (null? mylist)
                            '()
                            (cons (lastelem mylist) (reversefunc (removelast mylist))))))
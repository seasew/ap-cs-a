(define (dictionarify f lst)
  (define (d-helper index result)
    (if (< index 0) result
        (d-helper (- index 1)
         (cons
          (list (list-ref lst index) (f (list-ref lst index))) result))))
  (d-helper (- (length lst) 1) '()))
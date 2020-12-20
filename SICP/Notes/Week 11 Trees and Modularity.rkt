; TREE
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1) ; add one each time you find a leaf
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

; scale-tree without map
(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((number? tree) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

; scale-tree written with map instead
(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))


(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-tree (list 1 (list 2 (list 3 4)) 5))


(define (enumerate-interval a b)
  (if (> a b)
      '()
  (append (list a) (enumerate-interval (+ a 1) b))))

(enumerate-interval 0 3)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (square x) (* x x))
(define (fib x)
  (cond ((= x 0) 1)
      ((= x 1) 1)
      (else (+ (fib (- x 1)) (fib (- x 2))))))

(define (list-fib-sq n)
  (accumulate cons
              '()
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))
(list-fib-sq 5)

(define (make-treemap key value left right)
  (lambda (msg)
    (cond ((= msg 0) key)
          ((= msg 1) value)
          ((= msg 2) left)
          ((= msg 3) right))))

(define (key node) (node 0))
(define (value node) (node 1))
(define (left node) (node 2))
(define (right node) (node 3))

(define the-empty-tree 'random)
(define tet the-empty-tree)
(define (empty-tree? node) (if (eq? node tet) #t #f))


(define treemap
  (make-treemap 'Mesopotamians 'The
     (make-treemap 'Ensor 'James (make-treemap 'Duluth 'Big 
        the-empty-tree
        the-empty-tree)
      the-empty-tree)
    (make-treemap 'Polk '(James K)
      (make-treemap 'Ng 'Ana
        the-empty-tree
        (make-treemap 'Octofoo 'Octofee the-empty-tree the-empty-tree))
      (make-treemap 'Worm 'Doctor the-empty-tree the-empty-tree))))

(define (lookup key-input treemap-input)
  (cond ((empty-tree? treemap-input) #f)
        ((eq? key-input (key treemap-input)) (value treemap-input))
        ((before? key-input (key treemap-input))
         (lookup key-input (left treemap-input)))
        (else (lookup key-input (right treemap-input)))))

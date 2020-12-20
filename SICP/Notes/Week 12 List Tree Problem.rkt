; The below abstraction for binary trees is implemented with
; a function in order to force you to use selectors to inspect
; tree data in the interpreter.
(define (make-bintree datum left right)
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right))))

(define (datum bintree) (bintree 0))
(define (left bintree) (bintree 1))
(define (right bintree) (bintree 2))

(define the-empty-tree 'cow)
(define tet the-empty-tree)
(define (empty-tree? tree) 
  (eq? tree tet))
(define (leaf? bintree)
  (and (not (empty-tree? bintree))
       (empty-tree? (left bintree))
       (empty-tree? (right bintree))))


(define bst
  (make-bintree 15
     (make-bintree 6
        (make-bintree 2 tet tet)
        tet)
     (make-bintree 22
        (make-bintree 17
           (make-bintree 16 tet tet)
           (make-bintree 19 tet tet))
        (make-bintree 24 tet tet))))

; function list to tree (balanced tree)
(define (getLen lyst)
  (if (odd? (length lyst))
      (/ (- (length lyst) 1) 2)
      (/ (length lyst) 2)))

(define (part1 lyst)
  (define new-length
           (getLen lyst))
  (define (iter new-list i new-lyst)
    (if (<= i 0)
        new-list
        (iter (append new-list (list (car new-lyst))) (- i 1) (cdr new-lyst))))
  (iter '() new-length lyst))

(define (part2 lyst)
  (define new-length
           (if (odd? (length lyst))
               (/ (- (length lyst) 1) 2)
               (/ (length lyst) 2)))
  (define (iter new-list i)
    (if (<= i 0)
        new-list
        (iter (cdr new-list) (- i 1))))
  (if (null? (iter lyst new-length))
      '()
      (cdr (iter lyst new-length))))

(define (middle-datum lyst)
  
  (list-ref lyst (getLen lyst)))

(define ll (list 1 2 3 4 5))
(part1 ll)
(part2 ll)
(middle-datum ll)

(define ll2 (list 2))
(part1 ll2)
(part2 ll2)
(middle-datum ll2)

(define (list->tree lyst)
  (cond
    ((null? lyst)
      tet)
    ((= 1 (length lyst))
         (make-bintree (car lyst)
                       tet tet))
    (else
         (make-bintree 
                (middle-datum lyst)
                (list->tree (part1 lyst))
                (list->tree (part2 lyst))))))

(define tt (list->tree ll))

(define (inorder tree)
  (cond ((empty-tree? tree) '())
        (else (append
               (inorder (left tree))
               (list (datum tree))
               (inorder (right tree))))))

tt
(inorder tt)

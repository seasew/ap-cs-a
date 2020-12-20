; final quest

; 1A
(define (simple-caesar n)
  (define alphabet '('A 'B 'C 'D 'E 'F 'G 'H 'I 'J 'K 'L 'M 'N 'O 'P 'Q 'R 'S 'T 'U 'V 'W 'X 'Y 'Z))
  (list-ref alphabet (- n 1)))

(simple-caesar 1)
(simple-caesar 26)


; 1B

(define (accumulate op id term a next b)
  (cond ((> a b) id)
        (else (op (term a) (accumulate op id term (next a) next b)))))

(define (decrypt decryption-function cipher)

  (accumulate cons    ; op

   		  '()     ; id

   		  (lambda (index) (decryption-function (list-ref cipher index)))  ; term

   		  0  ; a

   		  (lambda (index) (+ index 1))  ; next

   		  (- (length cipher) 1))) ; b


(decrypt simple-caesar '(20 15 1 19 20 5 18 8 5 1 4))


; 2A 
(define (make-bintree datum left right)
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right))))

(define (datum bintree) (bintree 0))
(define (left bintree) (bintree 1))
(define (right bintree) (bintree 2))
(define the-empty-tree 'not-a-node)
(define (empty-tree? tree) (eq? tree the-empty-tree))

; A sample binary search tree for testing and for Problem 2A.
(define bst
  (make-bintree 15
     (make-bintree 6
        (make-bintree 2 the-empty-tree the-empty-tree)
        the-empty-tree)
     (make-bintree 22
        (make-bintree 17
           (make-bintree 16 the-empty-tree the-empty-tree)
           (make-bintree 19 the-empty-tree the-empty-tree))
        (make-bintree 24 the-empty-tree the-empty-tree))))

(define (pathway num tree)
  (define (path-helper sub-tree)
    (cond ((empty-tree? sub-tree) (list 'fail))
          ((= num (datum sub-tree))
           (list 'found))
          ((> num (datum sub-tree))
           (cons 'right (path-helper (right sub-tree))))
          ((< num (datum sub-tree))
           (cons 'left (path-helper (left sub-tree))))))
  (path-helper tree))

(pathway 8 bst)
(pathway 15 bst)
(pathway 16 bst)
(pathway 17 bst)
(pathway 18 bst)
(pathway 19 bst)


; 3
(define (make-stack) (cons 'stack '()))
(define (top-ptr stack) (cdr stack))
(define (peek stack)
  (car (top-ptr stack)))
(define (push! datum stack)
  (let ((new-pair (cons datum '())))
    (set-cdr! new-pair (top-ptr stack))
    (set-cdr! stack new-pair)))
(define (pop! stack)
  (let ((datum (peek stack)))
    (set-cdr! stack (cdr (top-ptr stack)))
    datum))

(define (operator? token) (member token '(+ - / *)))
(define (operand? token) (number? token))
(define (get-op operator)
   (cond ((equal? operator '+) +)
         ((equal? operator '-) -)
   ((equal? operator '*) *)
	   ((equal? operator '/) /)))

; 3 part 1
(define (post-eval expr)

  (let ((stack (make-stack)))

    (define (post-eval-iter expr)

      (cond ((null? expr) (pop! stack))

            ((operand? (car expr)) 

             (push! (car expr) stack)

             (post-eval-iter (cdr expr)))

            ((operator? (car expr))

             (let ((num1 (pop! stack))

                   (num2 (pop! stack)))
               
               (push! ((get-op (car expr)) num2 num1) stack)
               (post-eval-iter (cdr expr))))))

    (post-eval-iter expr)))

(post-eval '(1 2 *))              ; (* 1 2)
;2
(post-eval '(1 2 3 * +))          ; (+ 1 (* 2 3))
;7
(post-eval '(4 1 2 - *))          ; (* 4 (- 1 2))  NOTE THE ORDER OF THE OPERANDS
;-4
(post-eval '(6 5 - 2 8 4 / + *))  ; (* (- 6 5) (+ 2 (/ 8 4)))
;4

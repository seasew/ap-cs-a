; Week 16

; Data structures

; Tables
(define (make-table)
  (cons '*table* '()))

;making a table
(define t (make-table))
(define (empty-table? t) (null? (cdr t)))

;step 1 - trace through lookup and associ to make sure you understand what they do
(define (lookup key table)
  (let ((record (associ key (cdr table))))
    (if record
        (cdr record)
        #f)))

(define (associ key records)
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else (associ key (cdr records)))))


;Work together to complete insert!
(define (insert! key value table)
  (let ((record (associ key (cdr table))))
    (if record
       ; with a partner or breakout group, finish the if statement
        #f
  (set-cdr! table (cons (cons key value) (cdr table))))))

(insert! 1 'apple t)
(lookup 1 t)
(lookup 2 t)


(define (rlookup k t)
  (let ((record (rassoc k (cdr t))))
    (cond (record (car record))
          (else #f))))
(define (rassoc value records)
  (cond ((null? records) #f)
        ((equal? value (cdar records)) (car records))
        (else (rassoc value (cdr records)))))


(define (delete! k t)
  (let ((record (associ k (cdr t))))
    (if record
        (set-cdr! t (cddr t))
        (delete! k (cdr t)))))
        

(define (error reason . args)
  (display "Error: ")
  (display reason)
  (for-each (lambda (arg) 
              (display " ")
              (write arg))
            args) (newline))  ;; we hope that this will signal an error

t
(delete! 1 t)
t
(insert! 2 'hello t)
t

;Queues
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    ; empty-queue? is written to align with the way front-ptr
    ; and rear-ptr were given, above
    (define (empty-queue?)
      (null? front-ptr))

    ; peek returns the datum at the front of the queue
    ; peek returns #f if the queue is empty
    (define (peek)
      (cond ((empty-queue?) (error "Empty queue.  :-("))
            (else (car front-ptr))))

    ; insert-queue! plays out differently depending on whether the queue
    ; is currently empty or not
    (define (insert-queue! datum)
      (let ((new-node (cons datum '())))
        (cond
          ((empty-queue?) (set! front-ptr new-node))
          (else (set-cdr! rear-ptr new-node)
                (set! rear-ptr new-node))))) 

    ; delete-queue! has three possibilties:
    ; * empty queue
    ; * one element in queue
    ; * more than one element in queue
    (define (delete-queue!)
      (cond ((empty-queue?) (error "Empty queue.  :-("))
            (else 
                    ; store the datum at the head of the queue
                  (let ((return-value (peek)))
                    ; update the front pointer
                    (set! front-ptr (cdr front-ptr))
                    ; If there was only one thing in the queue, then the
                    ; rear-ptr will need to be set to nil
                    (if (null? front-ptr) (set! rear-ptr '()))
                    ; Now return the element of the queue (or #f)
                    return-value))))

    (define (dispatch message)
      (cond ((eq? message 'insert-queue!) insert-queue!)
            ((eq? message 'delete-queue!) delete-queue!)
            ((eq? message 'peek) peek)
            ((eq? message 'empty?) empty-queue?)))
    dispatch))

(define q (make-queue))
((q 'insert-queue!) 'Alin)
((q 'peek))
((q 'delete-queue!))
((q 'insert-queue!) 'Bob)
((q 'peek))


; Stacks
; Last in, First out
; push and popping: O(1)
(define (make-stack)
  (let ((top-ptr '()))
    
    (define (empty?) (null? top-ptr))
    
    (define (push! arg)
      (cond ((empty?) (set! top-ptr (list arg)))
            (else (let ((new-pair (list arg (car top-ptr))))
                    (set! top-ptr new-pair)))))

    (define (pop!)
      (cond ((empty?) (error "Nothing in stack to pop!"))
            (else (let ((datum (car top-ptr)))
                    (set! top-ptr (cdr top-ptr))
                    datum))))

    (define (peek)
      (car top-ptr))


      (define (dispatch msg)
        (cond ((eq? msg 'peek) peek)
            ((eq? msg 'push!) push!)
            ((eq? msg 'pop!) pop!)))

    dispatch))

(define animules (make-stack))
((animules 'push!) 'horse)
((animules 'push!) 'cow)
((animules 'push!) 'moose)
((animules 'pop!))
((animules 'peek))

;Queue Abstraction - DON'T CHANGE THIS
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    ; empty-queue? is written to align with the way front-ptr
    ; and rear-ptr were given, above
    (define (empty-queue?)
      ;(and (null? front-ptr) (null? rear-ptr)))
      (null? front-ptr))
    (define (set-front-ptr! pair)
      (set! front-ptr pair))
    (define (set-rear-ptr! pair)
      (set! rear-ptr pair))

    ; insert! plays out differently depending on whether the queue
    ; is currently empty or not
    (define (insert! item)
      (let ((new-pair (list item)))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair))
              (else  
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)))))

    ; delete! has three possibilties:
    ; * empty queue
    ; * one element in queue
    ; * more than one element in queue
    (define (delete!)
      (cond ((empty-queue?) "Nothing to delete! Empty queue!")
             ; store the datum at the head of the queue
            (else (let ((return-value (peek)))
                     ; update the front pointer
                    (set-front-ptr! (cdr front-ptr))
                    ; If there was only one thing in the queue, then the
                    ; rear-ptr will need to be set to nil
                    (if (null? front-ptr)
                        (set-rear-ptr! '()))
                    return-value)))) ; Now return the element of the queue (or #f)

    ; peek returns the datum at the front of the queue
    ; peek returns #f if the queue is empty
    (define (peek)
      (if (empty-queue?)
          (display "No one in the queue!")
          (car front-ptr)))
    (define (show)
      (show-helper front-ptr))
    (define (show-helper lyst)
      (cond ((null? lyst) '())
            (else (cons ((car lyst) 'name) (show-helper (cdr lyst))))))
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert!)
            ((eq? m 'delete-queue!) delete!)
            ((eq? m 'empty?) empty-queue?)
            ((eq? m 'peek) peek) 
            ((eq? m 'show) show))) ; shows a list of who's in the queue
    dispatch))

;Make-Teacher procedure - DON'T CHANGE THIS!
(define (make-teacher name subject)
  (let ((penalized #f))
    (define (calc-check) (set! penalized #t))
    (define (get-out-of-jail) (set! penalized #f))
    (define (oktopay?) (or (not (eq? subject 'calc)) penalized))
    (lambda (msg)
      (cond ((eq? msg 'calc-check) calc-check)
            ((eq? msg 'get-out-of-jail) get-out-of-jail)
            ((eq? msg 'name) name)
            ((eq? msg 'oktopay?) oktopay?)))))

;COMPLETE THIS PROCEDURE
(define (paycashier! shoppingQueue)
  (let ((payer ((shoppingQueue 'peek)))) ; who is in the front of the queue?
    (if ((shoppingQueue 'empty?))
        (newline)
    (cond (((payer 'oktopay?)) ; will we let them pay?
           ((payer 'get-out-of-jail)) ; calc teacher no longer penalized
           (display (cons (((shoppingQueue 'delete-queue!)) 'name) '(has paid)))
           (newline))
          (else ; a calc teacher who needs to be penalized!
           ((payer 'calc-check)) ; penalize person for being a calc teacher
           (display (cons (payer 'name) '(has gone to the back of the line)))
           (newline)
           ; Actually put the calc teacher in the back of the queue
           ((shoppingQueue 'insert-queue!) ((shoppingQueue 'delete-queue!))))))))




;Code you can use for testing
(define deggeller (make-teacher 'deg 'calc))
(define bautista (make-teacher 'bautista 'calc))
(define paley (make-teacher 'paley 'cs))
(define hexsel (make-teacher 'hexsel 'cs))
(define shoppingQueue (make-queue))

((shoppingQueue 'insert-queue!) deggeller)
((shoppingQueue 'insert-queue!) bautista)
((shoppingQueue 'insert-queue!) paley)
((shoppingQueue 'insert-queue!) hexsel)

((shoppingQueue 'show))

(paycashier! shoppingQueue)
(paycashier! shoppingQueue)
(paycashier! shoppingQueue)
(paycashier! shoppingQueue)
((shoppingQueue 'show))
(paycashier! shoppingQueue)
(paycashier! shoppingQueue)
((shoppingQueue 'show))
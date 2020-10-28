; Scheme Ch17 Homework

; 17.1
; (car '(Rod Chris Colin Hugh Paul))
; Rod

; (cadr '(Rod Chris Colin Hugh Paul))
; Chris

; (cdr '(Rod Chris Colin Hugh Paul))
; (Chris Colin Hugh Paul)

; (car 'Rod)
; Error

; (cons '(Rod Argent) '(Chris White))
; ((Rod Argent) Chris White)

; (append '(Rod Argent) '(Chris White))
; (Rod Argent Chris White)

; (list '(Rod Argent) '(Chris White))
; ((Rod Argent) (Chris White))

; (caadr '((Rod Argent) (Chris White) (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
; (Colin Blunstone)
; oops actually Chris

; (assoc 'Colin '((Rod Argent) (Chris White) (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
; (Colin Blunstone)

; (assoc 'Argent '((Rod Argent) (Chris White) (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
; (Rod Argent)
; oops actually #f, since Argent isn't a key in the list



; 17.2
(define (f1 list1 list2)
  (list (append (cdr list1) (list (car list2)))))

(define (f2 list1 list2)
  (list (cdr list1) (cadr list2)))

(define (f3 list1 list2)
  (append list1 list1))

(define (f4 list1 list2)
  (list (list (car list1) (car list2)) (append (cdr list1) (cdr list2))))



; 17.3
; (map (lambda (x) (lambda (y) (+ x y))) '(1 2 3 4))
; returns '(procedure procedure procedure procedure)



; 17.8
; my "member" implementation
(define (member2 val list)
  (define (iter result)
    (cond
      ((= 0 (length result)) #f)
      ((equal? (car result) val) result)
      (else (iter (cdr result)))))
  (iter list))
; testing member2:
;(member2 'd '(a b c d e f g)) ; returns (d e f g)
;(member2 'g '(a b c d e f g))
;(member2 '(1 2) '(4 5 (1 2 3) 3 4))
;(member2 '(1 2 3) '(4 5 (1 2 3) 3 4))


; 17.9
; Write list-ref.
(define (list-ref2 lst i)
  (define (iter new-lst new-i)
    (cond ((= new-i 0) (car new-lst))
          (else (iter (cdr new-lst) (- new-i 1)))))
  (iter lst i))
; testing list-ref2
;(list-ref2 '(Lucy in the sky with diamonds) 3)
;(list-ref2 '(the sounds of silence) 5)  ; if index out of bounds, error


; 17.10
; write length.
(define (length2 lst)
  (define (iter new-lst count)
    (cond
      ((null? new-lst) count)
      (else (iter  (cdr new-lst) (+ count 1)))))
  (iter lst 0))
; testing length2
; > (length2 '(1))
; 1
; > (length2 '())
; 0
; > (length2 '(1 2 3 4 444))
; 5


; 17.11
; Write before-in-list?, which takes a list and two elements of the list. It should return #t if the second argument appears in the list argument before the third argument.
; The procedure should also return #f if either of the supposed elements doesn't appear at all.
(define (before-in-list lst x y)
  (let ((x-mem (member x lst)) (y-mem (member y lst)))
    (cond ((or (not x-mem) (not y-mem)) #f)
          ((> (length x-mem) (length y-mem)) #t)
          (else #f))))
; testing    
;(before-in-list '(1 2 3 4 5 6) 1 3)
;(before-in-list '(1 2 3 4 5 6) 3 1)
;(before-in-list '(1 2 3 4 5 6) -3 1)
;(before-in-list '(1 2 3 4 5 6) -3 -1)


; 17.12
;  Write a procedure called flatten that takes as its argument a list, possibly including sublists, but whose ultimate building blocks are words (not Booleans or procedures).
; It should return a sentence containing all the words of the list, in the order in which they appear in the original.

(define (flatten lst)
  (define (f-helper sub-lst sentence)
    (cond
      ((null? sub-lst) sentence)
      ((list? (car sub-lst)) (f-helper (cdr sub-lst) (append sentence (car sub-lst))))
      (else (f-helper (cdr sub-lst) (append sentence (list (car sub-lst)))))))
  (f-helper lst '()))
   
        
;testing
(flatten '("hello" "my" "name" "is?"))
(flatten '("hello" ("my" "cool") "name" "is?"))
(flatten '("hello" ("my" "cool") "name" ("a" "b") "is?"))
(flatten '(("h1 " "h2") ("my" "cool") "name" "is?"))


; 17.14
; Write a procedure branch that takes as arguments a list of numbers and a nested list structure. It should be the list-of-lists equivalent of item.
(define (branch num-lst lst)
  (define (iter num-lst2 lst2)
    (if (null? num-lst2)
        lst2
        (iter (cdr num-lst2) (list-ref lst2 (- (car num-lst2) 1)))))
  (iter num-lst lst))

; testing
(branch '(3) '((a b) (c d) (e f) (g h)))
(branch '(3 2) '((a b) (c d) (e f) (g h)))
(branch '(2 3 1 2) '((a b) ((c d) (e f) ((g h) (i j)) k) (l m)))

    

   
    

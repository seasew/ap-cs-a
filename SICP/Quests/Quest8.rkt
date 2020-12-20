(define x (list (list 1 2) 3 (cons 4 5) (list 6 7 8)))
x
(set-car! (cdr x) 9)
x
(set-cdr! (caddr x) (list 10 11))
x
(set-car! (cdaddr x) 12)
x
(set-cdr! (cdddr x) (list 13))
x
(set-cdr! (cdr x) x)
;x

;3.16 Incorrect count pairs
(define (count-pairs thing)
  (if (not (pair? thing))
      0
      (+ (count-pairs (car thing))
         (count-pairs (cdr thing))
         1)))
;(count-pairs x)

; A solution to the count-pairs problem (#3.17)
;
; Note the use of a list to keep track of which pairs
; have already been visited.

(define (cp pair)
  (let ((visited '()))

    ; return #t if the pair is in vl, #f otherwise
    (define (visited? pair vl)
      (cond ((null? vl) #f)
            ((eq? pair (car vl)) #t)
            (else (visited? pair (cdr vl)))))

    ; return number of pairs
    (define (cp2 pair)
      ; if not a pair, 0
      (cond ((not (pair? pair)) 0)
      ; if already visited, 0
            ((visited? pair visited) 0)
      ; else:
            (else
             ; updated visited (use set!) to include pair
             (set! visited (cons pair visited))
             ; this pair counts as one, still need to look at
             ; car and cdr to determine how many more pairs there are
             (+ 1 (cp2 (car pair)) (cp2 (cdr pair))))))
      
    (cp2 pair)))

(cp x)
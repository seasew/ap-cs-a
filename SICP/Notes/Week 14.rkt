; Week 14 problem
; SICP 3.1 Cow Problem

; Part A
(define (make-cow name weight)
  (define (get-name) name)
  (define (eat grass) (set! weight (+ weight (/ grass 10))) weight)
  (define (speak) 'moo)
  (define (get-weight) weight)
  (define (dispatch msg)
    (cond ((eq? msg 'get-name) get-name)
          ((eq? msg 'eat) eat)
          ((eq? msg 'speak) speak)
          ((eq? msg 'get-weight) get-weight)
          (else (lambda (x) 'Invalid))))
  dispatch)

;Part B
(define peppaCow (make-cow 'Peppa 10))
((peppaCow 'get-weight))
((peppaCow 'eat) 20)
((peppaCow 'speak))
((peppaCow 'get-name))


; Part C - inheritance in Scheme
(define (catCow cow)
  (define (speak) 'meow)
  (define (dispatch msg)
    (cond ((eq? msg 'speak) speak)
          (else (cow msg))))
  dispatch)

(define cat (catCow (make-cow 'Cat 10)))
((cat 'get-weight))
((cat 'eat) 20)
((cat 'speak))
((cat 'get-name))

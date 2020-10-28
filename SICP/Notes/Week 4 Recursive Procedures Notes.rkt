(#%require racket/trace)

; order of growth: space - size of stack trace; time - number of steps

; recursive procedure using a recursive process
; factorial
; Time - O(n)
; Space - O(n)
(define fact (lambda (n)
               (if (= n 1)
                   1
                   (* n (fact (- n 1))))))

; factorial using an iterative
; Time - O(n)
; Space - O(1)
(define (fact-iter n)
  (define fact-helper (lambda (product count n)
                        (if (> count n) product
                            (fact-helper (* product count)
                                         (+ count 1)
                                         n))))
  (trace fact-helper)
  (fact-helper 1 1 n))
                    


; recursive procedure using an iterative process
(define (count2 list)
  (define (iter wds result)
    (if (null? wds)
        result
        (iter (cdr wds) (+ result 1))))
  (trace iter)
  (iter list 0))

;recusive procedure using a recursive process
(define (count1 list)
  (if (null? list) 0
      (count1 (cdr list)))
  (trace count1))


       
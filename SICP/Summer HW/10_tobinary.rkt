(define mod (lambda (num div)
                (- num (* (truncate (/ num div)) div))))

(define toBinary (lambda (num)
                     (+ (mod num 2) (if (= (truncate (/ num 2)) 0) 0 (* (toBinary (truncate (/ num 2))) 10)))))
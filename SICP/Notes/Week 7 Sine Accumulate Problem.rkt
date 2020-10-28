; mystery
(define (mystery? n)
  (define (iter x counter)
    (cond ((<= n 0) #f)
          ((= n 1) #f)
          ((and (= x 1)(= counter 2)) #t)
          ((and (= x 1)(> counter 2)) #f)
          ((= (remainder n x) 0)(iter (- x 1) (+ counter 1)))
          (else (iter (- x 1) counter))))
  (iter n 1))


(define (filtered-accumulate op id term a next b pred)
   (cond ((> a b) id)
         ((pred a)(op (term a)(filtered-accumulate op id term (next a) next b pred)))
         (else (filtered-accumulate op id term (next a) next b pred))))

(define (sum-m n)
    (filtered-accumulate + 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) n mystery?))

; sin-accumulate
(define (accumulate op id term a next b)
  (cond ((> a b) id)
        (else (op (term a) (accumulate op id term (next a) next b)))))

(define (factorial n)
  (fact-iter 1 n))
(define (fact-iter result n)
  (cond ((< n 2) result)
        (else (fact-iter (* n result) (- n 1)))))

(define pi 3.14159265359)

(define (sine-accumulate x)
  (define (sine-term i)
    (* (if (odd? i) 1 -1) (let ((i2 (- (* 2 i) 1)))
      (/ (expt x i2) (factorial i2)))))

  (* 1.0 (accumulate + 0 sine-term 1 (lambda (c) (+ c 1)) 200))) ; multiply by 1.0 so you get a decimal, not a fraction
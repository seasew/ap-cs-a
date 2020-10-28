(define (accumulate op id term a next b)
  (cond ((> a b) id)
        (else (op (term a) (accumulate op id term (next a) next b)))))

(define (factorial n)
  (cond ((< n 2) 1)
        (else (* n (factorial (- n 1))))))


(define (e n)

  (accumulate +  ;; op

              0   ;; id

		   (lambda (x) (* 1.0 (/ 1 (factorial x))))   ;; term

		   0   ;; a

		   (lambda (x) (+ x 1))   ;; next

		   (- n 1))) ;; b


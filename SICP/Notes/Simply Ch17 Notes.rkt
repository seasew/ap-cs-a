(define (accumulate op id term a next b)
  (define (iter a result)
    (if (> a b)
        id
        (iter (next a) (op result (term a)))))
  (iter a id))

(define (rangew n)
  (accumulate + 0 (lambda (x) (display x) (newline) x) 1 (lambda (x) (+ x 1)) n) (newline))

(define (range n)
  (accumulate cons '() (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

; pi-sum

; a let is a lambda that is immediately executed
; (syntatic sugar)
(define (thing)
  (let ((x 5))
    x))

(define (thing2)
  ((lambda (x) x) 5))

(define (mything)
  (let ((x 1) (y 2) (z 3))
    (+ x y (* z z))))

(define (mything2)
  ((lambda (x y z) (+ x y (* z z))) 1 2 3))


;Local vars
(define x 5)
(+ (let ((x 3))
     (+ x (* x 10))) 5)

(define x 2)
(let ((x 3)
      (y (+ x 2)))
  (* x y)) ; 3 * 4. The 4 is 2 + 2, not 3 + 2

; let star:
(define x 2)
(let* ((x 3)
       (y (+ x 2)))
  (* x y)) ; 3 * 5. The 5 is 3 + 2

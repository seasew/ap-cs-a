(define (make-mobile left right)
  (list left right)) ; left and right are branches

(define (make-branch length structure)
  (list length structure)) ; structure can be a num or mobile

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (mobile?) list?)

(define (branch-weight branch)
  (let ((struc (branch-structure branch)))
  (if (mobile? struc)
      (+ (branch-weight (left-branch struc))
         (branch-weight (right-branch struc)))
      struc)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))


(define (branch-torque branch)
  (if (mobile? (branch-structure branch))
      (* (branch-length branch) (branch-weight branch))
      (* (branch-length branch) (branch-structure branch))))

(define (balanced-branch branch)
  (if (number? (branch-structure branch))
      #t
      (and 
       (balanced-branch (left-branch (branch-structure branch)))
       (balanced-branch (right-branch (branch-structure branch)))
       (= (branch-torque (left-branch (branch-structure branch)))
          (branch-torque (right-branch (branch-structure branch)))))))

(define (balanced-mobile mobile)
  (and (balanced-branch (left-branch mobile))
       (balanced-branch (right-branch mobile))
       (= (branch-torque (left-branch mobile))
          (branch-torque (right-branch mobile)))))
      
; if the definition of mobile and branch changes to cons
; the selectors have to change
; (define (right-branch branch) (cdr branch))
; (define (branch-structure mobile) (cdr mobile))

; test
(branch-weight (make-branch 6
       (make-mobile
        (make-branch 1 8)
        (make-branch 4 2))))


(define m
  (make-mobile
   (make-branch 1
       (make-mobile
        (make-branch 1 30)
        (make-branch 1 (make-mobile
                        (make-branch 1 15)
                        (make-branch 1 15)))))
   (make-branch 5 12)))

(total-weight m)

(branch-torque (left-branch m))
(balanced-branch (left-branch m))
(balanced-branch (right-branch m))
(balanced-mobile m)


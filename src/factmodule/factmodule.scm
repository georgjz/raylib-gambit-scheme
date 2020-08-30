;;; This is a simple Scheme module that provides a functions that will 
;;; calculate the factorial of a number n
; (##supply-module factmodule)

(define fact
  (lambda (n)
    (if (zero? n)
        1
        (* n (fact (- n 1))))))
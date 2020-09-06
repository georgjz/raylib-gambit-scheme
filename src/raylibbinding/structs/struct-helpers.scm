(define flatten 
  (lambda (ls)
    (cond 
      ((null? ls) '())
      ((pair? ls) (append (flatten (car ls))
                          (flatten (cdr ls))))
      (else (list ls)))))

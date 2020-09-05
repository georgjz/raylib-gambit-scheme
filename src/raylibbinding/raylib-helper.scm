;;; These are helper functions to make using some of raylib's data strucutures 
;;; more convenient 

(define make-color 
  (lambda (r g b a)
    (get-color 
     (bitwise-ior (arithmetic-shift r 24)
                  (arithmetic-shift g 16)
                  (arithmetic-shift b 8)
                  a))))
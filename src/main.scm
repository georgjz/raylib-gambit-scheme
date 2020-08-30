;;; Simple example of using raylib in Scheme
; (##demand-module factmodule)

(begin (write "Hello, Schemer!")
       (newline)
       (write "10! = ")
       (write (number->string (fact 10))))
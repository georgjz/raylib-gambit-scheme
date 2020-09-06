;;; Simple example of using raylib in Scheme
; (##demand-module raylib-test)

;;; Some game constants 
(define screen-width 800)
(define screen-height 450)

;;; Vector2 testing 
(define start-vec (make-vector2 0. 0.))
(define end-vec (make-vector2 800. 450.))
(define line-color (make-color 0 0 255 255))

;;; Initialize the game
(define init-game 
  (lambda ()
    (init-window screen-width 
                 screen-height
                 "Raylib with Gambit Scheme")
    (set-target-fps 60)))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background RAYWHITE)
               (draw-text "(absolute 'power)"
                          20
                          20 
                          30 
                          DARKGRAY)
               (draw-line-v start-vec end-vec line-color)
               (end-drawing)
               (main-loop)))))

(init-game)
(main-loop)
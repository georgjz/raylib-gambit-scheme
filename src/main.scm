;;; Simple example of using raylib in Scheme
; (##demand-module raylib-test)

;;; Some game constants 
(define screen-width 800)
(define screen-height 450)
(define RAYWHITE (get-color 16448250))
(define RAYGRAY (get-color 1644825))

;;; Initialize the game
(define init-game 
  (lambda ()
    (init-window screen-width 
                 screen-height
                 "Raylib with Scheme")
    (set-target-fps 60)))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background RAYWHITE)
               (draw-text "ABSOLUTE POWER"
                          20
                          20 
                          30 
                          (get-color 16777215))
               (end-drawing)
               (main-loop)))))

(init-game)
(main-loop)
;;; Simple example of using raylib in Scheme

;; Some game constants 
(define SCREEN-WIDTH 800)
(define SCREEN-HEIGHT 450)

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
      (init-window SCREEN-WIDTH 
                   SCREEN-HEIGHT
                   "raylib [core] example - basic window (Gambit Scheme)")
      (set-target-fps 60))))

;;; The main loop
(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background RAYWHITE)
               (draw-text "Congrats! You created your first window!" 
                          190 
                          200 
                          20
                          LIGHTGRAY)
               (end-drawing)
               (main-loop))
        (close-window))))

;;; Init the game and start the main loop
(init-game)
(main-loop)

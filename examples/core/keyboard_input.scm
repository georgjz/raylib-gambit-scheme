;;; Simple example of using raylib in Scheme

;; Some game constants 
(define SCREEN-WIDTH 800)
(define SCREEN-HEIGHT 450)

;;; Some global game variables 
(define *ball-position* (map exact->inexact (list (/ SCREEN-WIDTH 2) 
                                                  (/ SCREEN-HEIGHT 2))))

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
      (init-window SCREEN-WIDTH 
                   SCREEN-HEIGHT
                   "raylib [core] example - keyboard input (Gambit Scheme)")
      (set-target-fps 60))))

;;; vector addition helper 
(define vec-add (lambda (v1 v2) (map + v1 v2)))

;;; The main loop
(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               ; check input
               (when (is-key-down KEY_RIGHT) 
                     (set! *ball-position* (vec-add *ball-position* '(2.0 0.0))))
               (when (is-key-down KEY_LEFT) 
                     (set! *ball-position* (vec-add *ball-position* '(-2.0 0.0))))
               (when (is-key-down KEY_UP) 
                     (set! *ball-position* (vec-add *ball-position* '(0.0 -2.0))))
               (when (is-key-down KEY_DOWN) 
                     (set! *ball-position* (vec-add *ball-position* '(0.0 2.0))))
               (clear-background RAYWHITE)
               (draw-text "Move the ball with arrow keys"
                          10 
                          10 
                          20
                          DARKGRAY)
               (draw-circle-v *ball-position* 50.0 MAROON)
               (end-drawing)
               (main-loop))
        (close-window))))

;;; Init the game and start the main loop
(init-game)
(main-loop)

;;; Simple example of using raylib in Scheme

;; Some game constants 
(define SCREEN-WIDTH 800)
(define SCREEN-HEIGHT 450)

;;; Some global game variables 
(define *ball-position* '(-100.0 -100.0))
(define *ball-color* DARKBLUE)

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
      (init-window SCREEN-WIDTH 
                   SCREEN-HEIGHT
                   "raylib [core] example - mouse input (Gambit Scheme)")
      (set-target-fps 60))))

;;; The main loop
(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin ; update ball position 
               (set! *ball-position* (get-mouse-position))
               ; check input
               (when (is-mouse-button-pressed MOUSE_LEFT_BUTTON) 
                     (set! *ball-color* MAROON))
               (when (is-mouse-button-pressed MOUSE_MIDDLE_BUTTON) 
                     (set! *ball-color* LIME))
               (when (is-mouse-button-pressed MOUSE_RIGHT_BUTTON) 
                     (set! *ball-color* DARKBLUE))
               (begin-drawing)
               (clear-background RAYWHITE)
               (draw-circle-v *ball-position* 40.0 *ball-color*)
               (draw-text "Move ball with mouse and click mouse button to change color"
                          10 
                          10 
                          20
                          DARKGRAY)
               (end-drawing)
               (main-loop))
        (close-window))))

;;; Init the game and start the main loop
(init-game)
(main-loop)

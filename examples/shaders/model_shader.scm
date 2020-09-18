;;; An example of loading and using a simple fragment shader

;;; Some game constants 
(define SCREEN-WIDTH 800)
(define SCREEN-HEIGHT 450)
(define CAMERA_PERSPECTIVE 0)

;;; Set up a camera 
(define camera '(4.0 4.0 4.0)
               '(0.0 1.0 -1.0)
               '(0.0 1.0 0.0)
               45.0 
               CAMERA_PERSPECTIVE)

;;; Game variables 
(define model #f)
(define texture #f)
(define shader #f)
(define position '(0.0 0.0 0.0))

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
      (set-config-flags FLAG_MSAA_4X_HINT)
      (init-window SCREEN-WIDTH 
                   SCREEN-HEIGHT
                   "raylib [core] example - basic window (Gambit Scheme)")
      (set! model (load-model "assets/models/watermill.obj"))
      (set! texture (load-texture "assets/models/watermill_diffuse.png"))
      (set! shader (load-shader 0 ; no vertex shader
                                "assets/shaders/grayscale.fs"))
      
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

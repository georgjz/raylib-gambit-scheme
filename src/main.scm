;;; Simple example of using raylib in Scheme
; (##demand-module raylib-test)

;;; Some game constants 
(define screen-width 800)
(define screen-height 450)
(define CAMERA-PERSPECTIVE 0)

;;; Camera setup
(define camera (make-camera (make-vector3 0. 5. 10.)
                            (make-vector3 0. 0. 0.)
                            (make-vector3 0. 1. 0.)
                            45.
                            CAMERA-PERSPECTIVE))

(define cube-position (make-vector3 0. 0. 0.))

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
               (begin-mode-3d camera)
               (draw-cube 
                cube-position 2. 2. 2. RED)
               (draw-cube-wires 
                cube-position 2. 2. 2. MAROON)
               (draw-grid 10 1.)
               (end-mode-3d)
               (draw-text 
                "Welcome to the third dimension!" 10 40 20 DARKGRAY)
               (draw-fps 
                10 10)
               (end-drawing)
               (main-loop))
        (write (get-camera-matrix camera)))))

(init-game)
(main-loop)
;; Simple example of using raylib in Scheme

; (include "raylibbinding/raylib.scm")

;; Some game constants 
(define screen-width 800)
(define screen-height 600)
(define CAMERA-PERSPECTIVE 0)

;;; Define a camera
(define camera (make-camera '(10. 10. 10.)
                            '(0. 0. 5.)
                            '(0. 1. 0.)
                            45. 
                            CAMERA-PERSPECTIVE))

;;; this is weird
(define make-int-pointer 
  (c-lambda ()
    (pointer int) 
      "int a = 0; 
       int * ptr = &a;
       ___return( ptr );"))

;;; game variables 
(define texture #f)
(define model #f)
(define anims #f)
(define anims-count (make-int-pointer))
; (define anims-count 0)
(define anim-frame-count 0)

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
     (init-window screen-width 
                  screen-height
                  "Raylib with Gambit Scheme")
     (set! model (load-model "assets/guy/guy.iqm"))
     (set! texture (load-texture "assets/guy/guytex.png"))
     (set-material-texture (deref-material (car (cddddr model)) 0)
                           0 ; MAP_DIFFUSE 
                           texture)
     (set! anims (load-model-animations "assets/guy/guyanim.iqm" anims-count))
     (set! anim-frame-count 0)
     (set-target-fps 60)
    )))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (if (is-key-down 32)   ; KEY_SPACE = 32
                   (begin (set! anim-frame-count (+ 1 anim-frame-count))
                          (if (> anim-frame-count 30)
                              (set! anim-frame-count 0))
                          (update-model-animation model 
                                                  (deref-model-animation anims 0)
                                                  anim-frame-count)))
               (begin-drawing)
               (clear-background RAYWHITE)
                 (begin-mode-3d camera)
                 (draw-model-ex model
                                '(0. 0. 0.)
                                '(1. 0. 0.)
                                0. 
                                '(1. 1. 1.)
                                WHITE)
                 (draw-grid 10 1.)
                 (end-mode-3d)
               (draw-fps 10 10)
              ;  (draw-texture texture 100 100 WHITE)
               (end-drawing)
               (main-loop))
        (begin 
         (unload-texture texture)
         (unload-model model)
         (close-window)))))

(init-game)
(main-loop)

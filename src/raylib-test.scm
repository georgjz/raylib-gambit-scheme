;;; A simple module that interfaces raylib functions 
; (##supply-module raylib-test)

;;; Include raylib
(c-declare #<<c-declare-end

#include "raylib.h"

c-declare-end
)

;;; Core functions
(define init-window 
  (c-lambda (int int char-string)
    void "InitWindow"))

(define window-should-close 
  (c-lambda ()
    bool "WindowShouldClose"))

(c-define-type color "Color")

(define clear-background
  (c-lambda (color)
    void "ClearBackground"))

(define set-target-fps 
  (c-lambda (int)
    void "SetTargetFPS"))

(define get-color 
  (c-lambda (int)
    color "GetColor"))

(define begin-drawing
  (c-lambda ()
    void "BeginDrawing"))

(define end-drawing
  (c-lambda ()
    void "EndDrawing"))

;;; text 
(define draw-text 
  (c-lambda (char-string int int int color)
    void "DrawText"))

;;; helper functions 
(define make-color 
  (lambda (r g b a)
    (bitwise-and (arithmetic-shift r 24)
                 (arithmetic-shift g 16)
                 (arithmetic-shift b 8)
                 a)))
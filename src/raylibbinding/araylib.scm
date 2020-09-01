;;;-----------------------------------------------------------------------------
;;; This is the Raylib main file. It contains most of the important macros and 
;;; data structures.
;;;-----------------------------------------------------------------------------
(##supply-module araylib)

;;; Include raylib header
(c-declare #<<c-declare-end

#include "raylib.h"

c-declare-end
)

;;; Structure definitions
(c-define-type color              "Color")
(c-define-type vector2            "Vector2")
(c-define-type vector3            "Vector3")
(c-define-type vector4            "Vector4")
(define quaternion vector4)
(c-define-type matrix             "Matrix")
(c-define-type rectangle          "Rectangle")
(c-define-type image              "Image")
(c-define-type texture-2d         "Texture2D")
(define tex texture-2d)
(define tex-cube-map texture-2d)
(c-define-type render-texture-2d  "RenderTexture2D")
(define render-tex render-texture-2d)
(c-define-type n-patch-info       "NPatchInfo")
(c-define-type font               "Font")
(define sprite-font font) 
(c-define-type camera-3d          "Camera3D")
(define camera camera-3d)
(c-define-type camera-2d          "Camera2D")
(c-define-type mesh               "Mesh")
(c-define-type shader             "Shader")
(c-define-type material-map       "MaterialMap")
(c-define-type material           "Material")
(c-define-type transform          "Transform")
(c-define-type bone-info          "BoneInfo")
(c-define-type model              "Model")
(c-define-type model-animation    "ModelAnimation")
(c-define-type ray-hit-info       "RayHitInfo")
(c-define-type bounding-box       "BoundingBox")
(c-define-type wave               "Wave")
(c-define-type r-audio-buffer     "rAudioBuffer")
(c-define-type audio-stream       "AudioStream")
(c-define-type sound              "Sound")
(c-define-type music              "Music")
(c-define-type vr-device-info     "vrDeviceInfo")

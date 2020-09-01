;;;-----------------------------------------------------------------------------
;;; This is the Raylib main file. It contains most of the important macros and 
;;; data structures.
;;;-----------------------------------------------------------------------------
(##demand-module araylib)

;;; Include raylib header
(c-declare #<<c-declare-end

#include "raylib.h"

c-declare-end
)

;;; Structure definitions
; (c-define-type color              "Color")
; (c-define-type input-event-worker "InputEventWorker")
; (c-define-type key-event-fifo     "KeyEventFifo")
; (c-define-type )

;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the core module of raylib.
;;;-----------------------------------------------------------------------------
;;; Initialize window and OpenGL context
(define init-window
  (c-lambda (int int char-string)
    void "InitWindow"))

;;; Check if KEY_ESCAPE pressed or Close icon pressed
(define window-should-close
  (c-lambda ()
    bool "WindowShouldClose"))

;;; Close window and unload OpenGL context
(define close-window
  (c-lambda ()
    void "CloseWindow"))

;;; Check if window has been initialized successfully
(define is-window-ready
  (c-lambda ()
    bool "IsWindowReady"))

;;; Check if window has been minimized (or lost focus)
(define is-window-minimized
  (c-lambda ()
    bool "IsWindowMinimized"))

;;; Check if window has been resized
(define is-window-resized
  (c-lambda ()
    bool "IsWindowResized"))

;;; Check if window is currently hidden
(define is-window-hidden
  (c-lambda ()
    bool "IsWindowHidden"))

;;; Check if window is currently fullscreen
(define is-window-fullscreen
  (c-lambda ()
    bool "IsWindowFullscreen"))

;;; Toggle fullscreen mode (only PLATFORM_DESKTOP)
(define toggle-fullscreen
  (c-lambda ()
    void "ToggleFullscreen"))

;;; Show the window
(define unhide-window
  (c-lambda ()
    void "UnhideWindow"))

;;; Hide the window
(define hide-window
  (c-lambda ()
    void "HideWindow"))

;;; Set icon for window (only PLATFORM_DESKTOP)
(define set-window-icon
  (c-lambda (image)
    void "SetWindowIcon"))

;;; Set title for window (only PLATFORM_DESKTOP)
(define set-window-title
  (c-lambda (char-string)
    void "SetWindowTitle"))

;;; Set window position on screen (only PLATFORM_DESKTOP)
(define set-window-position
  (c-lambda (int int)
    void "SetWindowPosition"))

;;; Set monitor for the current window (fullscreen mode)
(define set-window-monitor
  (c-lambda (int)
    void "SetWindowMonitor"))

;;; Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
(define set-window-min-size
  (c-lambda (int int)
    void "SetWindowMinSize"))

;;; Set window dimensions
(define set-window-size
  (c-lambda (int int)
    void "SetWindowSize"))

;;; Get native window handle
(define get-window-handle
  (c-lambda ()
    (pointer void) "GetWindowHandle"))

;;; Get current screen width
(define get-screen-width
  (c-lambda ()
    int "GetScreenWidth"))

;;; Get current screen height
(define get-screen-height
  (c-lambda ()
    int "GetScreenHeight"))

;;; Get number of connected monitors
(define get-monitor-count
  (c-lambda ()
    int "GetMonitorCount"))

;;; Get primary monitor width
(define get-monitor-width
  (c-lambda (int)
    int "GetMonitorWidth"))

;;; Get primary monitor height
(define get-monitor-height
  (c-lambda (int)
    int "GetMonitorHeight"))

;;; Get primary monitor physical width in millimetres
(define get-monitor-physical-width
  (c-lambda (int)
    int "GetMonitorPhysicalWidth"))

;;; Get primary monitor physical height in millimetres
(define get-monitor-physical-height
  (c-lambda (int)
    int "GetMonitorPhysicalHeight"))

;;; Get window position XY on monitor
(define get-window-position
  (c-lambda ()
    vector2 "GetWindowPosition"))

;;; Get the human-readable, UTF-8 encoded name of the primary monitor
(define get-monitor-name
  (c-lambda (int)
    char-string "GetMonitorName"))

;;; Get clipboard text content
(define get-clipboard-text
  (c-lambda ()
    char-string "GetClipboardText"))

;;; Set clipboard text content
(define set-clipboard-text
  (c-lambda (char-string)
    void "SetClipboardText"))

;;; Shows cursor
(define show-cursor
  (c-lambda ()
    void "ShowCursor"))

;;; Hides cursor
(define hide-cursor
  (c-lambda ()
    void "HideCursor"))

;;; Check if cursor is not visible
(define is-cursor-hidden
  (c-lambda ()
    bool "IsCursorHidden"))

;;; Enables cursor (unlock cursor)
(define enable-cursor
  (c-lambda ()
    void "EnableCursor"))

;;; Disables cursor (lock cursor)
(define disable-cursor
  (c-lambda ()
    void "DisableCursor"))

;;; Set background color (framebuffer clear color)
(define clear-background
  (c-lambda (color)
    void "ClearBackground"))

;;; Setup canvas (framebuffer) to start drawing
(define begin-drawing
  (c-lambda ()
    void "BeginDrawing"))

;;; End canvas drawing and swap buffers (double buffering)
(define end-drawing
  (c-lambda ()
    void "EndDrawing"))

;;; Initialize 2D mode with custom camera (2D)
(define begin-mode2-d
  (c-lambda (camera-2d)
    void "BeginMode2D"))

;;; Ends 2D mode with custom camera
(define end-mode2-d
  (c-lambda ()
    void "EndMode2D"))

;;; Initializes 3D mode with custom camera (3D)
(define begin-mode3-d
  (c-lambda (camera-3d)
    void "BeginMode3D"))

;;; Ends 3D mode and returns to default 2D orthographic mode
(define end-mode3-d
  (c-lambda ()
    void "EndMode3D"))

;;; Initializes render texture for drawing
(define begin-texture-mode
  (c-lambda (render-texture-2d)
    void "BeginTextureMode"))

;;; Ends drawing to render texture
(define end-texture-mode
  (c-lambda ()
    void "EndTextureMode"))

;;; Begin scissor mode (define screen area for following drawing)
(define begin-scissor-mode
  (c-lambda (int int int int)
    void "BeginScissorMode"))

;;; End scissor mode
(define end-scissor-mode
  (c-lambda ()
    void "EndScissorMode"))

;;; Returns a ray trace from mouse position
(define get-mouse-ray
  (c-lambda (vector2 camera)
    ray "GetMouseRay"))

;;; Returns camera transform matrix (view matrix)
(define get-camera-matrix
  (c-lambda (camera)
    matrix "GetCameraMatrix"))

;;; Returns camera 2d transform matrix
(define get-camera-matrix2-d
  (c-lambda (camera-2d)
    matrix "GetCameraMatrix2D"))

;;; Returns the screen space position for a 3d world space position
(define get-world-to-screen
  (c-lambda (vector3 camera)
    vector2 "GetWorldToScreen"))

;;; Returns size position for a 3d world space position
(define get-world-to-screen-ex
  (c-lambda (vector3 camera int int)
    vector2 "GetWorldToScreenEx"))

;;; Returns the screen space position for a 2d camera world space position
(define get-world-to-screen2-d
  (c-lambda (vector2 camera-2d)
    vector2 "GetWorldToScreen2D"))

;;; Returns the world space position for a 2d camera screen space position
(define get-screen-to-world2-d
  (c-lambda (vector2 camera-2d)
    vector2 "GetScreenToWorld2D"))

;;; Set target FPS (maximum)
(define set-target-fps
  (c-lambda (int)
    void "SetTargetFPS"))

;;; Returns current FPS
(define get-fps
  (c-lambda ()
    int "GetFPS"))

;;; Returns time in seconds for last frame drawn
(define get-frame-time
  (c-lambda ()
    float "GetFrameTime"))

;;; Returns elapsed time in seconds since InitWindow()
(define get-time
  (c-lambda ()
    double "GetTime"))

;;; Returns hexadecimal value for a Color
(define color-to-int
  (c-lambda (color)
    int "ColorToInt"))

;;; Returns color normalized as float [0..1]
(define color-normalize
  (c-lambda (color)
    vector4 "ColorNormalize"))

;;; Returns color from normalized values [0..1]
(define color-from-normalized
  (c-lambda (vector4)
    color "ColorFromNormalized"))

;;; Returns HSV values for a Color
(define color-to-hsv
  (c-lambda (color)
    vector3 "ColorToHSV"))

;;; Returns a Color from HSV values
(define color-from-hsv
  (c-lambda (vector3)
    color "ColorFromHSV"))

;;; Returns a Color struct from hexadecimal value
(define get-color
  (c-lambda (int)
    color "GetColor"))

;;; Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
(define fade
  (c-lambda (color float)
    color "Fade"))

;;; Setup window configuration flags (view FLAGS)
(define set-config-flags
  (c-lambda (unsigned-int)
    void "SetConfigFlags"))

;;; Set the current threshold (minimum) log level
(define set-trace-log-level
  (c-lambda (int)
    void "SetTraceLogLevel"))

;;; Set the exit threshold (minimum) log level
(define set-trace-log-exit
  (c-lambda (int)
    void "SetTraceLogExit"))

;;; BUG: (Callback type) Set a trace log callback to enable custom logging
(define set-trace-log-callback
  (c-lambda (TraceLogCallback)
    void "SetTraceLogCallback"))

;;; BUG: (Argument count) Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
(define trace-log
  (c-lambda (int char-string)
    void "TraceLog"))

;;; Takes a screenshot of current screen (saved a .png)
(define take-screenshot
  (c-lambda (char-string)
    void "TakeScreenshot"))

;;; Returns a random value between min and max (both included)
(define get-random-value
  (c-lambda (int int)
    int "GetRandomValue"))

;;; Load file data as byte array (read)
(define load-file-data
  (c-lambda (char-string int *)
    (pointer unsigned-char) "LoadFileData"))

;;; Save data to file from byte array (write)
(define save-file-data
  (c-lambda (char-string (pointer void) int)
    void "SaveFileData"))

;;; Load text data from file (read), returns a ' ' terminated string
(define load-file-text
  (c-lambda (char-string)
    (pointer char) "LoadFileText"))

;;; Save text data to file (write), string must be ' ' terminated    
(define save-file-text
  (c-lambda (char-string (pointer char))
    void "SaveFileText"))

;;; Check if file exists
(define file-exists
  (c-lambda (char-string)
    bool "FileExists"))

;;; Check file extension
(define is-file-extension
  (c-lambda (char-string char-string)
    bool "IsFileExtension"))

;;; Check if a directory path exists
(define directory-exists
  (c-lambda (char-string)
    bool "DirectoryExists"))

;;; Get pointer to extension for a filename string
(define get-extension
  (c-lambda (char-string)
    char-string "GetExtension"))

;;; Get pointer to filename for a path string
(define get-file-name
  (c-lambda (char-string)
    char-string "GetFileName"))

;;; Get filename string without extension (uses static string)
(define get-file-name-without-ext
  (c-lambda (char-string)
    char-string "GetFileNameWithoutExt"))

;;; Get full path for a given fileName with path (uses static string)
(define get-directory-path
  (c-lambda (char-string)
    char-string "GetDirectoryPath"))

;;; Get previous directory path for a given path (uses static string)
(define get-prev-directory-path
  (c-lambda (char-string)
    char-string "GetPrevDirectoryPath"))

;;; Get current working directory (uses static string)
(define get-working-directory
  (c-lambda ()
    char-string "GetWorkingDirectory"))

;;; Get filenames in a directory path (memory should be freed)
(define get-directory-files
  (c-lambda (char-string int *)
    (pointer (pointer char)) "GetDirectoryFiles"))

;;; Clear directory files paths buffers (free memory)
(define clear-directory-files
  (c-lambda ()
    void "ClearDirectoryFiles"))

;;; Change working directory, returns true if success
(define change-directory
  (c-lambda (char-string)
    bool "ChangeDirectory"))

;;; Check if a file has been dropped into window
(define is-file-dropped
  (c-lambda ()
    bool "IsFileDropped"))

;;; Get dropped files names (memory should be freed)
(define get-dropped-files
  (c-lambda (int *)
    (pointer (pointer char)) "GetDroppedFiles"))

;;; Clear dropped files paths buffer (free memory)
(define clear-dropped-files
  (c-lambda ()
    void "ClearDroppedFiles"))

;;; Get file modification time (last write time)
(define get-file-mod-time
  (c-lambda (char-string)
    long "GetFileModTime"))

;;; Compress data (DEFLATE algorythm)
(define compress-data
  (c-lambda ((pointer unsigned-char) int int *)
    (pointer unsigned-char) "CompressData"))

;;; Decompress data (DEFLATE algorythm)
(define decompress-data
  (c-lambda ((pointer unsigned-char) int int *)
    (pointer unsigned-char) "DecompressData"))

;;; Load integer value from storage file (from defined position)
(define load-storage-value
  (c-lambda (int)
    int "LoadStorageValue"))

;;; Save integer value to storage file (to defined position)
(define save-storage-value
  (c-lambda (int int)
    void "SaveStorageValue"))

;;; Open URL with default system browser (if available)
(define open-url
  (c-lambda (char-string)
    void "OpenURL"))

;;; Detect if a key has been pressed once
(define is-key-pressed
  (c-lambda (int)
    bool "IsKeyPressed"))

;;; Detect if a key is being pressed
(define is-key-down
  (c-lambda (int)
    bool "IsKeyDown"))

;;; Detect if a key has been released once
(define is-key-released
  (c-lambda (int)
    bool "IsKeyReleased"))

;;; Detect if a key is NOT being pressed
(define is-key-up
  (c-lambda (int)
    bool "IsKeyUp"))

;;; Get latest key pressed
(define get-key-pressed
  (c-lambda ()
    int "GetKeyPressed"))

;;; Set a custom key to exit program (default is ESC)
(define set-exit-key
  (c-lambda (int)
    void "SetExitKey"))

;;; Detect if a gamepad is available
(define is-gamepad-available
  (c-lambda (int)
    bool "IsGamepadAvailable"))

;;; Check gamepad name (if available)
(define is-gamepad-name
  (c-lambda (int char-string)
    bool "IsGamepadName"))

;;; Return gamepad internal name id
(define get-gamepad-name
  (c-lambda (int)
    char-string "GetGamepadName"))

;;; Detect if a gamepad button has been pressed once
(define is-gamepad-button-pressed
  (c-lambda (int int)
    bool "IsGamepadButtonPressed"))

;;; Detect if a gamepad button is being pressed
(define is-gamepad-button-down
  (c-lambda (int int)
    bool "IsGamepadButtonDown"))

;;; Detect if a gamepad button has been released once
(define is-gamepad-button-released
  (c-lambda (int int)
    bool "IsGamepadButtonReleased"))

;;; Detect if a gamepad button is NOT being pressed
(define is-gamepad-button-up
  (c-lambda (int int)
    bool "IsGamepadButtonUp"))

;;; Get the last gamepad button pressed
(define get-gamepad-button-pressed
  (c-lambda ()
    int "GetGamepadButtonPressed"))

;;; Return gamepad axis count for a gamepad
(define get-gamepad-axis-count
  (c-lambda (int)
    int "GetGamepadAxisCount"))

;;; Return axis movement value for a gamepad axis
(define get-gamepad-axis-movement
  (c-lambda (int int)
    float "GetGamepadAxisMovement"))

;;; Detect if a mouse button has been pressed once
(define is-mouse-button-pressed
  (c-lambda (int)
    bool "IsMouseButtonPressed"))

;;; Detect if a mouse button is being pressed
(define is-mouse-button-down
  (c-lambda (int)
    bool "IsMouseButtonDown"))

;;; Detect if a mouse button has been released once
(define is-mouse-button-released
  (c-lambda (int)
    bool "IsMouseButtonReleased"))

;;; Detect if a mouse button is NOT being pressed
(define is-mouse-button-up
  (c-lambda (int)
    bool "IsMouseButtonUp"))

;;; Returns mouse position X
(define get-mouse-x
  (c-lambda ()
    int "GetMouseX"))

;;; Returns mouse position Y
(define get-mouse-y
  (c-lambda ()
    int "GetMouseY"))

;;; Returns mouse position XY
(define get-mouse-position
  (c-lambda ()
    vector2 "GetMousePosition"))

;;; Set mouse position XY
(define set-mouse-position
  (c-lambda (int int)
    void "SetMousePosition"))

;;; Set mouse offset
(define set-mouse-offset
  (c-lambda (int int)
    void "SetMouseOffset"))

;;; Set mouse scaling
(define set-mouse-scale
  (c-lambda (float float)
    void "SetMouseScale"))

;;; Returns mouse wheel movement Y
(define get-mouse-wheel-move
  (c-lambda ()
    int "GetMouseWheelMove"))

;;; Returns touch position X for touch point 0 (relative to screen size)
(define get-touch-x
  (c-lambda ()
    int "GetTouchX"))

;;; Returns touch position Y for touch point 0 (relative to screen size)
(define get-touch-y
  (c-lambda ()
    int "GetTouchY"))

;;; Returns touch position XY for a touch point index (relative to screen size)
(define get-touch-position
  (c-lambda (int)
    vector2 "GetTouchPosition"))

;;; Enable a set of gestures using flags
(define set-gestures-enabled
  (c-lambda (unsigned-int)
    void "SetGesturesEnabled"))

;;; Check if a gesture have been detected
(define is-gesture-detected
  (c-lambda (int)
    bool "IsGestureDetected"))

;;; Get latest detected gesture
(define get-gesture-detected
  (c-lambda ()
    int "GetGestureDetected"))

;;; Get touch points count
(define get-touch-points-count
  (c-lambda ()
    int "GetTouchPointsCount"))

;;; Get gesture hold time in milliseconds
(define get-gesture-hold-duration
  (c-lambda ()
    float "GetGestureHoldDuration"))

;;; Get gesture drag vector
(define get-gesture-drag-vector
  (c-lambda ()
    vector2 "GetGestureDragVector"))

;;; Get gesture drag angle
(define get-gesture-drag-angle
  (c-lambda ()
    float "GetGestureDragAngle"))

;;; Get gesture pinch delta
(define get-gesture-pinch-vector
  (c-lambda ()
    vector2 "GetGesturePinchVector"))

;;; Get gesture pinch angle
(define get-gesture-pinch-angle
  (c-lambda ()
    float "GetGesturePinchAngle"))

;;; Set camera mode (multiple camera modes available)
(define set-camera-mode
  (c-lambda (camera int)
    void "SetCameraMode"))

;;; Update camera position for selected mode
(define update-camera
  (c-lambda ((pointer camera))
    void "UpdateCamera"))

;;; Set camera pan key to combine with mouse movement (free camera)
(define set-camera-pan-control
  (c-lambda (int)
    void "SetCameraPanControl"))

;;; Set camera alt key to combine with mouse movement (free camera)
(define set-camera-alt-control
  (c-lambda (int)
    void "SetCameraAltControl"))

;;; Set camera smooth zoom key to combine with mouse (free camera)
(define set-camera-smooth-zoom-control
  (c-lambda (int)
    void "SetCameraSmoothZoomControl"))

;;; Set camera move controls (1st person and 3rd person cameras)
(define set-camera-move-controls
  (c-lambda (int int int int int int)
    void "SetCameraMoveControls"))


cmake_minimum_required( VERSION 3.10...3.18 )

# Basic Window example
add_executable( basic_window 
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib-colors.scm
        basic_window.scm )

# Keyboard Input example
add_executable( keyboard_input
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib-colors.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib-consts.scm
        keyboard_input.scm )

# Mouse Input example
add_executable( mouse_input
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib-colors.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib-consts.scm
        mouse_input.scm )
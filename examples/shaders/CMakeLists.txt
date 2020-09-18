cmake_minimum_required( VERSION 3.10...3.18 )

# Model Shader example
add_executable( model_shader.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib.scm
        ${PROJECT_SOURCE_DIR}/src/raylibbinding/raylib-colors.scm
        model_shader.scm )

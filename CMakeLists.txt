cmake_minimum_required( VERSION 3.10...3.18 )

if( ${CMAKE_VERSION} VERSION_LESS 3.12 )
    cmake_policy( VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} )
endif()

# Give the project a name
project( raylib-gambit-scheme
    VERSION 0.1.0
    DESCRIPTION "A simple Gambit Scheme binding for raylib" )

# Add external dependencies to project
add_subdirectory( extern ) 

# Build simple Gambit Scheme program
list( APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" )
enable_language( Gambit )
add_executable( ${PROJECT_NAME} "" )
add_subdirectory( src )
cmake_minimum_required( VERSION 3.10...3.18 )

### Include all modules you need 
add_subdirectory( factmodule )

# Add sources to target 
# target_sources( ${PROJECT_NAME}
#     PRIVATE factmodule.scm 
#             main.scm 
# )

target_sources( ${PROJECT_NAME}
    PRIVATE 
        main.scm 
)
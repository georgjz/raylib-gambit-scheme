cmake_minimum_required( VERSION 3.10...3.18 )

# target_sources( ${PROJECT_NAME}
#     PRIVATE 
#         araylib.scm 
#         core.scm
# )

add_library( myraylib OBJECTS araylib.scm core.scm )
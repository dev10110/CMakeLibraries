cmake_minimum_required(VERSION 3.6)

project(myLib)


add_library(myLib SHARED src/myLib)
target_include_directories(myLib PUBLIC include	)


add_executable(demo test/demo.cpp)
target_link_libraries(demo myLib)
target_include_directories(demo PUBLIC include)



install(FILES "${PROJECT_NAME}Config.cmake" 
  DESTINATION "share/${PROJECT_NAME}/cmake")

install(TARGETS myLib
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib)

install(FILES include/myLib.hpp
  DESTINATION include)

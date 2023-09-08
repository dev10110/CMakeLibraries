cmake_minimum_required(VERSION 3.6)

project(proj)

find_package(myLib REQUIRED)

add_compile_definitions(MAGIC_NUMBER=5)

add_executable(main main.cpp)
target_link_libraries(main
	${MYLIB_DIRS}
)
target_include_directories(main PRIVATE
	${MYLIB_INCLUDE_DIRS}
)

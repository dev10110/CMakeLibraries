# Compute paths
get_filename_component(MYLIB_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

message(${MYLIB_CMAKE_DIR})

set(MYLIB_INCLUDE_DIRS "${MYLIB_CMAKE_DIR}/../../../include")

set(MYLIB_DIRS
	"${MYLIB_CMAKE_DIR}/../../../lib/libmyLib.so"
	)

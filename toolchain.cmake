# Clear default flags
set(CMAKE_CXX_FLAGS_INIT CACHE STRING "" FORCE)
foreach(build_type DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
	set(CMAKE_CXX_FLAGS_${build_type}_INIT CACHE STRING "" FORCE)
	set(CMAKE_CXX_FLAGS_${build_type} "")

	message("CMAKE_CXX_FLAGS_${build_type}_INIT: ${CMAKE_CXX_FLAGS_${build_type}_INIT}")
	message("CMAKE_CXX_FLAGS_${build_type}: ${CMAKE_CXX_FLAGS_${build_type}}")
endforeach()

message("Leaving toolchain...\n")

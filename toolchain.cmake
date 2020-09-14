message("\nEntering toolchain...")
message("  TOOLCHAIN_VARIABLE (before append): ${TOOLCHAIN_VARIABLE}")
message("  COMMAND_LINE_VARIABLE: ${COMMAND_LINE_VARIABLE}")

#[[
	Notes

	1. This will append "${COMMAND_LINE_VARIABLE} 1" to the variable each time the toolchain is enterred, which
		will be more than once--at least once for try_compile(), and at least once for the top-level project()
		directive.

	2. This means that there will be repeated flags if the cache has not yet been generated. To fix this issue,
		an include guard is added. The guard is only necessary when the variable is extended in the toolchain
		file, not when it is explicitly set.
]]
if(NOT TOOLCHAIN_INCLUDED)
	set(TOOLCHAIN_INCLUDED true)

	set(TOOLCHAIN_VARIABLE "${TOOLCHAIN_VARIABLE} ${COMMAND_LINE_VARIABLE} 1")
endif()

message("  TOOLCHAIN_VARIABLE (after append): ${TOOLCHAIN_VARIABLE}")

# Clear default flags
set(CMAKE_CXX_FLAGS_INIT CACHE STRING "" FORCE)
foreach(build_type DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
	set(CMAKE_CXX_FLAGS_${build_type}_INIT CACHE STRING "" FORCE)
	set(CMAKE_CXX_FLAGS_${build_type} "")

	message("CMAKE_CXX_FLAGS_${build_type}_INIT: ${CMAKE_CXX_FLAGS_${build_type}_INIT}")
	message("CMAKE_CXX_FLAGS_${build_type}: ${CMAKE_CXX_FLAGS_${build_type}}")
endforeach()

message("Leaving toolchain...\n")

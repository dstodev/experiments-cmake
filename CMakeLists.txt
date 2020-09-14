#[[

	CMake Questions

	3. What does it look like to replace global variables with interface libraries?

	4. Do object libraries need to be linked via $<TARGET_OBJECTS:target>?
		No, since CMake 3.12 object libraries can be linked via target_link_libraries. There are some nuances,
		though, about interface properties.

	7. Do subsequent project() directives enter the toolchain again?
		No, only the first project() directive appears to load the toolchain file.

	8. Is CMAKE_PROJECT_NAME set to anything before the first project() call?
		Sometimes. PROJECT_NAME never is. CMAKE_PROJECT_NAME, once set, is saved in the cache. This means it is empty
		on first configure, but not afterwards. PROJECT_NAME will always be empty before first project().
		To check if parent:
			get_directory_property(has_parent PARENT_DIRECTORY)
			if(has_parent)
			message(STATUS "Has a parent scope.")
			else()
			message(STATUS "Doesn't have a parent scope.")
			endif()

	9. Does CMake-Tools set CMAKE_BUILD_TYPE?
]]

cmake_minimum_required(VERSION 3.15.x)

message("PROJECT_NAME (before first project()): ${PROJECT_NAME}")

message("TOOLCHAIN_VARIABLE (before first project()): ${TOOLCHAIN_VARIABLE}")
project(CMakeExperiment LANGUAGES CXX)
message("TOOLCHAIN_VARIABLE (after first project()): ${TOOLCHAIN_VARIABLE}")

message("PROJECT_NAME (after first project()): ${PROJECT_NAME}")

foreach(build_type DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
	message("CMAKE_CXX_FLAGS_${build_type}_INIT: ${CMAKE_CXX_FLAGS_${build_type}_INIT}")
	message("CMAKE_CXX_FLAGS_${build_type}: ${CMAKE_CXX_FLAGS_${build_type}}")
endforeach()

message("Build Type: " )

# message("TOOLCHAIN_VARIABLE (before second project()): ${TOOLCHAIN_VARIABLE}")
# project(CMakeExperimentSecondProjectToolchain LANGUAGES CXX)
# message("TOOLCHAIN_VARIABLE (after second project()): ${TOOLCHAIN_VARIABLE}")

set(CPACK_GENERATOR ZIP)
include(CPack)

add_subdirectory(lib)

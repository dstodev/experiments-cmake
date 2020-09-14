#[[

	Untested CMake Questions

	3. What does it look like to replace global variables with interface libraries?

	4. Do object libraries need to be linked via $<TARGET_OBJECTS:target>?
		No, since CMake 3.12 object libraries can be linked via target_link_libraries. There are some nuances,
		though, about interface properties.

	9. Does CMake-Tools set CMAKE_BUILD_TYPE?

]]
cmake_minimum_required(VERSION 3.12)
project(CMakeExperiments LANGUAGES CXX)

foreach(build_type DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
	message("CMAKE_CXX_FLAGS_${build_type}_INIT: ${CMAKE_CXX_FLAGS_${build_type}_INIT}")
	message("CMAKE_CXX_FLAGS_${build_type}: ${CMAKE_CXX_FLAGS_${build_type}}")
endforeach()

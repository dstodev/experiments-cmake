cmake_minimum_required(VERSION 3.12)

# Exp.1
foreach(build_type "" _DEBUG _RELEASE _RELWITHDEBINFO _MINSIZEREL)
	set(flag "CMAKE_CXX_FLAGS${build_type}")

	message("1. ${flag}: ${${flag}}")
endforeach()

project(CMakeVariableExperiments LANGUAGES NONE)

foreach(build_type "" _DEBUG _RELEASE _RELWITHDEBINFO _MINSIZEREL)
	set(flag "CMAKE_CXX_FLAGS${build_type}")

	set(${flag} "" CACHE STRING "")

	message("2. ${flag}: ${${flag}}")
endforeach()

enable_language(C CXX)

foreach(build_type "" _DEBUG _RELEASE _RELWITHDEBINFO _MINSIZEREL)
	set(flag "CMAKE_CXX_FLAGS${build_type}")

	message("3. ${flag}: ${${flag}}")
endforeach()

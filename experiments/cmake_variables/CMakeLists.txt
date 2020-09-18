cmake_minimum_required(VERSION 3.12)

# Exp.1
# Load CMAKE_TOOLCHAIN_FILE, but don't load any languages (or their default flags) yet.
project(CMakeVariableExperiments LANGUAGES NONE)

# Clear all language flags that weren't set in CMAKE_TOOLCHAIN_FILE.
foreach(build_type "" _DEBUG _RELEASE _RELWITHDEBINFO _MINSIZEREL)
	set(flag "CMAKE_CXX_FLAGS${build_type}")

	set(${flag} "" CACHE STRING "")

	message("2. ${flag}: ${${flag}}")
endforeach()

# Load project languages. Because all language flags are now set in the cache, this won't append any default flags!
enable_language(C CXX)

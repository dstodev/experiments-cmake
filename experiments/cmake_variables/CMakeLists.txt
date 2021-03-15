cmake_minimum_required(VERSION 3.12)

# Exp.1
# Load CMAKE_TOOLCHAIN_FILE, but don't load any languages (or their default flags) yet.
project(CMakeVariableExperiments LANGUAGES NONE)

# Clear all language flags that weren't set in CMAKE_TOOLCHAIN_FILE.
foreach(build_type "" _DEBUG _RELEASE _RELWITHDEBINFO _MINSIZEREL)
	set(flag "CMAKE_CXX_FLAGS${build_type}")

	# Populate the cache variable with any value already known. This way, if the toolchain sets local variables,
	# they will be converted to cache variables. But if the toolchain sets cache variables, then this will not
	# overwrite them, because it does not use FORCE.
	set(${flag} "${${flag}}" CACHE STRING "")

	message("${flag}: ${${flag}}")
endforeach()

# Load project languages. Because all language flags are now set in the cache, this won't append any default flags!
enable_language(C CXX)

# Exp.2
set(CACHE_VARIABLE "For Exp.2" CACHE STRING "Test variable for Experiment 2")
set(CACHE_VARIABLE "${CACHE_VARIABLE}+")
message("Shadow variable: ${CACHE_VARIABLE}")

# Exp.3
set(VARIABLE "For Exp.3: A")
set(VARIABLE "For Exp.3: B" CACHE STRING "Test variable for Experiment 3")
set(VARIABLE "${VARIABLE}+")
message("Shadow variable: ${VARIABLE}")

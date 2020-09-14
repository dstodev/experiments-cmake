# Exp.2
if (DEFINED CLI_VARIABLE)
	message("Found CLI variable: ${CLI_VARIABLE}")
endif ()

# Exp.3
set(NORMAL_TOOLCHAIN_VARIABLE "For Exp.3")
set(CACHE_TOOLCHAIN_VARIABLE "For Exp.3" CACHE STRING "Test variable for Experiment 3")

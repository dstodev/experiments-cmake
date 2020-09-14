#[[

	(Exp.1)
	Q. Are command-line variables cache variables?
	A. Yes! Variables set via the command-line will become cache variables.

	Approach
		1. Set a variable via command-line while configuring, e.g. -DCLI_VARIABLE=For Exp.1
		2. Check CMakeCache.txt for the variable

	---

	(Exp.2)
	Q. Can command-line variables be referenced in toolchains?
	A. Yes! Variables set via the command-line are present and accessible from toolchain files.

	Approach
		1. Set a variable via command-line while configuring, e.g. -DCLI_VARIABLE=For Exp.2
		2. Check for the presence & value of the variable within a toolchain file

	---

	(Exp.3)
	Q. Do toolchain variables persist throughout the build tree at configure time?
	A. Yes! After the project() directive, variables (cache or otherwise) defined in the toolchain file are available
		in the rest of the cmake build tree.

	Approach
		2. Set a variable via toolchain
		3. Check for the presence & value of the variable after the project() statement

	---

	(Exp.4) -- Deprecated
	Q. Are command-line variables set before toolchain variables?
	A. Yes. This means toolchains can use "${VARIABLE} <extra stuff>" to append to variables set via command line!
		This has some caveats, though, which are described in `toolchain.cmake`.

	Approach
		1. Set a variable via command-line
		2. Append to the same variable via toolchain
		3. Check for the presence & value of the variable after the project() statement

	If the full variable expands to ${CLI_VARIABLE} ${TOOLCHAIN_VARIABLE}, then the answer is yes.

	This experiment is deprecated by Exp.2. If
]]

cmake_minimum_required(VERSION 3.12)
project(ExternalVariableExperiments LANGUAGES CXX)

# Exp.3
if (DEFINED NORMAL_TOOLCHAIN_VARIABLE)
	message("Found normal toolchain variable: ${NORMAL_TOOLCHAIN_VARIABLE}")
endif ()
if (DEFINED CACHE_TOOLCHAIN_VARIABLE)
	message("Found cached toolchain variable: ${CACHE_TOOLCHAIN_VARIABLE}")
endif ()

# Exp.4
if (DEFINED EXTENDED_CLI_VARIABLE)
	message("EXTENDED_CLI_VARAIBLE")
endif()

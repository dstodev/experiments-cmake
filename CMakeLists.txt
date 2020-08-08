# CMake Questions
###################
# 1. Is PUBLIC_HEADER transitive?
# 2. Do toolchain variables persist throughout the build tree at configure time?
#	It appears so. After the project() directive, variables defined in the toolchain file are available
#	in the rest of the cmake build tree.
# 3. What does it look like to replace global variables with interface libraries?
# 4. Do object libraries need to be linked via $<TARGET_OBJECTS:target>?
#	No, since CMake 3.12 object libraries can be linked via target_link_libraries. There are some nuances,
#	though, about interface properties.
# 5. Are toolchain variables set before command line variables?
# 	Command-line variables are set first, then toolchain variables. This means toolchains can use the
#	"${VARIABLE} <extra stuff>" method of appending to variables set via command line! This has some caveats,
#	though, which are described in `toolchain.cmake`.
# 6. Can command-line variables be referenced in toolchains?
#	Yes!
# 7. Do subsequent project() directives enter the toolchain again?
#	No, only the first project() directive appears to load the toolchain file.

cmake_minimum_required(VERSION 3.15.x)

message("TOOLCHAIN_VARIABLE (before first project()): ${TOOLCHAIN_VARIABLE}")
project(CMakeExperiment LANGUAGES CXX)
message("TOOLCHAIN_VARIABLE (after first project()): ${TOOLCHAIN_VARIABLE}")

message("TOOLCHAIN_VARIABLE (before second project()): ${TOOLCHAIN_VARIABLE}")
project(CMakeExperimentSecondProjectToolchain LANGUAGES CXX)
message("TOOLCHAIN_VARIABLE (after second project()): ${TOOLCHAIN_VARIABLE}")

set(CPACK_GENERATOR ZIP)
include(CPack)

add_subdirectory(lib)

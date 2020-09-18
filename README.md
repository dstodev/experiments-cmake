# CMake Experiments

## Table of Experiments
1. [CMake Variables](experiments/cmake_variables/)
	- Can default flags be permanently cleared?

2. [External Variables](experiments/external_variables/)
	- Are command-line variables cache variables?
	- Can toolchains reference command-line variables?
	- Do toolchain variables persist throughout the build tree at configure time?

3. [Project Directive](experiments/project_directive/)
	- Do subsequent project() directives re-load the toolchain?

4. [Target Properties](experiments/target_properties/)
	- Is PUBLIC_HEADER transitive?

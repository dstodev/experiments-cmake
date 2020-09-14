# CMake Experiments

## Table of Experiments
1. [External Variables](experiments/external_variables/)
	- Are command-line variables cache variables?
	- Can toolchains reference command-line variables?
	- Do toolchain variables persist throughout the build tree at configure time?

2. [Project Directive](experiments/project_directive/)
	- Do subsequent project() directives re-load the toolchain?

3. [Target Properties](experiments/target_properties/)
	- Is PUBLIC_HEADER transitive?

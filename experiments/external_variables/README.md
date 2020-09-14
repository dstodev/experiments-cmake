## External Variable Experiments

### (Exp.1) Are command-line variables cache variables?
Yes! Variables set via the command-line become cache variables.

Approach
1. Set a variable via command-line while configuring, e.g. -DCLI_VARIABLE=For Exp.1
2. Check CMakeCache.txt for the variable

---
### (Exp.2) Can toolchains reference command-line variables?
Yes! Variables set via the command-line are present and accessible from toolchain files.

Approach
1. Set a variable via command-line while configuring, e.g. -DCLI_VARIABLE=For Exp.2
2. Check for the presence & value of the variable within a toolchain file

---
### (Exp.3) Do toolchain variables persist throughout the build tree at configure time?
Yes! After the project() directive, variables (cache or otherwise) defined in the toolchain file are available
in the rest of the cmake build tree.

Approach
1. Set a variable via toolchain
2. Check for the presence & value of the variable after the project() statement

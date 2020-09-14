[Back](../../README.md)

## External Variable Experiments

### (Exp.1) Do subsequent project() directives re-load the toolchain?
No. Only the first project() directive loads the toolchain file.<sup>1</sup>

Approach
1. Append to a variable via toolchain file
2. Call multiple project() statements

If there are multiple copies of the value in the variable, it was appended to more than once--the toolchain
file must have been loaded more than once.

<sup>1</sup> On first configure, the toolchain is loaded twice, so the variable is appended twice. On all
subsequent configures, the toolchain is loaded once.

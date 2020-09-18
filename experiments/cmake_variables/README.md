## CMake Variable Experiments

### (Exp.1) Can default flags be permanently cleared?
Yes! By setting the project languages to `NONE`, the `project()` directive will still load a custom toolchain specified
by `CMAKE_TOOLCHAIN_FILE`, but will not load any langauge/platform toolchains, so will not populate default language
flags with their `_INIT` variables. This allows the user to set any cache variables (without using `FORCE`) that they
wish in the toolchain file or before the `project()` directive.

After the `project()` directive, all of the flags-to-clear are cleared by setting them to an empty string. Because they
are cache variables, if they were already set by a user, they will not be cleared here.

After clearing the variables, `enable_language()` can be used to load the language/platform toolchains and enable
support for those languages in the project. Because all relevant flags have at this point been either set or cleared,
the toolchain will not be able to set these variables to any default value!

Approach
1. Experiment with methods to clear default language flags:
	- Try clearing `CMAKE_<lang>_FLAGS_<type>_INIT` variables
	- Try pre-setting `CMAKE_<lang>_FLAGS_<type> cache` variables
	- Try other spontaneous ideas

2. Develop a method of clearing language default flags with the following properties:
	- Flag default variables (e.g. `CMAKE_CXX_FLAGS_DEBUG_INIT`) do not populate their respective variables
	  (e.g. `CMAKE_CXX_FLAGS_DEBUG`)
	- Custom toolchain files are still able to populate these variables, preferably without using `FORCE` so that
	  the CMake GUI is still able to modify these flags after initial configuration
	- Does not limit user ability to add/modify flags (e.g. user can specify to use the same set of flags as
	  the default flags. No matching for and removing default flags after the `project()` directive.)
	- Is simple & easy to understand/add. It probably isn't worth it if the solution is 100 lines long.

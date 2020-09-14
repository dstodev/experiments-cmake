cmake_minimum_required(VERSION 3.12)
project(ExternalVariableExperiments LANGUAGES CXX)

# Exp.3
if (DEFINED NORMAL_TOOLCHAIN_VARIABLE)
	message("Found normal toolchain variable: ${NORMAL_TOOLCHAIN_VARIABLE}")
endif ()
if (DEFINED CACHE_TOOLCHAIN_VARIABLE)
	message("Found cached toolchain variable: ${CACHE_TOOLCHAIN_VARIABLE}")
endif ()

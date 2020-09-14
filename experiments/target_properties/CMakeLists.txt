cmake_minimum_required(VERSION 3.12)
project(PropertyExperiments LANGUAGES CXX)

# Exp.1
add_library(producer INTERFACE)
target_include_directories(producer
	INTERFACE
		$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
		$<INSTALL_INTERFACE:include>
)
set_target_properties(producer
	PROPERTIES
		PUBLIC_HEADER include/producer.h
)

add_library(consumer
	src/producer.cpp
)
target_link_libraries(consumer
	PRIVATE
		producer
)

add_library(control INTERFACE)
set_target_properties(control
	PROPERTIES
		PUBLIC_HEADER include/control.h
)

include(CPack)
set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR} CACHE INTERNAL "")

install(TARGETS control consumer
	ARCHIVE DESTINATION lib
	LIBRARY DESTINATION lib
	RUNTIME DESTINATION bin
)

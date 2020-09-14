cmake_minimum_required(VERSION 3.12)
project(PropertyExperiments LANGUAGES CXX)

# Exp.1
add_library(producer INTERFACE)
target_include_directories(producer
	INTERFACE
		include
)
set_target_properties(producer
	PROPERTIES
		PUBLIC_HEADER include/producer.h
)

add_library(consumer
	src/consumer.cpp
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
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/Exp.1")

install(TARGETS control consumer
	ARCHIVE DESTINATION lib
	LIBRARY DESTINATION lib
	RUNTIME DESTINATION bin
)

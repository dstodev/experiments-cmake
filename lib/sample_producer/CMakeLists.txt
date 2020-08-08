add_library(producer
	src/product.cpp
)

target_include_directories(producer
	PUBLIC
		$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
		$<INSTALL_INTERFACE:subdir/include>
)

set_target_properties(producer PROPERTIES
	PUBLIC_HEADER ${CMAKE_CURRENT_LIST_DIR}/include/product.hpp
)

add_subdirectory(sample_producer)
add_subdirectory(sample_consumer)

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR} CACHE INTERNAL "")
install(TARGETS producer consumer
	EXPORT producer_consumer
	ARCHIVE DESTINATION lib
	LIBRARY DESTINATION lib
	RUNTIME DESTINATION bin

	# Without specifying PUBLIC_HEADER, headers will be installed to an "include" directory. A different
	# directory can be specified by supplying this argument.
	# PUBLIC_HEADER DESTINATION different
)

install(EXPORT producer_consumer NAMESPACE example_
	DESTINATION cmake
)

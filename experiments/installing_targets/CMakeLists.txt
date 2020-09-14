include(CPack)
set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR} CACHE INTERNAL "")

install(TARGETS example
	EXPORT example_exports  # Can this be named `example`?
	ARCHIVE DESTINATION lib
	LIBRARY DESTINATION lib
	RUNTIME DESTINATION bin

	# Without specifying PUBLIC_HEADER, headers will be installed to an "include" directory. A different
	# directory can be specified by supplying this argument, e.g. PUBLIC_HEADER DESTINATION different
)

install(EXPORT consumers
	NAMESPACE example_
	DESTINATION cmake
)

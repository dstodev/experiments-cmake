add_library(_verbose EXCLUDE_FROM_ALL
	dummy
)

add_custom_target(verbose ALL
	#COMMAND ${CMAKE_COMMAND} --build . --target clean
	COMMAND ${CMAKE_COMMAND} --build . --target _verbose --verbose
	WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
)

add_executable(consumer
	src/main.cpp
)

target_link_libraries(consumer
	PRIVATE
		producer
)

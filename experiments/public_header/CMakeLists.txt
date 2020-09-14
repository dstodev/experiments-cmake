#[[

	Q. Is PUBLIC_HEADER transitive?
	A.

	Approach
		1. Create three targets
			a. An interface library which populates its PUBLIC_HEADER property
			b. A static library which links to the interface library
			c. A static library which populates its PUBLIC_HEADER property
		2. Install targets b and c

		If target b installs the headers specified by a, then PUBLIC_HEADER is transitive.
		Target c is a control, to compare install behavior.

]]

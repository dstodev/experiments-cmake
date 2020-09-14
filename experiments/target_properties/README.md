[Back](../../)

## External Variable Experiments

### (Exp.1) Is PUBLIC_HEADER transitive?
No. The PUBLIC_HEADER property does not propogate to linked targets.

Approach
1. Create three targets: <ol type="a">
	<li> <!-- a. --> An interface library which populates its PUBLIC_HEADER property</li>
	<li> <!-- b. --> A static library which links to the interface library</li>
	<li> <!-- c. --> Another interface library which populates its PUBLIC_HEADER property</li></ol>
2. Install targets b and c

If installing target b installs the headers specified by a, then PUBLIC_HEADER is transitive.
Target c is a control to compare install behavior.

## External Variable Experiments

### (Exp.1) Is PUBLIC_HEADER transitive?
No. The `PUBLIC_HEADER` property does not propogate to linked targets.

Approach
1. Create three targets: <ol type="A">
	<li> <!-- A. --> An interface library which populates its PUBLIC_HEADER property</li>
	<li> <!-- B. --> A static library which links to the interface library</li>
	<li> <!-- C. --> Another interface library which populates its PUBLIC_HEADER property</li></ol>
2. Install targets B and C

If installing target B installs the headers specified by A, then `PUBLIC_HEADER` is transitive.
Target C is a control to compare install behavior.

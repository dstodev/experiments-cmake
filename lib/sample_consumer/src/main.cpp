#include <iostream>
using std::cout;
using std::endl;

#include <product.hpp>


int main()
{
	Product c(1);

	cout << c.get_value() << endl;

	return 0;
}

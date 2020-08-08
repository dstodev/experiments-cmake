#include <product.hpp>


Product::Product(int value) : _value(value)
{}

int Product::get_value() const
{
	return _value;
}

#include <string>
#include <iostream>
#include "encode.h"
#include "decode.h"

int main()
{
	std::string str1, encoded, decoded;
	int key = 0;
	std::cout << "Enter the key: ";
	std::cin >> key;
	std::cout << "Enter the string: ";
	std::cin >> str1;

	for (int i = 0; i < (int)str1.size(); i++)
	{
		encoded += encode(str1[i], key);
	}
	std::cout << "Encoded string is: " << encoded << '\n';

	for (int i = 0; i < (int)encoded.size(); i++)
	{
	    decoded += decode(encoded[i], key);
	}

    std::cout << "Decoded string is: " << decoded << '\n';

    return 0;
}

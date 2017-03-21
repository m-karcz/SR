#include <fstream>
#include <sstream>
#include <iostream>

int main()
{
	std::ifstream input("asd.txt");
	std::string data;
	std::getline(input, data);
	input.close();
	std::ofstream output("serialized.txt");
	output << 0 << 0;
	for (unsigned char c : data)
	{
		output << 1;
		for (int i = 0; i < 8; i++)
			output << ((c >> i) & 1);
		output << 0;
		output << 0 << 0;
	}
	output.close();
}

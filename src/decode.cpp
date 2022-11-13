#include "decode.h"

int decode(int ch, int key)
{
	if (ch >= 'a' && ch <= 'z')
	{
		ch -= key;
		if (ch > 'z')
		{
			ch = ch + 'z' - 'a' + 1;
		}
		else if (ch < 'a')
		{
			ch = ch - 26;
		}
	}
	else if (ch >= 'A' && ch <= 'Z')
	{
		ch -= key;
		if (ch > 'Z')
		{
			ch = ch + 'Z' - 'A' + 1;
		}
		else if (ch < 'A')
		{
			ch = ch - 26;
		}
	}
	return ch;
}
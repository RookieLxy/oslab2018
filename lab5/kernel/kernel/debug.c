#include "debug.h"

void printString(char *str) {
	int len = 0;
	while(str[len] != '\0') {
		putChar(str[len]);
        ++len;
	}
}

void printDemical(int d) {
	if(d == 0x80000000) {
		printString("-2147483748");
		return;
	} else if(d == 0) {
		putChar('0');
		return;
	}

	if(d < 0) {
		d = -d;
		putChar('-');
	}

	char buf[10];
	int len = 0;
	while(d > 0) {
		buf[10 - (++len)] = (char)((d%10) + '0');
		d /= 10;
	}
	
	for(int i = 10 - len; i < 10; ++i) {
        putChar(buf[i]);
    }
}

void printHex(unsigned int d) {
	if(d == 0) {
		putChar('0');
		return;
	}

	char buf[8];
	int len = 0;
	while(d != 0) {
		char ch;
		if((d%16) < 10) {
			ch = (char)(d%16 + '0');
		} else {
			ch = (char)(d%16 - 10 + 'a');
		}
		buf[8 - (++len)] = ch;
		d /= 16;
	}

    for(int i = 8 - len; i < 8; ++i) {
        putChar(buf[i]);
    }
}

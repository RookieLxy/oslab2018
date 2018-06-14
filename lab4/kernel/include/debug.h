#ifndef __DEBUG__
#define __DEBUG__

#include "device.h"
#include "common.h"
#include <stdarg.h>

void printf(const char *format,...);
void printString(char *str);
void printDemical(int d);
void printHex(unsigned int d);

#endif
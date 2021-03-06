#ifndef __lib_h__
#define __lib_h__

#include "types.h"

void printf(const char *format,...);
uint32_t fork();
void sleep(uint32_t time);
void exit();

#endif

#include "lib.h"
#include "types.h"
#include <stdarg.h>

#define SYS_fork 1
#define SYS_sleep 2
#define SYS_exit 3
#define SYS_write 4
#define NULL 0
/*
 * io lib here
 * 库函数写在这
 */
int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5) {
	int32_t ret = 0;

	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
	
	asm volatile("int $0x80": "=a"(ret): "a"(num), "b"(a1), "c"(a2), "d"(a3), "S"(a4), "D"(a5));
		
	return ret;
}

void printChar(char ch) {
	syscall(SYS_write, 1, (uint32_t)&ch, 1, 0, 0);
}

void printString(char *str) {
	int len = 0;
	while(str[len] != '\0') {
		++len;
	}
	syscall(SYS_write, 1, (uint32_t)str, len, 0, 0);
}

void printDemical(int d) {
	if(d == 0x80000000) {
		printString("-2147483748");
		return;
	} else if(d == 0) {
		printChar('0');
		return;
	}

	if(d < 0) {
		d = -d;
		printChar('-');
	}

	char buf[10];
	int len = 0;
	while(d > 0) {
		buf[10 - (++len)] = (char)((d%10) + '0');
		d /= 10;
	}
	
	syscall(SYS_write, 1, (uint32_t)&buf[10 - len], len, 0, 0);
}

void printHex(unsigned int d) {
	if(d == 0) {
		printChar('0');
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

	syscall(SYS_write, 1, (uint32_t)&buf[8 - len], len, 0, 0);
}

void printf(const char *format,...){
	if(format == NULL) {
		return;
	}

	va_list vl;
	va_start(vl, format);

	char buf[200];
	char *bufp = buf;
	int tail = 0;

	while(format[tail] != '\0') {
		bufp = buf;
		while(format[tail] != '%' && format[tail] != '\0') {
			*bufp = format[tail];
			++bufp;
			++tail;
		}
		syscall(SYS_write, 1, (uint32_t)buf, (uint32_t)(bufp - buf), 0, 0);
		if(format[tail] == '\0') {
			break;
		}
		++tail;
		switch(format[tail]) {
			case 'c': printChar(va_arg(vl, int)); break;
			case 'd': printDemical(va_arg(vl, int)); break;
			case 'x': printHex(va_arg(vl, int)); break;
			case 's': printString(va_arg(vl, char*)); break; 
		}
		++tail;
	}
	va_end(vl);
}

uint32_t fork() {
	return syscall(SYS_fork, 0, 0, 0, 0, 0);
}

void sleep(uint32_t time) {
	syscall(SYS_sleep, time, 0, 0, 0, 0);
}

void exit() {
	syscall(SYS_exit, 0, 0, 0, 0, 0);
}
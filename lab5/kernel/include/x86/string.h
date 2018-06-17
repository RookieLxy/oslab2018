#ifndef __X86_STRING__
#define __X86_STRING__

#include "common.h"

char *strcpy(char *dst, const char *src);
int strcmp(const char *s1, const char *s2);
char *strchr(const char *str, int ch);
size_t strcspn(const char *s1, const char *s2);
size_t strspn(const char *s1, const char *s2);
char *strtok(char *str, const char *delim);
void *memcpy(void *dest, const void *src, size_t n);
void *memset(void *s, int c, size_t len);

#endif
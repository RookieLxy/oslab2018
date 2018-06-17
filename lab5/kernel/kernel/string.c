#include "x86.h"
#include "device.h"
#include "debug.h"

char *strcpy(char *dst, const char *src) {
    while(*src != '\0') {
        *dst = *src;
        ++src;
        ++dst;
    }
    *dst = '\0';
    return dst;
}

int strcmp(const char *s1, const char *s2) {
    while((*s1 != '\0') && (*s1 == *s2)) {
        ++s1;
        ++s2;
    }
    return *(unsigned char *)s1 - *(unsigned char *)s2;
}


char *strchr(const char *str, int ch) {
    while((*str != '\0') && *str != (char)ch) {
        ++str;
    }
    return (*str == ch)? (char *)str: NULL;
}

size_t strcspn(const char *s1, const char *s2) {
    size_t ret = 0;
    while(*s1 != '\0') {
        if(strchr(s2, *s1) != NULL) {
            return ret;
        } else {
            ++ret;
            ++s1;
        }
    }
    return ret;
}

size_t strspn(const char *s1, const char *s2) {
    size_t ret = 0;
    while((*s1 != '\0') && (strchr(s2, *s1) != NULL)) {
        ++ret;
        ++s1;
    }
    return ret;
}

char *strtok(char *str, const char *delim) {
    static char *p = NULL;
    if(str != NULL) {
        p = str;
    } else if(p == NULL){
        return NULL;
    }

    str = p + strspn(p, delim);
    p = str + strcspn(str, delim);
    if(p == str) {
        return p = NULL;
    }
    p = (*p != '\0')? *p = '\0', p + 1: NULL;
    return str;
}

void *memcpy(void *dest, const void *src, size_t n) {
    for(int i = 0; i < n; ++i, ++dest, ++src) {
        *(char *)dest = *(char *)src;
    }
    return dest;
}

void *memset(void *s, int c, size_t len) {
    for(int i = 0; i < len; ++i, ++s) {
        *(unsigned char *)s = (unsigned char)c;
    }
    return s;
}

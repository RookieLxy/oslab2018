#ifndef __lib_h__
#define __lib_h__

#include "types.h"

#define O_RDWR 0
#define O_CREAT 1

void printf(const char *format,...);
uint32_t fork();
void sleep(uint32_t time);
void exit();
uint32_t sem_init(sem_t *sem, uint32_t value);
uint32_t sem_post(sem_t *sem);
uint32_t sem_wait(sem_t *sem);
uint32_t sem_destroy(sem_t *sem);
void ls(const char *dirName);
uint32_t open(const char *fileName, int priority);
uint32_t write(int fd, void *src, int size);
void close(int fd);
void cat(const char *fileName);

#endif

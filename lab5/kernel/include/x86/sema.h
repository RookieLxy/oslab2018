#ifndef __SEMA__
#define __SEMA__

#define SEMA_MAX 8
#define ALIVE  0
#define DESTROYED 1

struct Semaphore {
    int sem;
    int value;
    int state;
    struct ProcessControlBlock *blocked;
};

extern struct Semaphore semaphoreTable[SEMA_MAX];
extern uint32_t endOfSem;

uint32_t initNewSem(uint32_t value);
void P(struct Semaphore *s);
void V(struct Semaphore *s);

#endif
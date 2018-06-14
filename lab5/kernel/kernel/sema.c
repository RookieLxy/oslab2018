#include "x86.h"
#include "device.h"
#include "debug.h"
#include "memory.h"

struct Semaphore semaphoreTable[SEMA_MAX];
uint32_t endOfSem = 0;

uint32_t initNewSem(uint32_t value) {
    int idx = 0;
    while(idx < endOfSem) {
        if(semaphoreTable[idx].state == DESTROYED) {
            break;
        }
        ++idx;
    }
    if(idx == endOfSem) {
        ++endOfSem;
    }

    //putChar('I');
    //putChar((char)(idx + '0'));
    //putChar('H');
    //putChar((char)(value + '0'));

    semaphoreTable[idx].blocked = NULL;
    semaphoreTable[idx].sem = idx;
    semaphoreTable[idx].value = value;
    semaphoreTable[idx].state = ALIVE;
    //putChar('S');
    //putChar((char)(semaphoreTable[idx].value + '0'));
    return idx;
}

void P(struct Semaphore *s) {
    --s->value;
    if(s->value < 0) {
        current->state = BLOCKED;
        if(s->blocked == NULL) {
            s->blocked = current;    
            current->next = NULL;
        } else {
            struct ProcessControlBlock *p = s->blocked;
            while(p->next != NULL) {
                p = p->next;
            }
            p->next = current;
            current->next = NULL;
        }
        printf("Sema blocked ");
        schedule();
        switchToRunning();
    }
}

void V(struct Semaphore *s) {
    ++s->value;
    if(s->value <= 0) {
        if(s->blocked == NULL) {
            assert(0);
        }
        struct ProcessControlBlock *p = s->blocked;
        s->blocked = p->next;
        p->state = RUNNABLE;
        p->next = NULL;
        addToRunnable(p);
        printf("Sema realased ");
    }
}



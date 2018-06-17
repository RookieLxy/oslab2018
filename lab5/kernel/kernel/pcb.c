#include "x86.h"
#include "device.h"
#include "debug.h"

struct ProcessControlBlock processTable[NR_PCB];

struct ProcessControlBlock *current;

struct ProcessControlBlock *runnable;

struct ProcessControlBlock *erunnable;

struct ProcessControlBlock *blocked;

struct ProcessControlBlock *eblocked;

uint32_t endOfPCB = 0;

uint32_t initNewPCB() {
    int idx = 0;
    while(idx < endOfPCB) {
        if(processTable[idx].state == DEAD) {
            break;
        }
        ++idx;
    }
    if(idx == endOfPCB) {
        ++endOfPCB;
    }

    processTable[idx].state = RUNNABLE;
    processTable[idx].sleepTime = 0;
    processTable[idx].timeCount = 0;
    processTable[idx].pid = idx + PID_START;
    processTable[idx].stackTop = KERNEL_STACK_SIZE;
    processTable[idx].prevStackTop = KERNEL_STACK_SIZE;
    processTable[idx].next = NULL;

    processTable[idx].sf.gs = USEL(SEG_UDATA);
    processTable[idx].sf.fs = USEL(SEG_UDATA);
    processTable[idx].sf.es = USEL(SEG_UDATA);
    processTable[idx].sf.ds = USEL(SEG_UDATA);

    processTable[idx].sf.eip = 0;
    processTable[idx].sf.cs = USEL(SEG_UCODE);
    processTable[idx].sf.eflags = 0;
    processTable[idx].sf.esp = PROC_SPACE_SIZE;
    processTable[idx].sf.ss = USEL(SEG_UDATA);

    return idx;
}

void idle() {
    enableInterrupt();
    while(1) {
        waitForInterrupt();
    }
}

void enterProcessSpace(uint32_t entry) {
    memcpy((void*)PROC_K_START(current), (void*)entry, PROC_CODE_SEG_SIZE);

    gdt[SEG_UCODE] = SEG(STA_X | STA_R, PROC_K_START(current), PROC_SPACE_SIZE   , DPL_USER);
    gdt[SEG_UDATA] = SEG(STA_W        , PROC_K_START(current), PROC_SPACE_SIZE   , DPL_USER);
    gdt[SEG_KSTACK] = SEG(STA_W       , &current->stack      , KERNEL_STACK_LIMIT, DPL_KERN);
    setGdt(gdt, sizeof(gdt));

    asm volatile("movl %0, %%esp": :"r"(&current->sf.eflags + 1));
    asm volatile("pushfl");

    asm volatile("movl %0, %%esp": :"r"(&current->sf.eip));
    
    asm volatile("movl %0, %%eax":: "r"(USEL(SEG_UDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %es");
    asm volatile("movw %ax, %fs");
    asm volatile("movw %ax, %gs");

    asm volatile("iret");
}

void addToBlocked(struct ProcessControlBlock* toAdd) {
    if(blocked == NULL) {
        blocked = toAdd;
        eblocked = toAdd;
    } else {
        eblocked->next = toAdd;
        eblocked = toAdd;
    }
}

void addToRunnable(struct ProcessControlBlock* toAdd) {
    if(runnable == NULL) {
        runnable = toAdd;
        erunnable = toAdd;
    } else {
        erunnable->next = toAdd;
        erunnable = toAdd;
    }
}

void updateTime() {
    if(current->state != BLOCKED) {
        ++current->timeCount;
    }
    struct ProcessControlBlock *p = blocked;
    while(p != NULL) {
        --p->sleepTime;
        if(p->sleepTime == 0) {
            p->state = RUNNABLE;
            p->sleepTime = 0;
            p->timeCount = 0;
        }
        p = p->next;
    }
}

void checkRunnableList() {
    while(runnable->state == BLOCKED || runnable->state == DEAD) {
        if(runnable->state == BLOCKED) {
            addToBlocked(runnable);
        }
        runnable = runnable->next;
        if(runnable == NULL) {
            erunnable = NULL;
            break;
        }
    }
    struct ProcessControlBlock *p = runnable;
    struct ProcessControlBlock *q = runnable->next;
    while(q != NULL) {
        if(q->state == BLOCKED || q->state == DEAD) {
            if(q->state == BLOCKED) {
                addToBlocked(q);
            }
            p->next = q->next;
            q = q->next;
        } else {
            p = q;
            q = q->next;
        }
    }
}

void checkBlockedList() {
	while(blocked->state == RUNNABLE || blocked->state == DEAD) {
        if(blocked->state == RUNNABLE) {
            printString("wake ");
		    addToRunnable(blocked);
        }
		blocked = blocked->next;
		if(blocked == NULL) {
			eblocked = NULL;
            break;
		}
	}
	struct ProcessControlBlock *q = blocked->next;
	struct ProcessControlBlock *p = blocked;
	while(q != NULL) {
		if(q->state == RUNNABLE || q->state == DEAD) {
			if(q->state == RUNNABLE) {
                printString("wake ");
                addToRunnable(q);
            }
			q = q->next;
			p->next = q;
		} else {
			p = q;
			q = q->next;
		}
	}
}

void schedule() {
    if(runnable == NULL) {
        idle();
    } else {
        runnable->state = RUNNING;
        runnable->sleepTime = 0;
        runnable->timeCount = 0;
        current = runnable;
        runnable = runnable->next;
        current->next = NULL;
        if(runnable == NULL) {
            erunnable = NULL;
        }
    }


}

void switchToRunning() {
    printString("switch ");
    tss.ss0 = KSEL(SEG_KSTACK);
    tss.esp0 = current->stackTop;

    gdt[SEG_UCODE] = SEG(STA_X | STA_R, PROC_K_START(current), PROC_SPACE_SIZE   , DPL_USER);
    gdt[SEG_UDATA] = SEG(STA_W        , PROC_K_START(current), PROC_SPACE_SIZE   , DPL_USER);
    gdt[SEG_KSTACK] = SEG(STA_W       , &current->stack      , KERNEL_STACK_LIMIT, DPL_KERN);
    setGdt(gdt, sizeof(gdt));

    asm volatile("movl %0, %%ss":: "r"(KSEL(SEG_KSTACK)));

    asm volatile("movl %0, %%esp": :"r"(KERNEL_STACK_SIZE + 17*sizeof(uint32_t)));
    asm volatile("pushfl");

    asm volatile("movl %0, %%esp": :"r"(KERNEL_STACK_SIZE));
    asm volatile("popl %gs");
    asm volatile("popl %fs");
    asm volatile("popl %es");
    asm volatile("popl %ds");
    asm volatile("popal");
    asm volatile("addl $8, %esp");
    asm volatile("iret");
}
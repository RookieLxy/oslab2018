#include "x86.h"
#include "device.h"
#include "debug.h"
#include "memory.h"

#define SYS_fork 1
#define SYS_sleep 2
#define SYS_exit 3
#define SYS_write 4
#define SYS_sem_init 5
#define SYS_sem_post 6
#define SYS_sem_wait 7
#define SYS_sem_destroy 8
#define SYS_LS 9
#define SYS_OPEN 10
#define SYS_FWRITE 11
#define SYS_CAT 12
#define SYS_CLOSE 13
#define LINE 80

int row = 0, col = 0;

void syscallHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);

void sysWrite(struct TrapFrame *tf);
int fsWrite(int fd, void *buf, uint32_t len);
void writeVMem(char ch, int row, int col);

void timerHandle(struct TrapFrame *tf);
void sysFork(struct TrapFrame *tf);
void sysSleep(struct TrapFrame *tf);
void sysExit(struct TrapFrame *tf);

void sysSemInit(struct TrapFrame *tf);
void sysSemPost(struct TrapFrame *tf);
void sysSemWait(struct TrapFrame *tf);
void sysSemDestroy(struct TrapFrame *tf);

void sysList(struct TrapFrame *tf);
void sysOpen(struct TrapFrame *tf);
void sysFwrite(struct TrapFrame *tf);
void sysCat(struct TrapFrame *tf);
void sysClose(struct TrapFrame *tf);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	disableInterrupt();
	asm volatile("mov %0, %%eax":: "r"(KSEL(SEG_KDATA)));
	asm volatile("mov %ax, %es");
	asm volatile("mov %ax, %ds");
	asm volatile("mov %ax, %fs");
	asm volatile("mov %ax, %gs");
	tf = (struct TrapFrame *)((uint8_t *)tf + (uint32_t)&current->stack);
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x20:
			timerHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default: 
			printString("error irq\n");
			assert(0);
	}
	enableInterrupt();
}

void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/

	switch(tf->eax) {
		case SYS_write: sysWrite(tf); break;
		case SYS_fork: sysFork(tf); break;
		case SYS_sleep: sysSleep(tf); break;
		case SYS_exit: sysExit(tf); break;
		case SYS_sem_init: sysSemInit(tf); break;
		case SYS_sem_post: sysSemPost(tf); break;
		case SYS_sem_wait: sysSemWait(tf); break;
		case SYS_sem_destroy: sysSemDestroy(tf); break;
		case SYS_LS: sysList(tf); break;
		case SYS_OPEN: sysOpen(tf); break;
		case SYS_FWRITE: sysFwrite(tf); break;
		case SYS_CAT: sysCat(tf); break;
		case SYS_CLOSE: sysClose(tf); break;
		default: assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	printString("GProtextFaultHandle\n");
	assert(0);
	return;
}

void sysWrite(struct TrapFrame *tf) {
	void *buf = (char *)((uint32_t)tf->ecx + PROC_K_START(current));
	tf->eax = fsWrite(tf->ebx, buf, tf->edx);
}

int fsWrite(int fd, void *buf, uint32_t len) {
	uint32_t retLen = len;
		
	if(fd <= 2) {
		for(int i = 0; i < len; ++i) {
			char ch = ((char *)buf)[i];
			//putChar(ch);
			if(ch == '\n' || col == 80) {
				++row;
				col = 0;
			} else {
				writeVMem(ch, row, col);
				++col;
				--retLen;
			}
		}
	} else {
		assert(0);
	}
	return retLen;
}

void writeVMem(char ch, int row, int col) {
	short word = 0x0c00 | ch;
	int offset = (LINE*row + col);
	short *p = (short *)(0xb8000) + offset;
	*p = word;
}

void timerHandle(struct TrapFrame *tf) {
	//printString("-");
	updateTime();
	checkBlockedList();
	if(current->state == RUNNING) {
		return;
	} else if(runnable == NULL) {
		return;
	} else {			
		schedule();
		switchToRunning();
	}
}

void sysFork(struct TrapFrame *tf) {
	printString("fork ");
	uint32_t idx = initNewPCB();
	memcpy((void *)&processTable[idx].stack, (void *)&current->stack, KERNEL_STACK_SIZE);
	memcpy((void *)&current->sf, (void *)tf, sizeof(struct StackFrame));
	memcpy((void *)&processTable[idx].sf, (void *)tf, sizeof(struct StackFrame));
	memcpy((void *)PROC_K_START(&processTable[idx]), (void *)PROC_K_START(current), PROC_SPACE_SIZE);
	current->sf.eax = idx;
	processTable[idx].sf.eax = 0;
	processTable[idx].stackTop = current->stackTop;
	processTable[idx].prevStackTop = current->prevStackTop;
	addToRunnable(&processTable[idx]);
}

void sysSleep(struct TrapFrame *tf) {
	printString("sleep ");
	memcpy((void *)&current->sf, (void *)tf, sizeof(struct StackFrame));
	current->state = BLOCKED;
	current->timeCount = 0;
	current->sleepTime = tf->ebx;
	addToBlocked(current);
	checkRunnableList();
	schedule();
	switchToRunning();
}

void sysExit(struct TrapFrame *tf) {
	//printString("exit ");
	current->state = DEAD;
	schedule();
	switchToRunning();
}

void sysSemInit(struct TrapFrame *tf) {
	uint32_t *ptrSem = (uint32_t *)((uint32_t)tf->ebx + PROC_K_START(current));
	uint32_t value = tf->ecx;
	*ptrSem = initNewSem(value);
	tf->eax = 0;
}

void sysSemPost(struct TrapFrame *tf) {
	uint32_t *ptrSem = (uint32_t *)((uint32_t)tf->ebx + PROC_K_START(current));
	uint32_t sem = *ptrSem;

	int i = 0;
	while(i < endOfSem) {
		if(sem == semaphoreTable[i].sem) {
			//memcpy((void *)&current->sf, (void *)tf, sizeof(struct StackFrame));
			V(&semaphoreTable[i]);
			tf->eax = 0;
			return;
		}
	}
	tf->eax = -1;
	assert(0);
}

void sysSemWait(struct TrapFrame *tf) {
	uint32_t *ptrSem = (uint32_t *)((uint32_t)tf->ebx + PROC_K_START(current));
	uint32_t sem = *ptrSem;
	int i = 0;
	while(i < endOfSem) {
		if(sem == semaphoreTable[i].sem) {
			memcpy((void *)&current->sf, (void *)tf, sizeof(struct StackFrame));
			P(&semaphoreTable[i]);
			tf->eax = 0;
			return;
		}
	}
	tf->eax = -1;
	assert(0);
}

void sysSemDestroy(struct TrapFrame *tf) {
	uint32_t *ptrSem = (uint32_t *)((uint32_t)tf->ebx + PROC_K_START(current));
	uint32_t sem = *ptrSem;
	int i = 0;
	while(i < endOfSem) {
		if(sem == semaphoreTable[i].sem) {
			semaphoreTable[i].state = DESTROYED;
			tf->eax = 0;
			return;
		}
	}
	tf->eax = -1;
	assert(0);
}

void sysList(struct TrapFrame *tf) {
	char *dirName = (char *)((uint32_t)tf->ebx + PROC_K_START(current));
	ls(dirName);
}

void kernelPrint(char *str) {
	int i = 0;
	while(str[i] != '\0') {
		++i;
	}
	fsWrite(2, (void *)str, i);
}

void kernelPrintN(char *str, int n) {
	fsWrite(2, (void *)str, n);
}

void sysOpen(struct TrapFrame *tf) {
	char *fileName = (char *)((uint32_t)tf->ebx + PROC_K_START(current));
	int priority = tf->ecx;
	tf->eax = open(fileName, priority); 
}

void sysFwrite(struct TrapFrame *tf) {
	int fd = tf->ebx;
	void *src = (void *)((uint32_t)tf->ecx + PROC_K_START(current));
	//putChar(*(char *)src);
	int size = tf->edx;
	tf->eax = write(fd, src, size);
}

void sysCat(struct TrapFrame *tf) {
	char *dirName = (char *)((uint32_t)tf->ebx + PROC_K_START(current));
	cat(dirName);
}

void sysClose(struct TrapFrame *tf) {
	int fd = tf->ebx;
	close(fd);
}
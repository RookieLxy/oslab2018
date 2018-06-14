#ifndef __X86_PCB__
#define __X86_PCB__

#define PROC_SPACE_START 0x400000
#define PROC_CODE_SEG_SIZE 0x80000
#define PROC_STACK_SIZE 0x80000
#define PROC_SPACE_SIZE (PROC_STACK_SIZE + PROC_CODE_SEG_SIZE)
#define PROC_K_START(p) (PROC_SPACE_START + INDEX_P(p)*PROC_SPACE_SIZE)

#define KERNEL_STACK_SIZE 0x10000
#define KERNEL_STACK_LIMIT (KERNEL_STACK_SIZE + sizeof(struct StackFrame))

#define NR_PCB 32

#define RUNNING 0
#define RUNNABLE 1
#define BLOCKED 2
#define DEAD 3

#define IDLE_INDEX 0
#define INDEX_P(p) (p - &processTable[IDLE_INDEX])

#define PID_START 512

#define TIME_SLICE 8

struct StackFrame {
    uint32_t gs, fs, es, ds;
    uint32_t edi, esi, ebp, xxx, ebx, edx, ecx, eax;
    uint32_t irq, error;
    uint32_t eip, cs, eflags, esp, ss;
};

struct ProcessControlBlock {
    uint8_t stack[KERNEL_STACK_SIZE];
    struct StackFrame sf;
    uint32_t stackTop;
    uint32_t prevStackTop;
    int state;
    int timeCount;
    int sleepTime;
    uint32_t pid;
    struct ProcessControlBlock *next;
};

extern struct ProcessControlBlock processTable[NR_PCB];

extern struct ProcessControlBlock *current;

extern struct ProcessControlBlock *runnable;

extern struct ProcessControlBlock *erunnable;

extern struct ProcessControlBlock *blocked;

extern struct ProcessControlBlock *eblocked;

extern uint32_t endOfPCB;

void initProcessTable();

uint32_t initNewPCB();

void idle();

void enterProcessSpace(uint32_t entry);

void addToBlocked(struct ProcessControlBlock* toAdd);

void addToRunnable(struct ProcessControlBlock* toAdd);

void updateTime();

void checkBlockedList();

void schedule();

void switchToRunning();

void checkRunnableList();

#endif
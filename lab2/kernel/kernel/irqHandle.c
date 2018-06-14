#include "x86.h"
#include "device.h"
#include "memory.h"

#define SYS_write 4
#define LINE 80

int row = 5, col = 0;

void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void sysWrite(struct TrapFrame *tf);

int fsWrite(int fd, void *buf, uint32_t len);

void writeVMem(char ch, int row, int col);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	asm volatile("mov %0, %%eax":: "r"(KSEL(SEG_KDATA)));
	asm volatile("mov %ax, %es");
	asm volatile("mov %ax, %ds");
	asm volatile("mov %ax, %fs");
	//asm volatile("mov %0, %%eax":: "r"(KSEL(SEG_VIDEO)));
	asm volatile("mov %ax, %gs");

	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default: assert(0);
	}

	asm volatile("mov %0, %%eax":: "r"(USEL(SEG_UDATA)));
	asm volatile("mov %ax, %es");
	asm volatile("mov %ax, %ds");
	asm volatile("mov %ax, %fs");
	//asm volatile("mov %0, %%eax":: "r"(KSEL(SEG_VIDEO)));
	asm volatile("mov %ax, %gs");
}

void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	switch(tf->eax) {
		case SYS_write: sysWrite(tf); break;
		default: assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}

void sysWrite(struct TrapFrame *tf) {
	tf->eax = fsWrite(tf->ebx, (void *)tf->ecx, tf->edx);
}

int fsWrite(int fd, void *buf, uint32_t len) {
	uint32_t retLen = len;
		
	if(fd <= 2) {
		for(int i = 0; i < len; ++i) {
			char ch = ((char *)buf)[i];
			putChar(ch);
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
	/*
	asm volatile("mov %0, %%edi":: "r"((LINE*row + col)*2));
	asm volatile("mov $0x0c, %ah");
	asm volatile("mov %0, %%al":: "r"(ch));
	asm volatile("mov %ax, %gs:(%edi)");
	*/
	
	short word = 0x0c00 | ch;
	int offset = (LINE*row + col);
	short *p = (short *)(0xb8000) + offset;
	*p = word;

}

#ifndef __X86_H__
#define __X86_H__

#include "x86/cpu.h"
#include "x86/memory.h"
#include "x86/io.h"
#include "x86/irq.h"
#include "x86/pcb.h"
#include "x86/sema.h"
#include "x86/fs.h"
#include "x86/string.h"

void initSeg(void);
void loadUMain(void);
void readSect(void *dst, int offset);
void writeSect(void *src, int offset);
void kernelPrint(char *str);
void kernelPrintN(char *str, int n);
#endif

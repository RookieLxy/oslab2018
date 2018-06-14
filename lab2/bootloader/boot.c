#include "boot.h"

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	void (*entry)(void);
	entry = (void *)loader();
	entry();
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
	int i;
	waitDisk();
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}

uint32_t loader() {
	uint8_t *buf = (uint8_t *)0x1000000;	// a random memory that is 
											// used as heap, unrecommended
	uint8_t *p = buf;
	for(int i = 0; i < NR_KELF_SECT; ++i) {
		readSect(p, KElF_START + i);
		p += SECTSIZE;
	}
	
	struct ELFHeader *elf = (struct ELFHeader *)buf;
	struct ProgramHeader *ph = (struct ProgramHeader *)(buf + elf->phoff);
	for(int i = 0; i < elf->phnum; ++i, ++ph) {
		if(ph->type == PT_LOAD) {
			void *dst = (void *)ph->vaddr;
			memcpy(dst, (void *)buf + ph->off, ph->filesz);
			memset(dst + ph->filesz, 0, ph->memsz - ph->filesz);
		}
	}
	volatile uint32_t entry = elf->entry;
	return entry;
}

/*
void readIde(void *dst, int offset, int n) {
	int sector = offset/SECTSIZE;
	int postion = offset%SECTSIZE;
	uint8_t buf[SECTSIZE];
	readSect((void *)buf, sector);
	for(int i = 0; i < SECTSIZE - postion; ++i) {
		((uint8_t *)dst)[i] =  buf[postion + i];
	}
	dst += SECTSIZE - postion;

	int esector = (offset + n)/SECTSIZE;
	for(int i = sector + 1; i < esector; ++i) {
		readSect((void *)dst, i);
		dst += SECTSIZE;
	}

	n = (n + postion)%SECTSIZE;
	readSect((void *)buf, esector);
	for(int i = 0; i < n; ++i) {
		((uint8_t *)dst)[i] = buf[i];
	}
}

uint32_t loader() {
	uint8_t elfBuf[sizeof(struct ELFHeader)];
	readIde((void *)elfBuf, ELF_OFFSET(0), sizeof(elfBuf));
	struct ELFHeader *elf = (struct ELFHeader *)elfBuf;

	uint8_t phBuf[elf->phnum*sizeof(struct ProgramHeader)];
	readIde((void *)phBuf, ELF_OFFSET(elf->phoff), sizeof(phBuf));
	struct ProgramHeader *ph = (struct ProgramHeader *)phBuf;

	for(int i = 0; i < elf->phnum; ++i, ++ph) {
		if(ph->type == PT_LOAD) {
			void *dst = (void *)ph->vaddr;
			readIde(dst, ELF_OFFSET(ph->off), ph->filesz);
			if(ph->filesz < ph->memsz) {
				for(int j = 0; j < ph->memsz - ph->filesz; ++j) {
					*((uint8_t *)dst + ph->filesz + j) = 0;
				}
			}
		}
	}

	volatile uint32_t entry = elf->entry;
	return entry;
}
*/

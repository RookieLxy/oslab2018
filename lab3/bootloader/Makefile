bootloader.bin: start.S boot.c boot.h
	gcc -c -m32 start.S -o start.o
	gcc -c -m32 -Os -fno-stack-protector boot.c -o boot.o
	ld -m elf_i386 -e start -Ttext 0x7c00 start.o boot.o -o bootloader.elf -lc
	objcopy -S -j .text -O binary bootloader.elf bootloader.bin
	../utils/genBoot.pl bootloader.bin

clean:
	rm -rf *.o bootloader.elf bootloader.bin

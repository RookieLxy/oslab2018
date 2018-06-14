CC = gcc
LD = ld

CFLAGS = -m32 -march=i386 -static \
	 -fno-builtin -fno-stack-protector -fno-omit-frame-pointer \
	 -Wall -Werror -I../lib
LDFLAGS = -m elf_i386

UCFILES = $(shell find ./ -name "*.c")
LCFILES = $(shell find ../lib -name "*.c")
UOBJS = $(UCFILES:.c=.o) $(LCFILES:.c=.o)

umain.bin: $(UOBJS)
	$(LD) $(LDFLAGS) -e uEntry -Ttext 0x0000000 -o uMain.elf $(UOBJS)
	objdump -D uMain.elf > uMain.s

clean:
	rm -rf $(UOBJS) uMain.elf uMain.s

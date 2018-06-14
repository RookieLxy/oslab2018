.code16

.global start
start:
	movw $message, %ax
	movw %ax, %bp
	movw $13, %cx
	movw $0x1301, %ax
	movw $0x000c, %bx
	movw $0x0000, %dx
	int $0x10
	cli
	inb $0x92, %al
	orb $0x02, %al
	outb %al, $0x92
	data32 addr32 lgdt gdtDesc		# load gdtr
	movl %cr0, %eax
	orb $0x01, %al					# set PE and enter protected model
	movl %eax, %cr0
	data32 ljmp $0x08, $start32		# set EIP to start32 and load 
									# the second gdt into CS

.code32
start32:
	movw $(2 << 3), %ax			# load the third gdt into ax
	movw %ax, %ds					
	movw %ax, %es
	movw %ax, %ss
	movw %ax, %fs
	movw $(3 << 3), %ax
	movw %ax, %gs
	movl $0, %ebp
	movl $(128 << 20), %esp
	sub $16, %esp
	jmp bootMain

message:
	.string "Hello, World!"

.p2align 2
gdt:
	.word 0,0 					# empty entry
	.byte 0,0,0,0

	.word 0xffff, 0				# code
	.byte 0, 0x9a, 0xcf, 0

	.word 0xffff, 0				# data
	.byte 0, 0x92, 0xcf, 0

	.word 0xffff, 0x8000		# video
	.byte 0x0b, 0x92, 0xcf, 0

	

gdtDesc:
	.word (gdtDesc - gdt -1)
	.long gdt

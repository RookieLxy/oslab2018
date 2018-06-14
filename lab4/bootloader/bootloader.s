
bootloader.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
    7c00:	fa                   	cli    
    7c01:	e4 92                	in     $0x92,%al
    7c03:	0c 02                	or     $0x2,%al
    7c05:	e6 92                	out    %al,$0x92
    7c07:	67 66 0f 01 15       	lgdtw  (%di)
    7c0c:	64 7c 00             	fs jl  7c0f <start+0xf>
    7c0f:	00 0f                	add    %cl,(%edi)
    7c11:	20 c0                	and    %al,%al
    7c13:	0c 01                	or     $0x1,%al
    7c15:	0f 22 c0             	mov    %eax,%cr0
    7c18:	66 ea 20 7c 00 00    	ljmpw  $0x0,$0x7c20
    7c1e:	08 00                	or     %al,(%eax)

00007c20 <start32>:
    7c20:	66 b8 10 00          	mov    $0x10,%ax
    7c24:	8e d8                	mov    %eax,%ds
    7c26:	8e c0                	mov    %eax,%es
    7c28:	8e d0                	mov    %eax,%ss
    7c2a:	8e e0                	mov    %eax,%fs
    7c2c:	66 b8 18 00          	mov    $0x18,%ax
    7c30:	8e e8                	mov    %eax,%gs
    7c32:	bd 00 00 00 00       	mov    $0x0,%ebp
    7c37:	bc 00 00 00 08       	mov    $0x8000000,%esp
    7c3c:	83 ec 10             	sub    $0x10,%esp
    7c3f:	e9 21 01 00 00       	jmp    7d65 <bootMain>

00007c44 <gdt>:
	...
    7c4c:	ff                   	(bad)  
    7c4d:	ff 00                	incl   (%eax)
    7c4f:	00 00                	add    %al,(%eax)
    7c51:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c58:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    7c5e:	00 80 0b 92 cf 00    	add    %al,0xcf920b(%eax)

00007c64 <gdtDesc>:
    7c64:	1f                   	pop    %ds
    7c65:	00 44 7c 00          	add    %al,0x0(%esp,%edi,2)
	...

00007c6a <waitDisk>:
    7c6a:	55                   	push   %ebp
    7c6b:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c70:	89 e5                	mov    %esp,%ebp
    7c72:	ec                   	in     (%dx),%al
    7c73:	25 c0 00 00 00       	and    $0xc0,%eax
    7c78:	83 f8 40             	cmp    $0x40,%eax
    7c7b:	75 f5                	jne    7c72 <waitDisk+0x8>
    7c7d:	5d                   	pop    %ebp
    7c7e:	c3                   	ret    

00007c7f <readSect>:
    7c7f:	55                   	push   %ebp
    7c80:	89 e5                	mov    %esp,%ebp
    7c82:	53                   	push   %ebx
    7c83:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7c86:	e8 df ff ff ff       	call   7c6a <waitDisk>
    7c8b:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7c90:	b0 01                	mov    $0x1,%al
    7c92:	ee                   	out    %al,(%dx)
    7c93:	ba f3 01 00 00       	mov    $0x1f3,%edx
    7c98:	88 c8                	mov    %cl,%al
    7c9a:	ee                   	out    %al,(%dx)
    7c9b:	89 c8                	mov    %ecx,%eax
    7c9d:	ba f4 01 00 00       	mov    $0x1f4,%edx
    7ca2:	c1 f8 08             	sar    $0x8,%eax
    7ca5:	ee                   	out    %al,(%dx)
    7ca6:	89 c8                	mov    %ecx,%eax
    7ca8:	ba f5 01 00 00       	mov    $0x1f5,%edx
    7cad:	c1 f8 10             	sar    $0x10,%eax
    7cb0:	ee                   	out    %al,(%dx)
    7cb1:	89 c8                	mov    %ecx,%eax
    7cb3:	ba f6 01 00 00       	mov    $0x1f6,%edx
    7cb8:	c1 f8 18             	sar    $0x18,%eax
    7cbb:	83 c8 e0             	or     $0xffffffe0,%eax
    7cbe:	ee                   	out    %al,(%dx)
    7cbf:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7cc4:	b0 20                	mov    $0x20,%al
    7cc6:	ee                   	out    %al,(%dx)
    7cc7:	e8 9e ff ff ff       	call   7c6a <waitDisk>
    7ccc:	31 c9                	xor    %ecx,%ecx
    7cce:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cd3:	ed                   	in     (%dx),%eax
    7cd4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7cd7:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
    7cda:	41                   	inc    %ecx
    7cdb:	81 f9 80 00 00 00    	cmp    $0x80,%ecx
    7ce1:	75 f0                	jne    7cd3 <readSect+0x54>
    7ce3:	5b                   	pop    %ebx
    7ce4:	5d                   	pop    %ebp
    7ce5:	c3                   	ret    

00007ce6 <loader>:
    7ce6:	55                   	push   %ebp
    7ce7:	89 e5                	mov    %esp,%ebp
    7ce9:	57                   	push   %edi
    7cea:	56                   	push   %esi
    7ceb:	53                   	push   %ebx
    7cec:	31 db                	xor    %ebx,%ebx
    7cee:	83 ec 10             	sub    $0x10,%esp
    7cf1:	8d 83 00 80 00 00    	lea    0x8000(%ebx),%eax
    7cf7:	43                   	inc    %ebx
    7cf8:	53                   	push   %ebx
    7cf9:	c1 e0 09             	shl    $0x9,%eax
    7cfc:	50                   	push   %eax
    7cfd:	e8 7d ff ff ff       	call   7c7f <readSect>
    7d02:	81 fb c8 00 00 00    	cmp    $0xc8,%ebx
    7d08:	58                   	pop    %eax
    7d09:	5a                   	pop    %edx
    7d0a:	75 e5                	jne    7cf1 <loader+0xb>
    7d0c:	a1 1c 00 00 01       	mov    0x100001c,%eax
    7d11:	31 db                	xor    %ebx,%ebx
    7d13:	8d 90 00 00 00 01    	lea    0x1000000(%eax),%edx
    7d19:	0f b7 05 2c 00 00 01 	movzwl 0x100002c,%eax
    7d20:	39 c3                	cmp    %eax,%ebx
    7d22:	7d 2e                	jge    7d52 <loader+0x6c>
    7d24:	83 3a 01             	cmpl   $0x1,(%edx)
    7d27:	75 23                	jne    7d4c <loader+0x66>
    7d29:	8b 42 08             	mov    0x8(%edx),%eax
    7d2c:	8b 7a 04             	mov    0x4(%edx),%edi
    7d2f:	8b 4a 10             	mov    0x10(%edx),%ecx
    7d32:	8d b7 00 00 00 01    	lea    0x1000000(%edi),%esi
    7d38:	89 c7                	mov    %eax,%edi
    7d3a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
    7d3c:	8b 72 10             	mov    0x10(%edx),%esi
    7d3f:	8b 4a 14             	mov    0x14(%edx),%ecx
    7d42:	29 f1                	sub    %esi,%ecx
    7d44:	01 c6                	add    %eax,%esi
    7d46:	31 c0                	xor    %eax,%eax
    7d48:	89 f7                	mov    %esi,%edi
    7d4a:	f3 aa                	rep stos %al,%es:(%edi)
    7d4c:	43                   	inc    %ebx
    7d4d:	83 c2 20             	add    $0x20,%edx
    7d50:	eb c7                	jmp    7d19 <loader+0x33>
    7d52:	a1 18 00 00 01       	mov    0x1000018,%eax
    7d57:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7d5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    7d60:	5b                   	pop    %ebx
    7d61:	5e                   	pop    %esi
    7d62:	5f                   	pop    %edi
    7d63:	5d                   	pop    %ebp
    7d64:	c3                   	ret    

00007d65 <bootMain>:
    7d65:	55                   	push   %ebp
    7d66:	89 e5                	mov    %esp,%ebp
    7d68:	83 ec 08             	sub    $0x8,%esp
    7d6b:	e8 76 ff ff ff       	call   7ce6 <loader>
    7d70:	c9                   	leave  
    7d71:	ff e0                	jmp    *%eax

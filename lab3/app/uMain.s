
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00000000 <uEntry>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
   6:	e8 c0 03 00 00       	call   3cb <fork>
   b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   e:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
  15:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  19:	75 45                	jne    60 <uEntry+0x60>
  1b:	c7 05 c8 15 00 00 02 	movl   $0x2,0x15c8
  22:	00 00 00 
  25:	eb 2c                	jmp    53 <uEntry+0x53>
  27:	ff 4d f4             	decl   -0xc(%ebp)
  2a:	a1 c8 15 00 00       	mov    0x15c8,%eax
  2f:	83 ec 04             	sub    $0x4,%esp
  32:	ff 75 f4             	pushl  -0xc(%ebp)
  35:	50                   	push   %eax
  36:	68 19 04 00 00       	push   $0x419
  3b:	e8 44 02 00 00       	call   284 <printf>
  40:	83 c4 10             	add    $0x10,%esp
  43:	83 ec 0c             	sub    $0xc,%esp
  46:	68 80 00 00 00       	push   $0x80
  4b:	e8 94 03 00 00       	call   3e4 <sleep>
  50:	83 c4 10             	add    $0x10,%esp
  53:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  57:	75 ce                	jne    27 <uEntry+0x27>
  59:	e8 a1 03 00 00       	call   3ff <exit>
  5e:	eb 49                	jmp    a9 <uEntry+0xa9>
  60:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  64:	74 43                	je     a9 <uEntry+0xa9>
  66:	c7 05 c8 15 00 00 01 	movl   $0x1,0x15c8
  6d:	00 00 00 
  70:	eb 2c                	jmp    9e <uEntry+0x9e>
  72:	ff 4d f4             	decl   -0xc(%ebp)
  75:	a1 c8 15 00 00       	mov    0x15c8,%eax
  7a:	83 ec 04             	sub    $0x4,%esp
  7d:	ff 75 f4             	pushl  -0xc(%ebp)
  80:	50                   	push   %eax
  81:	68 36 04 00 00       	push   $0x436
  86:	e8 f9 01 00 00       	call   284 <printf>
  8b:	83 c4 10             	add    $0x10,%esp
  8e:	83 ec 0c             	sub    $0xc,%esp
  91:	68 80 00 00 00       	push   $0x80
  96:	e8 49 03 00 00       	call   3e4 <sleep>
  9b:	83 c4 10             	add    $0x10,%esp
  9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a2:	75 ce                	jne    72 <uEntry+0x72>
  a4:	e8 56 03 00 00       	call   3ff <exit>
  a9:	b8 00 00 00 00       	mov    $0x0,%eax
  ae:	c9                   	leave  
  af:	c3                   	ret    

000000b0 <syscall>:
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	83 ec 10             	sub    $0x10,%esp
  b9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c6:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c9:	8b 55 14             	mov    0x14(%ebp),%edx
  cc:	8b 75 18             	mov    0x18(%ebp),%esi
  cf:	8b 7d 1c             	mov    0x1c(%ebp),%edi
  d2:	cd 80                	int    $0x80
  d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  da:	83 c4 10             	add    $0x10,%esp
  dd:	5b                   	pop    %ebx
  de:	5e                   	pop    %esi
  df:	5f                   	pop    %edi
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    

000000e2 <printChar>:
  e2:	55                   	push   %ebp
  e3:	89 e5                	mov    %esp,%ebp
  e5:	83 ec 04             	sub    $0x4,%esp
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	88 45 fc             	mov    %al,-0x4(%ebp)
  ee:	8d 45 fc             	lea    -0x4(%ebp),%eax
  f1:	6a 00                	push   $0x0
  f3:	6a 00                	push   $0x0
  f5:	6a 01                	push   $0x1
  f7:	50                   	push   %eax
  f8:	6a 01                	push   $0x1
  fa:	6a 04                	push   $0x4
  fc:	e8 af ff ff ff       	call   b0 <syscall>
 101:	83 c4 18             	add    $0x18,%esp
 104:	90                   	nop
 105:	c9                   	leave  
 106:	c3                   	ret    

00000107 <printString>:
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 10             	sub    $0x10,%esp
 10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 114:	eb 03                	jmp    119 <printString+0x12>
 116:	ff 45 fc             	incl   -0x4(%ebp)
 119:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	01 d0                	add    %edx,%eax
 121:	8a 00                	mov    (%eax),%al
 123:	84 c0                	test   %al,%al
 125:	75 ef                	jne    116 <printString+0xf>
 127:	8b 55 fc             	mov    -0x4(%ebp),%edx
 12a:	8b 45 08             	mov    0x8(%ebp),%eax
 12d:	6a 00                	push   $0x0
 12f:	6a 00                	push   $0x0
 131:	52                   	push   %edx
 132:	50                   	push   %eax
 133:	6a 01                	push   $0x1
 135:	6a 04                	push   $0x4
 137:	e8 74 ff ff ff       	call   b0 <syscall>
 13c:	83 c4 18             	add    $0x18,%esp
 13f:	90                   	nop
 140:	c9                   	leave  
 141:	c3                   	ret    

00000142 <printDemical>:
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	83 ec 10             	sub    $0x10,%esp
 149:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
 150:	75 12                	jne    164 <printDemical+0x22>
 152:	68 54 04 00 00       	push   $0x454
 157:	e8 ab ff ff ff       	call   107 <printString>
 15c:	83 c4 04             	add    $0x4,%esp
 15f:	e9 90 00 00 00       	jmp    1f4 <printDemical+0xb2>
 164:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 168:	75 0c                	jne    176 <printDemical+0x34>
 16a:	6a 30                	push   $0x30
 16c:	e8 71 ff ff ff       	call   e2 <printChar>
 171:	83 c4 04             	add    $0x4,%esp
 174:	eb 7e                	jmp    1f4 <printDemical+0xb2>
 176:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 17a:	79 0d                	jns    189 <printDemical+0x47>
 17c:	f7 5d 08             	negl   0x8(%ebp)
 17f:	6a 2d                	push   $0x2d
 181:	e8 5c ff ff ff       	call   e2 <printChar>
 186:	83 c4 04             	add    $0x4,%esp
 189:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 190:	eb 3a                	jmp    1cc <printDemical+0x8a>
 192:	ff 45 f8             	incl   -0x8(%ebp)
 195:	b8 0a 00 00 00       	mov    $0xa,%eax
 19a:	2b 45 f8             	sub    -0x8(%ebp),%eax
 19d:	89 c1                	mov    %eax,%ecx
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
 1a2:	bb 0a 00 00 00       	mov    $0xa,%ebx
 1a7:	99                   	cltd   
 1a8:	f7 fb                	idiv   %ebx
 1aa:	89 d0                	mov    %edx,%eax
 1ac:	83 c0 30             	add    $0x30,%eax
 1af:	88 44 0d ee          	mov    %al,-0x12(%ebp,%ecx,1)
 1b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b6:	b8 67 66 66 66       	mov    $0x66666667,%eax
 1bb:	f7 e9                	imul   %ecx
 1bd:	c1 fa 02             	sar    $0x2,%edx
 1c0:	89 c8                	mov    %ecx,%eax
 1c2:	c1 f8 1f             	sar    $0x1f,%eax
 1c5:	29 c2                	sub    %eax,%edx
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	89 45 08             	mov    %eax,0x8(%ebp)
 1cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1d0:	7f c0                	jg     192 <printDemical+0x50>
 1d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 1d5:	ba 0a 00 00 00       	mov    $0xa,%edx
 1da:	2b 55 f8             	sub    -0x8(%ebp),%edx
 1dd:	8d 4d ee             	lea    -0x12(%ebp),%ecx
 1e0:	01 ca                	add    %ecx,%edx
 1e2:	6a 00                	push   $0x0
 1e4:	6a 00                	push   $0x0
 1e6:	50                   	push   %eax
 1e7:	52                   	push   %edx
 1e8:	6a 01                	push   $0x1
 1ea:	6a 04                	push   $0x4
 1ec:	e8 bf fe ff ff       	call   b0 <syscall>
 1f1:	83 c4 18             	add    $0x18,%esp
 1f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <printHex>:
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
 1ff:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 203:	75 0c                	jne    211 <printHex+0x18>
 205:	6a 30                	push   $0x30
 207:	e8 d6 fe ff ff       	call   e2 <printChar>
 20c:	83 c4 04             	add    $0x4,%esp
 20f:	eb 71                	jmp    282 <printHex+0x89>
 211:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 218:	eb 40                	jmp    25a <printHex+0x61>
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	83 e0 0f             	and    $0xf,%eax
 220:	83 f8 09             	cmp    $0x9,%eax
 223:	77 0e                	ja     233 <printHex+0x3a>
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	83 e0 0f             	and    $0xf,%eax
 22b:	83 c0 30             	add    $0x30,%eax
 22e:	88 45 fb             	mov    %al,-0x5(%ebp)
 231:	eb 0c                	jmp    23f <printHex+0x46>
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	83 e0 0f             	and    $0xf,%eax
 239:	83 c0 57             	add    $0x57,%eax
 23c:	88 45 fb             	mov    %al,-0x5(%ebp)
 23f:	ff 45 fc             	incl   -0x4(%ebp)
 242:	b8 08 00 00 00       	mov    $0x8,%eax
 247:	2b 45 fc             	sub    -0x4(%ebp),%eax
 24a:	8a 55 fb             	mov    -0x5(%ebp),%dl
 24d:	88 54 05 f3          	mov    %dl,-0xd(%ebp,%eax,1)
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c1 e8 04             	shr    $0x4,%eax
 257:	89 45 08             	mov    %eax,0x8(%ebp)
 25a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 25e:	75 ba                	jne    21a <printHex+0x21>
 260:	8b 45 fc             	mov    -0x4(%ebp),%eax
 263:	ba 08 00 00 00       	mov    $0x8,%edx
 268:	2b 55 fc             	sub    -0x4(%ebp),%edx
 26b:	8d 4d f3             	lea    -0xd(%ebp),%ecx
 26e:	01 ca                	add    %ecx,%edx
 270:	6a 00                	push   $0x0
 272:	6a 00                	push   $0x0
 274:	50                   	push   %eax
 275:	52                   	push   %edx
 276:	6a 01                	push   $0x1
 278:	6a 04                	push   $0x4
 27a:	e8 31 fe ff ff       	call   b0 <syscall>
 27f:	83 c4 18             	add    $0x18,%esp
 282:	c9                   	leave  
 283:	c3                   	ret    

00000284 <printf>:
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	81 ec e0 00 00 00    	sub    $0xe0,%esp
 28d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 291:	0f 84 2e 01 00 00    	je     3c5 <printf+0x141>
 297:	8d 45 0c             	lea    0xc(%ebp),%eax
 29a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 29d:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 2a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2a6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 2ad:	e9 ff 00 00 00       	jmp    3b1 <printf+0x12d>
 2b2:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 2b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2bb:	eb 15                	jmp    2d2 <printf+0x4e>
 2bd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
 2c3:	01 d0                	add    %edx,%eax
 2c5:	8a 10                	mov    (%eax),%dl
 2c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2ca:	88 10                	mov    %dl,(%eax)
 2cc:	ff 45 fc             	incl   -0x4(%ebp)
 2cf:	ff 45 f8             	incl   -0x8(%ebp)
 2d2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	01 d0                	add    %edx,%eax
 2da:	8a 00                	mov    (%eax),%al
 2dc:	3c 25                	cmp    $0x25,%al
 2de:	74 0e                	je     2ee <printf+0x6a>
 2e0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	01 d0                	add    %edx,%eax
 2e8:	8a 00                	mov    (%eax),%al
 2ea:	84 c0                	test   %al,%al
 2ec:	75 cf                	jne    2bd <printf+0x39>
 2ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f1:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 2f7:	29 c2                	sub    %eax,%edx
 2f9:	89 d0                	mov    %edx,%eax
 2fb:	89 c2                	mov    %eax,%edx
 2fd:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 303:	6a 00                	push   $0x0
 305:	6a 00                	push   $0x0
 307:	52                   	push   %edx
 308:	50                   	push   %eax
 309:	6a 01                	push   $0x1
 30b:	6a 04                	push   $0x4
 30d:	e8 9e fd ff ff       	call   b0 <syscall>
 312:	83 c4 18             	add    $0x18,%esp
 315:	8b 55 f8             	mov    -0x8(%ebp),%edx
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	01 d0                	add    %edx,%eax
 31d:	8a 00                	mov    (%eax),%al
 31f:	84 c0                	test   %al,%al
 321:	0f 84 a1 00 00 00    	je     3c8 <printf+0x144>
 327:	ff 45 f8             	incl   -0x8(%ebp)
 32a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
 330:	01 d0                	add    %edx,%eax
 332:	8a 00                	mov    (%eax),%al
 334:	0f be c0             	movsbl %al,%eax
 337:	83 f8 64             	cmp    $0x64,%eax
 33a:	74 31                	je     36d <printf+0xe9>
 33c:	83 f8 64             	cmp    $0x64,%eax
 33f:	7f 07                	jg     348 <printf+0xc4>
 341:	83 f8 63             	cmp    $0x63,%eax
 344:	74 0e                	je     354 <printf+0xd0>
 346:	eb 66                	jmp    3ae <printf+0x12a>
 348:	83 f8 73             	cmp    $0x73,%eax
 34b:	74 4c                	je     399 <printf+0x115>
 34d:	83 f8 78             	cmp    $0x78,%eax
 350:	74 31                	je     383 <printf+0xff>
 352:	eb 5a                	jmp    3ae <printf+0x12a>
 354:	8b 45 f4             	mov    -0xc(%ebp),%eax
 357:	8d 50 04             	lea    0x4(%eax),%edx
 35a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 35d:	8b 00                	mov    (%eax),%eax
 35f:	0f be c0             	movsbl %al,%eax
 362:	50                   	push   %eax
 363:	e8 7a fd ff ff       	call   e2 <printChar>
 368:	83 c4 04             	add    $0x4,%esp
 36b:	eb 41                	jmp    3ae <printf+0x12a>
 36d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 370:	8d 50 04             	lea    0x4(%eax),%edx
 373:	89 55 f4             	mov    %edx,-0xc(%ebp)
 376:	8b 00                	mov    (%eax),%eax
 378:	50                   	push   %eax
 379:	e8 c4 fd ff ff       	call   142 <printDemical>
 37e:	83 c4 04             	add    $0x4,%esp
 381:	eb 2b                	jmp    3ae <printf+0x12a>
 383:	8b 45 f4             	mov    -0xc(%ebp),%eax
 386:	8d 50 04             	lea    0x4(%eax),%edx
 389:	89 55 f4             	mov    %edx,-0xc(%ebp)
 38c:	8b 00                	mov    (%eax),%eax
 38e:	50                   	push   %eax
 38f:	e8 65 fe ff ff       	call   1f9 <printHex>
 394:	83 c4 04             	add    $0x4,%esp
 397:	eb 15                	jmp    3ae <printf+0x12a>
 399:	8b 45 f4             	mov    -0xc(%ebp),%eax
 39c:	8d 50 04             	lea    0x4(%eax),%edx
 39f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3a2:	8b 00                	mov    (%eax),%eax
 3a4:	50                   	push   %eax
 3a5:	e8 5d fd ff ff       	call   107 <printString>
 3aa:	83 c4 04             	add    $0x4,%esp
 3ad:	90                   	nop
 3ae:	ff 45 f8             	incl   -0x8(%ebp)
 3b1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	01 d0                	add    %edx,%eax
 3b9:	8a 00                	mov    (%eax),%al
 3bb:	84 c0                	test   %al,%al
 3bd:	0f 85 ef fe ff ff    	jne    2b2 <printf+0x2e>
 3c3:	eb 04                	jmp    3c9 <printf+0x145>
 3c5:	90                   	nop
 3c6:	eb 01                	jmp    3c9 <printf+0x145>
 3c8:	90                   	nop
 3c9:	c9                   	leave  
 3ca:	c3                   	ret    

000003cb <fork>:
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	6a 00                	push   $0x0
 3d0:	6a 00                	push   $0x0
 3d2:	6a 00                	push   $0x0
 3d4:	6a 00                	push   $0x0
 3d6:	6a 00                	push   $0x0
 3d8:	6a 01                	push   $0x1
 3da:	e8 d1 fc ff ff       	call   b0 <syscall>
 3df:	83 c4 18             	add    $0x18,%esp
 3e2:	c9                   	leave  
 3e3:	c3                   	ret    

000003e4 <sleep>:
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	6a 00                	push   $0x0
 3e9:	6a 00                	push   $0x0
 3eb:	6a 00                	push   $0x0
 3ed:	6a 00                	push   $0x0
 3ef:	ff 75 08             	pushl  0x8(%ebp)
 3f2:	6a 02                	push   $0x2
 3f4:	e8 b7 fc ff ff       	call   b0 <syscall>
 3f9:	83 c4 18             	add    $0x18,%esp
 3fc:	90                   	nop
 3fd:	c9                   	leave  
 3fe:	c3                   	ret    

000003ff <exit>:
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	6a 00                	push   $0x0
 404:	6a 00                	push   $0x0
 406:	6a 00                	push   $0x0
 408:	6a 00                	push   $0x0
 40a:	6a 00                	push   $0x0
 40c:	6a 03                	push   $0x3
 40e:	e8 9d fc ff ff       	call   b0 <syscall>
 413:	83 c4 18             	add    $0x18,%esp
 416:	90                   	nop
 417:	c9                   	leave  
 418:	c3                   	ret    

Disassembly of section .rodata:

00000419 <.rodata>:
 419:	43                   	inc    %ebx
 41a:	68 69 6c 64 20       	push   $0x20646c69
 41f:	50                   	push   %eax
 420:	72 6f                	jb     491 <exit+0x92>
 422:	63 65 73             	arpl   %sp,0x73(%ebp)
 425:	73 3a                	jae    461 <exit+0x62>
 427:	20 50 6f             	and    %dl,0x6f(%eax)
 42a:	6e                   	outsb  %ds:(%esi),(%dx)
 42b:	67 20 25             	and    %ah,(%di)
 42e:	64 2c 20             	fs sub $0x20,%al
 431:	25 64 3b 0a 00       	and    $0xa3b64,%eax
 436:	46                   	inc    %esi
 437:	61                   	popa   
 438:	74 68                	je     4a2 <exit+0xa3>
 43a:	65 72 20             	gs jb  45d <exit+0x5e>
 43d:	50                   	push   %eax
 43e:	72 6f                	jb     4af <exit+0xb0>
 440:	63 65 73             	arpl   %sp,0x73(%ebp)
 443:	73 3a                	jae    47f <exit+0x80>
 445:	20 50 69             	and    %dl,0x69(%eax)
 448:	6e                   	outsb  %ds:(%esi),(%dx)
 449:	67 20 25             	and    %ah,(%di)
 44c:	64 2c 20             	fs sub $0x20,%al
 44f:	25 64 3b 0a 00       	and    $0xa3b64,%eax
 454:	2d 32 31 34 37       	sub    $0x37343132,%eax
 459:	34 38                	xor    $0x38,%al
 45b:	33 37                	xor    (%edi),%esi
 45d:	34 38                	xor    $0x38,%al
	...

Disassembly of section .eh_frame:

00000460 <.eh_frame>:
 460:	14 00                	adc    $0x0,%al
 462:	00 00                	add    %al,(%eax)
 464:	00 00                	add    %al,(%eax)
 466:	00 00                	add    %al,(%eax)
 468:	01 7a 52             	add    %edi,0x52(%edx)
 46b:	00 01                	add    %al,(%ecx)
 46d:	7c 08                	jl     477 <exit+0x78>
 46f:	01 1b                	add    %ebx,(%ebx)
 471:	0c 04                	or     $0x4,%al
 473:	04 88                	add    $0x88,%al
 475:	01 00                	add    %eax,(%eax)
 477:	00 1c 00             	add    %bl,(%eax,%eax,1)
 47a:	00 00                	add    %al,(%eax)
 47c:	1c 00                	sbb    $0x0,%al
 47e:	00 00                	add    %al,(%eax)
 480:	80 fb ff             	cmp    $0xff,%bl
 483:	ff b0 00 00 00 00    	pushl  0x0(%eax)
 489:	41                   	inc    %ecx
 48a:	0e                   	push   %cs
 48b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 491:	02 ac c5 0c 04 04 00 	add    0x4040c(%ebp,%eax,8),%ch
 498:	28 00                	sub    %al,(%eax)
 49a:	00 00                	add    %al,(%eax)
 49c:	3c 00                	cmp    $0x0,%al
 49e:	00 00                	add    %al,(%eax)
 4a0:	10 fc                	adc    %bh,%ah
 4a2:	ff                   	(bad)  
 4a3:	ff 32                	pushl  (%edx)
 4a5:	00 00                	add    %al,(%eax)
 4a7:	00 00                	add    %al,(%eax)
 4a9:	41                   	inc    %ecx
 4aa:	0e                   	push   %cs
 4ab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 4b1:	46                   	inc    %esi
 4b2:	87 03                	xchg   %eax,(%ebx)
 4b4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
 4b7:	05 65 c3 41 c6       	add    $0xc641c365,%eax
 4bc:	41                   	inc    %ecx
 4bd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
 4c4:	1c 00                	sbb    $0x0,%al
 4c6:	00 00                	add    %al,(%eax)
 4c8:	68 00 00 00 16       	push   $0x16000000
 4cd:	fc                   	cld    
 4ce:	ff                   	(bad)  
 4cf:	ff 25 00 00 00 00    	jmp    *0x0
 4d5:	41                   	inc    %ecx
 4d6:	0e                   	push   %cs
 4d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 4dd:	61                   	popa   
 4de:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 4e1:	04 00                	add    $0x0,%al
 4e3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 4e6:	00 00                	add    %al,(%eax)
 4e8:	88 00                	mov    %al,(%eax)
 4ea:	00 00                	add    %al,(%eax)
 4ec:	1b fc                	sbb    %esp,%edi
 4ee:	ff                   	(bad)  
 4ef:	ff                   	(bad)  
 4f0:	3b 00                	cmp    (%eax),%eax
 4f2:	00 00                	add    %al,(%eax)
 4f4:	00 41 0e             	add    %al,0xe(%ecx)
 4f7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 4fd:	77 c5                	ja     4c4 <exit+0xc5>
 4ff:	0c 04                	or     $0x4,%al
 501:	04 00                	add    $0x0,%al
 503:	00 20                	add    %ah,(%eax)
 505:	00 00                	add    %al,(%eax)
 507:	00 a8 00 00 00 36    	add    %ch,0x36000000(%eax)
 50d:	fc                   	cld    
 50e:	ff                   	(bad)  
 50f:	ff b7 00 00 00 00    	pushl  0x0(%edi)
 515:	41                   	inc    %ecx
 516:	0e                   	push   %cs
 517:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 51d:	44                   	inc    %esp
 51e:	83 03 02             	addl   $0x2,(%ebx)
 521:	af                   	scas   %es:(%edi),%eax
 522:	c5 c3 0c             	(bad)  
 525:	04 04                	add    $0x4,%al
 527:	00 1c 00             	add    %bl,(%eax,%eax,1)
 52a:	00 00                	add    %al,(%eax)
 52c:	cc                   	int3   
 52d:	00 00                	add    %al,(%eax)
 52f:	00 c9                	add    %cl,%cl
 531:	fc                   	cld    
 532:	ff                   	(bad)  
 533:	ff 8b 00 00 00 00    	decl   0x0(%ebx)
 539:	41                   	inc    %ecx
 53a:	0e                   	push   %cs
 53b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 541:	02 87 c5 0c 04 04    	add    0x4040cc5(%edi),%al
 547:	00 1c 00             	add    %bl,(%eax,%eax,1)
 54a:	00 00                	add    %al,(%eax)
 54c:	ec                   	in     (%dx),%al
 54d:	00 00                	add    %al,(%eax)
 54f:	00 34 fd ff ff 47 01 	add    %dh,0x147ffff(,%edi,8)
 556:	00 00                	add    %al,(%eax)
 558:	00 41 0e             	add    %al,0xe(%ecx)
 55b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 561:	03 43 01             	add    0x1(%ebx),%eax
 564:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 567:	04 1c                	add    $0x1c,%al
 569:	00 00                	add    %al,(%eax)
 56b:	00 0c 01             	add    %cl,(%ecx,%eax,1)
 56e:	00 00                	add    %al,(%eax)
 570:	5b                   	pop    %ebx
 571:	fe                   	(bad)  
 572:	ff                   	(bad)  
 573:	ff 19                	lcall  *(%ecx)
 575:	00 00                	add    %al,(%eax)
 577:	00 00                	add    %al,(%eax)
 579:	41                   	inc    %ecx
 57a:	0e                   	push   %cs
 57b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 581:	55                   	push   %ebp
 582:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 585:	04 00                	add    $0x0,%al
 587:	00 1c 00             	add    %bl,(%eax,%eax,1)
 58a:	00 00                	add    %al,(%eax)
 58c:	2c 01                	sub    $0x1,%al
 58e:	00 00                	add    %al,(%eax)
 590:	54                   	push   %esp
 591:	fe                   	(bad)  
 592:	ff                   	(bad)  
 593:	ff 1b                	lcall  *(%ebx)
 595:	00 00                	add    %al,(%eax)
 597:	00 00                	add    %al,(%eax)
 599:	41                   	inc    %ecx
 59a:	0e                   	push   %cs
 59b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 5a1:	57                   	push   %edi
 5a2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 5a5:	04 00                	add    $0x0,%al
 5a7:	00 1c 00             	add    %bl,(%eax,%eax,1)
 5aa:	00 00                	add    %al,(%eax)
 5ac:	4c                   	dec    %esp
 5ad:	01 00                	add    %eax,(%eax)
 5af:	00 4f fe             	add    %cl,-0x2(%edi)
 5b2:	ff                   	(bad)  
 5b3:	ff 1a                	lcall  *(%edx)
 5b5:	00 00                	add    %al,(%eax)
 5b7:	00 00                	add    %al,(%eax)
 5b9:	41                   	inc    %ecx
 5ba:	0e                   	push   %cs
 5bb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 5c1:	56                   	push   %esi
 5c2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 5c5:	04 00                	add    $0x0,%al
	...

Disassembly of section .bss:

000015c8 <__bss_start>:
    15c8:	00 00                	add    %al,(%eax)
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 55 62             	sub    %dl,0x62(%ebp)
   8:	75 6e                	jne    78 <uEntry+0x78>
   a:	74 75                	je     81 <uEntry+0x81>
   c:	20 35 2e 34 2e 30    	and    %dh,0x302e342e
  12:	2d 36 75 62 75       	sub    $0x75627536,%eax
  17:	6e                   	outsb  %ds:(%esi),(%dx)
  18:	74 75                	je     8f <uEntry+0x8f>
  1a:	31 7e 31             	xor    %edi,0x31(%esi)
  1d:	36 2e 30 34 2e       	ss xor %dh,%cs:(%esi,%ebp,1)
  22:	39 29                	cmp    %ebp,(%ecx)
  24:	20 35 2e 34 2e 30    	and    %dh,0x302e342e
  2a:	20 32                	and    %dh,(%edx)
  2c:	30 31                	xor    %dh,(%ecx)
  2e:	36 30 36             	xor    %dh,%ss:(%esi)
  31:	30 39                	xor    %bh,(%ecx)
	...

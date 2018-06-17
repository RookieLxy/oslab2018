
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00000000 <uEntry>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
   6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  14:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	68 5c 05 00 00       	push   $0x55c
  20:	e8 a4 04 00 00       	call   4c9 <ls>
  25:	83 c4 10             	add    $0x10,%esp
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 5e 05 00 00       	push   $0x55e
  30:	e8 94 04 00 00       	call   4c9 <ls>
  35:	83 c4 10             	add    $0x10,%esp
  38:	83 ec 0c             	sub    $0xc,%esp
  3b:	68 65 05 00 00       	push   $0x565
  40:	e8 84 04 00 00       	call   4c9 <ls>
  45:	83 c4 10             	add    $0x10,%esp
  48:	83 ec 0c             	sub    $0xc,%esp
  4b:	68 6b 05 00 00       	push   $0x56b
  50:	e8 74 04 00 00       	call   4c9 <ls>
  55:	83 c4 10             	add    $0x10,%esp
  58:	83 ec 0c             	sub    $0xc,%esp
  5b:	68 74 05 00 00       	push   $0x574
  60:	e8 62 02 00 00       	call   2c7 <printf>
  65:	83 c4 10             	add    $0x10,%esp
  68:	83 ec 08             	sub    $0x8,%esp
  6b:	6a 01                	push   $0x1
  6d:	68 a0 05 00 00       	push   $0x5a0
  72:	e8 6e 04 00 00       	call   4e5 <open>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  7d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  84:	eb 2a                	jmp    b0 <uEntry+0xb0>
  86:	8b 45 f4             	mov    -0xc(%ebp),%eax
  89:	b9 1a 00 00 00       	mov    $0x1a,%ecx
  8e:	99                   	cltd   
  8f:	f7 f9                	idiv   %ecx
  91:	89 d0                	mov    %edx,%eax
  93:	83 c0 41             	add    $0x41,%eax
  96:	88 45 ef             	mov    %al,-0x11(%ebp)
  99:	83 ec 04             	sub    $0x4,%esp
  9c:	6a 01                	push   $0x1
  9e:	8d 45 ef             	lea    -0x11(%ebp),%eax
  a1:	50                   	push   %eax
  a2:	ff 75 f0             	pushl  -0x10(%ebp)
  a5:	e8 58 04 00 00       	call   502 <write>
  aa:	83 c4 10             	add    $0x10,%esp
  ad:	ff 45 f4             	incl   -0xc(%ebp)
  b0:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
  b7:	7e cd                	jle    86 <uEntry+0x86>
  b9:	83 ec 0c             	sub    $0xc,%esp
  bc:	ff 75 f0             	pushl  -0x10(%ebp)
  bf:	e8 5d 04 00 00       	call   521 <close>
  c4:	83 c4 10             	add    $0x10,%esp
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	68 6b 05 00 00       	push   $0x56b
  cf:	e8 f5 03 00 00       	call   4c9 <ls>
  d4:	83 c4 10             	add    $0x10,%esp
  d7:	83 ec 0c             	sub    $0xc,%esp
  da:	68 a0 05 00 00       	push   $0x5a0
  df:	e8 59 04 00 00       	call   53d <cat>
  e4:	83 c4 10             	add    $0x10,%esp
  e7:	e8 56 03 00 00       	call   442 <exit>
  ec:	b8 00 00 00 00       	mov    $0x0,%eax
  f1:	c9                   	leave  
  f2:	c3                   	ret    

000000f3 <syscall>:
  f3:	55                   	push   %ebp
  f4:	89 e5                	mov    %esp,%ebp
  f6:	57                   	push   %edi
  f7:	56                   	push   %esi
  f8:	53                   	push   %ebx
  f9:	83 ec 10             	sub    $0x10,%esp
  fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 109:	8b 4d 10             	mov    0x10(%ebp),%ecx
 10c:	8b 55 14             	mov    0x14(%ebp),%edx
 10f:	8b 75 18             	mov    0x18(%ebp),%esi
 112:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 115:	cd 80                	int    $0x80
 117:	89 45 f0             	mov    %eax,-0x10(%ebp)
 11a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 11d:	83 c4 10             	add    $0x10,%esp
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <printChar>:
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 04             	sub    $0x4,%esp
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	88 45 fc             	mov    %al,-0x4(%ebp)
 131:	8d 45 fc             	lea    -0x4(%ebp),%eax
 134:	6a 00                	push   $0x0
 136:	6a 00                	push   $0x0
 138:	6a 01                	push   $0x1
 13a:	50                   	push   %eax
 13b:	6a 01                	push   $0x1
 13d:	6a 04                	push   $0x4
 13f:	e8 af ff ff ff       	call   f3 <syscall>
 144:	83 c4 18             	add    $0x18,%esp
 147:	90                   	nop
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <printString>:
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 10             	sub    $0x10,%esp
 150:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 157:	eb 03                	jmp    15c <printString+0x12>
 159:	ff 45 fc             	incl   -0x4(%ebp)
 15c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	01 d0                	add    %edx,%eax
 164:	8a 00                	mov    (%eax),%al
 166:	84 c0                	test   %al,%al
 168:	75 ef                	jne    159 <printString+0xf>
 16a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	6a 00                	push   $0x0
 172:	6a 00                	push   $0x0
 174:	52                   	push   %edx
 175:	50                   	push   %eax
 176:	6a 01                	push   $0x1
 178:	6a 04                	push   $0x4
 17a:	e8 74 ff ff ff       	call   f3 <syscall>
 17f:	83 c4 18             	add    $0x18,%esp
 182:	90                   	nop
 183:	c9                   	leave  
 184:	c3                   	ret    

00000185 <printDemical>:
 185:	55                   	push   %ebp
 186:	89 e5                	mov    %esp,%ebp
 188:	53                   	push   %ebx
 189:	83 ec 10             	sub    $0x10,%esp
 18c:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
 193:	75 12                	jne    1a7 <printDemical+0x22>
 195:	68 aa 05 00 00       	push   $0x5aa
 19a:	e8 ab ff ff ff       	call   14a <printString>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	e9 90 00 00 00       	jmp    237 <printDemical+0xb2>
 1a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1ab:	75 0c                	jne    1b9 <printDemical+0x34>
 1ad:	6a 30                	push   $0x30
 1af:	e8 71 ff ff ff       	call   125 <printChar>
 1b4:	83 c4 04             	add    $0x4,%esp
 1b7:	eb 7e                	jmp    237 <printDemical+0xb2>
 1b9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1bd:	79 0d                	jns    1cc <printDemical+0x47>
 1bf:	f7 5d 08             	negl   0x8(%ebp)
 1c2:	6a 2d                	push   $0x2d
 1c4:	e8 5c ff ff ff       	call   125 <printChar>
 1c9:	83 c4 04             	add    $0x4,%esp
 1cc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 1d3:	eb 3a                	jmp    20f <printDemical+0x8a>
 1d5:	ff 45 f8             	incl   -0x8(%ebp)
 1d8:	b8 0a 00 00 00       	mov    $0xa,%eax
 1dd:	2b 45 f8             	sub    -0x8(%ebp),%eax
 1e0:	89 c1                	mov    %eax,%ecx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	bb 0a 00 00 00       	mov    $0xa,%ebx
 1ea:	99                   	cltd   
 1eb:	f7 fb                	idiv   %ebx
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	83 c0 30             	add    $0x30,%eax
 1f2:	88 44 0d ee          	mov    %al,-0x12(%ebp,%ecx,1)
 1f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f9:	b8 67 66 66 66       	mov    $0x66666667,%eax
 1fe:	f7 e9                	imul   %ecx
 200:	c1 fa 02             	sar    $0x2,%edx
 203:	89 c8                	mov    %ecx,%eax
 205:	c1 f8 1f             	sar    $0x1f,%eax
 208:	29 c2                	sub    %eax,%edx
 20a:	89 d0                	mov    %edx,%eax
 20c:	89 45 08             	mov    %eax,0x8(%ebp)
 20f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 213:	7f c0                	jg     1d5 <printDemical+0x50>
 215:	8b 45 f8             	mov    -0x8(%ebp),%eax
 218:	ba 0a 00 00 00       	mov    $0xa,%edx
 21d:	2b 55 f8             	sub    -0x8(%ebp),%edx
 220:	8d 4d ee             	lea    -0x12(%ebp),%ecx
 223:	01 ca                	add    %ecx,%edx
 225:	6a 00                	push   $0x0
 227:	6a 00                	push   $0x0
 229:	50                   	push   %eax
 22a:	52                   	push   %edx
 22b:	6a 01                	push   $0x1
 22d:	6a 04                	push   $0x4
 22f:	e8 bf fe ff ff       	call   f3 <syscall>
 234:	83 c4 18             	add    $0x18,%esp
 237:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23a:	c9                   	leave  
 23b:	c3                   	ret    

0000023c <printHex>:
 23c:	55                   	push   %ebp
 23d:	89 e5                	mov    %esp,%ebp
 23f:	83 ec 10             	sub    $0x10,%esp
 242:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 246:	75 0c                	jne    254 <printHex+0x18>
 248:	6a 30                	push   $0x30
 24a:	e8 d6 fe ff ff       	call   125 <printChar>
 24f:	83 c4 04             	add    $0x4,%esp
 252:	eb 71                	jmp    2c5 <printHex+0x89>
 254:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25b:	eb 40                	jmp    29d <printHex+0x61>
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	83 e0 0f             	and    $0xf,%eax
 263:	83 f8 09             	cmp    $0x9,%eax
 266:	77 0e                	ja     276 <printHex+0x3a>
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	83 e0 0f             	and    $0xf,%eax
 26e:	83 c0 30             	add    $0x30,%eax
 271:	88 45 fb             	mov    %al,-0x5(%ebp)
 274:	eb 0c                	jmp    282 <printHex+0x46>
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	83 e0 0f             	and    $0xf,%eax
 27c:	83 c0 57             	add    $0x57,%eax
 27f:	88 45 fb             	mov    %al,-0x5(%ebp)
 282:	ff 45 fc             	incl   -0x4(%ebp)
 285:	b8 08 00 00 00       	mov    $0x8,%eax
 28a:	2b 45 fc             	sub    -0x4(%ebp),%eax
 28d:	8a 55 fb             	mov    -0x5(%ebp),%dl
 290:	88 54 05 f3          	mov    %dl,-0xd(%ebp,%eax,1)
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	c1 e8 04             	shr    $0x4,%eax
 29a:	89 45 08             	mov    %eax,0x8(%ebp)
 29d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2a1:	75 ba                	jne    25d <printHex+0x21>
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	ba 08 00 00 00       	mov    $0x8,%edx
 2ab:	2b 55 fc             	sub    -0x4(%ebp),%edx
 2ae:	8d 4d f3             	lea    -0xd(%ebp),%ecx
 2b1:	01 ca                	add    %ecx,%edx
 2b3:	6a 00                	push   $0x0
 2b5:	6a 00                	push   $0x0
 2b7:	50                   	push   %eax
 2b8:	52                   	push   %edx
 2b9:	6a 01                	push   $0x1
 2bb:	6a 04                	push   $0x4
 2bd:	e8 31 fe ff ff       	call   f3 <syscall>
 2c2:	83 c4 18             	add    $0x18,%esp
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <printf>:
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	81 ec e0 00 00 00    	sub    $0xe0,%esp
 2d0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2d4:	0f 84 2e 01 00 00    	je     408 <printf+0x141>
 2da:	8d 45 0c             	lea    0xc(%ebp),%eax
 2dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2e0:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 2e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2e9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 2f0:	e9 ff 00 00 00       	jmp    3f4 <printf+0x12d>
 2f5:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 2fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2fe:	eb 15                	jmp    315 <printf+0x4e>
 300:	8b 55 f8             	mov    -0x8(%ebp),%edx
 303:	8b 45 08             	mov    0x8(%ebp),%eax
 306:	01 d0                	add    %edx,%eax
 308:	8a 10                	mov    (%eax),%dl
 30a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 30d:	88 10                	mov    %dl,(%eax)
 30f:	ff 45 fc             	incl   -0x4(%ebp)
 312:	ff 45 f8             	incl   -0x8(%ebp)
 315:	8b 55 f8             	mov    -0x8(%ebp),%edx
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	01 d0                	add    %edx,%eax
 31d:	8a 00                	mov    (%eax),%al
 31f:	3c 25                	cmp    $0x25,%al
 321:	74 0e                	je     331 <printf+0x6a>
 323:	8b 55 f8             	mov    -0x8(%ebp),%edx
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	01 d0                	add    %edx,%eax
 32b:	8a 00                	mov    (%eax),%al
 32d:	84 c0                	test   %al,%al
 32f:	75 cf                	jne    300 <printf+0x39>
 331:	8b 55 fc             	mov    -0x4(%ebp),%edx
 334:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 33a:	29 c2                	sub    %eax,%edx
 33c:	89 d0                	mov    %edx,%eax
 33e:	89 c2                	mov    %eax,%edx
 340:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 346:	6a 00                	push   $0x0
 348:	6a 00                	push   $0x0
 34a:	52                   	push   %edx
 34b:	50                   	push   %eax
 34c:	6a 01                	push   $0x1
 34e:	6a 04                	push   $0x4
 350:	e8 9e fd ff ff       	call   f3 <syscall>
 355:	83 c4 18             	add    $0x18,%esp
 358:	8b 55 f8             	mov    -0x8(%ebp),%edx
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	01 d0                	add    %edx,%eax
 360:	8a 00                	mov    (%eax),%al
 362:	84 c0                	test   %al,%al
 364:	0f 84 a1 00 00 00    	je     40b <printf+0x144>
 36a:	ff 45 f8             	incl   -0x8(%ebp)
 36d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 370:	8b 45 08             	mov    0x8(%ebp),%eax
 373:	01 d0                	add    %edx,%eax
 375:	8a 00                	mov    (%eax),%al
 377:	0f be c0             	movsbl %al,%eax
 37a:	83 f8 64             	cmp    $0x64,%eax
 37d:	74 31                	je     3b0 <printf+0xe9>
 37f:	83 f8 64             	cmp    $0x64,%eax
 382:	7f 07                	jg     38b <printf+0xc4>
 384:	83 f8 63             	cmp    $0x63,%eax
 387:	74 0e                	je     397 <printf+0xd0>
 389:	eb 66                	jmp    3f1 <printf+0x12a>
 38b:	83 f8 73             	cmp    $0x73,%eax
 38e:	74 4c                	je     3dc <printf+0x115>
 390:	83 f8 78             	cmp    $0x78,%eax
 393:	74 31                	je     3c6 <printf+0xff>
 395:	eb 5a                	jmp    3f1 <printf+0x12a>
 397:	8b 45 f4             	mov    -0xc(%ebp),%eax
 39a:	8d 50 04             	lea    0x4(%eax),%edx
 39d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3a0:	8b 00                	mov    (%eax),%eax
 3a2:	0f be c0             	movsbl %al,%eax
 3a5:	50                   	push   %eax
 3a6:	e8 7a fd ff ff       	call   125 <printChar>
 3ab:	83 c4 04             	add    $0x4,%esp
 3ae:	eb 41                	jmp    3f1 <printf+0x12a>
 3b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b3:	8d 50 04             	lea    0x4(%eax),%edx
 3b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3b9:	8b 00                	mov    (%eax),%eax
 3bb:	50                   	push   %eax
 3bc:	e8 c4 fd ff ff       	call   185 <printDemical>
 3c1:	83 c4 04             	add    $0x4,%esp
 3c4:	eb 2b                	jmp    3f1 <printf+0x12a>
 3c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c9:	8d 50 04             	lea    0x4(%eax),%edx
 3cc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3cf:	8b 00                	mov    (%eax),%eax
 3d1:	50                   	push   %eax
 3d2:	e8 65 fe ff ff       	call   23c <printHex>
 3d7:	83 c4 04             	add    $0x4,%esp
 3da:	eb 15                	jmp    3f1 <printf+0x12a>
 3dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3df:	8d 50 04             	lea    0x4(%eax),%edx
 3e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3e5:	8b 00                	mov    (%eax),%eax
 3e7:	50                   	push   %eax
 3e8:	e8 5d fd ff ff       	call   14a <printString>
 3ed:	83 c4 04             	add    $0x4,%esp
 3f0:	90                   	nop
 3f1:	ff 45 f8             	incl   -0x8(%ebp)
 3f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	01 d0                	add    %edx,%eax
 3fc:	8a 00                	mov    (%eax),%al
 3fe:	84 c0                	test   %al,%al
 400:	0f 85 ef fe ff ff    	jne    2f5 <printf+0x2e>
 406:	eb 04                	jmp    40c <printf+0x145>
 408:	90                   	nop
 409:	eb 01                	jmp    40c <printf+0x145>
 40b:	90                   	nop
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <fork>:
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	6a 00                	push   $0x0
 413:	6a 00                	push   $0x0
 415:	6a 00                	push   $0x0
 417:	6a 00                	push   $0x0
 419:	6a 00                	push   $0x0
 41b:	6a 01                	push   $0x1
 41d:	e8 d1 fc ff ff       	call   f3 <syscall>
 422:	83 c4 18             	add    $0x18,%esp
 425:	c9                   	leave  
 426:	c3                   	ret    

00000427 <sleep>:
 427:	55                   	push   %ebp
 428:	89 e5                	mov    %esp,%ebp
 42a:	6a 00                	push   $0x0
 42c:	6a 00                	push   $0x0
 42e:	6a 00                	push   $0x0
 430:	6a 00                	push   $0x0
 432:	ff 75 08             	pushl  0x8(%ebp)
 435:	6a 02                	push   $0x2
 437:	e8 b7 fc ff ff       	call   f3 <syscall>
 43c:	83 c4 18             	add    $0x18,%esp
 43f:	90                   	nop
 440:	c9                   	leave  
 441:	c3                   	ret    

00000442 <exit>:
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	6a 00                	push   $0x0
 447:	6a 00                	push   $0x0
 449:	6a 00                	push   $0x0
 44b:	6a 00                	push   $0x0
 44d:	6a 00                	push   $0x0
 44f:	6a 03                	push   $0x3
 451:	e8 9d fc ff ff       	call   f3 <syscall>
 456:	83 c4 18             	add    $0x18,%esp
 459:	90                   	nop
 45a:	c9                   	leave  
 45b:	c3                   	ret    

0000045c <sem_init>:
 45c:	55                   	push   %ebp
 45d:	89 e5                	mov    %esp,%ebp
 45f:	8b 45 08             	mov    0x8(%ebp),%eax
 462:	6a 00                	push   $0x0
 464:	6a 00                	push   $0x0
 466:	6a 00                	push   $0x0
 468:	ff 75 0c             	pushl  0xc(%ebp)
 46b:	50                   	push   %eax
 46c:	6a 05                	push   $0x5
 46e:	e8 80 fc ff ff       	call   f3 <syscall>
 473:	83 c4 18             	add    $0x18,%esp
 476:	c9                   	leave  
 477:	c3                   	ret    

00000478 <sem_post>:
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	8b 45 08             	mov    0x8(%ebp),%eax
 47e:	6a 00                	push   $0x0
 480:	6a 00                	push   $0x0
 482:	6a 00                	push   $0x0
 484:	6a 00                	push   $0x0
 486:	50                   	push   %eax
 487:	6a 06                	push   $0x6
 489:	e8 65 fc ff ff       	call   f3 <syscall>
 48e:	83 c4 18             	add    $0x18,%esp
 491:	c9                   	leave  
 492:	c3                   	ret    

00000493 <sem_wait>:
 493:	55                   	push   %ebp
 494:	89 e5                	mov    %esp,%ebp
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	6a 00                	push   $0x0
 49b:	6a 00                	push   $0x0
 49d:	6a 00                	push   $0x0
 49f:	6a 00                	push   $0x0
 4a1:	50                   	push   %eax
 4a2:	6a 07                	push   $0x7
 4a4:	e8 4a fc ff ff       	call   f3 <syscall>
 4a9:	83 c4 18             	add    $0x18,%esp
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <sem_destroy>:
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	6a 00                	push   $0x0
 4b6:	6a 00                	push   $0x0
 4b8:	6a 00                	push   $0x0
 4ba:	6a 00                	push   $0x0
 4bc:	50                   	push   %eax
 4bd:	6a 08                	push   $0x8
 4bf:	e8 2f fc ff ff       	call   f3 <syscall>
 4c4:	83 c4 18             	add    $0x18,%esp
 4c7:	c9                   	leave  
 4c8:	c3                   	ret    

000004c9 <ls>:
 4c9:	55                   	push   %ebp
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	8b 45 08             	mov    0x8(%ebp),%eax
 4cf:	6a 00                	push   $0x0
 4d1:	6a 00                	push   $0x0
 4d3:	6a 00                	push   $0x0
 4d5:	6a 00                	push   $0x0
 4d7:	50                   	push   %eax
 4d8:	6a 09                	push   $0x9
 4da:	e8 14 fc ff ff       	call   f3 <syscall>
 4df:	83 c4 18             	add    $0x18,%esp
 4e2:	90                   	nop
 4e3:	c9                   	leave  
 4e4:	c3                   	ret    

000004e5 <open>:
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	8b 55 0c             	mov    0xc(%ebp),%edx
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	6a 00                	push   $0x0
 4f0:	6a 00                	push   $0x0
 4f2:	6a 00                	push   $0x0
 4f4:	52                   	push   %edx
 4f5:	50                   	push   %eax
 4f6:	6a 0a                	push   $0xa
 4f8:	e8 f6 fb ff ff       	call   f3 <syscall>
 4fd:	83 c4 18             	add    $0x18,%esp
 500:	c9                   	leave  
 501:	c3                   	ret    

00000502 <write>:
 502:	55                   	push   %ebp
 503:	89 e5                	mov    %esp,%ebp
 505:	8b 4d 10             	mov    0x10(%ebp),%ecx
 508:	8b 55 0c             	mov    0xc(%ebp),%edx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	6a 00                	push   $0x0
 510:	6a 00                	push   $0x0
 512:	51                   	push   %ecx
 513:	52                   	push   %edx
 514:	50                   	push   %eax
 515:	6a 0b                	push   $0xb
 517:	e8 d7 fb ff ff       	call   f3 <syscall>
 51c:	83 c4 18             	add    $0x18,%esp
 51f:	c9                   	leave  
 520:	c3                   	ret    

00000521 <close>:
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	6a 00                	push   $0x0
 529:	6a 00                	push   $0x0
 52b:	6a 00                	push   $0x0
 52d:	6a 00                	push   $0x0
 52f:	50                   	push   %eax
 530:	6a 0d                	push   $0xd
 532:	e8 bc fb ff ff       	call   f3 <syscall>
 537:	83 c4 18             	add    $0x18,%esp
 53a:	90                   	nop
 53b:	c9                   	leave  
 53c:	c3                   	ret    

0000053d <cat>:
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	6a 00                	push   $0x0
 545:	6a 00                	push   $0x0
 547:	6a 00                	push   $0x0
 549:	6a 00                	push   $0x0
 54b:	50                   	push   %eax
 54c:	6a 0c                	push   $0xc
 54e:	e8 a0 fb ff ff       	call   f3 <syscall>
 553:	83 c4 18             	add    $0x18,%esp
 556:	90                   	nop
 557:	c9                   	leave  
 558:	c3                   	ret    

Disassembly of section .rodata:

0000055c <.rodata>:
 55c:	2f                   	das    
 55d:	00 2f                	add    %ch,(%edi)
 55f:	73 62                	jae    5c3 <cat+0x86>
 561:	69 6e 2f 00 2f 64 65 	imul   $0x65642f00,0x2f(%esi),%ebp
 568:	76 2f                	jbe    599 <cat+0x5c>
 56a:	00 2f                	add    %ch,(%edi)
 56c:	75 73                	jne    5e1 <cat+0xa4>
 56e:	72 2f                	jb     59f <cat+0x62>
 570:	00 00                	add    %al,(%eax)
 572:	00 00                	add    %al,(%eax)
 574:	63 72 65             	arpl   %si,0x65(%edx)
 577:	61                   	popa   
 578:	74 65                	je     5df <cat+0xa2>
 57a:	20 2f                	and    %ch,(%edi)
 57c:	75 73                	jne    5f1 <cat+0xb4>
 57e:	72 2f                	jb     5af <cat+0x72>
 580:	74 65                	je     5e7 <cat+0xaa>
 582:	73 74                	jae    5f8 <cat+0xbb>
 584:	20 61 6e             	and    %ah,0x6e(%ecx)
 587:	64 20 77 72          	and    %dh,%fs:0x72(%edi)
 58b:	69 74 65 20 61 6c 70 	imul   $0x68706c61,0x20(%ebp,%eiz,2),%esi
 592:	68 
 593:	61                   	popa   
 594:	62 65 74             	bound  %esp,0x74(%ebp)
 597:	73 20                	jae    5b9 <cat+0x7c>
 599:	74 6f                	je     60a <cat+0xcd>
 59b:	20 69 74             	and    %ch,0x74(%ecx)
 59e:	0a 00                	or     (%eax),%al
 5a0:	2f                   	das    
 5a1:	75 73                	jne    616 <cat+0xd9>
 5a3:	72 2f                	jb     5d4 <cat+0x97>
 5a5:	74 65                	je     60c <cat+0xcf>
 5a7:	73 74                	jae    61d <cat+0xe0>
 5a9:	00 2d 32 31 34 37    	add    %ch,0x37343132
 5af:	34 38                	xor    $0x38,%al
 5b1:	33 37                	xor    (%edi),%esi
 5b3:	34 38                	xor    $0x38,%al
	...

Disassembly of section .eh_frame:

000005b8 <__bss_start-0x1288>:
 5b8:	14 00                	adc    $0x0,%al
 5ba:	00 00                	add    %al,(%eax)
 5bc:	00 00                	add    %al,(%eax)
 5be:	00 00                	add    %al,(%eax)
 5c0:	01 7a 52             	add    %edi,0x52(%edx)
 5c3:	00 01                	add    %al,(%ecx)
 5c5:	7c 08                	jl     5cf <cat+0x92>
 5c7:	01 1b                	add    %ebx,(%ebx)
 5c9:	0c 04                	or     $0x4,%al
 5cb:	04 88                	add    $0x88,%al
 5cd:	01 00                	add    %eax,(%eax)
 5cf:	00 1c 00             	add    %bl,(%eax,%eax,1)
 5d2:	00 00                	add    %al,(%eax)
 5d4:	1c 00                	sbb    $0x0,%al
 5d6:	00 00                	add    %al,(%eax)
 5d8:	28 fa                	sub    %bh,%dl
 5da:	ff                   	(bad)  
 5db:	ff f3                	push   %ebx
 5dd:	00 00                	add    %al,(%eax)
 5df:	00 00                	add    %al,(%eax)
 5e1:	41                   	inc    %ecx
 5e2:	0e                   	push   %cs
 5e3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 5e9:	02 ef                	add    %bh,%ch
 5eb:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 5ee:	04 00                	add    $0x0,%al
 5f0:	28 00                	sub    %al,(%eax)
 5f2:	00 00                	add    %al,(%eax)
 5f4:	3c 00                	cmp    $0x0,%al
 5f6:	00 00                	add    %al,(%eax)
 5f8:	fb                   	sti    
 5f9:	fa                   	cli    
 5fa:	ff                   	(bad)  
 5fb:	ff 32                	pushl  (%edx)
 5fd:	00 00                	add    %al,(%eax)
 5ff:	00 00                	add    %al,(%eax)
 601:	41                   	inc    %ecx
 602:	0e                   	push   %cs
 603:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 609:	46                   	inc    %esi
 60a:	87 03                	xchg   %eax,(%ebx)
 60c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
 60f:	05 65 c3 41 c6       	add    $0xc641c365,%eax
 614:	41                   	inc    %ecx
 615:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
 61c:	1c 00                	sbb    $0x0,%al
 61e:	00 00                	add    %al,(%eax)
 620:	68 00 00 00 01       	push   $0x1000000
 625:	fb                   	sti    
 626:	ff                   	(bad)  
 627:	ff 25 00 00 00 00    	jmp    *0x0
 62d:	41                   	inc    %ecx
 62e:	0e                   	push   %cs
 62f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 635:	61                   	popa   
 636:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 639:	04 00                	add    $0x0,%al
 63b:	00 1c 00             	add    %bl,(%eax,%eax,1)
 63e:	00 00                	add    %al,(%eax)
 640:	88 00                	mov    %al,(%eax)
 642:	00 00                	add    %al,(%eax)
 644:	06                   	push   %es
 645:	fb                   	sti    
 646:	ff                   	(bad)  
 647:	ff                   	(bad)  
 648:	3b 00                	cmp    (%eax),%eax
 64a:	00 00                	add    %al,(%eax)
 64c:	00 41 0e             	add    %al,0xe(%ecx)
 64f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 655:	77 c5                	ja     61c <cat+0xdf>
 657:	0c 04                	or     $0x4,%al
 659:	04 00                	add    $0x0,%al
 65b:	00 20                	add    %ah,(%eax)
 65d:	00 00                	add    %al,(%eax)
 65f:	00 a8 00 00 00 21    	add    %ch,0x21000000(%eax)
 665:	fb                   	sti    
 666:	ff                   	(bad)  
 667:	ff b7 00 00 00 00    	pushl  0x0(%edi)
 66d:	41                   	inc    %ecx
 66e:	0e                   	push   %cs
 66f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 675:	44                   	inc    %esp
 676:	83 03 02             	addl   $0x2,(%ebx)
 679:	af                   	scas   %es:(%edi),%eax
 67a:	c5 c3 0c             	(bad)  
 67d:	04 04                	add    $0x4,%al
 67f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 682:	00 00                	add    %al,(%eax)
 684:	cc                   	int3   
 685:	00 00                	add    %al,(%eax)
 687:	00 b4 fb ff ff 8b 00 	add    %dh,0x8bffff(%ebx,%edi,8)
 68e:	00 00                	add    %al,(%eax)
 690:	00 41 0e             	add    %al,0xe(%ecx)
 693:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 699:	02 87 c5 0c 04 04    	add    0x4040cc5(%edi),%al
 69f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 6a2:	00 00                	add    %al,(%eax)
 6a4:	ec                   	in     (%dx),%al
 6a5:	00 00                	add    %al,(%eax)
 6a7:	00 1f                	add    %bl,(%edi)
 6a9:	fc                   	cld    
 6aa:	ff                   	(bad)  
 6ab:	ff 47 01             	incl   0x1(%edi)
 6ae:	00 00                	add    %al,(%eax)
 6b0:	00 41 0e             	add    %al,0xe(%ecx)
 6b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 6b9:	03 43 01             	add    0x1(%ebx),%eax
 6bc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 6bf:	04 1c                	add    $0x1c,%al
 6c1:	00 00                	add    %al,(%eax)
 6c3:	00 0c 01             	add    %cl,(%ecx,%eax,1)
 6c6:	00 00                	add    %al,(%eax)
 6c8:	46                   	inc    %esi
 6c9:	fd                   	std    
 6ca:	ff                   	(bad)  
 6cb:	ff 19                	lcall  *(%ecx)
 6cd:	00 00                	add    %al,(%eax)
 6cf:	00 00                	add    %al,(%eax)
 6d1:	41                   	inc    %ecx
 6d2:	0e                   	push   %cs
 6d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 6d9:	55                   	push   %ebp
 6da:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 6dd:	04 00                	add    $0x0,%al
 6df:	00 1c 00             	add    %bl,(%eax,%eax,1)
 6e2:	00 00                	add    %al,(%eax)
 6e4:	2c 01                	sub    $0x1,%al
 6e6:	00 00                	add    %al,(%eax)
 6e8:	3f                   	aas    
 6e9:	fd                   	std    
 6ea:	ff                   	(bad)  
 6eb:	ff 1b                	lcall  *(%ebx)
 6ed:	00 00                	add    %al,(%eax)
 6ef:	00 00                	add    %al,(%eax)
 6f1:	41                   	inc    %ecx
 6f2:	0e                   	push   %cs
 6f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 6f9:	57                   	push   %edi
 6fa:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 6fd:	04 00                	add    $0x0,%al
 6ff:	00 1c 00             	add    %bl,(%eax,%eax,1)
 702:	00 00                	add    %al,(%eax)
 704:	4c                   	dec    %esp
 705:	01 00                	add    %eax,(%eax)
 707:	00 3a                	add    %bh,(%edx)
 709:	fd                   	std    
 70a:	ff                   	(bad)  
 70b:	ff 1a                	lcall  *(%edx)
 70d:	00 00                	add    %al,(%eax)
 70f:	00 00                	add    %al,(%eax)
 711:	41                   	inc    %ecx
 712:	0e                   	push   %cs
 713:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 719:	56                   	push   %esi
 71a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 71d:	04 00                	add    $0x0,%al
 71f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 722:	00 00                	add    %al,(%eax)
 724:	6c                   	insb   (%dx),%es:(%edi)
 725:	01 00                	add    %eax,(%eax)
 727:	00 34 fd ff ff 1c 00 	add    %dh,0x1cffff(,%edi,8)
 72e:	00 00                	add    %al,(%eax)
 730:	00 41 0e             	add    %al,0xe(%ecx)
 733:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 739:	58                   	pop    %eax
 73a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 73d:	04 00                	add    $0x0,%al
 73f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 742:	00 00                	add    %al,(%eax)
 744:	8c 01                	mov    %es,(%ecx)
 746:	00 00                	add    %al,(%eax)
 748:	30 fd                	xor    %bh,%ch
 74a:	ff                   	(bad)  
 74b:	ff 1b                	lcall  *(%ebx)
 74d:	00 00                	add    %al,(%eax)
 74f:	00 00                	add    %al,(%eax)
 751:	41                   	inc    %ecx
 752:	0e                   	push   %cs
 753:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 759:	57                   	push   %edi
 75a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 75d:	04 00                	add    $0x0,%al
 75f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 762:	00 00                	add    %al,(%eax)
 764:	ac                   	lods   %ds:(%esi),%al
 765:	01 00                	add    %eax,(%eax)
 767:	00 2b                	add    %ch,(%ebx)
 769:	fd                   	std    
 76a:	ff                   	(bad)  
 76b:	ff 1b                	lcall  *(%ebx)
 76d:	00 00                	add    %al,(%eax)
 76f:	00 00                	add    %al,(%eax)
 771:	41                   	inc    %ecx
 772:	0e                   	push   %cs
 773:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 779:	57                   	push   %edi
 77a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 77d:	04 00                	add    $0x0,%al
 77f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 782:	00 00                	add    %al,(%eax)
 784:	cc                   	int3   
 785:	01 00                	add    %eax,(%eax)
 787:	00 26                	add    %ah,(%esi)
 789:	fd                   	std    
 78a:	ff                   	(bad)  
 78b:	ff 1b                	lcall  *(%ebx)
 78d:	00 00                	add    %al,(%eax)
 78f:	00 00                	add    %al,(%eax)
 791:	41                   	inc    %ecx
 792:	0e                   	push   %cs
 793:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 799:	57                   	push   %edi
 79a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 79d:	04 00                	add    $0x0,%al
 79f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 7a2:	00 00                	add    %al,(%eax)
 7a4:	ec                   	in     (%dx),%al
 7a5:	01 00                	add    %eax,(%eax)
 7a7:	00 21                	add    %ah,(%ecx)
 7a9:	fd                   	std    
 7aa:	ff                   	(bad)  
 7ab:	ff 1c 00             	lcall  *(%eax,%eax,1)
 7ae:	00 00                	add    %al,(%eax)
 7b0:	00 41 0e             	add    %al,0xe(%ecx)
 7b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 7b9:	58                   	pop    %eax
 7ba:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 7bd:	04 00                	add    $0x0,%al
 7bf:	00 1c 00             	add    %bl,(%eax,%eax,1)
 7c2:	00 00                	add    %al,(%eax)
 7c4:	0c 02                	or     $0x2,%al
 7c6:	00 00                	add    %al,(%eax)
 7c8:	1d fd ff ff 1d       	sbb    $0x1dfffffd,%eax
 7cd:	00 00                	add    %al,(%eax)
 7cf:	00 00                	add    %al,(%eax)
 7d1:	41                   	inc    %ecx
 7d2:	0e                   	push   %cs
 7d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 7d9:	59                   	pop    %ecx
 7da:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 7dd:	04 00                	add    $0x0,%al
 7df:	00 1c 00             	add    %bl,(%eax,%eax,1)
 7e2:	00 00                	add    %al,(%eax)
 7e4:	2c 02                	sub    $0x2,%al
 7e6:	00 00                	add    %al,(%eax)
 7e8:	1a fd                	sbb    %ch,%bh
 7ea:	ff                   	(bad)  
 7eb:	ff 1f                	lcall  *(%edi)
 7ed:	00 00                	add    %al,(%eax)
 7ef:	00 00                	add    %al,(%eax)
 7f1:	41                   	inc    %ecx
 7f2:	0e                   	push   %cs
 7f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 7f9:	5b                   	pop    %ebx
 7fa:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 7fd:	04 00                	add    $0x0,%al
 7ff:	00 1c 00             	add    %bl,(%eax,%eax,1)
 802:	00 00                	add    %al,(%eax)
 804:	4c                   	dec    %esp
 805:	02 00                	add    (%eax),%al
 807:	00 19                	add    %bl,(%ecx)
 809:	fd                   	std    
 80a:	ff                   	(bad)  
 80b:	ff 1c 00             	lcall  *(%eax,%eax,1)
 80e:	00 00                	add    %al,(%eax)
 810:	00 41 0e             	add    %al,0xe(%ecx)
 813:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 819:	58                   	pop    %eax
 81a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 81d:	04 00                	add    $0x0,%al
 81f:	00 1c 00             	add    %bl,(%eax,%eax,1)
 822:	00 00                	add    %al,(%eax)
 824:	6c                   	insb   (%dx),%es:(%edi)
 825:	02 00                	add    (%eax),%al
 827:	00 15 fd ff ff 1c    	add    %dl,0x1cfffffd
 82d:	00 00                	add    %al,(%eax)
 82f:	00 00                	add    %al,(%eax)
 831:	41                   	inc    %ecx
 832:	0e                   	push   %cs
 833:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 839:	58                   	pop    %eax
 83a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 83d:	04 00                	add    $0x0,%al
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

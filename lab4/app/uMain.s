
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00000000 <uEntry>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
   6:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
   d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  14:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
  1b:	83 ec 0c             	sub    $0xc,%esp
  1e:	68 1c 05 00 00       	push   $0x51c
  23:	e8 f1 02 00 00       	call   319 <printf>
  28:	83 c4 10             	add    $0x10,%esp
  2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2e:	83 ec 08             	sub    $0x8,%esp
  31:	50                   	push   %eax
  32:	8d 45 e8             	lea    -0x18(%ebp),%eax
  35:	50                   	push   %eax
  36:	e8 73 04 00 00       	call   4ae <sem_init>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  41:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  45:	75 15                	jne    5c <uEntry+0x5c>
  47:	83 ec 0c             	sub    $0xc,%esp
  4a:	68 48 05 00 00       	push   $0x548
  4f:	e8 c5 02 00 00       	call   319 <printf>
  54:	83 c4 10             	add    $0x10,%esp
  57:	e8 38 04 00 00       	call   494 <exit>
  5c:	e8 ff 03 00 00       	call   460 <fork>
  61:	89 45 f0             	mov    %eax,-0x10(%ebp)
  64:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  68:	75 60                	jne    ca <uEntry+0xca>
  6a:	eb 32                	jmp    9e <uEntry+0x9e>
  6c:	ff 4d f4             	decl   -0xc(%ebp)
  6f:	83 ec 0c             	sub    $0xc,%esp
  72:	68 78 05 00 00       	push   $0x578
  77:	e8 9d 02 00 00       	call   319 <printf>
  7c:	83 c4 10             	add    $0x10,%esp
  7f:	83 ec 0c             	sub    $0xc,%esp
  82:	8d 45 e8             	lea    -0x18(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 5a 04 00 00       	call   4e5 <sem_wait>
  8b:	83 c4 10             	add    $0x10,%esp
  8e:	83 ec 0c             	sub    $0xc,%esp
  91:	68 9c 05 00 00       	push   $0x59c
  96:	e8 7e 02 00 00       	call   319 <printf>
  9b:	83 c4 10             	add    $0x10,%esp
  9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a2:	75 c8                	jne    6c <uEntry+0x6c>
  a4:	83 ec 0c             	sub    $0xc,%esp
  a7:	68 c0 05 00 00       	push   $0x5c0
  ac:	e8 68 02 00 00       	call   319 <printf>
  b1:	83 c4 10             	add    $0x10,%esp
  b4:	83 ec 0c             	sub    $0xc,%esp
  b7:	8d 45 e8             	lea    -0x18(%ebp),%eax
  ba:	50                   	push   %eax
  bb:	e8 40 04 00 00       	call   500 <sem_destroy>
  c0:	83 c4 10             	add    $0x10,%esp
  c3:	e8 cc 03 00 00       	call   494 <exit>
  c8:	eb 74                	jmp    13e <uEntry+0x13e>
  ca:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  ce:	74 6e                	je     13e <uEntry+0x13e>
  d0:	eb 42                	jmp    114 <uEntry+0x114>
  d2:	ff 4d f4             	decl   -0xc(%ebp)
  d5:	83 ec 0c             	sub    $0xc,%esp
  d8:	68 e6 05 00 00       	push   $0x5e6
  dd:	e8 37 02 00 00       	call   319 <printf>
  e2:	83 c4 10             	add    $0x10,%esp
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	68 80 00 00 00       	push   $0x80
  ed:	e8 87 03 00 00       	call   479 <sleep>
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	68 04 06 00 00       	push   $0x604
  fd:	e8 17 02 00 00       	call   319 <printf>
 102:	83 c4 10             	add    $0x10,%esp
 105:	83 ec 0c             	sub    $0xc,%esp
 108:	8d 45 e8             	lea    -0x18(%ebp),%eax
 10b:	50                   	push   %eax
 10c:	e8 b9 03 00 00       	call   4ca <sem_post>
 111:	83 c4 10             	add    $0x10,%esp
 114:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 118:	75 b8                	jne    d2 <uEntry+0xd2>
 11a:	83 ec 0c             	sub    $0xc,%esp
 11d:	68 28 06 00 00       	push   $0x628
 122:	e8 f2 01 00 00       	call   319 <printf>
 127:	83 c4 10             	add    $0x10,%esp
 12a:	83 ec 0c             	sub    $0xc,%esp
 12d:	8d 45 e8             	lea    -0x18(%ebp),%eax
 130:	50                   	push   %eax
 131:	e8 ca 03 00 00       	call   500 <sem_destroy>
 136:	83 c4 10             	add    $0x10,%esp
 139:	e8 56 03 00 00       	call   494 <exit>
 13e:	b8 00 00 00 00       	mov    $0x0,%eax
 143:	c9                   	leave  
 144:	c3                   	ret    

00000145 <syscall>:
 145:	55                   	push   %ebp
 146:	89 e5                	mov    %esp,%ebp
 148:	57                   	push   %edi
 149:	56                   	push   %esi
 14a:	53                   	push   %ebx
 14b:	83 ec 10             	sub    $0x10,%esp
 14e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 155:	8b 45 08             	mov    0x8(%ebp),%eax
 158:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 15b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15e:	8b 55 14             	mov    0x14(%ebp),%edx
 161:	8b 75 18             	mov    0x18(%ebp),%esi
 164:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 167:	cd 80                	int    $0x80
 169:	89 45 f0             	mov    %eax,-0x10(%ebp)
 16c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 16f:	83 c4 10             	add    $0x10,%esp
 172:	5b                   	pop    %ebx
 173:	5e                   	pop    %esi
 174:	5f                   	pop    %edi
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    

00000177 <printChar>:
 177:	55                   	push   %ebp
 178:	89 e5                	mov    %esp,%ebp
 17a:	83 ec 04             	sub    $0x4,%esp
 17d:	8b 45 08             	mov    0x8(%ebp),%eax
 180:	88 45 fc             	mov    %al,-0x4(%ebp)
 183:	8d 45 fc             	lea    -0x4(%ebp),%eax
 186:	6a 00                	push   $0x0
 188:	6a 00                	push   $0x0
 18a:	6a 01                	push   $0x1
 18c:	50                   	push   %eax
 18d:	6a 01                	push   $0x1
 18f:	6a 04                	push   $0x4
 191:	e8 af ff ff ff       	call   145 <syscall>
 196:	83 c4 18             	add    $0x18,%esp
 199:	90                   	nop
 19a:	c9                   	leave  
 19b:	c3                   	ret    

0000019c <printString>:
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 10             	sub    $0x10,%esp
 1a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1a9:	eb 03                	jmp    1ae <printString+0x12>
 1ab:	ff 45 fc             	incl   -0x4(%ebp)
 1ae:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	01 d0                	add    %edx,%eax
 1b6:	8a 00                	mov    (%eax),%al
 1b8:	84 c0                	test   %al,%al
 1ba:	75 ef                	jne    1ab <printString+0xf>
 1bc:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	6a 00                	push   $0x0
 1c4:	6a 00                	push   $0x0
 1c6:	52                   	push   %edx
 1c7:	50                   	push   %eax
 1c8:	6a 01                	push   $0x1
 1ca:	6a 04                	push   $0x4
 1cc:	e8 74 ff ff ff       	call   145 <syscall>
 1d1:	83 c4 18             	add    $0x18,%esp
 1d4:	90                   	nop
 1d5:	c9                   	leave  
 1d6:	c3                   	ret    

000001d7 <printDemical>:
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	53                   	push   %ebx
 1db:	83 ec 10             	sub    $0x10,%esp
 1de:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
 1e5:	75 12                	jne    1f9 <printDemical+0x22>
 1e7:	68 4f 06 00 00       	push   $0x64f
 1ec:	e8 ab ff ff ff       	call   19c <printString>
 1f1:	83 c4 04             	add    $0x4,%esp
 1f4:	e9 90 00 00 00       	jmp    289 <printDemical+0xb2>
 1f9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1fd:	75 0c                	jne    20b <printDemical+0x34>
 1ff:	6a 30                	push   $0x30
 201:	e8 71 ff ff ff       	call   177 <printChar>
 206:	83 c4 04             	add    $0x4,%esp
 209:	eb 7e                	jmp    289 <printDemical+0xb2>
 20b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 20f:	79 0d                	jns    21e <printDemical+0x47>
 211:	f7 5d 08             	negl   0x8(%ebp)
 214:	6a 2d                	push   $0x2d
 216:	e8 5c ff ff ff       	call   177 <printChar>
 21b:	83 c4 04             	add    $0x4,%esp
 21e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 225:	eb 3a                	jmp    261 <printDemical+0x8a>
 227:	ff 45 f8             	incl   -0x8(%ebp)
 22a:	b8 0a 00 00 00       	mov    $0xa,%eax
 22f:	2b 45 f8             	sub    -0x8(%ebp),%eax
 232:	89 c1                	mov    %eax,%ecx
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	bb 0a 00 00 00       	mov    $0xa,%ebx
 23c:	99                   	cltd   
 23d:	f7 fb                	idiv   %ebx
 23f:	89 d0                	mov    %edx,%eax
 241:	83 c0 30             	add    $0x30,%eax
 244:	88 44 0d ee          	mov    %al,-0x12(%ebp,%ecx,1)
 248:	8b 4d 08             	mov    0x8(%ebp),%ecx
 24b:	b8 67 66 66 66       	mov    $0x66666667,%eax
 250:	f7 e9                	imul   %ecx
 252:	c1 fa 02             	sar    $0x2,%edx
 255:	89 c8                	mov    %ecx,%eax
 257:	c1 f8 1f             	sar    $0x1f,%eax
 25a:	29 c2                	sub    %eax,%edx
 25c:	89 d0                	mov    %edx,%eax
 25e:	89 45 08             	mov    %eax,0x8(%ebp)
 261:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 265:	7f c0                	jg     227 <printDemical+0x50>
 267:	8b 45 f8             	mov    -0x8(%ebp),%eax
 26a:	ba 0a 00 00 00       	mov    $0xa,%edx
 26f:	2b 55 f8             	sub    -0x8(%ebp),%edx
 272:	8d 4d ee             	lea    -0x12(%ebp),%ecx
 275:	01 ca                	add    %ecx,%edx
 277:	6a 00                	push   $0x0
 279:	6a 00                	push   $0x0
 27b:	50                   	push   %eax
 27c:	52                   	push   %edx
 27d:	6a 01                	push   $0x1
 27f:	6a 04                	push   $0x4
 281:	e8 bf fe ff ff       	call   145 <syscall>
 286:	83 c4 18             	add    $0x18,%esp
 289:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28c:	c9                   	leave  
 28d:	c3                   	ret    

0000028e <printHex>:
 28e:	55                   	push   %ebp
 28f:	89 e5                	mov    %esp,%ebp
 291:	83 ec 10             	sub    $0x10,%esp
 294:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 298:	75 0c                	jne    2a6 <printHex+0x18>
 29a:	6a 30                	push   $0x30
 29c:	e8 d6 fe ff ff       	call   177 <printChar>
 2a1:	83 c4 04             	add    $0x4,%esp
 2a4:	eb 71                	jmp    317 <printHex+0x89>
 2a6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2ad:	eb 40                	jmp    2ef <printHex+0x61>
 2af:	8b 45 08             	mov    0x8(%ebp),%eax
 2b2:	83 e0 0f             	and    $0xf,%eax
 2b5:	83 f8 09             	cmp    $0x9,%eax
 2b8:	77 0e                	ja     2c8 <printHex+0x3a>
 2ba:	8b 45 08             	mov    0x8(%ebp),%eax
 2bd:	83 e0 0f             	and    $0xf,%eax
 2c0:	83 c0 30             	add    $0x30,%eax
 2c3:	88 45 fb             	mov    %al,-0x5(%ebp)
 2c6:	eb 0c                	jmp    2d4 <printHex+0x46>
 2c8:	8b 45 08             	mov    0x8(%ebp),%eax
 2cb:	83 e0 0f             	and    $0xf,%eax
 2ce:	83 c0 57             	add    $0x57,%eax
 2d1:	88 45 fb             	mov    %al,-0x5(%ebp)
 2d4:	ff 45 fc             	incl   -0x4(%ebp)
 2d7:	b8 08 00 00 00       	mov    $0x8,%eax
 2dc:	2b 45 fc             	sub    -0x4(%ebp),%eax
 2df:	8a 55 fb             	mov    -0x5(%ebp),%dl
 2e2:	88 54 05 f3          	mov    %dl,-0xd(%ebp,%eax,1)
 2e6:	8b 45 08             	mov    0x8(%ebp),%eax
 2e9:	c1 e8 04             	shr    $0x4,%eax
 2ec:	89 45 08             	mov    %eax,0x8(%ebp)
 2ef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2f3:	75 ba                	jne    2af <printHex+0x21>
 2f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2f8:	ba 08 00 00 00       	mov    $0x8,%edx
 2fd:	2b 55 fc             	sub    -0x4(%ebp),%edx
 300:	8d 4d f3             	lea    -0xd(%ebp),%ecx
 303:	01 ca                	add    %ecx,%edx
 305:	6a 00                	push   $0x0
 307:	6a 00                	push   $0x0
 309:	50                   	push   %eax
 30a:	52                   	push   %edx
 30b:	6a 01                	push   $0x1
 30d:	6a 04                	push   $0x4
 30f:	e8 31 fe ff ff       	call   145 <syscall>
 314:	83 c4 18             	add    $0x18,%esp
 317:	c9                   	leave  
 318:	c3                   	ret    

00000319 <printf>:
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	81 ec e0 00 00 00    	sub    $0xe0,%esp
 322:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 326:	0f 84 2e 01 00 00    	je     45a <printf+0x141>
 32c:	8d 45 0c             	lea    0xc(%ebp),%eax
 32f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 332:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 338:	89 45 fc             	mov    %eax,-0x4(%ebp)
 33b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 342:	e9 ff 00 00 00       	jmp    446 <printf+0x12d>
 347:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 34d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 350:	eb 15                	jmp    367 <printf+0x4e>
 352:	8b 55 f8             	mov    -0x8(%ebp),%edx
 355:	8b 45 08             	mov    0x8(%ebp),%eax
 358:	01 d0                	add    %edx,%eax
 35a:	8a 10                	mov    (%eax),%dl
 35c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 35f:	88 10                	mov    %dl,(%eax)
 361:	ff 45 fc             	incl   -0x4(%ebp)
 364:	ff 45 f8             	incl   -0x8(%ebp)
 367:	8b 55 f8             	mov    -0x8(%ebp),%edx
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	01 d0                	add    %edx,%eax
 36f:	8a 00                	mov    (%eax),%al
 371:	3c 25                	cmp    $0x25,%al
 373:	74 0e                	je     383 <printf+0x6a>
 375:	8b 55 f8             	mov    -0x8(%ebp),%edx
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	01 d0                	add    %edx,%eax
 37d:	8a 00                	mov    (%eax),%al
 37f:	84 c0                	test   %al,%al
 381:	75 cf                	jne    352 <printf+0x39>
 383:	8b 55 fc             	mov    -0x4(%ebp),%edx
 386:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 38c:	29 c2                	sub    %eax,%edx
 38e:	89 d0                	mov    %edx,%eax
 390:	89 c2                	mov    %eax,%edx
 392:	8d 85 2c ff ff ff    	lea    -0xd4(%ebp),%eax
 398:	6a 00                	push   $0x0
 39a:	6a 00                	push   $0x0
 39c:	52                   	push   %edx
 39d:	50                   	push   %eax
 39e:	6a 01                	push   $0x1
 3a0:	6a 04                	push   $0x4
 3a2:	e8 9e fd ff ff       	call   145 <syscall>
 3a7:	83 c4 18             	add    $0x18,%esp
 3aa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
 3b0:	01 d0                	add    %edx,%eax
 3b2:	8a 00                	mov    (%eax),%al
 3b4:	84 c0                	test   %al,%al
 3b6:	0f 84 a1 00 00 00    	je     45d <printf+0x144>
 3bc:	ff 45 f8             	incl   -0x8(%ebp)
 3bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	01 d0                	add    %edx,%eax
 3c7:	8a 00                	mov    (%eax),%al
 3c9:	0f be c0             	movsbl %al,%eax
 3cc:	83 f8 64             	cmp    $0x64,%eax
 3cf:	74 31                	je     402 <printf+0xe9>
 3d1:	83 f8 64             	cmp    $0x64,%eax
 3d4:	7f 07                	jg     3dd <printf+0xc4>
 3d6:	83 f8 63             	cmp    $0x63,%eax
 3d9:	74 0e                	je     3e9 <printf+0xd0>
 3db:	eb 66                	jmp    443 <printf+0x12a>
 3dd:	83 f8 73             	cmp    $0x73,%eax
 3e0:	74 4c                	je     42e <printf+0x115>
 3e2:	83 f8 78             	cmp    $0x78,%eax
 3e5:	74 31                	je     418 <printf+0xff>
 3e7:	eb 5a                	jmp    443 <printf+0x12a>
 3e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ec:	8d 50 04             	lea    0x4(%eax),%edx
 3ef:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f2:	8b 00                	mov    (%eax),%eax
 3f4:	0f be c0             	movsbl %al,%eax
 3f7:	50                   	push   %eax
 3f8:	e8 7a fd ff ff       	call   177 <printChar>
 3fd:	83 c4 04             	add    $0x4,%esp
 400:	eb 41                	jmp    443 <printf+0x12a>
 402:	8b 45 f4             	mov    -0xc(%ebp),%eax
 405:	8d 50 04             	lea    0x4(%eax),%edx
 408:	89 55 f4             	mov    %edx,-0xc(%ebp)
 40b:	8b 00                	mov    (%eax),%eax
 40d:	50                   	push   %eax
 40e:	e8 c4 fd ff ff       	call   1d7 <printDemical>
 413:	83 c4 04             	add    $0x4,%esp
 416:	eb 2b                	jmp    443 <printf+0x12a>
 418:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41b:	8d 50 04             	lea    0x4(%eax),%edx
 41e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 421:	8b 00                	mov    (%eax),%eax
 423:	50                   	push   %eax
 424:	e8 65 fe ff ff       	call   28e <printHex>
 429:	83 c4 04             	add    $0x4,%esp
 42c:	eb 15                	jmp    443 <printf+0x12a>
 42e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 431:	8d 50 04             	lea    0x4(%eax),%edx
 434:	89 55 f4             	mov    %edx,-0xc(%ebp)
 437:	8b 00                	mov    (%eax),%eax
 439:	50                   	push   %eax
 43a:	e8 5d fd ff ff       	call   19c <printString>
 43f:	83 c4 04             	add    $0x4,%esp
 442:	90                   	nop
 443:	ff 45 f8             	incl   -0x8(%ebp)
 446:	8b 55 f8             	mov    -0x8(%ebp),%edx
 449:	8b 45 08             	mov    0x8(%ebp),%eax
 44c:	01 d0                	add    %edx,%eax
 44e:	8a 00                	mov    (%eax),%al
 450:	84 c0                	test   %al,%al
 452:	0f 85 ef fe ff ff    	jne    347 <printf+0x2e>
 458:	eb 04                	jmp    45e <printf+0x145>
 45a:	90                   	nop
 45b:	eb 01                	jmp    45e <printf+0x145>
 45d:	90                   	nop
 45e:	c9                   	leave  
 45f:	c3                   	ret    

00000460 <fork>:
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	6a 00                	push   $0x0
 465:	6a 00                	push   $0x0
 467:	6a 00                	push   $0x0
 469:	6a 00                	push   $0x0
 46b:	6a 00                	push   $0x0
 46d:	6a 01                	push   $0x1
 46f:	e8 d1 fc ff ff       	call   145 <syscall>
 474:	83 c4 18             	add    $0x18,%esp
 477:	c9                   	leave  
 478:	c3                   	ret    

00000479 <sleep>:
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	6a 00                	push   $0x0
 47e:	6a 00                	push   $0x0
 480:	6a 00                	push   $0x0
 482:	6a 00                	push   $0x0
 484:	ff 75 08             	pushl  0x8(%ebp)
 487:	6a 02                	push   $0x2
 489:	e8 b7 fc ff ff       	call   145 <syscall>
 48e:	83 c4 18             	add    $0x18,%esp
 491:	90                   	nop
 492:	c9                   	leave  
 493:	c3                   	ret    

00000494 <exit>:
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	6a 00                	push   $0x0
 499:	6a 00                	push   $0x0
 49b:	6a 00                	push   $0x0
 49d:	6a 00                	push   $0x0
 49f:	6a 00                	push   $0x0
 4a1:	6a 03                	push   $0x3
 4a3:	e8 9d fc ff ff       	call   145 <syscall>
 4a8:	83 c4 18             	add    $0x18,%esp
 4ab:	90                   	nop
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <sem_init>:
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	6a 00                	push   $0x0
 4b6:	6a 00                	push   $0x0
 4b8:	6a 00                	push   $0x0
 4ba:	ff 75 0c             	pushl  0xc(%ebp)
 4bd:	50                   	push   %eax
 4be:	6a 05                	push   $0x5
 4c0:	e8 80 fc ff ff       	call   145 <syscall>
 4c5:	83 c4 18             	add    $0x18,%esp
 4c8:	c9                   	leave  
 4c9:	c3                   	ret    

000004ca <sem_post>:
 4ca:	55                   	push   %ebp
 4cb:	89 e5                	mov    %esp,%ebp
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	6a 00                	push   $0x0
 4d2:	6a 00                	push   $0x0
 4d4:	6a 00                	push   $0x0
 4d6:	6a 00                	push   $0x0
 4d8:	50                   	push   %eax
 4d9:	6a 06                	push   $0x6
 4db:	e8 65 fc ff ff       	call   145 <syscall>
 4e0:	83 c4 18             	add    $0x18,%esp
 4e3:	c9                   	leave  
 4e4:	c3                   	ret    

000004e5 <sem_wait>:
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	6a 00                	push   $0x0
 4ed:	6a 00                	push   $0x0
 4ef:	6a 00                	push   $0x0
 4f1:	6a 00                	push   $0x0
 4f3:	50                   	push   %eax
 4f4:	6a 07                	push   $0x7
 4f6:	e8 4a fc ff ff       	call   145 <syscall>
 4fb:	83 c4 18             	add    $0x18,%esp
 4fe:	c9                   	leave  
 4ff:	c3                   	ret    

00000500 <sem_destroy>:
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	6a 00                	push   $0x0
 508:	6a 00                	push   $0x0
 50a:	6a 00                	push   $0x0
 50c:	6a 00                	push   $0x0
 50e:	50                   	push   %eax
 50f:	6a 08                	push   $0x8
 511:	e8 2f fc ff ff       	call   145 <syscall>
 516:	83 c4 18             	add    $0x18,%esp
 519:	c9                   	leave  
 51a:	c3                   	ret    

Disassembly of section .rodata:

0000051c <.rodata>:
 51c:	46                   	inc    %esi
 51d:	61                   	popa   
 51e:	74 68                	je     588 <sem_destroy+0x88>
 520:	65 72 20             	gs jb  543 <sem_destroy+0x43>
 523:	50                   	push   %eax
 524:	72 6f                	jb     595 <sem_destroy+0x95>
 526:	63 65 73             	arpl   %sp,0x73(%ebp)
 529:	73 3a                	jae    565 <sem_destroy+0x65>
 52b:	20 53 65             	and    %dl,0x65(%ebx)
 52e:	6d                   	insl   (%dx),%es:(%edi)
 52f:	61                   	popa   
 530:	70 68                	jo     59a <sem_destroy+0x9a>
 532:	6f                   	outsl  %ds:(%esi),(%dx)
 533:	72 65                	jb     59a <sem_destroy+0x9a>
 535:	20 49 6e             	and    %cl,0x6e(%ecx)
 538:	69 74 69 61 6c 69 7a 	imul   $0x697a696c,0x61(%ecx,%ebp,2),%esi
 53f:	69 
 540:	6e                   	outsb  %ds:(%esi),(%dx)
 541:	67 2e 0a 00          	or     %cs:(%bx,%si),%al
 545:	00 00                	add    %al,(%eax)
 547:	00 46 61             	add    %al,0x61(%esi)
 54a:	74 68                	je     5b4 <sem_destroy+0xb4>
 54c:	65 72 20             	gs jb  56f <sem_destroy+0x6f>
 54f:	50                   	push   %eax
 550:	72 6f                	jb     5c1 <sem_destroy+0xc1>
 552:	63 65 73             	arpl   %sp,0x73(%ebp)
 555:	73 3a                	jae    591 <sem_destroy+0x91>
 557:	20 53 65             	and    %dl,0x65(%ebx)
 55a:	6d                   	insl   (%dx),%es:(%edi)
 55b:	61                   	popa   
 55c:	70 68                	jo     5c6 <sem_destroy+0xc6>
 55e:	6f                   	outsl  %ds:(%esi),(%dx)
 55f:	72 65                	jb     5c6 <sem_destroy+0xc6>
 561:	20 49 6e             	and    %cl,0x6e(%ecx)
 564:	69 74 69 61 6c 69 7a 	imul   $0x697a696c,0x61(%ecx,%ebp,2),%esi
 56b:	69 
 56c:	6e                   	outsb  %ds:(%esi),(%dx)
 56d:	67 20 46 61          	and    %al,0x61(%bp)
 571:	69 6c 65 64 2e 0a 00 	imul   $0x43000a2e,0x64(%ebp,%eiz,2),%ebp
 578:	43 
 579:	68 69 6c 64 20       	push   $0x20646c69
 57e:	50                   	push   %eax
 57f:	72 6f                	jb     5f0 <sem_destroy+0xf0>
 581:	63 65 73             	arpl   %sp,0x73(%ebp)
 584:	73 3a                	jae    5c0 <sem_destroy+0xc0>
 586:	20 53 65             	and    %dl,0x65(%ebx)
 589:	6d                   	insl   (%dx),%es:(%edi)
 58a:	61                   	popa   
 58b:	70 68                	jo     5f5 <sem_destroy+0xf5>
 58d:	6f                   	outsl  %ds:(%esi),(%dx)
 58e:	72 65                	jb     5f5 <sem_destroy+0xf5>
 590:	20 57 61             	and    %dl,0x61(%edi)
 593:	69 74 69 6e 67 2e 0a 	imul   $0xa2e67,0x6e(%ecx,%ebp,2),%esi
 59a:	00 
 59b:	00 43 68             	add    %al,0x68(%ebx)
 59e:	69 6c 64 20 50 72 6f 	imul   $0x636f7250,0x20(%esp,%eiz,2),%ebp
 5a5:	63 
 5a6:	65 73 73             	gs jae 61c <sem_destroy+0x11c>
 5a9:	3a 20                	cmp    (%eax),%ah
 5ab:	49                   	dec    %ecx
 5ac:	6e                   	outsb  %ds:(%esi),(%dx)
 5ad:	20 43 72             	and    %al,0x72(%ebx)
 5b0:	69 74 69 63 61 6c 20 	imul   $0x41206c61,0x63(%ecx,%ebp,2),%esi
 5b7:	41 
 5b8:	72 65                	jb     61f <sem_destroy+0x11f>
 5ba:	61                   	popa   
 5bb:	2e 0a 00             	or     %cs:(%eax),%al
 5be:	00 00                	add    %al,(%eax)
 5c0:	43                   	inc    %ebx
 5c1:	68 69 6c 64 20       	push   $0x20646c69
 5c6:	50                   	push   %eax
 5c7:	72 6f                	jb     638 <sem_destroy+0x138>
 5c9:	63 65 73             	arpl   %sp,0x73(%ebp)
 5cc:	73 3a                	jae    608 <sem_destroy+0x108>
 5ce:	20 53 65             	and    %dl,0x65(%ebx)
 5d1:	6d                   	insl   (%dx),%es:(%edi)
 5d2:	61                   	popa   
 5d3:	70 68                	jo     63d <sem_destroy+0x13d>
 5d5:	6f                   	outsl  %ds:(%esi),(%dx)
 5d6:	72 65                	jb     63d <sem_destroy+0x13d>
 5d8:	20 44 65 73          	and    %al,0x73(%ebp,%eiz,2)
 5dc:	74 72                	je     650 <sem_destroy+0x150>
 5de:	6f                   	outsl  %ds:(%esi),(%dx)
 5df:	79 69                	jns    64a <sem_destroy+0x14a>
 5e1:	6e                   	outsb  %ds:(%esi),(%dx)
 5e2:	67 2e 0a 00          	or     %cs:(%bx,%si),%al
 5e6:	46                   	inc    %esi
 5e7:	61                   	popa   
 5e8:	74 68                	je     652 <sem_destroy+0x152>
 5ea:	65 72 20             	gs jb  60d <sem_destroy+0x10d>
 5ed:	50                   	push   %eax
 5ee:	72 6f                	jb     65f <sem_destroy+0x15f>
 5f0:	63 65 73             	arpl   %sp,0x73(%ebp)
 5f3:	73 3a                	jae    62f <sem_destroy+0x12f>
 5f5:	20 53 6c             	and    %dl,0x6c(%ebx)
 5f8:	65 65 70 69          	gs gs jo 665 <sem_destroy+0x165>
 5fc:	6e                   	outsb  %ds:(%esi),(%dx)
 5fd:	67 2e 0a 00          	or     %cs:(%bx,%si),%al
 601:	00 00                	add    %al,(%eax)
 603:	00 46 61             	add    %al,0x61(%esi)
 606:	74 68                	je     670 <sem_destroy+0x170>
 608:	65 72 20             	gs jb  62b <sem_destroy+0x12b>
 60b:	50                   	push   %eax
 60c:	72 6f                	jb     67d <sem_destroy+0x17d>
 60e:	63 65 73             	arpl   %sp,0x73(%ebp)
 611:	73 3a                	jae    64d <sem_destroy+0x14d>
 613:	20 53 65             	and    %dl,0x65(%ebx)
 616:	6d                   	insl   (%dx),%es:(%edi)
 617:	61                   	popa   
 618:	70 68                	jo     682 <sem_destroy+0x182>
 61a:	6f                   	outsl  %ds:(%esi),(%dx)
 61b:	72 65                	jb     682 <sem_destroy+0x182>
 61d:	20 50 6f             	and    %dl,0x6f(%eax)
 620:	73 74                	jae    696 <sem_destroy+0x196>
 622:	69 6e 67 2e 0a 00 46 	imul   $0x46000a2e,0x67(%esi),%ebp
 629:	61                   	popa   
 62a:	74 68                	je     694 <sem_destroy+0x194>
 62c:	65 72 20             	gs jb  64f <sem_destroy+0x14f>
 62f:	50                   	push   %eax
 630:	72 6f                	jb     6a1 <sem_destroy+0x1a1>
 632:	63 65 73             	arpl   %sp,0x73(%ebp)
 635:	73 3a                	jae    671 <sem_destroy+0x171>
 637:	20 53 65             	and    %dl,0x65(%ebx)
 63a:	6d                   	insl   (%dx),%es:(%edi)
 63b:	61                   	popa   
 63c:	70 68                	jo     6a6 <sem_destroy+0x1a6>
 63e:	6f                   	outsl  %ds:(%esi),(%dx)
 63f:	72 65                	jb     6a6 <sem_destroy+0x1a6>
 641:	20 44 65 73          	and    %al,0x73(%ebp,%eiz,2)
 645:	74 72                	je     6b9 <sem_destroy+0x1b9>
 647:	6f                   	outsl  %ds:(%esi),(%dx)
 648:	79 69                	jns    6b3 <sem_destroy+0x1b3>
 64a:	6e                   	outsb  %ds:(%esi),(%dx)
 64b:	67 2e 0a 00          	or     %cs:(%bx,%si),%al
 64f:	2d 32 31 34 37       	sub    $0x37343132,%eax
 654:	34 38                	xor    $0x38,%al
 656:	33 37                	xor    (%edi),%esi
 658:	34 38                	xor    $0x38,%al
	...

Disassembly of section .eh_frame:

0000065c <__bss_start-0x11e8>:
 65c:	14 00                	adc    $0x0,%al
 65e:	00 00                	add    %al,(%eax)
 660:	00 00                	add    %al,(%eax)
 662:	00 00                	add    %al,(%eax)
 664:	01 7a 52             	add    %edi,0x52(%edx)
 667:	00 01                	add    %al,(%ecx)
 669:	7c 08                	jl     673 <sem_destroy+0x173>
 66b:	01 1b                	add    %ebx,(%ebx)
 66d:	0c 04                	or     $0x4,%al
 66f:	04 88                	add    $0x88,%al
 671:	01 00                	add    %eax,(%eax)
 673:	00 1c 00             	add    %bl,(%eax,%eax,1)
 676:	00 00                	add    %al,(%eax)
 678:	1c 00                	sbb    $0x0,%al
 67a:	00 00                	add    %al,(%eax)
 67c:	84 f9                	test   %bh,%cl
 67e:	ff                   	(bad)  
 67f:	ff 45 01             	incl   0x1(%ebp)
 682:	00 00                	add    %al,(%eax)
 684:	00 41 0e             	add    %al,0xe(%ecx)
 687:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 68d:	03 41 01             	add    0x1(%ecx),%eax
 690:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 693:	04 28                	add    $0x28,%al
 695:	00 00                	add    %al,(%eax)
 697:	00 3c 00             	add    %bh,(%eax,%eax,1)
 69a:	00 00                	add    %al,(%eax)
 69c:	a9 fa ff ff 32       	test   $0x32fffffa,%eax
 6a1:	00 00                	add    %al,(%eax)
 6a3:	00 00                	add    %al,(%eax)
 6a5:	41                   	inc    %ecx
 6a6:	0e                   	push   %cs
 6a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 6ad:	46                   	inc    %esi
 6ae:	87 03                	xchg   %eax,(%ebx)
 6b0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
 6b3:	05 65 c3 41 c6       	add    $0xc641c365,%eax
 6b8:	41                   	inc    %ecx
 6b9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
 6c0:	1c 00                	sbb    $0x0,%al
 6c2:	00 00                	add    %al,(%eax)
 6c4:	68 00 00 00 af       	push   $0xaf000000
 6c9:	fa                   	cli    
 6ca:	ff                   	(bad)  
 6cb:	ff 25 00 00 00 00    	jmp    *0x0
 6d1:	41                   	inc    %ecx
 6d2:	0e                   	push   %cs
 6d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 6d9:	61                   	popa   
 6da:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 6dd:	04 00                	add    $0x0,%al
 6df:	00 1c 00             	add    %bl,(%eax,%eax,1)
 6e2:	00 00                	add    %al,(%eax)
 6e4:	88 00                	mov    %al,(%eax)
 6e6:	00 00                	add    %al,(%eax)
 6e8:	b4 fa                	mov    $0xfa,%ah
 6ea:	ff                   	(bad)  
 6eb:	ff                   	(bad)  
 6ec:	3b 00                	cmp    (%eax),%eax
 6ee:	00 00                	add    %al,(%eax)
 6f0:	00 41 0e             	add    %al,0xe(%ecx)
 6f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 6f9:	77 c5                	ja     6c0 <sem_destroy+0x1c0>
 6fb:	0c 04                	or     $0x4,%al
 6fd:	04 00                	add    $0x0,%al
 6ff:	00 20                	add    %ah,(%eax)
 701:	00 00                	add    %al,(%eax)
 703:	00 a8 00 00 00 cf    	add    %ch,-0x31000000(%eax)
 709:	fa                   	cli    
 70a:	ff                   	(bad)  
 70b:	ff b7 00 00 00 00    	pushl  0x0(%edi)
 711:	41                   	inc    %ecx
 712:	0e                   	push   %cs
 713:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 719:	44                   	inc    %esp
 71a:	83 03 02             	addl   $0x2,(%ebx)
 71d:	af                   	scas   %es:(%edi),%eax
 71e:	c5 c3 0c             	(bad)  
 721:	04 04                	add    $0x4,%al
 723:	00 1c 00             	add    %bl,(%eax,%eax,1)
 726:	00 00                	add    %al,(%eax)
 728:	cc                   	int3   
 729:	00 00                	add    %al,(%eax)
 72b:	00 62 fb             	add    %ah,-0x5(%edx)
 72e:	ff                   	(bad)  
 72f:	ff 8b 00 00 00 00    	decl   0x0(%ebx)
 735:	41                   	inc    %ecx
 736:	0e                   	push   %cs
 737:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 73d:	02 87 c5 0c 04 04    	add    0x4040cc5(%edi),%al
 743:	00 1c 00             	add    %bl,(%eax,%eax,1)
 746:	00 00                	add    %al,(%eax)
 748:	ec                   	in     (%dx),%al
 749:	00 00                	add    %al,(%eax)
 74b:	00 cd                	add    %cl,%ch
 74d:	fb                   	sti    
 74e:	ff                   	(bad)  
 74f:	ff 47 01             	incl   0x1(%edi)
 752:	00 00                	add    %al,(%eax)
 754:	00 41 0e             	add    %al,0xe(%ecx)
 757:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 75d:	03 43 01             	add    0x1(%ebx),%eax
 760:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 763:	04 1c                	add    $0x1c,%al
 765:	00 00                	add    %al,(%eax)
 767:	00 0c 01             	add    %cl,(%ecx,%eax,1)
 76a:	00 00                	add    %al,(%eax)
 76c:	f4                   	hlt    
 76d:	fc                   	cld    
 76e:	ff                   	(bad)  
 76f:	ff 19                	lcall  *(%ecx)
 771:	00 00                	add    %al,(%eax)
 773:	00 00                	add    %al,(%eax)
 775:	41                   	inc    %ecx
 776:	0e                   	push   %cs
 777:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 77d:	55                   	push   %ebp
 77e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 781:	04 00                	add    $0x0,%al
 783:	00 1c 00             	add    %bl,(%eax,%eax,1)
 786:	00 00                	add    %al,(%eax)
 788:	2c 01                	sub    $0x1,%al
 78a:	00 00                	add    %al,(%eax)
 78c:	ed                   	in     (%dx),%eax
 78d:	fc                   	cld    
 78e:	ff                   	(bad)  
 78f:	ff 1b                	lcall  *(%ebx)
 791:	00 00                	add    %al,(%eax)
 793:	00 00                	add    %al,(%eax)
 795:	41                   	inc    %ecx
 796:	0e                   	push   %cs
 797:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 79d:	57                   	push   %edi
 79e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 7a1:	04 00                	add    $0x0,%al
 7a3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 7a6:	00 00                	add    %al,(%eax)
 7a8:	4c                   	dec    %esp
 7a9:	01 00                	add    %eax,(%eax)
 7ab:	00 e8                	add    %ch,%al
 7ad:	fc                   	cld    
 7ae:	ff                   	(bad)  
 7af:	ff 1a                	lcall  *(%edx)
 7b1:	00 00                	add    %al,(%eax)
 7b3:	00 00                	add    %al,(%eax)
 7b5:	41                   	inc    %ecx
 7b6:	0e                   	push   %cs
 7b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 7bd:	56                   	push   %esi
 7be:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 7c1:	04 00                	add    $0x0,%al
 7c3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 7c6:	00 00                	add    %al,(%eax)
 7c8:	6c                   	insb   (%dx),%es:(%edi)
 7c9:	01 00                	add    %eax,(%eax)
 7cb:	00 e2                	add    %ah,%dl
 7cd:	fc                   	cld    
 7ce:	ff                   	(bad)  
 7cf:	ff 1c 00             	lcall  *(%eax,%eax,1)
 7d2:	00 00                	add    %al,(%eax)
 7d4:	00 41 0e             	add    %al,0xe(%ecx)
 7d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 7dd:	58                   	pop    %eax
 7de:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 7e1:	04 00                	add    $0x0,%al
 7e3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 7e6:	00 00                	add    %al,(%eax)
 7e8:	8c 01                	mov    %es,(%ecx)
 7ea:	00 00                	add    %al,(%eax)
 7ec:	de fc                	fdivrp %st,%st(4)
 7ee:	ff                   	(bad)  
 7ef:	ff 1b                	lcall  *(%ebx)
 7f1:	00 00                	add    %al,(%eax)
 7f3:	00 00                	add    %al,(%eax)
 7f5:	41                   	inc    %ecx
 7f6:	0e                   	push   %cs
 7f7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 7fd:	57                   	push   %edi
 7fe:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 801:	04 00                	add    $0x0,%al
 803:	00 1c 00             	add    %bl,(%eax,%eax,1)
 806:	00 00                	add    %al,(%eax)
 808:	ac                   	lods   %ds:(%esi),%al
 809:	01 00                	add    %eax,(%eax)
 80b:	00 d9                	add    %bl,%cl
 80d:	fc                   	cld    
 80e:	ff                   	(bad)  
 80f:	ff 1b                	lcall  *(%ebx)
 811:	00 00                	add    %al,(%eax)
 813:	00 00                	add    %al,(%eax)
 815:	41                   	inc    %ecx
 816:	0e                   	push   %cs
 817:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 81d:	57                   	push   %edi
 81e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 821:	04 00                	add    $0x0,%al
 823:	00 1c 00             	add    %bl,(%eax,%eax,1)
 826:	00 00                	add    %al,(%eax)
 828:	cc                   	int3   
 829:	01 00                	add    %eax,(%eax)
 82b:	00 d4                	add    %dl,%ah
 82d:	fc                   	cld    
 82e:	ff                   	(bad)  
 82f:	ff 1b                	lcall  *(%ebx)
 831:	00 00                	add    %al,(%eax)
 833:	00 00                	add    %al,(%eax)
 835:	41                   	inc    %ecx
 836:	0e                   	push   %cs
 837:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 83d:	57                   	push   %edi
 83e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 841:	04 00                	add    $0x0,%al
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

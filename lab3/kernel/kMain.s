
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 01 08 00 00       	call   10080c <initSerial>
  10000b:	e8 34 04 00 00       	call   100444 <initIdt>
  100010:	e8 9f 07 00 00       	call   1007b4 <initIntr>
  100015:	e8 4e 08 00 00       	call   100868 <initTimer>
  10001a:	e8 ed 08 00 00       	call   10090c <initSeg>
  10001f:	e8 8c 0a 00 00       	call   100ab0 <loadUMain>
  100024:	eb fe                	jmp    100024 <kEntry+0x24>
  100026:	66 90                	xchg   %ax,%ax

00100028 <GProtectFaultHandle>:
  100028:	55                   	push   %ebp
  100029:	89 e5                	mov    %esp,%ebp
  10002b:	83 ec 14             	sub    $0x14,%esp
  10002e:	68 12 14 10 00       	push   $0x101412
  100033:	e8 68 06 00 00       	call   1006a0 <printf>
  100038:	58                   	pop    %eax
  100039:	5a                   	pop    %edx
  10003a:	6a 4c                	push   $0x4c
  10003c:	68 27 14 10 00       	push   $0x101427
  100041:	e8 fe 12 00 00       	call   101344 <abort>
  100046:	83 c4 10             	add    $0x10,%esp
  100049:	c9                   	leave  
  10004a:	c3                   	ret    
  10004b:	90                   	nop

0010004c <fsWrite>:
  10004c:	55                   	push   %ebp
  10004d:	89 e5                	mov    %esp,%ebp
  10004f:	57                   	push   %edi
  100050:	56                   	push   %esi
  100051:	53                   	push   %ebx
  100052:	83 ec 0c             	sub    $0xc,%esp
  100055:	8b 7d 10             	mov    0x10(%ebp),%edi
  100058:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  10005c:	0f 8f a2 00 00 00    	jg     100104 <fsWrite+0xb8>
  100062:	a1 24 37 30 00       	mov    0x303724,%eax
  100067:	2d 20 2a 10 00       	sub    $0x102a20,%eax
  10006c:	c1 f8 03             	sar    $0x3,%eax
  10006f:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100072:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100075:	01 d2                	add    %edx,%edx
  100077:	01 c2                	add    %eax,%edx
  100079:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10007c:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10007f:	c1 e2 0b             	shl    $0xb,%edx
  100082:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  100085:	89 ca                	mov    %ecx,%edx
  100087:	c1 e2 04             	shl    $0x4,%edx
  10008a:	01 ca                	add    %ecx,%edx
  10008c:	01 d2                	add    %edx,%edx
  10008e:	01 d0                	add    %edx,%eax
  100090:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100093:	f7 da                	neg    %edx
  100095:	83 c2 04             	add    $0x4,%edx
  100098:	c1 e2 14             	shl    $0x14,%edx
  10009b:	03 55 0c             	add    0xc(%ebp),%edx
  10009e:	85 ff                	test   %edi,%edi
  1000a0:	74 7e                	je     100120 <fsWrite+0xd4>
  1000a2:	8d 04 17             	lea    (%edi,%edx,1),%eax
  1000a5:	eb 32                	jmp    1000d9 <fsWrite+0x8d>
  1000a7:	90                   	nop
  1000a8:	8b 1d 00 21 10 00    	mov    0x102100,%ebx
  1000ae:	83 fb 50             	cmp    $0x50,%ebx
  1000b1:	74 2f                	je     1000e2 <fsWrite+0x96>
  1000b3:	8b 35 04 21 10 00    	mov    0x102104,%esi
  1000b9:	8d 34 b6             	lea    (%esi,%esi,4),%esi
  1000bc:	c1 e6 04             	shl    $0x4,%esi
  1000bf:	01 de                	add    %ebx,%esi
  1000c1:	80 cd 0c             	or     $0xc,%ch
  1000c4:	66 89 8c 36 00 80 0b 	mov    %cx,0xb8000(%esi,%esi,1)
  1000cb:	00 
  1000cc:	43                   	inc    %ebx
  1000cd:	89 1d 00 21 10 00    	mov    %ebx,0x102100
  1000d3:	4f                   	dec    %edi
  1000d4:	42                   	inc    %edx
  1000d5:	39 c2                	cmp    %eax,%edx
  1000d7:	74 1e                	je     1000f7 <fsWrite+0xab>
  1000d9:	66 0f be 0a          	movsbw (%edx),%cx
  1000dd:	80 f9 0a             	cmp    $0xa,%cl
  1000e0:	75 c6                	jne    1000a8 <fsWrite+0x5c>
  1000e2:	ff 05 04 21 10 00    	incl   0x102104
  1000e8:	c7 05 00 21 10 00 00 	movl   $0x0,0x102100
  1000ef:	00 00 00 
  1000f2:	42                   	inc    %edx
  1000f3:	39 c2                	cmp    %eax,%edx
  1000f5:	75 e2                	jne    1000d9 <fsWrite+0x8d>
  1000f7:	89 f8                	mov    %edi,%eax
  1000f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1000fc:	5b                   	pop    %ebx
  1000fd:	5e                   	pop    %esi
  1000fe:	5f                   	pop    %edi
  1000ff:	5d                   	pop    %ebp
  100100:	c3                   	ret    
  100101:	8d 76 00             	lea    0x0(%esi),%esi
  100104:	83 ec 08             	sub    $0x8,%esp
  100107:	6a 66                	push   $0x66
  100109:	68 27 14 10 00       	push   $0x101427
  10010e:	e8 31 12 00 00       	call   101344 <abort>
  100113:	89 f8                	mov    %edi,%eax
  100115:	83 c4 10             	add    $0x10,%esp
  100118:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10011b:	5b                   	pop    %ebx
  10011c:	5e                   	pop    %esi
  10011d:	5f                   	pop    %edi
  10011e:	5d                   	pop    %ebp
  10011f:	c3                   	ret    
  100120:	31 c0                	xor    %eax,%eax
  100122:	eb d5                	jmp    1000f9 <fsWrite+0xad>

00100124 <sysWrite>:
  100124:	55                   	push   %ebp
  100125:	89 e5                	mov    %esp,%ebp
  100127:	53                   	push   %ebx
  100128:	83 ec 08             	sub    $0x8,%esp
  10012b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10012e:	ff 73 24             	pushl  0x24(%ebx)
  100131:	ff 73 28             	pushl  0x28(%ebx)
  100134:	ff 73 20             	pushl  0x20(%ebx)
  100137:	e8 10 ff ff ff       	call   10004c <fsWrite>
  10013c:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10013f:	83 c4 10             	add    $0x10,%esp
  100142:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100145:	c9                   	leave  
  100146:	c3                   	ret    
  100147:	90                   	nop

00100148 <writeVMem>:
  100148:	55                   	push   %ebp
  100149:	89 e5                	mov    %esp,%ebp
  10014b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10014e:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100151:	c1 e0 04             	shl    $0x4,%eax
  100154:	03 45 10             	add    0x10(%ebp),%eax
  100157:	66 0f be 55 08       	movsbw 0x8(%ebp),%dx
  10015c:	80 ce 0c             	or     $0xc,%dh
  10015f:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%eax,%eax,1)
  100166:	00 
  100167:	5d                   	pop    %ebp
  100168:	c3                   	ret    
  100169:	8d 76 00             	lea    0x0(%esi),%esi

0010016c <timerHandle>:
  10016c:	55                   	push   %ebp
  10016d:	89 e5                	mov    %esp,%ebp
  10016f:	83 ec 14             	sub    $0x14,%esp
  100172:	68 3a 14 10 00       	push   $0x10143a
  100177:	e8 24 05 00 00       	call   1006a0 <printf>
  10017c:	e8 1b 0d 00 00       	call   100e9c <updateTime>
  100181:	e8 06 0f 00 00       	call   10108c <checkBlockedList>
  100186:	83 c4 10             	add    $0x10,%esp
  100189:	a1 24 37 30 00       	mov    0x303724,%eax
  10018e:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  100194:	85 d2                	test   %edx,%edx
  100196:	74 14                	je     1001ac <timerHandle+0x40>
  100198:	a1 28 37 30 00       	mov    0x303728,%eax
  10019d:	85 c0                	test   %eax,%eax
  10019f:	74 0b                	je     1001ac <timerHandle+0x40>
  1001a1:	e8 fe 0f 00 00       	call   1011a4 <schedule>
  1001a6:	c9                   	leave  
  1001a7:	e9 54 10 00 00       	jmp    101200 <switchToRunning>
  1001ac:	c9                   	leave  
  1001ad:	c3                   	ret    
  1001ae:	66 90                	xchg   %ax,%ax

001001b0 <sysFork>:
  1001b0:	55                   	push   %ebp
  1001b1:	89 e5                	mov    %esp,%ebp
  1001b3:	57                   	push   %edi
  1001b4:	56                   	push   %esi
  1001b5:	53                   	push   %ebx
  1001b6:	83 ec 1c             	sub    $0x1c,%esp
  1001b9:	8b 75 08             	mov    0x8(%ebp),%esi
  1001bc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1001bf:	e8 c0 09 00 00       	call   100b84 <initNewPCB>
  1001c4:	89 c2                	mov    %eax,%edx
  1001c6:	c1 e0 0a             	shl    $0xa,%eax
  1001c9:	01 d0                	add    %edx,%eax
  1001cb:	01 c0                	add    %eax,%eax
  1001cd:	01 d0                	add    %edx,%eax
  1001cf:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1001d2:	c1 e0 03             	shl    $0x3,%eax
  1001d5:	8d 98 20 2a 10 00    	lea    0x102a20(%eax),%ebx
  1001db:	b9 00 40 00 00       	mov    $0x4000,%ecx
  1001e0:	89 df                	mov    %ebx,%edi
  1001e2:	8b 35 24 37 30 00    	mov    0x303724,%esi
  1001e8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1001ea:	8b 3d 24 37 30 00    	mov    0x303724,%edi
  1001f0:	81 c7 00 00 01 00    	add    $0x10000,%edi
  1001f6:	b9 13 00 00 00       	mov    $0x13,%ecx
  1001fb:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  1001fe:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100200:	05 20 2a 11 00       	add    $0x112a20,%eax
  100205:	b9 13 00 00 00       	mov    $0x13,%ecx
  10020a:	89 c7                	mov    %eax,%edi
  10020c:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  10020f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100211:	8d 42 04             	lea    0x4(%edx),%eax
  100214:	c1 e0 14             	shl    $0x14,%eax
  100217:	8b 0d 24 37 30 00    	mov    0x303724,%ecx
  10021d:	81 e9 20 2a 10 00    	sub    $0x102a20,%ecx
  100223:	c1 f9 03             	sar    $0x3,%ecx
  100226:	8d 34 c9             	lea    (%ecx,%ecx,8),%esi
  100229:	8d 34 f6             	lea    (%esi,%esi,8),%esi
  10022c:	01 f6                	add    %esi,%esi
  10022e:	01 ce                	add    %ecx,%esi
  100230:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  100233:	8d 34 f6             	lea    (%esi,%esi,8),%esi
  100236:	c1 e6 0b             	shl    $0xb,%esi
  100239:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
  10023c:	89 fe                	mov    %edi,%esi
  10023e:	c1 e6 04             	shl    $0x4,%esi
  100241:	01 fe                	add    %edi,%esi
  100243:	01 f6                	add    %esi,%esi
  100245:	01 f1                	add    %esi,%ecx
  100247:	8d 34 c9             	lea    (%ecx,%ecx,8),%esi
  10024a:	f7 de                	neg    %esi
  10024c:	83 c6 04             	add    $0x4,%esi
  10024f:	c1 e6 14             	shl    $0x14,%esi
  100252:	b9 00 00 04 00       	mov    $0x40000,%ecx
  100257:	89 c7                	mov    %eax,%edi
  100259:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10025b:	a1 24 37 30 00       	mov    0x303724,%eax
  100260:	89 90 2c 00 01 00    	mov    %edx,0x1002c(%eax)
  100266:	c7 83 2c 00 01 00 00 	movl   $0x0,0x1002c(%ebx)
  10026d:	00 00 00 
  100270:	8b 90 4c 00 01 00    	mov    0x1004c(%eax),%edx
  100276:	89 93 4c 00 01 00    	mov    %edx,0x1004c(%ebx)
  10027c:	8b 80 50 00 01 00    	mov    0x10050(%eax),%eax
  100282:	89 83 50 00 01 00    	mov    %eax,0x10050(%ebx)
  100288:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10028b:	83 c4 1c             	add    $0x1c,%esp
  10028e:	5b                   	pop    %ebx
  10028f:	5e                   	pop    %esi
  100290:	5f                   	pop    %edi
  100291:	5d                   	pop    %ebp
  100292:	e9 d5 0b 00 00       	jmp    100e6c <addToRunnable>
  100297:	90                   	nop

00100298 <sysSleep>:
  100298:	55                   	push   %ebp
  100299:	89 e5                	mov    %esp,%ebp
  10029b:	57                   	push   %edi
  10029c:	56                   	push   %esi
  10029d:	53                   	push   %ebx
  10029e:	83 ec 18             	sub    $0x18,%esp
  1002a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1002a4:	68 3c 14 10 00       	push   $0x10143c
  1002a9:	e8 f2 03 00 00       	call   1006a0 <printf>
  1002ae:	8b 15 24 37 30 00    	mov    0x303724,%edx
  1002b4:	8d 82 00 00 01 00    	lea    0x10000(%edx),%eax
  1002ba:	b9 13 00 00 00       	mov    $0x13,%ecx
  1002bf:	89 c7                	mov    %eax,%edi
  1002c1:	89 de                	mov    %ebx,%esi
  1002c3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1002c5:	c7 82 54 00 01 00 02 	movl   $0x2,0x10054(%edx)
  1002cc:	00 00 00 
  1002cf:	c7 82 58 00 01 00 00 	movl   $0x0,0x10058(%edx)
  1002d6:	00 00 00 
  1002d9:	8b 43 20             	mov    0x20(%ebx),%eax
  1002dc:	89 82 5c 00 01 00    	mov    %eax,0x1005c(%edx)
  1002e2:	89 14 24             	mov    %edx,(%esp)
  1002e5:	e8 52 0b 00 00       	call   100e3c <addToBlocked>
  1002ea:	e8 0d 0c 00 00       	call   100efc <checkRunnableList>
  1002ef:	e8 b0 0e 00 00       	call   1011a4 <schedule>
  1002f4:	83 c4 10             	add    $0x10,%esp
  1002f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1002fa:	5b                   	pop    %ebx
  1002fb:	5e                   	pop    %esi
  1002fc:	5f                   	pop    %edi
  1002fd:	5d                   	pop    %ebp
  1002fe:	e9 fd 0e 00 00       	jmp    101200 <switchToRunning>
  100303:	90                   	nop

00100304 <sysExit>:
  100304:	55                   	push   %ebp
  100305:	89 e5                	mov    %esp,%ebp
  100307:	83 ec 14             	sub    $0x14,%esp
  10030a:	68 43 14 10 00       	push   $0x101443
  10030f:	e8 8c 03 00 00       	call   1006a0 <printf>
  100314:	a1 24 37 30 00       	mov    0x303724,%eax
  100319:	c7 80 54 00 01 00 03 	movl   $0x3,0x10054(%eax)
  100320:	00 00 00 
  100323:	e8 7c 0e 00 00       	call   1011a4 <schedule>
  100328:	83 c4 10             	add    $0x10,%esp
  10032b:	c9                   	leave  
  10032c:	e9 cf 0e 00 00       	jmp    101200 <switchToRunning>
  100331:	8d 76 00             	lea    0x0(%esi),%esi

00100334 <syscallHandle>:
  100334:	55                   	push   %ebp
  100335:	89 e5                	mov    %esp,%ebp
  100337:	53                   	push   %ebx
  100338:	52                   	push   %edx
  100339:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10033c:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10033f:	83 f8 02             	cmp    $0x2,%eax
  100342:	74 5c                	je     1003a0 <syscallHandle+0x6c>
  100344:	76 32                	jbe    100378 <syscallHandle+0x44>
  100346:	83 f8 03             	cmp    $0x3,%eax
  100349:	74 21                	je     10036c <syscallHandle+0x38>
  10034b:	83 f8 04             	cmp    $0x4,%eax
  10034e:	75 38                	jne    100388 <syscallHandle+0x54>
  100350:	50                   	push   %eax
  100351:	ff 73 24             	pushl  0x24(%ebx)
  100354:	ff 73 28             	pushl  0x28(%ebx)
  100357:	ff 73 20             	pushl  0x20(%ebx)
  10035a:	e8 ed fc ff ff       	call   10004c <fsWrite>
  10035f:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100362:	83 c4 10             	add    $0x10,%esp
  100365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100368:	c9                   	leave  
  100369:	c3                   	ret    
  10036a:	66 90                	xchg   %ax,%ax
  10036c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10036f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100372:	c9                   	leave  
  100373:	eb 8f                	jmp    100304 <sysExit>
  100375:	8d 76 00             	lea    0x0(%esi),%esi
  100378:	48                   	dec    %eax
  100379:	75 0d                	jne    100388 <syscallHandle+0x54>
  10037b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10037e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100381:	c9                   	leave  
  100382:	e9 29 fe ff ff       	jmp    1001b0 <sysFork>
  100387:	90                   	nop
  100388:	83 ec 08             	sub    $0x8,%esp
  10038b:	6a 46                	push   $0x46
  10038d:	68 27 14 10 00       	push   $0x101427
  100392:	e8 ad 0f 00 00       	call   101344 <abort>
  100397:	83 c4 10             	add    $0x10,%esp
  10039a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10039d:	c9                   	leave  
  10039e:	c3                   	ret    
  10039f:	90                   	nop
  1003a0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1003a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1003a6:	c9                   	leave  
  1003a7:	e9 ec fe ff ff       	jmp    100298 <sysSleep>

001003ac <irqHandle>:
  1003ac:	55                   	push   %ebp
  1003ad:	89 e5                	mov    %esp,%ebp
  1003af:	83 ec 08             	sub    $0x8,%esp
  1003b2:	fa                   	cli    
  1003b3:	b8 10 00 00 00       	mov    $0x10,%eax
  1003b8:	89 c0                	mov    %eax,%eax
  1003ba:	8e c0                	mov    %eax,%es
  1003bc:	8e d8                	mov    %eax,%ds
  1003be:	8e e0                	mov    %eax,%fs
  1003c0:	8e e8                	mov    %eax,%gs
  1003c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1003c5:	03 05 24 37 30 00    	add    0x303724,%eax
  1003cb:	8b 50 30             	mov    0x30(%eax),%edx
  1003ce:	83 fa 0d             	cmp    $0xd,%edx
  1003d1:	74 51                	je     100424 <irqHandle+0x78>
  1003d3:	7e 2b                	jle    100400 <irqHandle+0x54>
  1003d5:	83 fa 20             	cmp    $0x20,%edx
  1003d8:	74 16                	je     1003f0 <irqHandle+0x44>
  1003da:	83 c2 80             	add    $0xffffff80,%edx
  1003dd:	75 24                	jne    100403 <irqHandle+0x57>
  1003df:	83 ec 0c             	sub    $0xc,%esp
  1003e2:	50                   	push   %eax
  1003e3:	e8 4c ff ff ff       	call   100334 <syscallHandle>
  1003e8:	83 c4 10             	add    $0x10,%esp
  1003eb:	fb                   	sti    
  1003ec:	c9                   	leave  
  1003ed:	c3                   	ret    
  1003ee:	66 90                	xchg   %ax,%ax
  1003f0:	83 ec 0c             	sub    $0xc,%esp
  1003f3:	50                   	push   %eax
  1003f4:	e8 73 fd ff ff       	call   10016c <timerHandle>
  1003f9:	83 c4 10             	add    $0x10,%esp
  1003fc:	eb ed                	jmp    1003eb <irqHandle+0x3f>
  1003fe:	66 90                	xchg   %ax,%ax
  100400:	42                   	inc    %edx
  100401:	74 e8                	je     1003eb <irqHandle+0x3f>
  100403:	83 ec 0c             	sub    $0xc,%esp
  100406:	68 49 14 10 00       	push   $0x101449
  10040b:	e8 90 02 00 00       	call   1006a0 <printf>
  100410:	58                   	pop    %eax
  100411:	5a                   	pop    %edx
  100412:	6a 3a                	push   $0x3a
  100414:	68 27 14 10 00       	push   $0x101427
  100419:	e8 26 0f 00 00       	call   101344 <abort>
  10041e:	83 c4 10             	add    $0x10,%esp
  100421:	eb c8                	jmp    1003eb <irqHandle+0x3f>
  100423:	90                   	nop
  100424:	83 ec 0c             	sub    $0xc,%esp
  100427:	68 12 14 10 00       	push   $0x101412
  10042c:	e8 6f 02 00 00       	call   1006a0 <printf>
  100431:	59                   	pop    %ecx
  100432:	58                   	pop    %eax
  100433:	6a 4c                	push   $0x4c
  100435:	68 27 14 10 00       	push   $0x101427
  10043a:	e8 05 0f 00 00       	call   101344 <abort>
  10043f:	83 c4 10             	add    $0x10,%esp
  100442:	eb a7                	jmp    1003eb <irqHandle+0x3f>

00100444 <initIdt>:
  100444:	55                   	push   %ebp
  100445:	89 e5                	mov    %esp,%ebp
  100447:	53                   	push   %ebx
  100448:	ba db 13 10 00       	mov    $0x1013db,%edx
  10044d:	89 d3                	mov    %edx,%ebx
  10044f:	c1 ea 10             	shr    $0x10,%edx
  100452:	b9 60 29 10 00       	mov    $0x102960,%ecx
  100457:	b8 60 21 10 00       	mov    $0x102160,%eax
  10045c:	66 89 18             	mov    %bx,(%eax)
  10045f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100465:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100469:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  10046d:	66 89 50 06          	mov    %dx,0x6(%eax)
  100471:	83 c0 08             	add    $0x8,%eax
  100474:	39 c1                	cmp    %eax,%ecx
  100476:	75 e4                	jne    10045c <initIdt+0x18>
  100478:	b8 e1 13 10 00       	mov    $0x1013e1,%eax
  10047d:	66 a3 c8 21 10 00    	mov    %ax,0x1021c8
  100483:	66 c7 05 ca 21 10 00 	movw   $0x8,0x1021ca
  10048a:	08 00 
  10048c:	c6 05 cc 21 10 00 00 	movb   $0x0,0x1021cc
  100493:	c6 05 cd 21 10 00 8f 	movb   $0x8f,0x1021cd
  10049a:	c1 e8 10             	shr    $0x10,%eax
  10049d:	66 a3 ce 21 10 00    	mov    %ax,0x1021ce
  1004a3:	b8 e5 13 10 00       	mov    $0x1013e5,%eax
  1004a8:	66 a3 60 25 10 00    	mov    %ax,0x102560
  1004ae:	66 c7 05 62 25 10 00 	movw   $0x8,0x102562
  1004b5:	08 00 
  1004b7:	c6 05 64 25 10 00 00 	movb   $0x0,0x102564
  1004be:	c6 05 65 25 10 00 ee 	movb   $0xee,0x102565
  1004c5:	c1 e8 10             	shr    $0x10,%eax
  1004c8:	66 a3 66 25 10 00    	mov    %ax,0x102566
  1004ce:	b8 ee 13 10 00       	mov    $0x1013ee,%eax
  1004d3:	66 a3 60 22 10 00    	mov    %ax,0x102260
  1004d9:	66 c7 05 62 22 10 00 	movw   $0x8,0x102262
  1004e0:	08 00 
  1004e2:	c6 05 64 22 10 00 00 	movb   $0x0,0x102264
  1004e9:	c6 05 65 22 10 00 8e 	movb   $0x8e,0x102265
  1004f0:	c1 e8 10             	shr    $0x10,%eax
  1004f3:	66 a3 66 22 10 00    	mov    %ax,0x102266
  1004f9:	66 c7 05 08 21 10 00 	movw   $0x7ff,0x102108
  100500:	ff 07 
  100502:	b8 60 21 10 00       	mov    $0x102160,%eax
  100507:	66 a3 0a 21 10 00    	mov    %ax,0x10210a
  10050d:	c1 e8 10             	shr    $0x10,%eax
  100510:	66 a3 0c 21 10 00    	mov    %ax,0x10210c
  100516:	b8 08 21 10 00       	mov    $0x102108,%eax
  10051b:	0f 01 18             	lidtl  (%eax)
  10051e:	5b                   	pop    %ebx
  10051f:	5d                   	pop    %ebp
  100520:	c3                   	ret    
  100521:	66 90                	xchg   %ax,%ax
  100523:	90                   	nop

00100524 <printString>:
  100524:	55                   	push   %ebp
  100525:	89 e5                	mov    %esp,%ebp
  100527:	53                   	push   %ebx
  100528:	50                   	push   %eax
  100529:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10052c:	0f be 03             	movsbl (%ebx),%eax
  10052f:	43                   	inc    %ebx
  100530:	84 c0                	test   %al,%al
  100532:	74 15                	je     100549 <printString+0x25>
  100534:	83 ec 0c             	sub    $0xc,%esp
  100537:	50                   	push   %eax
  100538:	e8 0f 03 00 00       	call   10084c <putChar>
  10053d:	43                   	inc    %ebx
  10053e:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  100542:	83 c4 10             	add    $0x10,%esp
  100545:	84 c0                	test   %al,%al
  100547:	75 eb                	jne    100534 <printString+0x10>
  100549:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10054c:	c9                   	leave  
  10054d:	c3                   	ret    
  10054e:	66 90                	xchg   %ax,%ax

00100550 <printDemical>:
  100550:	55                   	push   %ebp
  100551:	89 e5                	mov    %esp,%ebp
  100553:	57                   	push   %edi
  100554:	56                   	push   %esi
  100555:	53                   	push   %ebx
  100556:	83 ec 1c             	sub    $0x1c,%esp
  100559:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10055c:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  100562:	74 6c                	je     1005d0 <printDemical+0x80>
  100564:	85 db                	test   %ebx,%ebx
  100566:	0f 84 8c 00 00 00    	je     1005f8 <printDemical+0xa8>
  10056c:	0f 88 9a 00 00 00    	js     10060c <printDemical+0xbc>
  100572:	be 09 00 00 00       	mov    $0x9,%esi
  100577:	bf 0a 00 00 00       	mov    $0xa,%edi
  10057c:	eb 04                	jmp    100582 <printDemical+0x32>
  10057e:	66 90                	xchg   %ax,%ax
  100580:	89 d6                	mov    %edx,%esi
  100582:	89 d8                	mov    %ebx,%eax
  100584:	99                   	cltd   
  100585:	f7 ff                	idiv   %edi
  100587:	8d 4a 30             	lea    0x30(%edx),%ecx
  10058a:	88 4c 35 de          	mov    %cl,-0x22(%ebp,%esi,1)
  10058e:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100593:	f7 eb                	imul   %ebx
  100595:	89 d0                	mov    %edx,%eax
  100597:	c1 f8 02             	sar    $0x2,%eax
  10059a:	c1 fb 1f             	sar    $0x1f,%ebx
  10059d:	8d 56 ff             	lea    -0x1(%esi),%edx
  1005a0:	29 d8                	sub    %ebx,%eax
  1005a2:	89 c3                	mov    %eax,%ebx
  1005a4:	75 da                	jne    100580 <printDemical+0x30>
  1005a6:	8d 5c 35 df          	lea    -0x21(%ebp,%esi,1),%ebx
  1005aa:	8d 75 e8             	lea    -0x18(%ebp),%esi
  1005ad:	eb 04                	jmp    1005b3 <printDemical+0x63>
  1005af:	90                   	nop
  1005b0:	8a 0b                	mov    (%ebx),%cl
  1005b2:	43                   	inc    %ebx
  1005b3:	83 ec 0c             	sub    $0xc,%esp
  1005b6:	0f be c9             	movsbl %cl,%ecx
  1005b9:	51                   	push   %ecx
  1005ba:	e8 8d 02 00 00       	call   10084c <putChar>
  1005bf:	83 c4 10             	add    $0x10,%esp
  1005c2:	39 de                	cmp    %ebx,%esi
  1005c4:	75 ea                	jne    1005b0 <printDemical+0x60>
  1005c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1005c9:	5b                   	pop    %ebx
  1005ca:	5e                   	pop    %esi
  1005cb:	5f                   	pop    %edi
  1005cc:	5d                   	pop    %ebp
  1005cd:	c3                   	ret    
  1005ce:	66 90                	xchg   %ax,%ax
  1005d0:	bb 54 14 10 00       	mov    $0x101454,%ebx
  1005d5:	b8 2d 00 00 00       	mov    $0x2d,%eax
  1005da:	66 90                	xchg   %ax,%ax
  1005dc:	83 ec 0c             	sub    $0xc,%esp
  1005df:	50                   	push   %eax
  1005e0:	e8 67 02 00 00       	call   10084c <putChar>
  1005e5:	43                   	inc    %ebx
  1005e6:	0f be 03             	movsbl (%ebx),%eax
  1005e9:	83 c4 10             	add    $0x10,%esp
  1005ec:	84 c0                	test   %al,%al
  1005ee:	75 ec                	jne    1005dc <printDemical+0x8c>
  1005f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1005f3:	5b                   	pop    %ebx
  1005f4:	5e                   	pop    %esi
  1005f5:	5f                   	pop    %edi
  1005f6:	5d                   	pop    %ebp
  1005f7:	c3                   	ret    
  1005f8:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
  1005ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100602:	5b                   	pop    %ebx
  100603:	5e                   	pop    %esi
  100604:	5f                   	pop    %edi
  100605:	5d                   	pop    %ebp
  100606:	e9 41 02 00 00       	jmp    10084c <putChar>
  10060b:	90                   	nop
  10060c:	f7 db                	neg    %ebx
  10060e:	83 ec 0c             	sub    $0xc,%esp
  100611:	6a 2d                	push   $0x2d
  100613:	e8 34 02 00 00       	call   10084c <putChar>
  100618:	83 c4 10             	add    $0x10,%esp
  10061b:	e9 52 ff ff ff       	jmp    100572 <printDemical+0x22>

00100620 <printHex>:
  100620:	55                   	push   %ebp
  100621:	89 e5                	mov    %esp,%ebp
  100623:	56                   	push   %esi
  100624:	53                   	push   %ebx
  100625:	83 ec 10             	sub    $0x10,%esp
  100628:	8b 55 08             	mov    0x8(%ebp),%edx
  10062b:	85 d2                	test   %edx,%edx
  10062d:	74 5d                	je     10068c <printHex+0x6c>
  10062f:	be 07 00 00 00       	mov    $0x7,%esi
  100634:	eb 13                	jmp    100649 <printHex+0x29>
  100636:	66 90                	xchg   %ax,%ax
  100638:	83 c0 30             	add    $0x30,%eax
  10063b:	88 44 35 f0          	mov    %al,-0x10(%ebp,%esi,1)
  10063f:	8d 4e ff             	lea    -0x1(%esi),%ecx
  100642:	c1 ea 04             	shr    $0x4,%edx
  100645:	74 1b                	je     100662 <printHex+0x42>
  100647:	89 ce                	mov    %ecx,%esi
  100649:	89 d0                	mov    %edx,%eax
  10064b:	83 e0 0f             	and    $0xf,%eax
  10064e:	83 f8 09             	cmp    $0x9,%eax
  100651:	76 e5                	jbe    100638 <printHex+0x18>
  100653:	83 c0 57             	add    $0x57,%eax
  100656:	88 44 35 f0          	mov    %al,-0x10(%ebp,%esi,1)
  10065a:	8d 4e ff             	lea    -0x1(%esi),%ecx
  10065d:	c1 ea 04             	shr    $0x4,%edx
  100660:	75 e5                	jne    100647 <printHex+0x27>
  100662:	8d 5d f0             	lea    -0x10(%ebp),%ebx
  100665:	01 de                	add    %ebx,%esi
  100667:	8d 5d f8             	lea    -0x8(%ebp),%ebx
  10066a:	eb 02                	jmp    10066e <printHex+0x4e>
  10066c:	8a 06                	mov    (%esi),%al
  10066e:	83 ec 0c             	sub    $0xc,%esp
  100671:	0f be c0             	movsbl %al,%eax
  100674:	50                   	push   %eax
  100675:	e8 d2 01 00 00       	call   10084c <putChar>
  10067a:	46                   	inc    %esi
  10067b:	83 c4 10             	add    $0x10,%esp
  10067e:	39 de                	cmp    %ebx,%esi
  100680:	75 ea                	jne    10066c <printHex+0x4c>
  100682:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100685:	5b                   	pop    %ebx
  100686:	5e                   	pop    %esi
  100687:	5d                   	pop    %ebp
  100688:	c3                   	ret    
  100689:	8d 76 00             	lea    0x0(%esi),%esi
  10068c:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
  100693:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100696:	5b                   	pop    %ebx
  100697:	5e                   	pop    %esi
  100698:	5d                   	pop    %ebp
  100699:	e9 ae 01 00 00       	jmp    10084c <putChar>
  10069e:	66 90                	xchg   %ax,%ax

001006a0 <printf>:
  1006a0:	55                   	push   %ebp
  1006a1:	89 e5                	mov    %esp,%ebp
  1006a3:	57                   	push   %edi
  1006a4:	56                   	push   %esi
  1006a5:	53                   	push   %ebx
  1006a6:	81 ec ec 00 00 00    	sub    $0xec,%esp
  1006ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006af:	85 db                	test   %ebx,%ebx
  1006b1:	74 7a                	je     10072d <printf+0x8d>
  1006b3:	8d 45 0c             	lea    0xc(%ebp),%eax
  1006b6:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
  1006bc:	0f be 03             	movsbl (%ebx),%eax
  1006bf:	31 d2                	xor    %edx,%edx
  1006c1:	84 c0                	test   %al,%al
  1006c3:	74 68                	je     10072d <printf+0x8d>
  1006c5:	8d 76 00             	lea    0x0(%esi),%esi
  1006c8:	89 d7                	mov    %edx,%edi
  1006ca:	3c 25                	cmp    $0x25,%al
  1006cc:	74 26                	je     1006f4 <printf+0x54>
  1006ce:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
  1006d4:	29 fe                	sub    %edi,%esi
  1006d6:	eb 04                	jmp    1006dc <printf+0x3c>
  1006d8:	84 c0                	test   %al,%al
  1006da:	74 51                	je     10072d <printf+0x8d>
  1006dc:	88 04 3e             	mov    %al,(%esi,%edi,1)
  1006df:	83 ec 0c             	sub    $0xc,%esp
  1006e2:	50                   	push   %eax
  1006e3:	e8 64 01 00 00       	call   10084c <putChar>
  1006e8:	47                   	inc    %edi
  1006e9:	0f be 04 3b          	movsbl (%ebx,%edi,1),%eax
  1006ed:	83 c4 10             	add    $0x10,%esp
  1006f0:	3c 25                	cmp    $0x25,%al
  1006f2:	75 e4                	jne    1006d8 <printf+0x38>
  1006f4:	8a 44 3b 01          	mov    0x1(%ebx,%edi,1),%al
  1006f8:	3c 64                	cmp    $0x64,%al
  1006fa:	74 60                	je     10075c <printf+0xbc>
  1006fc:	7e 3a                	jle    100738 <printf+0x98>
  1006fe:	3c 73                	cmp    $0x73,%al
  100700:	74 7a                	je     10077c <printf+0xdc>
  100702:	3c 78                	cmp    $0x78,%al
  100704:	75 1c                	jne    100722 <printf+0x82>
  100706:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
  10070c:	8d 70 04             	lea    0x4(%eax),%esi
  10070f:	83 ec 0c             	sub    $0xc,%esp
  100712:	ff 30                	pushl  (%eax)
  100714:	e8 07 ff ff ff       	call   100620 <printHex>
  100719:	83 c4 10             	add    $0x10,%esp
  10071c:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
  100722:	8d 57 02             	lea    0x2(%edi),%edx
  100725:	0f be 04 13          	movsbl (%ebx,%edx,1),%eax
  100729:	84 c0                	test   %al,%al
  10072b:	75 9b                	jne    1006c8 <printf+0x28>
  10072d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100730:	5b                   	pop    %ebx
  100731:	5e                   	pop    %esi
  100732:	5f                   	pop    %edi
  100733:	5d                   	pop    %ebp
  100734:	c3                   	ret    
  100735:	8d 76 00             	lea    0x0(%esi),%esi
  100738:	3c 63                	cmp    $0x63,%al
  10073a:	75 e6                	jne    100722 <printf+0x82>
  10073c:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
  100742:	8d 70 04             	lea    0x4(%eax),%esi
  100745:	83 ec 0c             	sub    $0xc,%esp
  100748:	0f be 00             	movsbl (%eax),%eax
  10074b:	50                   	push   %eax
  10074c:	e8 fb 00 00 00       	call   10084c <putChar>
  100751:	83 c4 10             	add    $0x10,%esp
  100754:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
  10075a:	eb c6                	jmp    100722 <printf+0x82>
  10075c:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
  100762:	89 c8                	mov    %ecx,%eax
  100764:	83 c1 04             	add    $0x4,%ecx
  100767:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
  10076d:	83 ec 0c             	sub    $0xc,%esp
  100770:	ff 30                	pushl  (%eax)
  100772:	e8 d9 fd ff ff       	call   100550 <printDemical>
  100777:	83 c4 10             	add    $0x10,%esp
  10077a:	eb a6                	jmp    100722 <printf+0x82>
  10077c:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
  100782:	89 c8                	mov    %ecx,%eax
  100784:	83 c1 04             	add    $0x4,%ecx
  100787:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
  10078d:	8b 30                	mov    (%eax),%esi
  10078f:	0f be 06             	movsbl (%esi),%eax
  100792:	46                   	inc    %esi
  100793:	84 c0                	test   %al,%al
  100795:	74 8b                	je     100722 <printf+0x82>
  100797:	90                   	nop
  100798:	83 ec 0c             	sub    $0xc,%esp
  10079b:	50                   	push   %eax
  10079c:	e8 ab 00 00 00       	call   10084c <putChar>
  1007a1:	46                   	inc    %esi
  1007a2:	0f be 46 ff          	movsbl -0x1(%esi),%eax
  1007a6:	83 c4 10             	add    $0x10,%esp
  1007a9:	84 c0                	test   %al,%al
  1007ab:	75 eb                	jne    100798 <printf+0xf8>
  1007ad:	e9 70 ff ff ff       	jmp    100722 <printf+0x82>
  1007b2:	66 90                	xchg   %ax,%ax

001007b4 <initIntr>:
  1007b4:	55                   	push   %ebp
  1007b5:	89 e5                	mov    %esp,%ebp
  1007b7:	ba 21 00 00 00       	mov    $0x21,%edx
  1007bc:	b0 ff                	mov    $0xff,%al
  1007be:	ee                   	out    %al,(%dx)
  1007bf:	ba a1 00 00 00       	mov    $0xa1,%edx
  1007c4:	ee                   	out    %al,(%dx)
  1007c5:	ba 20 00 00 00       	mov    $0x20,%edx
  1007ca:	b0 11                	mov    $0x11,%al
  1007cc:	ee                   	out    %al,(%dx)
  1007cd:	ba 21 00 00 00       	mov    $0x21,%edx
  1007d2:	b0 20                	mov    $0x20,%al
  1007d4:	ee                   	out    %al,(%dx)
  1007d5:	b0 04                	mov    $0x4,%al
  1007d7:	ee                   	out    %al,(%dx)
  1007d8:	b0 03                	mov    $0x3,%al
  1007da:	ee                   	out    %al,(%dx)
  1007db:	ba a0 00 00 00       	mov    $0xa0,%edx
  1007e0:	b0 11                	mov    $0x11,%al
  1007e2:	ee                   	out    %al,(%dx)
  1007e3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1007e8:	b0 28                	mov    $0x28,%al
  1007ea:	ee                   	out    %al,(%dx)
  1007eb:	b0 02                	mov    $0x2,%al
  1007ed:	ee                   	out    %al,(%dx)
  1007ee:	b0 03                	mov    $0x3,%al
  1007f0:	ee                   	out    %al,(%dx)
  1007f1:	ba 20 00 00 00       	mov    $0x20,%edx
  1007f6:	b0 68                	mov    $0x68,%al
  1007f8:	ee                   	out    %al,(%dx)
  1007f9:	b0 0a                	mov    $0xa,%al
  1007fb:	ee                   	out    %al,(%dx)
  1007fc:	ba a0 00 00 00       	mov    $0xa0,%edx
  100801:	b0 68                	mov    $0x68,%al
  100803:	ee                   	out    %al,(%dx)
  100804:	b0 0a                	mov    $0xa,%al
  100806:	ee                   	out    %al,(%dx)
  100807:	5d                   	pop    %ebp
  100808:	c3                   	ret    
  100809:	66 90                	xchg   %ax,%ax
  10080b:	90                   	nop

0010080c <initSerial>:
  10080c:	55                   	push   %ebp
  10080d:	89 e5                	mov    %esp,%ebp
  10080f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100814:	31 c0                	xor    %eax,%eax
  100816:	ee                   	out    %al,(%dx)
  100817:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10081c:	b0 80                	mov    $0x80,%al
  10081e:	ee                   	out    %al,(%dx)
  10081f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100824:	b0 01                	mov    $0x1,%al
  100826:	ee                   	out    %al,(%dx)
  100827:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10082c:	31 c0                	xor    %eax,%eax
  10082e:	ee                   	out    %al,(%dx)
  10082f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100834:	b0 03                	mov    $0x3,%al
  100836:	ee                   	out    %al,(%dx)
  100837:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10083c:	b0 c7                	mov    $0xc7,%al
  10083e:	ee                   	out    %al,(%dx)
  10083f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100844:	b0 0b                	mov    $0xb,%al
  100846:	ee                   	out    %al,(%dx)
  100847:	5d                   	pop    %ebp
  100848:	c3                   	ret    
  100849:	8d 76 00             	lea    0x0(%esi),%esi

0010084c <putChar>:
  10084c:	55                   	push   %ebp
  10084d:	89 e5                	mov    %esp,%ebp
  10084f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100852:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100857:	90                   	nop
  100858:	ec                   	in     (%dx),%al
  100859:	a8 20                	test   $0x20,%al
  10085b:	74 fb                	je     100858 <putChar+0xc>
  10085d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100862:	88 c8                	mov    %cl,%al
  100864:	ee                   	out    %al,(%dx)
  100865:	5d                   	pop    %ebp
  100866:	c3                   	ret    
  100867:	90                   	nop

00100868 <initTimer>:
  100868:	55                   	push   %ebp
  100869:	89 e5                	mov    %esp,%ebp
  10086b:	ba 43 00 00 00       	mov    $0x43,%edx
  100870:	b0 34                	mov    $0x34,%al
  100872:	ee                   	out    %al,(%dx)
  100873:	ba 40 00 00 00       	mov    $0x40,%edx
  100878:	b0 9b                	mov    $0x9b,%al
  10087a:	ee                   	out    %al,(%dx)
  10087b:	b0 2e                	mov    $0x2e,%al
  10087d:	ee                   	out    %al,(%dx)
  10087e:	5d                   	pop    %ebp
  10087f:	c3                   	ret    

00100880 <waitDisk>:
  100880:	55                   	push   %ebp
  100881:	89 e5                	mov    %esp,%ebp
  100883:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100888:	ec                   	in     (%dx),%al
  100889:	83 e0 c0             	and    $0xffffffc0,%eax
  10088c:	3c 40                	cmp    $0x40,%al
  10088e:	75 f8                	jne    100888 <waitDisk+0x8>
  100890:	5d                   	pop    %ebp
  100891:	c3                   	ret    
  100892:	66 90                	xchg   %ax,%ax

00100894 <readSect>:
  100894:	55                   	push   %ebp
  100895:	89 e5                	mov    %esp,%ebp
  100897:	53                   	push   %ebx
  100898:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10089b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1008a0:	ec                   	in     (%dx),%al
  1008a1:	83 e0 c0             	and    $0xffffffc0,%eax
  1008a4:	3c 40                	cmp    $0x40,%al
  1008a6:	75 f8                	jne    1008a0 <readSect+0xc>
  1008a8:	ba f2 01 00 00       	mov    $0x1f2,%edx
  1008ad:	b0 01                	mov    $0x1,%al
  1008af:	ee                   	out    %al,(%dx)
  1008b0:	ba f3 01 00 00       	mov    $0x1f3,%edx
  1008b5:	88 c8                	mov    %cl,%al
  1008b7:	ee                   	out    %al,(%dx)
  1008b8:	89 c8                	mov    %ecx,%eax
  1008ba:	c1 f8 08             	sar    $0x8,%eax
  1008bd:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1008c2:	ee                   	out    %al,(%dx)
  1008c3:	89 c8                	mov    %ecx,%eax
  1008c5:	c1 f8 10             	sar    $0x10,%eax
  1008c8:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1008cd:	ee                   	out    %al,(%dx)
  1008ce:	89 c8                	mov    %ecx,%eax
  1008d0:	c1 f8 18             	sar    $0x18,%eax
  1008d3:	83 c8 e0             	or     $0xffffffe0,%eax
  1008d6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1008db:	ee                   	out    %al,(%dx)
  1008dc:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1008e1:	b0 20                	mov    $0x20,%al
  1008e3:	ee                   	out    %al,(%dx)
  1008e4:	ec                   	in     (%dx),%al
  1008e5:	83 e0 c0             	and    $0xffffffc0,%eax
  1008e8:	3c 40                	cmp    $0x40,%al
  1008ea:	75 f8                	jne    1008e4 <readSect+0x50>
  1008ec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1008ef:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1008f5:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1008fa:	66 90                	xchg   %ax,%ax
  1008fc:	ed                   	in     (%dx),%eax
  1008fd:	89 01                	mov    %eax,(%ecx)
  1008ff:	83 c1 04             	add    $0x4,%ecx
  100902:	39 d9                	cmp    %ebx,%ecx
  100904:	75 f6                	jne    1008fc <readSect+0x68>
  100906:	5b                   	pop    %ebx
  100907:	5d                   	pop    %ebp
  100908:	c3                   	ret    
  100909:	8d 76 00             	lea    0x0(%esi),%esi

0010090c <initSeg>:
  10090c:	55                   	push   %ebp
  10090d:	89 e5                	mov    %esp,%ebp
  10090f:	ba 60 29 10 00       	mov    $0x102960,%edx
  100914:	66 c7 05 68 29 10 00 	movw   $0xffff,0x102968
  10091b:	ff ff 
  10091d:	66 c7 05 6a 29 10 00 	movw   $0x0,0x10296a
  100924:	00 00 
  100926:	c6 05 6c 29 10 00 00 	movb   $0x0,0x10296c
  10092d:	c6 05 6d 29 10 00 9a 	movb   $0x9a,0x10296d
  100934:	c6 05 6e 29 10 00 cf 	movb   $0xcf,0x10296e
  10093b:	c6 05 6f 29 10 00 00 	movb   $0x0,0x10296f
  100942:	66 c7 05 70 29 10 00 	movw   $0xffff,0x102970
  100949:	ff ff 
  10094b:	66 c7 05 72 29 10 00 	movw   $0x0,0x102972
  100952:	00 00 
  100954:	c6 05 74 29 10 00 00 	movb   $0x0,0x102974
  10095b:	c6 05 75 29 10 00 92 	movb   $0x92,0x102975
  100962:	c6 05 76 29 10 00 cf 	movb   $0xcf,0x102976
  100969:	c6 05 77 29 10 00 00 	movb   $0x0,0x102977
  100970:	66 c7 05 90 29 10 00 	movw   $0xffff,0x102990
  100977:	ff ff 
  100979:	66 c7 05 92 29 10 00 	movw   $0x0,0x102992
  100980:	00 00 
  100982:	c6 05 94 29 10 00 00 	movb   $0x0,0x102994
  100989:	c6 05 95 29 10 00 92 	movb   $0x92,0x102995
  100990:	c6 05 96 29 10 00 cf 	movb   $0xcf,0x102996
  100997:	c6 05 97 29 10 00 00 	movb   $0x0,0x102997
  10099e:	66 c7 05 78 29 10 00 	movw   $0xffff,0x102978
  1009a5:	ff ff 
  1009a7:	66 c7 05 7a 29 10 00 	movw   $0x0,0x10297a
  1009ae:	00 00 
  1009b0:	c6 05 7c 29 10 00 00 	movb   $0x0,0x10297c
  1009b7:	c6 05 7d 29 10 00 fa 	movb   $0xfa,0x10297d
  1009be:	c6 05 7e 29 10 00 cf 	movb   $0xcf,0x10297e
  1009c5:	c6 05 7f 29 10 00 00 	movb   $0x0,0x10297f
  1009cc:	66 c7 05 80 29 10 00 	movw   $0xffff,0x102980
  1009d3:	ff ff 
  1009d5:	66 c7 05 82 29 10 00 	movw   $0x0,0x102982
  1009dc:	00 00 
  1009de:	c6 05 84 29 10 00 00 	movb   $0x0,0x102984
  1009e5:	c6 05 85 29 10 00 f2 	movb   $0xf2,0x102985
  1009ec:	c6 05 86 29 10 00 cf 	movb   $0xcf,0x102986
  1009f3:	c6 05 87 29 10 00 00 	movb   $0x0,0x102987
  1009fa:	66 c7 05 88 29 10 00 	movw   $0x63,0x102988
  100a01:	63 00 
  100a03:	b8 a0 29 10 00       	mov    $0x1029a0,%eax
  100a08:	66 a3 8a 29 10 00    	mov    %ax,0x10298a
  100a0e:	89 c1                	mov    %eax,%ecx
  100a10:	c1 e9 10             	shr    $0x10,%ecx
  100a13:	88 0d 8c 29 10 00    	mov    %cl,0x10298c
  100a19:	c6 05 8d 29 10 00 89 	movb   $0x89,0x10298d
  100a20:	c6 05 8e 29 10 00 40 	movb   $0x40,0x10298e
  100a27:	c1 e8 18             	shr    $0x18,%eax
  100a2a:	a2 8f 29 10 00       	mov    %al,0x10298f
  100a2f:	66 c7 05 10 21 10 00 	movw   $0x37,0x102110
  100a36:	37 00 
  100a38:	66 89 15 12 21 10 00 	mov    %dx,0x102112
  100a3f:	c1 ea 10             	shr    $0x10,%edx
  100a42:	66 89 15 14 21 10 00 	mov    %dx,0x102114
  100a49:	b8 10 21 10 00       	mov    $0x102110,%eax
  100a4e:	0f 01 10             	lgdtl  (%eax)
  100a51:	c7 05 a8 29 10 00 30 	movl   $0x30,0x1029a8
  100a58:	00 00 00 
  100a5b:	c7 05 a4 29 10 00 00 	movl   $0x10000,0x1029a4
  100a62:	00 01 00 
  100a65:	b8 28 00 00 00       	mov    $0x28,%eax
  100a6a:	0f 00 d8             	ltr    %ax
  100a6d:	b8 10 00 00 00       	mov    $0x10,%eax
  100a72:	89 c0                	mov    %eax,%eax
  100a74:	8e d8                	mov    %eax,%ds
  100a76:	8e c0                	mov    %eax,%es
  100a78:	8e d0                	mov    %eax,%ss
  100a7a:	8e e0                	mov    %eax,%fs
  100a7c:	8e e8                	mov    %eax,%gs
  100a7e:	31 c0                	xor    %eax,%eax
  100a80:	0f 00 d0             	lldt   %ax
  100a83:	5d                   	pop    %ebp
  100a84:	c3                   	ret    
  100a85:	8d 76 00             	lea    0x0(%esi),%esi

00100a88 <enterUserSpace>:
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	b8 23 00 00 00       	mov    $0x23,%eax
  100a90:	89 c0                	mov    %eax,%eax
  100a92:	8e d8                	mov    %eax,%ds
  100a94:	8e c0                	mov    %eax,%es
  100a96:	8e e0                	mov    %eax,%fs
  100a98:	8e e8                	mov    %eax,%gs
  100a9a:	50                   	push   %eax
  100a9b:	b8 00 00 00 08       	mov    $0x8000000,%eax
  100aa0:	50                   	push   %eax
  100aa1:	9c                   	pushf  
  100aa2:	b8 1b 00 00 00       	mov    $0x1b,%eax
  100aa7:	50                   	push   %eax
  100aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  100aab:	50                   	push   %eax
  100aac:	cf                   	iret   
  100aad:	5d                   	pop    %ebp
  100aae:	c3                   	ret    
  100aaf:	90                   	nop

00100ab0 <loadUMain>:
  100ab0:	55                   	push   %ebp
  100ab1:	89 e5                	mov    %esp,%ebp
  100ab3:	57                   	push   %edi
  100ab4:	56                   	push   %esi
  100ab5:	53                   	push   %ebx
  100ab6:	83 ec 0c             	sub    $0xc,%esp
  100ab9:	be c9 00 00 00       	mov    $0xc9,%esi
  100abe:	bb 00 00 00 02       	mov    $0x2000000,%ebx
  100ac3:	90                   	nop
  100ac4:	56                   	push   %esi
  100ac5:	53                   	push   %ebx
  100ac6:	e8 c9 fd ff ff       	call   100894 <readSect>
  100acb:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100ad1:	46                   	inc    %esi
  100ad2:	58                   	pop    %eax
  100ad3:	5a                   	pop    %edx
  100ad4:	81 fb 00 c8 00 02    	cmp    $0x200c800,%ebx
  100ada:	75 e8                	jne    100ac4 <loadUMain+0x14>
  100adc:	a1 1c 00 00 02       	mov    0x200001c,%eax
  100ae1:	8d 90 00 00 00 02    	lea    0x2000000(%eax),%edx
  100ae7:	31 db                	xor    %ebx,%ebx
  100ae9:	66 83 3d 2c 00 00 02 	cmpw   $0x0,0x200002c
  100af0:	00 
  100af1:	75 14                	jne    100b07 <loadUMain+0x57>
  100af3:	eb 49                	jmp    100b3e <loadUMain+0x8e>
  100af5:	8d 76 00             	lea    0x0(%esi),%esi
  100af8:	43                   	inc    %ebx
  100af9:	83 c2 20             	add    $0x20,%edx
  100afc:	0f b7 05 2c 00 00 02 	movzwl 0x200002c,%eax
  100b03:	39 d8                	cmp    %ebx,%eax
  100b05:	7e 37                	jle    100b3e <loadUMain+0x8e>
  100b07:	83 3a 01             	cmpl   $0x1,(%edx)
  100b0a:	75 ec                	jne    100af8 <loadUMain+0x48>
  100b0c:	8b 42 08             	mov    0x8(%edx),%eax
  100b0f:	8b 7a 04             	mov    0x4(%edx),%edi
  100b12:	8d b7 00 00 00 02    	lea    0x2000000(%edi),%esi
  100b18:	8b 4a 10             	mov    0x10(%edx),%ecx
  100b1b:	89 c7                	mov    %eax,%edi
  100b1d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100b1f:	8b 72 10             	mov    0x10(%edx),%esi
  100b22:	8b 4a 14             	mov    0x14(%edx),%ecx
  100b25:	29 f1                	sub    %esi,%ecx
  100b27:	01 c6                	add    %eax,%esi
  100b29:	89 f7                	mov    %esi,%edi
  100b2b:	31 c0                	xor    %eax,%eax
  100b2d:	f3 aa                	rep stos %al,%es:(%edi)
  100b2f:	43                   	inc    %ebx
  100b30:	83 c2 20             	add    $0x20,%edx
  100b33:	0f b7 05 2c 00 00 02 	movzwl 0x200002c,%eax
  100b3a:	39 d8                	cmp    %ebx,%eax
  100b3c:	7f c9                	jg     100b07 <loadUMain+0x57>
  100b3e:	e8 41 00 00 00       	call   100b84 <initNewPCB>
  100b43:	e8 3c 00 00 00       	call   100b84 <initNewPCB>
  100b48:	89 c2                	mov    %eax,%edx
  100b4a:	c1 e2 0a             	shl    $0xa,%edx
  100b4d:	01 c2                	add    %eax,%edx
  100b4f:	01 d2                	add    %edx,%edx
  100b51:	01 c2                	add    %eax,%edx
  100b53:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100b56:	8d 04 c5 20 2a 10 00 	lea    0x102a20(,%eax,8),%eax
  100b5d:	a3 24 37 30 00       	mov    %eax,0x303724
  100b62:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  100b69:	00 00 00 
  100b6c:	83 ec 0c             	sub    $0xc,%esp
  100b6f:	ff 35 18 00 00 02    	pushl  0x2000018
  100b75:	e8 5a 01 00 00       	call   100cd4 <enterProcessSpace>
  100b7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100b7d:	5b                   	pop    %ebx
  100b7e:	5e                   	pop    %esi
  100b7f:	5f                   	pop    %edi
  100b80:	5d                   	pop    %ebp
  100b81:	c3                   	ret    
  100b82:	66 90                	xchg   %ax,%ax

00100b84 <initNewPCB>:
  100b84:	55                   	push   %ebp
  100b85:	89 e5                	mov    %esp,%ebp
  100b87:	56                   	push   %esi
  100b88:	53                   	push   %ebx
  100b89:	8b 1d 18 21 10 00    	mov    0x102118,%ebx
  100b8f:	85 db                	test   %ebx,%ebx
  100b91:	0f 84 15 01 00 00    	je     100cac <initNewPCB+0x128>
  100b97:	83 3d 74 2a 11 00 03 	cmpl   $0x3,0x112a74
  100b9e:	0f 84 18 01 00 00    	je     100cbc <initNewPCB+0x138>
  100ba4:	b9 dc 2a 12 00       	mov    $0x122adc,%ecx
  100ba9:	89 de                	mov    %ebx,%esi
  100bab:	31 d2                	xor    %edx,%edx
  100bad:	eb 14                	jmp    100bc3 <initNewPCB+0x3f>
  100baf:	90                   	nop
  100bb0:	81 c1 68 00 01 00    	add    $0x10068,%ecx
  100bb6:	83 b9 98 ff fe ff 03 	cmpl   $0x3,-0x10068(%ecx)
  100bbd:	0f 84 cd 00 00 00    	je     100c90 <initNewPCB+0x10c>
  100bc3:	42                   	inc    %edx
  100bc4:	89 d0                	mov    %edx,%eax
  100bc6:	39 da                	cmp    %ebx,%edx
  100bc8:	75 e6                	jne    100bb0 <initNewPCB+0x2c>
  100bca:	39 da                	cmp    %ebx,%edx
  100bcc:	0f 84 c8 00 00 00    	je     100c9a <initNewPCB+0x116>
  100bd2:	8d 8e 00 02 00 00    	lea    0x200(%esi),%ecx
  100bd8:	89 f2                	mov    %esi,%edx
  100bda:	c1 e2 0a             	shl    $0xa,%edx
  100bdd:	01 f2                	add    %esi,%edx
  100bdf:	01 d2                	add    %edx,%edx
  100be1:	01 f2                	add    %esi,%edx
  100be3:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100be6:	8d 14 d5 20 2a 10 00 	lea    0x102a20(,%edx,8),%edx
  100bed:	c7 82 54 00 01 00 01 	movl   $0x1,0x10054(%edx)
  100bf4:	00 00 00 
  100bf7:	c7 82 5c 00 01 00 00 	movl   $0x0,0x1005c(%edx)
  100bfe:	00 00 00 
  100c01:	c7 82 58 00 01 00 00 	movl   $0x0,0x10058(%edx)
  100c08:	00 00 00 
  100c0b:	89 8a 60 00 01 00    	mov    %ecx,0x10060(%edx)
  100c11:	c7 82 4c 00 01 00 00 	movl   $0x10000,0x1004c(%edx)
  100c18:	00 01 00 
  100c1b:	c7 82 50 00 01 00 00 	movl   $0x10000,0x10050(%edx)
  100c22:	00 01 00 
  100c25:	c7 82 64 00 01 00 00 	movl   $0x0,0x10064(%edx)
  100c2c:	00 00 00 
  100c2f:	c7 82 00 00 01 00 23 	movl   $0x23,0x10000(%edx)
  100c36:	00 00 00 
  100c39:	c7 82 04 00 01 00 23 	movl   $0x23,0x10004(%edx)
  100c40:	00 00 00 
  100c43:	c7 82 08 00 01 00 23 	movl   $0x23,0x10008(%edx)
  100c4a:	00 00 00 
  100c4d:	c7 82 0c 00 01 00 23 	movl   $0x23,0x1000c(%edx)
  100c54:	00 00 00 
  100c57:	c7 82 38 00 01 00 00 	movl   $0x0,0x10038(%edx)
  100c5e:	00 00 00 
  100c61:	c7 82 3c 00 01 00 1b 	movl   $0x1b,0x1003c(%edx)
  100c68:	00 00 00 
  100c6b:	c7 82 40 00 01 00 00 	movl   $0x0,0x10040(%edx)
  100c72:	00 00 00 
  100c75:	c7 82 44 00 01 00 00 	movl   $0x100000,0x10044(%edx)
  100c7c:	00 10 00 
  100c7f:	c7 82 48 00 01 00 23 	movl   $0x23,0x10048(%edx)
  100c86:	00 00 00 
  100c89:	5b                   	pop    %ebx
  100c8a:	5e                   	pop    %esi
  100c8b:	5d                   	pop    %ebp
  100c8c:	c3                   	ret    
  100c8d:	8d 76 00             	lea    0x0(%esi),%esi
  100c90:	89 d6                	mov    %edx,%esi
  100c92:	39 da                	cmp    %ebx,%edx
  100c94:	0f 85 38 ff ff ff    	jne    100bd2 <initNewPCB+0x4e>
  100c9a:	42                   	inc    %edx
  100c9b:	8d 8e 00 02 00 00    	lea    0x200(%esi),%ecx
  100ca1:	89 15 18 21 10 00    	mov    %edx,0x102118
  100ca7:	e9 2c ff ff ff       	jmp    100bd8 <initNewPCB+0x54>
  100cac:	31 c0                	xor    %eax,%eax
  100cae:	b9 00 02 00 00       	mov    $0x200,%ecx
  100cb3:	ba 01 00 00 00       	mov    $0x1,%edx
  100cb8:	31 f6                	xor    %esi,%esi
  100cba:	eb e5                	jmp    100ca1 <initNewPCB+0x11d>
  100cbc:	b9 00 02 00 00       	mov    $0x200,%ecx
  100cc1:	31 f6                	xor    %esi,%esi
  100cc3:	31 c0                	xor    %eax,%eax
  100cc5:	e9 0e ff ff ff       	jmp    100bd8 <initNewPCB+0x54>
  100cca:	66 90                	xchg   %ax,%ax

00100ccc <idle>:
  100ccc:	55                   	push   %ebp
  100ccd:	89 e5                	mov    %esp,%ebp
  100ccf:	fb                   	sti    
  100cd0:	f4                   	hlt    
  100cd1:	eb fd                	jmp    100cd0 <idle+0x4>
  100cd3:	90                   	nop

00100cd4 <enterProcessSpace>:
  100cd4:	55                   	push   %ebp
  100cd5:	89 e5                	mov    %esp,%ebp
  100cd7:	57                   	push   %edi
  100cd8:	56                   	push   %esi
  100cd9:	53                   	push   %ebx
  100cda:	8b 75 08             	mov    0x8(%ebp),%esi
  100cdd:	a1 24 37 30 00       	mov    0x303724,%eax
  100ce2:	2d 20 2a 10 00       	sub    $0x102a20,%eax
  100ce7:	c1 f8 03             	sar    $0x3,%eax
  100cea:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100ced:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100cf0:	01 d2                	add    %edx,%edx
  100cf2:	01 c2                	add    %eax,%edx
  100cf4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cf7:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100cfa:	c1 e2 0b             	shl    $0xb,%edx
  100cfd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  100d00:	89 ca                	mov    %ecx,%edx
  100d02:	c1 e2 04             	shl    $0x4,%edx
  100d05:	01 ca                	add    %ecx,%edx
  100d07:	01 d2                	add    %edx,%edx
  100d09:	01 d0                	add    %edx,%eax
  100d0b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100d0e:	f7 d8                	neg    %eax
  100d10:	83 c0 04             	add    $0x4,%eax
  100d13:	c1 e0 14             	shl    $0x14,%eax
  100d16:	b9 00 00 02 00       	mov    $0x20000,%ecx
  100d1b:	89 c7                	mov    %eax,%edi
  100d1d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100d1f:	8b 15 24 37 30 00    	mov    0x303724,%edx
  100d25:	89 d0                	mov    %edx,%eax
  100d27:	2d 20 2a 10 00       	sub    $0x102a20,%eax
  100d2c:	c1 f8 03             	sar    $0x3,%eax
  100d2f:	89 c1                	mov    %eax,%ecx
  100d31:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100d34:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100d37:	01 c0                	add    %eax,%eax
  100d39:	01 c8                	add    %ecx,%eax
  100d3b:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d3e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100d41:	c1 e0 0b             	shl    $0xb,%eax
  100d44:	01 c8                	add    %ecx,%eax
  100d46:	89 c6                	mov    %eax,%esi
  100d48:	c1 e6 04             	shl    $0x4,%esi
  100d4b:	01 f0                	add    %esi,%eax
  100d4d:	01 c0                	add    %eax,%eax
  100d4f:	01 c8                	add    %ecx,%eax
  100d51:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100d54:	f7 d8                	neg    %eax
  100d56:	83 c0 04             	add    $0x4,%eax
  100d59:	c1 e0 14             	shl    $0x14,%eax
  100d5c:	89 c3                	mov    %eax,%ebx
  100d5e:	c1 eb 10             	shr    $0x10,%ebx
  100d61:	c1 e8 18             	shr    $0x18,%eax
  100d64:	b9 60 29 10 00       	mov    $0x102960,%ecx
  100d69:	66 c7 05 78 29 10 00 	movw   $0x100,0x102978
  100d70:	00 01 
  100d72:	66 c7 05 7a 29 10 00 	movw   $0x0,0x10297a
  100d79:	00 00 
  100d7b:	88 1d 7c 29 10 00    	mov    %bl,0x10297c
  100d81:	c6 05 7d 29 10 00 fa 	movb   $0xfa,0x10297d
  100d88:	c6 05 7e 29 10 00 c0 	movb   $0xc0,0x10297e
  100d8f:	a2 7f 29 10 00       	mov    %al,0x10297f
  100d94:	66 c7 05 80 29 10 00 	movw   $0x100,0x102980
  100d9b:	00 01 
  100d9d:	66 c7 05 82 29 10 00 	movw   $0x0,0x102982
  100da4:	00 00 
  100da6:	88 1d 84 29 10 00    	mov    %bl,0x102984
  100dac:	c6 05 85 29 10 00 f2 	movb   $0xf2,0x102985
  100db3:	c6 05 86 29 10 00 c0 	movb   $0xc0,0x102986
  100dba:	a2 87 29 10 00       	mov    %al,0x102987
  100dbf:	66 c7 05 90 29 10 00 	movw   $0x10,0x102990
  100dc6:	10 00 
  100dc8:	66 89 15 92 29 10 00 	mov    %dx,0x102992
  100dcf:	89 d0                	mov    %edx,%eax
  100dd1:	c1 e8 10             	shr    $0x10,%eax
  100dd4:	a2 94 29 10 00       	mov    %al,0x102994
  100dd9:	c6 05 95 29 10 00 92 	movb   $0x92,0x102995
  100de0:	c6 05 96 29 10 00 c0 	movb   $0xc0,0x102996
  100de7:	89 d0                	mov    %edx,%eax
  100de9:	c1 e8 18             	shr    $0x18,%eax
  100dec:	a2 97 29 10 00       	mov    %al,0x102997
  100df1:	66 c7 05 1c 21 10 00 	movw   $0x37,0x10211c
  100df8:	37 00 
  100dfa:	66 89 0d 1e 21 10 00 	mov    %cx,0x10211e
  100e01:	c1 e9 10             	shr    $0x10,%ecx
  100e04:	66 89 0d 20 21 10 00 	mov    %cx,0x102120
  100e0b:	b8 1c 21 10 00       	mov    $0x10211c,%eax
  100e10:	0f 01 10             	lgdtl  (%eax)
  100e13:	8d 82 44 00 01 00    	lea    0x10044(%edx),%eax
  100e19:	89 c4                	mov    %eax,%esp
  100e1b:	9c                   	pushf  
  100e1c:	81 c2 38 00 01 00    	add    $0x10038,%edx
  100e22:	89 d4                	mov    %edx,%esp
  100e24:	b8 23 00 00 00       	mov    $0x23,%eax
  100e29:	89 c0                	mov    %eax,%eax
  100e2b:	8e d8                	mov    %eax,%ds
  100e2d:	8e c0                	mov    %eax,%es
  100e2f:	8e e0                	mov    %eax,%fs
  100e31:	8e e8                	mov    %eax,%gs
  100e33:	cf                   	iret   
  100e34:	5b                   	pop    %ebx
  100e35:	5e                   	pop    %esi
  100e36:	5f                   	pop    %edi
  100e37:	5d                   	pop    %ebp
  100e38:	c3                   	ret    
  100e39:	8d 76 00             	lea    0x0(%esi),%esi

00100e3c <addToBlocked>:
  100e3c:	55                   	push   %ebp
  100e3d:	89 e5                	mov    %esp,%ebp
  100e3f:	8b 45 08             	mov    0x8(%ebp),%eax
  100e42:	8b 15 20 37 30 00    	mov    0x303720,%edx
  100e48:	85 d2                	test   %edx,%edx
  100e4a:	74 14                	je     100e60 <addToBlocked+0x24>
  100e4c:	8b 15 30 37 30 00    	mov    0x303730,%edx
  100e52:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  100e58:	a3 30 37 30 00       	mov    %eax,0x303730
  100e5d:	5d                   	pop    %ebp
  100e5e:	c3                   	ret    
  100e5f:	90                   	nop
  100e60:	a3 20 37 30 00       	mov    %eax,0x303720
  100e65:	a3 30 37 30 00       	mov    %eax,0x303730
  100e6a:	5d                   	pop    %ebp
  100e6b:	c3                   	ret    

00100e6c <addToRunnable>:
  100e6c:	55                   	push   %ebp
  100e6d:	89 e5                	mov    %esp,%ebp
  100e6f:	8b 45 08             	mov    0x8(%ebp),%eax
  100e72:	8b 15 28 37 30 00    	mov    0x303728,%edx
  100e78:	85 d2                	test   %edx,%edx
  100e7a:	74 14                	je     100e90 <addToRunnable+0x24>
  100e7c:	8b 15 2c 37 30 00    	mov    0x30372c,%edx
  100e82:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  100e88:	a3 2c 37 30 00       	mov    %eax,0x30372c
  100e8d:	5d                   	pop    %ebp
  100e8e:	c3                   	ret    
  100e8f:	90                   	nop
  100e90:	a3 28 37 30 00       	mov    %eax,0x303728
  100e95:	a3 2c 37 30 00       	mov    %eax,0x30372c
  100e9a:	5d                   	pop    %ebp
  100e9b:	c3                   	ret    

00100e9c <updateTime>:
  100e9c:	55                   	push   %ebp
  100e9d:	89 e5                	mov    %esp,%ebp
  100e9f:	a1 24 37 30 00       	mov    0x303724,%eax
  100ea4:	83 b8 54 00 01 00 02 	cmpl   $0x2,0x10054(%eax)
  100eab:	74 06                	je     100eb3 <updateTime+0x17>
  100ead:	ff 80 58 00 01 00    	incl   0x10058(%eax)
  100eb3:	a1 20 37 30 00       	mov    0x303720,%eax
  100eb8:	85 c0                	test   %eax,%eax
  100eba:	74 3b                	je     100ef7 <updateTime+0x5b>
  100ebc:	8b 88 5c 00 01 00    	mov    0x1005c(%eax),%ecx
  100ec2:	8d 51 ff             	lea    -0x1(%ecx),%edx
  100ec5:	89 90 5c 00 01 00    	mov    %edx,0x1005c(%eax)
  100ecb:	85 d2                	test   %edx,%edx
  100ecd:	75 1e                	jne    100eed <updateTime+0x51>
  100ecf:	c7 80 54 00 01 00 01 	movl   $0x1,0x10054(%eax)
  100ed6:	00 00 00 
  100ed9:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  100ee0:	00 00 00 
  100ee3:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  100eea:	00 00 00 
  100eed:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  100ef3:	85 c0                	test   %eax,%eax
  100ef5:	75 c5                	jne    100ebc <updateTime+0x20>
  100ef7:	5d                   	pop    %ebp
  100ef8:	c3                   	ret    
  100ef9:	8d 76 00             	lea    0x0(%esi),%esi

00100efc <checkRunnableList>:
  100efc:	55                   	push   %ebp
  100efd:	89 e5                	mov    %esp,%ebp
  100eff:	57                   	push   %edi
  100f00:	56                   	push   %esi
  100f01:	53                   	push   %ebx
  100f02:	52                   	push   %edx
  100f03:	a1 28 37 30 00       	mov    0x303728,%eax
  100f08:	8b 3d 20 37 30 00    	mov    0x303720,%edi
  100f0e:	8b 35 30 37 30 00    	mov    0x303730,%esi
  100f14:	31 db                	xor    %ebx,%ebx
  100f16:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  100f1a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100f1e:	eb 0c                	jmp    100f2c <checkRunnableList+0x30>
  100f20:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  100f26:	b3 01                	mov    $0x1,%bl
  100f28:	85 c0                	test   %eax,%eax
  100f2a:	74 37                	je     100f63 <checkRunnableList+0x67>
  100f2c:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  100f32:	8d 4a fe             	lea    -0x2(%edx),%ecx
  100f35:	83 f9 01             	cmp    $0x1,%ecx
  100f38:	0f 87 be 00 00 00    	ja     100ffc <checkRunnableList+0x100>
  100f3e:	83 fa 02             	cmp    $0x2,%edx
  100f41:	75 dd                	jne    100f20 <checkRunnableList+0x24>
  100f43:	85 ff                	test   %edi,%edi
  100f45:	0f 84 e9 00 00 00    	je     101034 <checkRunnableList+0x138>
  100f4b:	89 86 64 00 01 00    	mov    %eax,0x10064(%esi)
  100f51:	89 c6                	mov    %eax,%esi
  100f53:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  100f57:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  100f5d:	b3 01                	mov    $0x1,%bl
  100f5f:	85 c0                	test   %eax,%eax
  100f61:	75 c9                	jne    100f2c <checkRunnableList+0x30>
  100f63:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  100f67:	0f 85 fc 00 00 00    	jne    101069 <checkRunnableList+0x16d>
  100f6d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  100f71:	0f 85 fd 00 00 00    	jne    101074 <checkRunnableList+0x178>
  100f77:	c7 05 28 37 30 00 00 	movl   $0x0,0x303728
  100f7e:	00 00 00 
  100f81:	c7 05 2c 37 30 00 00 	movl   $0x0,0x30372c
  100f88:	00 00 00 
  100f8b:	31 c0                	xor    %eax,%eax
  100f8d:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  100f93:	85 d2                	test   %edx,%edx
  100f95:	74 5e                	je     100ff5 <checkRunnableList+0xf9>
  100f97:	8b 3d 20 37 30 00    	mov    0x303720,%edi
  100f9d:	8b 35 30 37 30 00    	mov    0x303730,%esi
  100fa3:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100fa7:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  100fab:	eb 0f                	jmp    100fbc <checkRunnableList+0xc0>
  100fad:	8d 76 00             	lea    0x0(%esi),%esi
  100fb0:	89 d0                	mov    %edx,%eax
  100fb2:	8b 92 64 00 01 00    	mov    0x10064(%edx),%edx
  100fb8:	85 d2                	test   %edx,%edx
  100fba:	74 29                	je     100fe5 <checkRunnableList+0xe9>
  100fbc:	8b 8a 54 00 01 00    	mov    0x10054(%edx),%ecx
  100fc2:	8d 59 fe             	lea    -0x2(%ecx),%ebx
  100fc5:	83 fb 01             	cmp    $0x1,%ebx
  100fc8:	77 e6                	ja     100fb0 <checkRunnableList+0xb4>
  100fca:	83 f9 02             	cmp    $0x2,%ecx
  100fcd:	74 51                	je     101020 <checkRunnableList+0x124>
  100fcf:	8b 8a 64 00 01 00    	mov    0x10064(%edx),%ecx
  100fd5:	89 88 64 00 01 00    	mov    %ecx,0x10064(%eax)
  100fdb:	8b 92 64 00 01 00    	mov    0x10064(%edx),%edx
  100fe1:	85 d2                	test   %edx,%edx
  100fe3:	75 d7                	jne    100fbc <checkRunnableList+0xc0>
  100fe5:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  100fe9:	0f 85 90 00 00 00    	jne    10107f <checkRunnableList+0x183>
  100fef:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  100ff3:	75 64                	jne    101059 <checkRunnableList+0x15d>
  100ff5:	58                   	pop    %eax
  100ff6:	5b                   	pop    %ebx
  100ff7:	5e                   	pop    %esi
  100ff8:	5f                   	pop    %edi
  100ff9:	5d                   	pop    %ebp
  100ffa:	c3                   	ret    
  100ffb:	90                   	nop
  100ffc:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  101000:	75 5f                	jne    101061 <checkRunnableList+0x165>
  101002:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  101006:	74 06                	je     10100e <checkRunnableList+0x112>
  101008:	89 35 30 37 30 00    	mov    %esi,0x303730
  10100e:	84 db                	test   %bl,%bl
  101010:	0f 84 77 ff ff ff    	je     100f8d <checkRunnableList+0x91>
  101016:	a3 28 37 30 00       	mov    %eax,0x303728
  10101b:	e9 6d ff ff ff       	jmp    100f8d <checkRunnableList+0x91>
  101020:	85 ff                	test   %edi,%edi
  101022:	74 24                	je     101048 <checkRunnableList+0x14c>
  101024:	89 96 64 00 01 00    	mov    %edx,0x10064(%esi)
  10102a:	89 d6                	mov    %edx,%esi
  10102c:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101030:	eb 9d                	jmp    100fcf <checkRunnableList+0xd3>
  101032:	66 90                	xchg   %ax,%ax
  101034:	89 c6                	mov    %eax,%esi
  101036:	89 c7                	mov    %eax,%edi
  101038:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10103c:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101040:	e9 db fe ff ff       	jmp    100f20 <checkRunnableList+0x24>
  101045:	8d 76 00             	lea    0x0(%esi),%esi
  101048:	89 d6                	mov    %edx,%esi
  10104a:	89 d7                	mov    %edx,%edi
  10104c:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101050:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101054:	e9 76 ff ff ff       	jmp    100fcf <checkRunnableList+0xd3>
  101059:	89 35 30 37 30 00    	mov    %esi,0x303730
  10105f:	eb 94                	jmp    100ff5 <checkRunnableList+0xf9>
  101061:	89 3d 20 37 30 00    	mov    %edi,0x303720
  101067:	eb 99                	jmp    101002 <checkRunnableList+0x106>
  101069:	89 3d 20 37 30 00    	mov    %edi,0x303720
  10106f:	e9 f9 fe ff ff       	jmp    100f6d <checkRunnableList+0x71>
  101074:	89 35 30 37 30 00    	mov    %esi,0x303730
  10107a:	e9 f8 fe ff ff       	jmp    100f77 <checkRunnableList+0x7b>
  10107f:	89 3d 20 37 30 00    	mov    %edi,0x303720
  101085:	e9 65 ff ff ff       	jmp    100fef <checkRunnableList+0xf3>
  10108a:	66 90                	xchg   %ax,%ax

0010108c <checkBlockedList>:
  10108c:	55                   	push   %ebp
  10108d:	89 e5                	mov    %esp,%ebp
  10108f:	56                   	push   %esi
  101090:	53                   	push   %ebx
  101091:	a1 20 37 30 00       	mov    0x303720,%eax
  101096:	eb 18                	jmp    1010b0 <checkBlockedList+0x24>
  101098:	83 fa 03             	cmp    $0x3,%edx
  10109b:	0f 85 d3 00 00 00    	jne    101174 <checkBlockedList+0xe8>
  1010a1:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1010a7:	a3 20 37 30 00       	mov    %eax,0x303720
  1010ac:	85 c0                	test   %eax,%eax
  1010ae:	74 50                	je     101100 <checkBlockedList+0x74>
  1010b0:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  1010b6:	83 fa 01             	cmp    $0x1,%edx
  1010b9:	75 dd                	jne    101098 <checkBlockedList+0xc>
  1010bb:	83 ec 0c             	sub    $0xc,%esp
  1010be:	68 60 14 10 00       	push   $0x101460
  1010c3:	e8 d8 f5 ff ff       	call   1006a0 <printf>
  1010c8:	a1 20 37 30 00       	mov    0x303720,%eax
  1010cd:	83 c4 10             	add    $0x10,%esp
  1010d0:	8b 15 28 37 30 00    	mov    0x303728,%edx
  1010d6:	85 d2                	test   %edx,%edx
  1010d8:	0f 84 9a 00 00 00    	je     101178 <checkBlockedList+0xec>
  1010de:	8b 15 2c 37 30 00    	mov    0x30372c,%edx
  1010e4:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  1010ea:	a3 2c 37 30 00       	mov    %eax,0x30372c
  1010ef:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1010f5:	a3 20 37 30 00       	mov    %eax,0x303720
  1010fa:	85 c0                	test   %eax,%eax
  1010fc:	75 b2                	jne    1010b0 <checkBlockedList+0x24>
  1010fe:	66 90                	xchg   %ax,%ax
  101100:	c7 05 30 37 30 00 00 	movl   $0x0,0x303730
  101107:	00 00 00 
  10110a:	31 db                	xor    %ebx,%ebx
  10110c:	8b b3 64 00 01 00    	mov    0x10064(%ebx),%esi
  101112:	66 90                	xchg   %ax,%ax
  101114:	85 f6                	test   %esi,%esi
  101116:	74 1c                	je     101134 <checkBlockedList+0xa8>
  101118:	8b 86 54 00 01 00    	mov    0x10054(%esi),%eax
  10111e:	83 f8 01             	cmp    $0x1,%eax
  101121:	74 19                	je     10113c <checkBlockedList+0xb0>
  101123:	83 f8 03             	cmp    $0x3,%eax
  101126:	74 3e                	je     101166 <checkBlockedList+0xda>
  101128:	89 f3                	mov    %esi,%ebx
  10112a:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101130:	85 f6                	test   %esi,%esi
  101132:	75 e4                	jne    101118 <checkBlockedList+0x8c>
  101134:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101137:	5b                   	pop    %ebx
  101138:	5e                   	pop    %esi
  101139:	5d                   	pop    %ebp
  10113a:	c3                   	ret    
  10113b:	90                   	nop
  10113c:	83 ec 0c             	sub    $0xc,%esp
  10113f:	68 60 14 10 00       	push   $0x101460
  101144:	e8 57 f5 ff ff       	call   1006a0 <printf>
  101149:	83 c4 10             	add    $0x10,%esp
  10114c:	a1 28 37 30 00       	mov    0x303728,%eax
  101151:	85 c0                	test   %eax,%eax
  101153:	74 32                	je     101187 <checkBlockedList+0xfb>
  101155:	a1 2c 37 30 00       	mov    0x30372c,%eax
  10115a:	89 b0 64 00 01 00    	mov    %esi,0x10064(%eax)
  101160:	89 35 2c 37 30 00    	mov    %esi,0x30372c
  101166:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  10116c:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  101172:	eb a0                	jmp    101114 <checkBlockedList+0x88>
  101174:	89 c3                	mov    %eax,%ebx
  101176:	eb 94                	jmp    10110c <checkBlockedList+0x80>
  101178:	a3 28 37 30 00       	mov    %eax,0x303728
  10117d:	a3 2c 37 30 00       	mov    %eax,0x30372c
  101182:	e9 1a ff ff ff       	jmp    1010a1 <checkBlockedList+0x15>
  101187:	89 35 28 37 30 00    	mov    %esi,0x303728
  10118d:	89 35 2c 37 30 00    	mov    %esi,0x30372c
  101193:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101199:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  10119f:	e9 70 ff ff ff       	jmp    101114 <checkBlockedList+0x88>

001011a4 <schedule>:
  1011a4:	a1 28 37 30 00       	mov    0x303728,%eax
  1011a9:	85 c0                	test   %eax,%eax
  1011ab:	74 4a                	je     1011f7 <schedule+0x53>
  1011ad:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  1011b4:	00 00 00 
  1011b7:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  1011be:	00 00 00 
  1011c1:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  1011c8:	00 00 00 
  1011cb:	a3 24 37 30 00       	mov    %eax,0x303724
  1011d0:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  1011d6:	89 15 28 37 30 00    	mov    %edx,0x303728
  1011dc:	c7 80 64 00 01 00 00 	movl   $0x0,0x10064(%eax)
  1011e3:	00 00 00 
  1011e6:	85 d2                	test   %edx,%edx
  1011e8:	74 02                	je     1011ec <schedule+0x48>
  1011ea:	c3                   	ret    
  1011eb:	90                   	nop
  1011ec:	c7 05 2c 37 30 00 00 	movl   $0x0,0x30372c
  1011f3:	00 00 00 
  1011f6:	c3                   	ret    
  1011f7:	55                   	push   %ebp
  1011f8:	89 e5                	mov    %esp,%ebp
  1011fa:	e8 cd fa ff ff       	call   100ccc <idle>
  1011ff:	90                   	nop

00101200 <switchToRunning>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	53                   	push   %ebx
  101204:	83 ec 10             	sub    $0x10,%esp
  101207:	68 66 14 10 00       	push   $0x101466
  10120c:	e8 8f f4 ff ff       	call   1006a0 <printf>
  101211:	c7 05 a8 29 10 00 30 	movl   $0x30,0x1029a8
  101218:	00 00 00 
  10121b:	8b 15 24 37 30 00    	mov    0x303724,%edx
  101221:	8b 82 4c 00 01 00    	mov    0x1004c(%edx),%eax
  101227:	a3 a4 29 10 00       	mov    %eax,0x1029a4
  10122c:	89 d0                	mov    %edx,%eax
  10122e:	2d 20 2a 10 00       	sub    $0x102a20,%eax
  101233:	c1 f8 03             	sar    $0x3,%eax
  101236:	8d 0c c0             	lea    (%eax,%eax,8),%ecx
  101239:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  10123c:	01 c9                	add    %ecx,%ecx
  10123e:	01 c1                	add    %eax,%ecx
  101240:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  101243:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  101246:	c1 e1 0b             	shl    $0xb,%ecx
  101249:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
  10124c:	89 d9                	mov    %ebx,%ecx
  10124e:	c1 e1 04             	shl    $0x4,%ecx
  101251:	01 d9                	add    %ebx,%ecx
  101253:	01 c9                	add    %ecx,%ecx
  101255:	01 c8                	add    %ecx,%eax
  101257:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  10125a:	f7 d8                	neg    %eax
  10125c:	83 c0 04             	add    $0x4,%eax
  10125f:	c1 e0 14             	shl    $0x14,%eax
  101262:	89 c3                	mov    %eax,%ebx
  101264:	c1 eb 10             	shr    $0x10,%ebx
  101267:	c1 e8 18             	shr    $0x18,%eax
  10126a:	b9 60 29 10 00       	mov    $0x102960,%ecx
  10126f:	66 c7 05 78 29 10 00 	movw   $0x100,0x102978
  101276:	00 01 
  101278:	66 c7 05 7a 29 10 00 	movw   $0x0,0x10297a
  10127f:	00 00 
  101281:	88 1d 7c 29 10 00    	mov    %bl,0x10297c
  101287:	c6 05 7d 29 10 00 fa 	movb   $0xfa,0x10297d
  10128e:	c6 05 7e 29 10 00 c0 	movb   $0xc0,0x10297e
  101295:	a2 7f 29 10 00       	mov    %al,0x10297f
  10129a:	66 c7 05 80 29 10 00 	movw   $0x100,0x102980
  1012a1:	00 01 
  1012a3:	66 c7 05 82 29 10 00 	movw   $0x0,0x102982
  1012aa:	00 00 
  1012ac:	88 1d 84 29 10 00    	mov    %bl,0x102984
  1012b2:	c6 05 85 29 10 00 f2 	movb   $0xf2,0x102985
  1012b9:	c6 05 86 29 10 00 c0 	movb   $0xc0,0x102986
  1012c0:	a2 87 29 10 00       	mov    %al,0x102987
  1012c5:	66 c7 05 90 29 10 00 	movw   $0x10,0x102990
  1012cc:	10 00 
  1012ce:	66 89 15 92 29 10 00 	mov    %dx,0x102992
  1012d5:	89 d0                	mov    %edx,%eax
  1012d7:	c1 e8 10             	shr    $0x10,%eax
  1012da:	a2 94 29 10 00       	mov    %al,0x102994
  1012df:	c6 05 95 29 10 00 92 	movb   $0x92,0x102995
  1012e6:	c6 05 96 29 10 00 c0 	movb   $0xc0,0x102996
  1012ed:	c1 ea 18             	shr    $0x18,%edx
  1012f0:	88 15 97 29 10 00    	mov    %dl,0x102997
  1012f6:	66 c7 05 1c 21 10 00 	movw   $0x37,0x10211c
  1012fd:	37 00 
  1012ff:	66 89 0d 1e 21 10 00 	mov    %cx,0x10211e
  101306:	c1 e9 10             	shr    $0x10,%ecx
  101309:	66 89 0d 20 21 10 00 	mov    %cx,0x102120
  101310:	b8 1c 21 10 00       	mov    $0x10211c,%eax
  101315:	0f 01 10             	lgdtl  (%eax)
  101318:	b8 30 00 00 00       	mov    $0x30,%eax
  10131d:	8e d0                	mov    %eax,%ss
  10131f:	b8 44 00 01 00       	mov    $0x10044,%eax
  101324:	89 c4                	mov    %eax,%esp
  101326:	9c                   	pushf  
  101327:	b8 00 00 01 00       	mov    $0x10000,%eax
  10132c:	89 c4                	mov    %eax,%esp
  10132e:	0f a9                	pop    %gs
  101330:	0f a1                	pop    %fs
  101332:	07                   	pop    %es
  101333:	1f                   	pop    %ds
  101334:	61                   	popa   
  101335:	83 c4 08             	add    $0x8,%esp
  101338:	cf                   	iret   
  101339:	83 c4 10             	add    $0x10,%esp
  10133c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10133f:	c9                   	leave  
  101340:	c3                   	ret    
  101341:	66 90                	xchg   %ax,%ax
  101343:	90                   	nop

00101344 <abort>:
  101344:	55                   	push   %ebp
  101345:	89 e5                	mov    %esp,%ebp
  101347:	57                   	push   %edi
  101348:	56                   	push   %esi
  101349:	53                   	push   %ebx
  10134a:	83 ec 1c             	sub    $0x1c,%esp
  10134d:	8b 55 08             	mov    0x8(%ebp),%edx
  101350:	fa                   	cli    
  101351:	8a 02                	mov    (%edx),%al
  101353:	b9 12 20 10 00       	mov    $0x102012,%ecx
  101358:	84 c0                	test   %al,%al
  10135a:	74 0b                	je     101367 <abort+0x23>
  10135c:	41                   	inc    %ecx
  10135d:	42                   	inc    %edx
  10135e:	88 41 ff             	mov    %al,-0x1(%ecx)
  101361:	8a 02                	mov    (%edx),%al
  101363:	84 c0                	test   %al,%al
  101365:	75 f5                	jne    10135c <abort+0x18>
  101367:	c6 01 3a             	movb   $0x3a,(%ecx)
  10136a:	bb 41 21 10 00       	mov    $0x102141,%ebx
  10136f:	be 0a 00 00 00       	mov    $0xa,%esi
  101374:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101379:	4b                   	dec    %ebx
  10137a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10137d:	99                   	cltd   
  10137e:	f7 fe                	idiv   %esi
  101380:	8d 42 30             	lea    0x30(%edx),%eax
  101383:	88 45 e7             	mov    %al,-0x19(%ebp)
  101386:	88 03                	mov    %al,(%ebx)
  101388:	89 f8                	mov    %edi,%eax
  10138a:	f7 6d 0c             	imull  0xc(%ebp)
  10138d:	c1 fa 02             	sar    $0x2,%edx
  101390:	8b 45 0c             	mov    0xc(%ebp),%eax
  101393:	c1 f8 1f             	sar    $0x1f,%eax
  101396:	29 c2                	sub    %eax,%edx
  101398:	89 55 0c             	mov    %edx,0xc(%ebp)
  10139b:	75 dc                	jne    101379 <abort+0x35>
  10139d:	41                   	inc    %ecx
  10139e:	41                   	inc    %ecx
  10139f:	43                   	inc    %ebx
  1013a0:	8a 45 e7             	mov    -0x19(%ebp),%al
  1013a3:	88 41 ff             	mov    %al,-0x1(%ecx)
  1013a6:	8a 03                	mov    (%ebx),%al
  1013a8:	88 45 e7             	mov    %al,-0x19(%ebp)
  1013ab:	84 c0                	test   %al,%al
  1013ad:	75 ef                	jne    10139e <abort+0x5a>
  1013af:	c6 01 0a             	movb   $0xa,(%ecx)
  1013b2:	0f be 05 00 20 10 00 	movsbl 0x102000,%eax
  1013b9:	84 c0                	test   %al,%al
  1013bb:	74 1b                	je     1013d8 <abort+0x94>
  1013bd:	bb 00 20 10 00       	mov    $0x102000,%ebx
  1013c2:	83 ec 0c             	sub    $0xc,%esp
  1013c5:	50                   	push   %eax
  1013c6:	e8 81 f4 ff ff       	call   10084c <putChar>
  1013cb:	43                   	inc    %ebx
  1013cc:	0f be 03             	movsbl (%ebx),%eax
  1013cf:	83 c4 10             	add    $0x10,%esp
  1013d2:	84 c0                	test   %al,%al
  1013d4:	75 ec                	jne    1013c2 <abort+0x7e>
  1013d6:	66 90                	xchg   %ax,%ax
  1013d8:	f4                   	hlt    
  1013d9:	eb fd                	jmp    1013d8 <abort+0x94>

001013db <irqEmpty>:
  1013db:	6a 00                	push   $0x0
  1013dd:	6a ff                	push   $0xffffffff
  1013df:	eb 13                	jmp    1013f4 <asmDoIrq>

001013e1 <irqGProtectFault>:
  1013e1:	6a 0d                	push   $0xd
  1013e3:	eb 0f                	jmp    1013f4 <asmDoIrq>

001013e5 <irqSyscall>:
  1013e5:	6a 00                	push   $0x0
  1013e7:	68 80 00 00 00       	push   $0x80
  1013ec:	eb 06                	jmp    1013f4 <asmDoIrq>

001013ee <irqTimer>:
  1013ee:	6a 00                	push   $0x0
  1013f0:	6a 20                	push   $0x20
  1013f2:	eb 00                	jmp    1013f4 <asmDoIrq>

001013f4 <asmDoIrq>:
  1013f4:	60                   	pusha  
  1013f5:	1e                   	push   %ds
  1013f6:	06                   	push   %es
  1013f7:	0f a0                	push   %fs
  1013f9:	0f a8                	push   %gs
  1013fb:	54                   	push   %esp
  1013fc:	e8 ab ef ff ff       	call   1003ac <irqHandle>
  101401:	83 c4 04             	add    $0x4,%esp
  101404:	0f a9                	pop    %gs
  101406:	0f a1                	pop    %fs
  101408:	07                   	pop    %es
  101409:	1f                   	pop    %ds
  10140a:	61                   	popa   
  10140b:	83 c4 04             	add    $0x4,%esp
  10140e:	83 c4 04             	add    $0x4,%esp
  101411:	cf                   	iret   

Disassembly of section .rodata:

00101412 <.rodata>:
  101412:	47                   	inc    %edi
  101413:	50                   	push   %eax
  101414:	72 6f                	jb     101485 <asmDoIrq+0x91>
  101416:	74 65                	je     10147d <asmDoIrq+0x89>
  101418:	78 74                	js     10148e <asmDoIrq+0x9a>
  10141a:	46                   	inc    %esi
  10141b:	61                   	popa   
  10141c:	75 6c                	jne    10148a <asmDoIrq+0x96>
  10141e:	74 48                	je     101468 <asmDoIrq+0x74>
  101420:	61                   	popa   
  101421:	6e                   	outsb  %ds:(%esi),(%dx)
  101422:	64 6c                	fs insb (%dx),%es:(%edi)
  101424:	65 0a 00             	or     %gs:(%eax),%al
  101427:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  10142b:	65 6c                	gs insb (%dx),%es:(%edi)
  10142d:	2f                   	das    
  10142e:	69 72 71 48 61 6e 64 	imul   $0x646e6148,0x71(%edx),%esi
  101435:	6c                   	insb   (%dx),%es:(%edi)
  101436:	65 2e 63 00          	gs arpl %ax,%cs:(%eax)
  10143a:	2d 00 73 6c 65       	sub    $0x656c7300,%eax
  10143f:	65 70 20             	gs jo  101462 <asmDoIrq+0x6e>
  101442:	00 65 78             	add    %ah,0x78(%ebp)
  101445:	69 74 20 00 65 72 72 	imul   $0x6f727265,0x0(%eax,%eiz,1),%esi
  10144c:	6f 
  10144d:	72 20                	jb     10146f <asmDoIrq+0x7b>
  10144f:	69 72 71 0a 00 2d 32 	imul   $0x322d000a,0x71(%edx),%esi
  101456:	31 34 37             	xor    %esi,(%edi,%esi,1)
  101459:	34 38                	xor    $0x38,%al
  10145b:	33 37                	xor    (%edi),%esi
  10145d:	34 38                	xor    $0x38,%al
  10145f:	00 77 61             	add    %dh,0x61(%edi)
  101462:	6b 65 20 00          	imul   $0x0,0x20(%ebp),%esp
  101466:	73 77                	jae    1014df <asmDoIrq+0xeb>
  101468:	69                   	.byte 0x69
  101469:	74 63                	je     1014ce <asmDoIrq+0xda>
  10146b:	68                   	.byte 0x68
  10146c:	20 00                	and    %al,(%eax)

Disassembly of section .eh_frame:

00101470 <.eh_frame>:
  101470:	14 00                	adc    $0x0,%al
  101472:	00 00                	add    %al,(%eax)
  101474:	00 00                	add    %al,(%eax)
  101476:	00 00                	add    %al,(%eax)
  101478:	01 7a 52             	add    %edi,0x52(%edx)
  10147b:	00 01                	add    %al,(%ecx)
  10147d:	7c 08                	jl     101487 <asmDoIrq+0x93>
  10147f:	01 1b                	add    %ebx,(%ebx)
  101481:	0c 04                	or     $0x4,%al
  101483:	04 88                	add    $0x88,%al
  101485:	01 00                	add    %eax,(%eax)
  101487:	00 18                	add    %bl,(%eax)
  101489:	00 00                	add    %al,(%eax)
  10148b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  10148e:	00 00                	add    %al,(%eax)
  101490:	70 eb                	jo     10147d <asmDoIrq+0x89>
  101492:	ff                   	(bad)  
  101493:	ff 26                	jmp    *(%esi)
  101495:	00 00                	add    %al,(%eax)
  101497:	00 00                	add    %al,(%eax)
  101499:	41                   	inc    %ecx
  10149a:	0e                   	push   %cs
  10149b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1014a1:	00 00                	add    %al,(%eax)
  1014a3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1014a6:	00 00                	add    %al,(%eax)
  1014a8:	38 00                	cmp    %al,(%eax)
  1014aa:	00 00                	add    %al,(%eax)
  1014ac:	7c eb                	jl     101499 <asmDoIrq+0xa5>
  1014ae:	ff                   	(bad)  
  1014af:	ff 23                	jmp    *(%ebx)
  1014b1:	00 00                	add    %al,(%eax)
  1014b3:	00 00                	add    %al,(%eax)
  1014b5:	41                   	inc    %ecx
  1014b6:	0e                   	push   %cs
  1014b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1014bd:	5f                   	pop    %edi
  1014be:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1014c1:	04 00                	add    $0x0,%al
  1014c3:	00 3c 00             	add    %bh,(%eax,%eax,1)
  1014c6:	00 00                	add    %al,(%eax)
  1014c8:	58                   	pop    %eax
  1014c9:	00 00                	add    %al,(%eax)
  1014cb:	00 80 eb ff ff d8    	add    %al,-0x27000015(%eax)
  1014d1:	00 00                	add    %al,(%eax)
  1014d3:	00 00                	add    %al,(%eax)
  1014d5:	41                   	inc    %ecx
  1014d6:	0e                   	push   %cs
  1014d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1014dd:	46                   	inc    %esi
  1014de:	87 03                	xchg   %eax,(%ebx)
  1014e0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1014e3:	05 02 a8 0a c3       	add    $0xc30aa802,%eax
  1014e8:	41                   	inc    %ecx
  1014e9:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1014ed:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1014f0:	04 44                	add    $0x44,%al
  1014f2:	0b 58 0a             	or     0xa(%eax),%ebx
  1014f5:	c3                   	ret    
  1014f6:	41                   	inc    %ecx
  1014f7:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1014fb:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1014fe:	04 41                	add    $0x41,%al
  101500:	0b 00                	or     (%eax),%eax
  101502:	00 00                	add    %al,(%eax)
  101504:	20 00                	and    %al,(%eax)
  101506:	00 00                	add    %al,(%eax)
  101508:	98                   	cwtl   
  101509:	00 00                	add    %al,(%eax)
  10150b:	00 18                	add    %bl,(%eax)
  10150d:	ec                   	in     (%dx),%al
  10150e:	ff                   	(bad)  
  10150f:	ff 23                	jmp    *(%ebx)
  101511:	00 00                	add    %al,(%eax)
  101513:	00 00                	add    %al,(%eax)
  101515:	41                   	inc    %ecx
  101516:	0e                   	push   %cs
  101517:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10151d:	44                   	inc    %esp
  10151e:	83 03 5b             	addl   $0x5b,(%ebx)
  101521:	c5 c3 0c             	(bad)  
  101524:	04 04                	add    $0x4,%al
  101526:	00 00                	add    %al,(%eax)
  101528:	1c 00                	sbb    $0x0,%al
  10152a:	00 00                	add    %al,(%eax)
  10152c:	bc 00 00 00 18       	mov    $0x18000000,%esp
  101531:	ec                   	in     (%dx),%al
  101532:	ff                   	(bad)  
  101533:	ff 21                	jmp    *(%ecx)
  101535:	00 00                	add    %al,(%eax)
  101537:	00 00                	add    %al,(%eax)
  101539:	41                   	inc    %ecx
  10153a:	0e                   	push   %cs
  10153b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101541:	5d                   	pop    %ebp
  101542:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101545:	04 00                	add    $0x0,%al
  101547:	00 24 00             	add    %ah,(%eax,%eax,1)
  10154a:	00 00                	add    %al,(%eax)
  10154c:	dc 00                	faddl  (%eax)
  10154e:	00 00                	add    %al,(%eax)
  101550:	1c ec                	sbb    $0xec,%al
  101552:	ff                   	(bad)  
  101553:	ff 42 00             	incl   0x0(%edx)
  101556:	00 00                	add    %al,(%eax)
  101558:	00 41 0e             	add    %al,0xe(%ecx)
  10155b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101561:	78 0a                	js     10156d <asmDoIrq+0x179>
  101563:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101566:	04 45                	add    $0x45,%al
  101568:	0b 41 c5             	or     -0x3b(%ecx),%eax
  10156b:	0c 04                	or     $0x4,%al
  10156d:	04 00                	add    $0x0,%al
  10156f:	00 28                	add    %ch,(%eax)
  101571:	00 00                	add    %al,(%eax)
  101573:	00 04 01             	add    %al,(%ecx,%eax,1)
  101576:	00 00                	add    %al,(%eax)
  101578:	38 ec                	cmp    %ch,%ah
  10157a:	ff                   	(bad)  
  10157b:	ff e7                	jmp    *%edi
  10157d:	00 00                	add    %al,(%eax)
  10157f:	00 00                	add    %al,(%eax)
  101581:	41                   	inc    %ecx
  101582:	0e                   	push   %cs
  101583:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101589:	46                   	inc    %esi
  10158a:	87 03                	xchg   %eax,(%ebx)
  10158c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10158f:	05 02 d6 c3 41       	add    $0x41c3d602,%eax
  101594:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101598:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10159b:	04 28                	add    $0x28,%al
  10159d:	00 00                	add    %al,(%eax)
  10159f:	00 30                	add    %dh,(%eax)
  1015a1:	01 00                	add    %eax,(%eax)
  1015a3:	00 f4                	add    %dh,%ah
  1015a5:	ec                   	in     (%dx),%al
  1015a6:	ff                   	(bad)  
  1015a7:	ff 6b 00             	ljmp   *0x0(%ebx)
  1015aa:	00 00                	add    %al,(%eax)
  1015ac:	00 41 0e             	add    %al,0xe(%ecx)
  1015af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1015b5:	46                   	inc    %esi
  1015b6:	87 03                	xchg   %eax,(%ebx)
  1015b8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1015bb:	05 02 5a c3 41       	add    $0x41c35a02,%eax
  1015c0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1015c4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1015c7:	04 1c                	add    $0x1c,%al
  1015c9:	00 00                	add    %al,(%eax)
  1015cb:	00 5c 01 00          	add    %bl,0x0(%ecx,%eax,1)
  1015cf:	00 34 ed ff ff 2d 00 	add    %dh,0x2dffff(,%ebp,8)
  1015d6:	00 00                	add    %al,(%eax)
  1015d8:	00 41 0e             	add    %al,0xe(%ecx)
  1015db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1015e1:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  1015e5:	04 00                	add    $0x0,%al
  1015e7:	00 44 00 00          	add    %al,0x0(%eax,%eax,1)
  1015eb:	00 7c 01 00          	add    %bh,0x0(%ecx,%eax,1)
  1015ef:	00 44 ed ff          	add    %al,-0x1(%ebp,%ebp,8)
  1015f3:	ff                   	(bad)  
  1015f4:	78 00                	js     1015f6 <asmDoIrq+0x202>
  1015f6:	00 00                	add    %al,(%eax)
  1015f8:	00 41 0e             	add    %al,0xe(%ecx)
  1015fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101601:	42                   	inc    %edx
  101602:	83 03 70             	addl   $0x70,(%ebx)
  101605:	0a c5                	or     %ch,%al
  101607:	c3                   	ret    
  101608:	0c 04                	or     $0x4,%al
  10160a:	04 43                	add    $0x43,%al
  10160c:	0b 47 0a             	or     0xa(%edi),%eax
  10160f:	c5 c3 0c             	(bad)  
  101612:	04 04                	add    $0x4,%al
  101614:	45                   	inc    %ebp
  101615:	0b 4a 0a             	or     0xa(%edx),%ecx
  101618:	c5 c3 0c             	(bad)  
  10161b:	04 04                	add    $0x4,%al
  10161d:	46                   	inc    %esi
  10161e:	0b 56 0a             	or     0xa(%esi),%edx
  101621:	c3                   	ret    
  101622:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101625:	04 42                	add    $0x42,%al
  101627:	0b 47 c5             	or     -0x3b(%edi),%eax
  10162a:	c3                   	ret    
  10162b:	0c 04                	or     $0x4,%al
  10162d:	04 00                	add    $0x0,%al
  10162f:	00 20                	add    %ah,(%eax)
  101631:	00 00                	add    %al,(%eax)
  101633:	00 c4                	add    %al,%ah
  101635:	01 00                	add    %eax,(%eax)
  101637:	00 74 ed ff          	add    %dh,-0x1(%ebp,%ebp,8)
  10163b:	ff 98 00 00 00 00    	lcall  *0x0(%eax)
  101641:	41                   	inc    %ecx
  101642:	0e                   	push   %cs
  101643:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101649:	7e 0a                	jle    101655 <asmDoIrq+0x261>
  10164b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10164e:	04 43                	add    $0x43,%al
  101650:	0b 00                	or     (%eax),%eax
  101652:	00 00                	add    %al,(%eax)
  101654:	20 00                	and    %al,(%eax)
  101656:	00 00                	add    %al,(%eax)
  101658:	e8 01 00 00 e8       	call   e810165e <_end+0xe7dfdf2a>
  10165d:	ed                   	in     (%dx),%eax
  10165e:	ff                   	(bad)  
  10165f:	ff                   	(bad)  
  101660:	dd 00                	fldl   (%eax)
  101662:	00 00                	add    %al,(%eax)
  101664:	00 41 0e             	add    %al,0xe(%ecx)
  101667:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10166d:	41                   	inc    %ecx
  10166e:	83 03 02             	addl   $0x2,(%ebx)
  101671:	d7                   	xlat   %ds:(%ebx)
  101672:	c3                   	ret    
  101673:	41                   	inc    %ecx
  101674:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101677:	04 20                	add    $0x20,%al
  101679:	00 00                	add    %al,(%eax)
  10167b:	00 0c 02             	add    %cl,(%edx,%eax,1)
  10167e:	00 00                	add    %al,(%eax)
  101680:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  101681:	ee                   	out    %al,(%dx)
  101682:	ff                   	(bad)  
  101683:	ff 2a                	ljmp   *(%edx)
  101685:	00 00                	add    %al,(%eax)
  101687:	00 00                	add    %al,(%eax)
  101689:	41                   	inc    %ecx
  10168a:	0e                   	push   %cs
  10168b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101691:	42                   	inc    %edx
  101692:	83 03 64             	addl   $0x64,(%ebx)
  101695:	c5 c3 0c             	(bad)  
  101698:	04 04                	add    $0x4,%al
  10169a:	00 00                	add    %al,(%eax)
  10169c:	48                   	dec    %eax
  10169d:	00 00                	add    %al,(%eax)
  10169f:	00 30                	add    %dh,(%eax)
  1016a1:	02 00                	add    (%eax),%al
  1016a3:	00 ac ee ff ff d0 00 	add    %ch,0xd0ffff(%esi,%ebp,8)
  1016aa:	00 00                	add    %al,(%eax)
  1016ac:	00 41 0e             	add    %al,0xe(%ecx)
  1016af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1016b5:	46                   	inc    %esi
  1016b6:	87 03                	xchg   %eax,(%ebx)
  1016b8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1016bb:	05 02 71 0a c3       	add    $0xc30a7102,%eax
  1016c0:	41                   	inc    %ecx
  1016c1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1016c5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1016c8:	04 43                	add    $0x43,%al
  1016ca:	0b 64 0a c3          	or     -0x3d(%edx,%ecx,1),%esp
  1016ce:	41                   	inc    %ecx
  1016cf:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1016d3:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1016d6:	04 41                	add    $0x41,%al
  1016d8:	0b 4b 0a             	or     0xa(%ebx),%ecx
  1016db:	c3                   	ret    
  1016dc:	41                   	inc    %ecx
  1016dd:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1016e1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1016e4:	04 46                	add    $0x46,%al
  1016e6:	0b 00                	or     (%eax),%eax
  1016e8:	30 00                	xor    %al,(%eax)
  1016ea:	00 00                	add    %al,(%eax)
  1016ec:	7c 02                	jl     1016f0 <asmDoIrq+0x2fc>
  1016ee:	00 00                	add    %al,(%eax)
  1016f0:	30 ef                	xor    %ch,%bh
  1016f2:	ff                   	(bad)  
  1016f3:	ff                   	(bad)  
  1016f4:	7e 00                	jle    1016f6 <asmDoIrq+0x302>
  1016f6:	00 00                	add    %al,(%eax)
  1016f8:	00 41 0e             	add    %al,0xe(%ecx)
  1016fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101701:	45                   	inc    %ebp
  101702:	86 03                	xchg   %al,(%ebx)
  101704:	83 04 02 5e          	addl   $0x5e,(%edx,%eax,1)
  101708:	0a c3                	or     %bl,%al
  10170a:	41                   	inc    %ecx
  10170b:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  10170f:	04 04                	add    $0x4,%al
  101711:	44                   	inc    %esp
  101712:	0b 4b c3             	or     -0x3d(%ebx),%ecx
  101715:	41                   	inc    %ecx
  101716:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  10171a:	04 04                	add    $0x4,%al
  10171c:	2c 00                	sub    $0x0,%al
  10171e:	00 00                	add    %al,(%eax)
  101720:	b0 02                	mov    $0x2,%al
  101722:	00 00                	add    %al,(%eax)
  101724:	7c ef                	jl     101715 <asmDoIrq+0x321>
  101726:	ff                   	(bad)  
  101727:	ff 12                	call   *(%edx)
  101729:	01 00                	add    %eax,(%eax)
  10172b:	00 00                	add    %al,(%eax)
  10172d:	41                   	inc    %ecx
  10172e:	0e                   	push   %cs
  10172f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101735:	49                   	dec    %ecx
  101736:	87 03                	xchg   %eax,(%ebx)
  101738:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10173b:	05 02 85 0a c3       	add    $0xc30a8502,%eax
  101740:	41                   	inc    %ecx
  101741:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101745:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101748:	04 44                	add    $0x44,%al
  10174a:	0b 00                	or     (%eax),%eax
  10174c:	1c 00                	sbb    $0x0,%al
  10174e:	00 00                	add    %al,(%eax)
  101750:	e0 02                	loopne 101754 <asmDoIrq+0x360>
  101752:	00 00                	add    %al,(%eax)
  101754:	60                   	pusha  
  101755:	f0 ff                	lock (bad) 
  101757:	ff 55 00             	call   *0x0(%ebp)
  10175a:	00 00                	add    %al,(%eax)
  10175c:	00 41 0e             	add    %al,0xe(%ecx)
  10175f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101765:	02 51 c5             	add    -0x3b(%ecx),%dl
  101768:	0c 04                	or     $0x4,%al
  10176a:	04 00                	add    $0x0,%al
  10176c:	1c 00                	sbb    $0x0,%al
  10176e:	00 00                	add    %al,(%eax)
  101770:	00 03                	add    %al,(%ebx)
  101772:	00 00                	add    %al,(%eax)
  101774:	98                   	cwtl   
  101775:	f0 ff                	lock (bad) 
  101777:	ff                   	(bad)  
  101778:	3d 00 00 00 00       	cmp    $0x0,%eax
  10177d:	41                   	inc    %ecx
  10177e:	0e                   	push   %cs
  10177f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101785:	79 c5                	jns    10174c <asmDoIrq+0x358>
  101787:	0c 04                	or     $0x4,%al
  101789:	04 00                	add    $0x0,%al
  10178b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  10178e:	00 00                	add    %al,(%eax)
  101790:	20 03                	and    %al,(%ebx)
  101792:	00 00                	add    %al,(%eax)
  101794:	b8 f0 ff ff 1b       	mov    $0x1bfffff0,%eax
  101799:	00 00                	add    %al,(%eax)
  10179b:	00 00                	add    %al,(%eax)
  10179d:	41                   	inc    %ecx
  10179e:	0e                   	push   %cs
  10179f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1017a5:	57                   	push   %edi
  1017a6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1017a9:	04 00                	add    $0x0,%al
  1017ab:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1017ae:	00 00                	add    %al,(%eax)
  1017b0:	40                   	inc    %eax
  1017b1:	03 00                	add    (%eax),%eax
  1017b3:	00 b4 f0 ff ff 18 00 	add    %dh,0x18ffff(%eax,%esi,8)
  1017ba:	00 00                	add    %al,(%eax)
  1017bc:	00 41 0e             	add    %al,0xe(%ecx)
  1017bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1017c5:	54                   	push   %esp
  1017c6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1017c9:	04 00                	add    $0x0,%al
  1017cb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1017ce:	00 00                	add    %al,(%eax)
  1017d0:	60                   	pusha  
  1017d1:	03 00                	add    (%eax),%eax
  1017d3:	00 ac f0 ff ff 12 00 	add    %ch,0x12ffff(%eax,%esi,8)
  1017da:	00 00                	add    %al,(%eax)
  1017dc:	00 41 0e             	add    %al,0xe(%ecx)
  1017df:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1017e5:	4e                   	dec    %esi
  1017e6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1017e9:	04 00                	add    $0x0,%al
  1017eb:	00 20                	add    %ah,(%eax)
  1017ed:	00 00                	add    %al,(%eax)
  1017ef:	00 80 03 00 00 a0    	add    %al,-0x5ffffffd(%eax)
  1017f5:	f0 ff                	lock (bad) 
  1017f7:	ff 75 00             	pushl  0x0(%ebp)
  1017fa:	00 00                	add    %al,(%eax)
  1017fc:	00 41 0e             	add    %al,0xe(%ecx)
  1017ff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101805:	41                   	inc    %ecx
  101806:	83 03 02             	addl   $0x2,(%ebx)
  101809:	6f                   	outsl  %ds:(%esi),(%dx)
  10180a:	c3                   	ret    
  10180b:	41                   	inc    %ecx
  10180c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10180f:	04 1c                	add    $0x1c,%al
  101811:	00 00                	add    %al,(%eax)
  101813:	00 a4 03 00 00 f4 f0 	add    %ah,-0xf0c0000(%ebx,%eax,1)
  10181a:	ff                   	(bad)  
  10181b:	ff                   	(bad)  
  10181c:	79 01                	jns    10181f <asmDoIrq+0x42b>
  10181e:	00 00                	add    %al,(%eax)
  101820:	00 41 0e             	add    %al,0xe(%ecx)
  101823:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101829:	03 75 01             	add    0x1(%ebp),%esi
  10182c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10182f:	04 1c                	add    $0x1c,%al
  101831:	00 00                	add    %al,(%eax)
  101833:	00 c4                	add    %al,%ah
  101835:	03 00                	add    (%eax),%eax
  101837:	00 50 f2             	add    %dl,-0xe(%eax)
  10183a:	ff                   	(bad)  
  10183b:	ff 27                	jmp    *(%edi)
  10183d:	00 00                	add    %al,(%eax)
  10183f:	00 00                	add    %al,(%eax)
  101841:	41                   	inc    %ecx
  101842:	0e                   	push   %cs
  101843:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101849:	63 c5                	arpl   %ax,%bp
  10184b:	0c 04                	or     $0x4,%al
  10184d:	04 00                	add    $0x0,%al
  10184f:	00 28                	add    %ch,(%eax)
  101851:	00 00                	add    %al,(%eax)
  101853:	00 e4                	add    %ah,%ah
  101855:	03 00                	add    (%eax),%eax
  101857:	00 58 f2             	add    %bl,-0xe(%eax)
  10185a:	ff                   	(bad)  
  10185b:	ff d2                	call   *%edx
  10185d:	00 00                	add    %al,(%eax)
  10185f:	00 00                	add    %al,(%eax)
  101861:	41                   	inc    %ecx
  101862:	0e                   	push   %cs
  101863:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101869:	46                   	inc    %esi
  10186a:	87 03                	xchg   %eax,(%ebx)
  10186c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10186f:	05 02 c5 c3 41       	add    $0x41c3c502,%eax
  101874:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101878:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10187b:	04 28                	add    $0x28,%al
  10187d:	00 00                	add    %al,(%eax)
  10187f:	00 10                	add    %dl,(%eax)
  101881:	04 00                	add    $0x0,%al
  101883:	00 00                	add    %al,(%eax)
  101885:	f3 ff                	repz (bad) 
  101887:	ff 46 01             	incl   0x1(%esi)
  10188a:	00 00                	add    %al,(%eax)
  10188c:	00 41 0e             	add    %al,0xe(%ecx)
  10188f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101895:	42                   	inc    %edx
  101896:	86 03                	xchg   %al,(%ebx)
  101898:	83 04 03 01          	addl   $0x1,(%ebx,%eax,1)
  10189c:	01 0a                	add    %ecx,(%edx)
  10189e:	c3                   	ret    
  10189f:	41                   	inc    %ecx
  1018a0:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  1018a4:	04 04                	add    $0x4,%al
  1018a6:	44                   	inc    %esp
  1018a7:	0b 18                	or     (%eax),%ebx
  1018a9:	00 00                	add    %al,(%eax)
  1018ab:	00 3c 04             	add    %bh,(%esp,%eax,1)
  1018ae:	00 00                	add    %al,(%eax)
  1018b0:	1c f4                	sbb    $0xf4,%al
  1018b2:	ff                   	(bad)  
  1018b3:	ff 07                	incl   (%edi)
  1018b5:	00 00                	add    %al,(%eax)
  1018b7:	00 00                	add    %al,(%eax)
  1018b9:	41                   	inc    %ecx
  1018ba:	0e                   	push   %cs
  1018bb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1018c1:	00 00                	add    %al,(%eax)
  1018c3:	00 2c 00             	add    %ch,(%eax,%eax,1)
  1018c6:	00 00                	add    %al,(%eax)
  1018c8:	58                   	pop    %eax
  1018c9:	04 00                	add    $0x0,%al
  1018cb:	00 08                	add    %cl,(%eax)
  1018cd:	f4                   	hlt    
  1018ce:	ff                   	(bad)  
  1018cf:	ff 65 01             	jmp    *0x1(%ebp)
  1018d2:	00 00                	add    %al,(%eax)
  1018d4:	00 41 0e             	add    %al,0xe(%ecx)
  1018d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1018dd:	43                   	inc    %ebx
  1018de:	87 03                	xchg   %eax,(%ebx)
  1018e0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1018e3:	05 03 5b 01 c3       	add    $0xc3015b03,%eax
  1018e8:	41                   	inc    %ecx
  1018e9:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1018ed:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1018f0:	04 00                	add    $0x0,%al
  1018f2:	00 00                	add    %al,(%eax)
  1018f4:	24 00                	and    $0x0,%al
  1018f6:	00 00                	add    %al,(%eax)
  1018f8:	88 04 00             	mov    %al,(%eax,%eax,1)
  1018fb:	00 40 f5             	add    %al,-0xb(%eax)
  1018fe:	ff                   	(bad)  
  1018ff:	ff 30                	pushl  (%eax)
  101901:	00 00                	add    %al,(%eax)
  101903:	00 00                	add    %al,(%eax)
  101905:	41                   	inc    %ecx
  101906:	0e                   	push   %cs
  101907:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10190d:	5f                   	pop    %edi
  10190e:	0a c5                	or     %ch,%al
  101910:	0c 04                	or     $0x4,%al
  101912:	04 42                	add    $0x42,%al
  101914:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  101917:	0c 04                	or     $0x4,%al
  101919:	04 00                	add    $0x0,%al
  10191b:	00 24 00             	add    %ah,(%eax,%eax,1)
  10191e:	00 00                	add    %al,(%eax)
  101920:	b0 04                	mov    $0x4,%al
  101922:	00 00                	add    %al,(%eax)
  101924:	48                   	dec    %eax
  101925:	f5                   	cmc    
  101926:	ff                   	(bad)  
  101927:	ff 30                	pushl  (%eax)
  101929:	00 00                	add    %al,(%eax)
  10192b:	00 00                	add    %al,(%eax)
  10192d:	41                   	inc    %ecx
  10192e:	0e                   	push   %cs
  10192f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101935:	5f                   	pop    %edi
  101936:	0a c5                	or     %ch,%al
  101938:	0c 04                	or     $0x4,%al
  10193a:	04 42                	add    $0x42,%al
  10193c:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  10193f:	0c 04                	or     $0x4,%al
  101941:	04 00                	add    $0x0,%al
  101943:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101946:	00 00                	add    %al,(%eax)
  101948:	d8 04 00             	fadds  (%eax,%eax,1)
  10194b:	00 50 f5             	add    %dl,-0xb(%eax)
  10194e:	ff                   	(bad)  
  10194f:	ff 5d 00             	lcall  *0x0(%ebp)
  101952:	00 00                	add    %al,(%eax)
  101954:	00 41 0e             	add    %al,0xe(%ecx)
  101957:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10195d:	02 59 c5             	add    -0x3b(%ecx),%bl
  101960:	0c 04                	or     $0x4,%al
  101962:	04 00                	add    $0x0,%al
  101964:	2c 00                	sub    $0x0,%al
  101966:	00 00                	add    %al,(%eax)
  101968:	f8                   	clc    
  101969:	04 00                	add    $0x0,%al
  10196b:	00 90 f5 ff ff 8e    	add    %dl,-0x7100000b(%eax)
  101971:	01 00                	add    %eax,(%eax)
  101973:	00 00                	add    %al,(%eax)
  101975:	41                   	inc    %ecx
  101976:	0e                   	push   %cs
  101977:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10197d:	44                   	inc    %esp
  10197e:	87 03                	xchg   %eax,(%ebx)
  101980:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101983:	05 02 f4 0a c3       	add    $0xc30af402,%eax
  101988:	41                   	inc    %ecx
  101989:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  10198d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101990:	04 42                	add    $0x42,%al
  101992:	0b 00                	or     (%eax),%eax
  101994:	28 00                	sub    %al,(%eax)
  101996:	00 00                	add    %al,(%eax)
  101998:	28 05 00 00 f0 f6    	sub    %al,0xf6f00000
  10199e:	ff                   	(bad)  
  10199f:	ff 18                	lcall  *(%eax)
  1019a1:	01 00                	add    %eax,(%eax)
  1019a3:	00 00                	add    %al,(%eax)
  1019a5:	41                   	inc    %ecx
  1019a6:	0e                   	push   %cs
  1019a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019ad:	42                   	inc    %edx
  1019ae:	86 03                	xchg   %al,(%ebx)
  1019b0:	83 04 02 a7          	addl   $0xffffffa7,(%edx,%eax,1)
  1019b4:	0a c3                	or     %bl,%al
  1019b6:	41                   	inc    %ecx
  1019b7:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  1019bb:	04 04                	add    $0x4,%al
  1019bd:	42                   	inc    %edx
  1019be:	0b 00                	or     (%eax),%eax
  1019c0:	18 00                	sbb    %al,(%eax)
  1019c2:	00 00                	add    %al,(%eax)
  1019c4:	54                   	push   %esp
  1019c5:	05 00 00 dc f7       	add    $0xf7dc0000,%eax
  1019ca:	ff                   	(bad)  
  1019cb:	ff 5b 00             	lcall  *0x0(%ebx)
  1019ce:	00 00                	add    %al,(%eax)
  1019d0:	00 02                	add    %al,(%edx)
  1019d2:	54                   	push   %esp
  1019d3:	0e                   	push   %cs
  1019d4:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019da:	00 00                	add    %al,(%eax)
  1019dc:	20 00                	and    %al,(%eax)
  1019de:	00 00                	add    %al,(%eax)
  1019e0:	70 05                	jo     1019e7 <asmDoIrq+0x5f3>
  1019e2:	00 00                	add    %al,(%eax)
  1019e4:	1c f8                	sbb    $0xf8,%al
  1019e6:	ff                   	(bad)  
  1019e7:	ff 41 01             	incl   0x1(%ecx)
  1019ea:	00 00                	add    %al,(%eax)
  1019ec:	00 41 0e             	add    %al,0xe(%ecx)
  1019ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019f5:	44                   	inc    %esp
  1019f6:	83 03 03             	addl   $0x3,(%ebx)
  1019f9:	39 01                	cmp    %eax,(%ecx)
  1019fb:	c5 c3 0c             	(bad)  
  1019fe:	04 04                	add    $0x4,%al
  101a00:	1c 00                	sbb    $0x0,%al
  101a02:	00 00                	add    %al,(%eax)
  101a04:	94                   	xchg   %eax,%esp
  101a05:	05 00 00 3c f9       	add    $0xf93c0000,%eax
  101a0a:	ff                   	(bad)  
  101a0b:	ff 97 00 00 00 00    	call   *0x0(%edi)
  101a11:	41                   	inc    %ecx
  101a12:	0e                   	push   %cs
  101a13:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a19:	46                   	inc    %esi
  101a1a:	87 03                	xchg   %eax,(%ebx)
  101a1c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101a1f:	05                   	.byte 0x5

Disassembly of section .data:

00102000 <buf.1226>:
  102000:	41                   	inc    %ecx
  102001:	73 73                	jae    102076 <buf.1226+0x76>
  102003:	65 72 74             	gs jb  10207a <buf.1226+0x7a>
  102006:	69 6f 6e 20 66 61 69 	imul   $0x69616620,0x6e(%edi),%ebp
  10200d:	6c                   	insb   (%dx),%es:(%edi)
  10200e:	65 64 3a 20          	gs cmp %fs:(%eax),%ah
	...

Disassembly of section .bss:

00102100 <__bss_start>:
  102100:	00 00                	add    %al,(%eax)
	...

00102104 <row>:
  102104:	00 00                	add    %al,(%eax)
	...

00102108 <data.1016>:
	...

00102110 <data.1103>:
	...

00102118 <endOfPCB>:
  102118:	00 00                	add    %al,(%eax)
	...

0010211c <data.1103>:
	...

00102124 <buf.1211>:
	...

00102160 <idt>:
	...

00102960 <gdt>:
	...

001029a0 <tss>:
	...

00102a20 <processTable>:
	...

00303720 <blocked>:
  303720:	00 00                	add    %al,(%eax)
	...

00303724 <current>:
  303724:	00 00                	add    %al,(%eax)
	...

00303728 <runnable>:
  303728:	00 00                	add    %al,(%eax)
	...

0030372c <erunnable>:
  30372c:	00 00                	add    %al,(%eax)
	...

00303730 <eblocked>:
  303730:	00 00                	add    %al,(%eax)
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 55 62             	sub    %dl,0x62(%ebp)
   8:	75 6e                	jne    78 <kEntry-0xfff88>
   a:	74 75                	je     81 <kEntry-0xfff7f>
   c:	20 35 2e 34 2e 30    	and    %dh,0x302e342e
  12:	2d 36 75 62 75       	sub    $0x75627536,%eax
  17:	6e                   	outsb  %ds:(%esi),(%dx)
  18:	74 75                	je     8f <kEntry-0xfff71>
  1a:	31 7e 31             	xor    %edi,0x31(%esi)
  1d:	36 2e 30 34 2e       	ss xor %dh,%cs:(%esi,%ebp,1)
  22:	39 29                	cmp    %ebp,(%ecx)
  24:	20 35 2e 34 2e 30    	and    %dh,0x302e342e
  2a:	20 32                	and    %dh,(%edx)
  2c:	30 31                	xor    %dh,(%ecx)
  2e:	36 30 36             	xor    %dh,%ss:(%esi)
  31:	30 39                	xor    %bh,(%ecx)
	...


kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 05 0c 00 00       	call   100c10 <initSerial>
  10000b:	e8 28 08 00 00       	call   100838 <initIdt>
  100010:	e8 a3 0b 00 00       	call   100bb8 <initIntr>
  100015:	e8 52 0c 00 00       	call   100c6c <initTimer>
  10001a:	e8 f1 0c 00 00       	call   100d10 <initSeg>
  10001f:	e8 90 0e 00 00       	call   100eb4 <loadUMain>
  100024:	eb fe                	jmp    100024 <kEntry+0x24>
  100026:	66 90                	xchg   %ax,%ax

00100028 <GProtectFaultHandle>:
  100028:	55                   	push   %ebp
  100029:	89 e5                	mov    %esp,%ebp
  10002b:	83 ec 14             	sub    $0x14,%esp
  10002e:	68 18 18 10 00       	push   $0x101818
  100033:	e8 6c 0a 00 00       	call   100aa4 <printf>
  100038:	58                   	pop    %eax
  100039:	5a                   	pop    %edx
  10003a:	6a 54                	push   $0x54
  10003c:	68 2d 18 10 00       	push   $0x10182d
  100041:	e8 02 17 00 00       	call   101748 <abort>
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
  100062:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  100067:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
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
  100107:	6a 6e                	push   $0x6e
  100109:	68 2d 18 10 00       	push   $0x10182d
  10010e:	e8 35 16 00 00       	call   101748 <abort>
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
  100172:	68 40 18 10 00       	push   $0x101840
  100177:	e8 28 09 00 00       	call   100aa4 <printf>
  10017c:	e8 1f 11 00 00       	call   1012a0 <updateTime>
  100181:	e8 0a 13 00 00       	call   101490 <checkBlockedList>
  100186:	83 c4 10             	add    $0x10,%esp
  100189:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  10018e:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  100194:	85 d2                	test   %edx,%edx
  100196:	74 14                	je     1001ac <timerHandle+0x40>
  100198:	a1 a8 37 30 00       	mov    0x3037a8,%eax
  10019d:	85 c0                	test   %eax,%eax
  10019f:	74 0b                	je     1001ac <timerHandle+0x40>
  1001a1:	e8 02 14 00 00       	call   1015a8 <schedule>
  1001a6:	c9                   	leave  
  1001a7:	e9 58 14 00 00       	jmp    101604 <switchToRunning>
  1001ac:	c9                   	leave  
  1001ad:	c3                   	ret    
  1001ae:	66 90                	xchg   %ax,%ax

001001b0 <sysFork>:
  1001b0:	55                   	push   %ebp
  1001b1:	89 e5                	mov    %esp,%ebp
  1001b3:	57                   	push   %edi
  1001b4:	56                   	push   %esi
  1001b5:	53                   	push   %ebx
  1001b6:	83 ec 28             	sub    $0x28,%esp
  1001b9:	8b 75 08             	mov    0x8(%ebp),%esi
  1001bc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1001bf:	68 42 18 10 00       	push   $0x101842
  1001c4:	e8 db 08 00 00       	call   100aa4 <printf>
  1001c9:	e8 ba 0d 00 00       	call   100f88 <initNewPCB>
  1001ce:	89 c2                	mov    %eax,%edx
  1001d0:	c1 e0 0a             	shl    $0xa,%eax
  1001d3:	01 d0                	add    %edx,%eax
  1001d5:	01 c0                	add    %eax,%eax
  1001d7:	01 d0                	add    %edx,%eax
  1001d9:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1001dc:	c1 e0 03             	shl    $0x3,%eax
  1001df:	8d 98 a0 2a 10 00    	lea    0x102aa0(%eax),%ebx
  1001e5:	b9 00 40 00 00       	mov    $0x4000,%ecx
  1001ea:	89 df                	mov    %ebx,%edi
  1001ec:	8b 35 a4 37 30 00    	mov    0x3037a4,%esi
  1001f2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1001f4:	8b 3d a4 37 30 00    	mov    0x3037a4,%edi
  1001fa:	81 c7 00 00 01 00    	add    $0x10000,%edi
  100200:	b9 13 00 00 00       	mov    $0x13,%ecx
  100205:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100208:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10020a:	05 a0 2a 11 00       	add    $0x112aa0,%eax
  10020f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100214:	89 c7                	mov    %eax,%edi
  100216:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100219:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10021b:	8d 42 04             	lea    0x4(%edx),%eax
  10021e:	c1 e0 14             	shl    $0x14,%eax
  100221:	8b 0d a4 37 30 00    	mov    0x3037a4,%ecx
  100227:	81 e9 a0 2a 10 00    	sub    $0x102aa0,%ecx
  10022d:	c1 f9 03             	sar    $0x3,%ecx
  100230:	8d 34 c9             	lea    (%ecx,%ecx,8),%esi
  100233:	8d 34 f6             	lea    (%esi,%esi,8),%esi
  100236:	01 f6                	add    %esi,%esi
  100238:	01 ce                	add    %ecx,%esi
  10023a:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  10023d:	8d 34 f6             	lea    (%esi,%esi,8),%esi
  100240:	c1 e6 0b             	shl    $0xb,%esi
  100243:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
  100246:	89 fe                	mov    %edi,%esi
  100248:	c1 e6 04             	shl    $0x4,%esi
  10024b:	01 fe                	add    %edi,%esi
  10024d:	01 f6                	add    %esi,%esi
  10024f:	01 f1                	add    %esi,%ecx
  100251:	8d 34 c9             	lea    (%ecx,%ecx,8),%esi
  100254:	f7 de                	neg    %esi
  100256:	83 c6 04             	add    $0x4,%esi
  100259:	c1 e6 14             	shl    $0x14,%esi
  10025c:	b9 00 00 04 00       	mov    $0x40000,%ecx
  100261:	89 c7                	mov    %eax,%edi
  100263:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100265:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  10026a:	89 90 2c 00 01 00    	mov    %edx,0x1002c(%eax)
  100270:	c7 83 2c 00 01 00 00 	movl   $0x0,0x1002c(%ebx)
  100277:	00 00 00 
  10027a:	8b 90 4c 00 01 00    	mov    0x1004c(%eax),%edx
  100280:	89 93 4c 00 01 00    	mov    %edx,0x1004c(%ebx)
  100286:	8b 80 50 00 01 00    	mov    0x10050(%eax),%eax
  10028c:	89 83 50 00 01 00    	mov    %eax,0x10050(%ebx)
  100292:	83 c4 10             	add    $0x10,%esp
  100295:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100298:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10029b:	5b                   	pop    %ebx
  10029c:	5e                   	pop    %esi
  10029d:	5f                   	pop    %edi
  10029e:	5d                   	pop    %ebp
  10029f:	e9 cc 0f 00 00       	jmp    101270 <addToRunnable>

001002a4 <sysSleep>:
  1002a4:	55                   	push   %ebp
  1002a5:	89 e5                	mov    %esp,%ebp
  1002a7:	57                   	push   %edi
  1002a8:	56                   	push   %esi
  1002a9:	53                   	push   %ebx
  1002aa:	83 ec 18             	sub    $0x18,%esp
  1002ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1002b0:	68 48 18 10 00       	push   $0x101848
  1002b5:	e8 ea 07 00 00       	call   100aa4 <printf>
  1002ba:	8b 15 a4 37 30 00    	mov    0x3037a4,%edx
  1002c0:	8d 82 00 00 01 00    	lea    0x10000(%edx),%eax
  1002c6:	b9 13 00 00 00       	mov    $0x13,%ecx
  1002cb:	89 c7                	mov    %eax,%edi
  1002cd:	89 de                	mov    %ebx,%esi
  1002cf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1002d1:	c7 82 54 00 01 00 02 	movl   $0x2,0x10054(%edx)
  1002d8:	00 00 00 
  1002db:	c7 82 58 00 01 00 00 	movl   $0x0,0x10058(%edx)
  1002e2:	00 00 00 
  1002e5:	8b 43 20             	mov    0x20(%ebx),%eax
  1002e8:	89 82 5c 00 01 00    	mov    %eax,0x1005c(%edx)
  1002ee:	89 14 24             	mov    %edx,(%esp)
  1002f1:	e8 4a 0f 00 00       	call   101240 <addToBlocked>
  1002f6:	e8 05 10 00 00       	call   101300 <checkRunnableList>
  1002fb:	e8 a8 12 00 00       	call   1015a8 <schedule>
  100300:	83 c4 10             	add    $0x10,%esp
  100303:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100306:	5b                   	pop    %ebx
  100307:	5e                   	pop    %esi
  100308:	5f                   	pop    %edi
  100309:	5d                   	pop    %ebp
  10030a:	e9 f5 12 00 00       	jmp    101604 <switchToRunning>
  10030f:	90                   	nop

00100310 <sysExit>:
  100310:	55                   	push   %ebp
  100311:	89 e5                	mov    %esp,%ebp
  100313:	83 ec 14             	sub    $0x14,%esp
  100316:	68 4f 18 10 00       	push   $0x10184f
  10031b:	e8 84 07 00 00       	call   100aa4 <printf>
  100320:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  100325:	c7 80 54 00 01 00 03 	movl   $0x3,0x10054(%eax)
  10032c:	00 00 00 
  10032f:	e8 74 12 00 00       	call   1015a8 <schedule>
  100334:	83 c4 10             	add    $0x10,%esp
  100337:	c9                   	leave  
  100338:	e9 c7 12 00 00       	jmp    101604 <switchToRunning>
  10033d:	8d 76 00             	lea    0x0(%esi),%esi

00100340 <sysSemInit>:
  100340:	55                   	push   %ebp
  100341:	89 e5                	mov    %esp,%ebp
  100343:	56                   	push   %esi
  100344:	53                   	push   %ebx
  100345:	8b 75 08             	mov    0x8(%ebp),%esi
  100348:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  10034d:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
  100352:	c1 f8 03             	sar    $0x3,%eax
  100355:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100358:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10035b:	01 d2                	add    %edx,%edx
  10035d:	01 c2                	add    %eax,%edx
  10035f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100362:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100365:	c1 e2 0b             	shl    $0xb,%edx
  100368:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  10036b:	89 ca                	mov    %ecx,%edx
  10036d:	c1 e2 04             	shl    $0x4,%edx
  100370:	01 ca                	add    %ecx,%edx
  100372:	01 d2                	add    %edx,%edx
  100374:	01 d0                	add    %edx,%eax
  100376:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  100379:	f7 db                	neg    %ebx
  10037b:	83 c3 04             	add    $0x4,%ebx
  10037e:	c1 e3 14             	shl    $0x14,%ebx
  100381:	03 5e 20             	add    0x20(%esi),%ebx
  100384:	83 ec 0c             	sub    $0xc,%esp
  100387:	ff 76 28             	pushl  0x28(%esi)
  10038a:	e8 39 03 00 00       	call   1006c8 <initNewSem>
  10038f:	89 03                	mov    %eax,(%ebx)
  100391:	c7 46 2c 00 00 00 00 	movl   $0x0,0x2c(%esi)
  100398:	83 c4 10             	add    $0x10,%esp
  10039b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10039e:	5b                   	pop    %ebx
  10039f:	5e                   	pop    %esi
  1003a0:	5d                   	pop    %ebp
  1003a1:	c3                   	ret    
  1003a2:	66 90                	xchg   %ax,%ax

001003a4 <sysSemPost>:
  1003a4:	55                   	push   %ebp
  1003a5:	89 e5                	mov    %esp,%ebp
  1003a7:	53                   	push   %ebx
  1003a8:	50                   	push   %eax
  1003a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1003ac:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  1003b1:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
  1003b6:	c1 f8 03             	sar    $0x3,%eax
  1003b9:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  1003bc:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1003bf:	01 d2                	add    %edx,%edx
  1003c1:	01 c2                	add    %eax,%edx
  1003c3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003c6:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1003c9:	c1 e2 0b             	shl    $0xb,%edx
  1003cc:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  1003cf:	89 ca                	mov    %ecx,%edx
  1003d1:	c1 e2 04             	shl    $0x4,%edx
  1003d4:	01 ca                	add    %ecx,%edx
  1003d6:	01 d2                	add    %edx,%edx
  1003d8:	01 d0                	add    %edx,%eax
  1003da:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  1003dd:	f7 d8                	neg    %eax
  1003df:	83 c0 04             	add    $0x4,%eax
  1003e2:	c1 e0 14             	shl    $0x14,%eax
  1003e5:	03 43 20             	add    0x20(%ebx),%eax
  1003e8:	8b 08                	mov    (%eax),%ecx
  1003ea:	a1 08 21 10 00       	mov    0x102108,%eax
  1003ef:	8b 15 60 21 10 00    	mov    0x102160,%edx
  1003f5:	eb 05                	jmp    1003fc <sysSemPost+0x58>
  1003f7:	90                   	nop
  1003f8:	39 d1                	cmp    %edx,%ecx
  1003fa:	74 28                	je     100424 <sysSemPost+0x80>
  1003fc:	85 c0                	test   %eax,%eax
  1003fe:	75 f8                	jne    1003f8 <sysSemPost+0x54>
  100400:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  100407:	83 ec 08             	sub    $0x8,%esp
  10040a:	68 be 00 00 00       	push   $0xbe
  10040f:	68 2d 18 10 00       	push   $0x10182d
  100414:	e8 2f 13 00 00       	call   101748 <abort>
  100419:	83 c4 10             	add    $0x10,%esp
  10041c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10041f:	c9                   	leave  
  100420:	c3                   	ret    
  100421:	8d 76 00             	lea    0x0(%esi),%esi
  100424:	83 ec 0c             	sub    $0xc,%esp
  100427:	68 60 21 10 00       	push   $0x102160
  10042c:	e8 97 03 00 00       	call   1007c8 <V>
  100431:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
  100438:	83 c4 10             	add    $0x10,%esp
  10043b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10043e:	c9                   	leave  
  10043f:	c3                   	ret    

00100440 <sysSemWait>:
  100440:	55                   	push   %ebp
  100441:	89 e5                	mov    %esp,%ebp
  100443:	57                   	push   %edi
  100444:	56                   	push   %esi
  100445:	53                   	push   %ebx
  100446:	83 ec 0c             	sub    $0xc,%esp
  100449:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10044c:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  100451:	89 c2                	mov    %eax,%edx
  100453:	81 ea a0 2a 10 00    	sub    $0x102aa0,%edx
  100459:	c1 fa 03             	sar    $0x3,%edx
  10045c:	8d 0c d2             	lea    (%edx,%edx,8),%ecx
  10045f:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  100462:	01 c9                	add    %ecx,%ecx
  100464:	01 d1                	add    %edx,%ecx
  100466:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100469:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  10046c:	c1 e1 0b             	shl    $0xb,%ecx
  10046f:	8d 34 11             	lea    (%ecx,%edx,1),%esi
  100472:	89 f1                	mov    %esi,%ecx
  100474:	c1 e1 04             	shl    $0x4,%ecx
  100477:	01 f1                	add    %esi,%ecx
  100479:	01 c9                	add    %ecx,%ecx
  10047b:	01 ca                	add    %ecx,%edx
  10047d:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100480:	f7 da                	neg    %edx
  100482:	83 c2 04             	add    $0x4,%edx
  100485:	c1 e2 14             	shl    $0x14,%edx
  100488:	03 53 20             	add    0x20(%ebx),%edx
  10048b:	8b 32                	mov    (%edx),%esi
  10048d:	8b 15 08 21 10 00    	mov    0x102108,%edx
  100493:	8b 0d 60 21 10 00    	mov    0x102160,%ecx
  100499:	eb 05                	jmp    1004a0 <sysSemWait+0x60>
  10049b:	90                   	nop
  10049c:	39 ce                	cmp    %ecx,%esi
  10049e:	74 28                	je     1004c8 <sysSemWait+0x88>
  1004a0:	85 d2                	test   %edx,%edx
  1004a2:	75 f8                	jne    10049c <sysSemWait+0x5c>
  1004a4:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  1004ab:	83 ec 08             	sub    $0x8,%esp
  1004ae:	68 ce 00 00 00       	push   $0xce
  1004b3:	68 2d 18 10 00       	push   $0x10182d
  1004b8:	e8 8b 12 00 00       	call   101748 <abort>
  1004bd:	83 c4 10             	add    $0x10,%esp
  1004c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1004c3:	5b                   	pop    %ebx
  1004c4:	5e                   	pop    %esi
  1004c5:	5f                   	pop    %edi
  1004c6:	5d                   	pop    %ebp
  1004c7:	c3                   	ret    
  1004c8:	05 00 00 01 00       	add    $0x10000,%eax
  1004cd:	b9 13 00 00 00       	mov    $0x13,%ecx
  1004d2:	89 c7                	mov    %eax,%edi
  1004d4:	89 de                	mov    %ebx,%esi
  1004d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1004d8:	83 ec 0c             	sub    $0xc,%esp
  1004db:	68 60 21 10 00       	push   $0x102160
  1004e0:	e8 67 02 00 00       	call   10074c <P>
  1004e5:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
  1004ec:	83 c4 10             	add    $0x10,%esp
  1004ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1004f2:	5b                   	pop    %ebx
  1004f3:	5e                   	pop    %esi
  1004f4:	5f                   	pop    %edi
  1004f5:	5d                   	pop    %ebp
  1004f6:	c3                   	ret    
  1004f7:	90                   	nop

001004f8 <sysSemDestroy>:
  1004f8:	55                   	push   %ebp
  1004f9:	89 e5                	mov    %esp,%ebp
  1004fb:	53                   	push   %ebx
  1004fc:	50                   	push   %eax
  1004fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100500:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  100505:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
  10050a:	c1 f8 03             	sar    $0x3,%eax
  10050d:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100510:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100513:	01 d2                	add    %edx,%edx
  100515:	01 c2                	add    %eax,%edx
  100517:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10051a:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10051d:	c1 e2 0b             	shl    $0xb,%edx
  100520:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  100523:	89 ca                	mov    %ecx,%edx
  100525:	c1 e2 04             	shl    $0x4,%edx
  100528:	01 ca                	add    %ecx,%edx
  10052a:	01 d2                	add    %edx,%edx
  10052c:	01 d0                	add    %edx,%eax
  10052e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100531:	f7 d8                	neg    %eax
  100533:	83 c0 04             	add    $0x4,%eax
  100536:	c1 e0 14             	shl    $0x14,%eax
  100539:	03 43 20             	add    0x20(%ebx),%eax
  10053c:	8b 08                	mov    (%eax),%ecx
  10053e:	a1 08 21 10 00       	mov    0x102108,%eax
  100543:	8b 15 60 21 10 00    	mov    0x102160,%edx
  100549:	eb 05                	jmp    100550 <sysSemDestroy+0x58>
  10054b:	90                   	nop
  10054c:	39 d1                	cmp    %edx,%ecx
  10054e:	74 28                	je     100578 <sysSemDestroy+0x80>
  100550:	85 c0                	test   %eax,%eax
  100552:	75 f8                	jne    10054c <sysSemDestroy+0x54>
  100554:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  10055b:	83 ec 08             	sub    $0x8,%esp
  10055e:	68 dd 00 00 00       	push   $0xdd
  100563:	68 2d 18 10 00       	push   $0x10182d
  100568:	e8 db 11 00 00       	call   101748 <abort>
  10056d:	83 c4 10             	add    $0x10,%esp
  100570:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100573:	c9                   	leave  
  100574:	c3                   	ret    
  100575:	8d 76 00             	lea    0x0(%esi),%esi
  100578:	c7 05 68 21 10 00 01 	movl   $0x1,0x102168
  10057f:	00 00 00 
  100582:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
  100589:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10058c:	c9                   	leave  
  10058d:	c3                   	ret    
  10058e:	66 90                	xchg   %ax,%ax

00100590 <syscallHandle>:
  100590:	55                   	push   %ebp
  100591:	89 e5                	mov    %esp,%ebp
  100593:	53                   	push   %ebx
  100594:	52                   	push   %edx
  100595:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100598:	83 7b 2c 08          	cmpl   $0x8,0x2c(%ebx)
  10059c:	77 7a                	ja     100618 <syscallHandle+0x88>
  10059e:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1005a1:	ff 24 85 60 18 10 00 	jmp    *0x101860(,%eax,4)
  1005a8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1005ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ae:	c9                   	leave  
  1005af:	e9 44 ff ff ff       	jmp    1004f8 <sysSemDestroy>
  1005b4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1005b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ba:	c9                   	leave  
  1005bb:	e9 f0 fb ff ff       	jmp    1001b0 <sysFork>
  1005c0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1005c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005c6:	c9                   	leave  
  1005c7:	e9 d8 fc ff ff       	jmp    1002a4 <sysSleep>
  1005cc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1005cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005d2:	c9                   	leave  
  1005d3:	e9 38 fd ff ff       	jmp    100310 <sysExit>
  1005d8:	50                   	push   %eax
  1005d9:	ff 73 24             	pushl  0x24(%ebx)
  1005dc:	ff 73 28             	pushl  0x28(%ebx)
  1005df:	ff 73 20             	pushl  0x20(%ebx)
  1005e2:	e8 65 fa ff ff       	call   10004c <fsWrite>
  1005e7:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1005ea:	83 c4 10             	add    $0x10,%esp
  1005ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005f0:	c9                   	leave  
  1005f1:	c3                   	ret    
  1005f2:	66 90                	xchg   %ax,%ax
  1005f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1005f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005fa:	c9                   	leave  
  1005fb:	e9 40 fd ff ff       	jmp    100340 <sysSemInit>
  100600:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100603:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100606:	c9                   	leave  
  100607:	e9 98 fd ff ff       	jmp    1003a4 <sysSemPost>
  10060c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10060f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100612:	c9                   	leave  
  100613:	e9 28 fe ff ff       	jmp    100440 <sysSemWait>
  100618:	83 ec 08             	sub    $0x8,%esp
  10061b:	6a 4e                	push   $0x4e
  10061d:	68 2d 18 10 00       	push   $0x10182d
  100622:	e8 21 11 00 00       	call   101748 <abort>
  100627:	83 c4 10             	add    $0x10,%esp
  10062a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10062d:	c9                   	leave  
  10062e:	c3                   	ret    
  10062f:	90                   	nop

00100630 <irqHandle>:
  100630:	55                   	push   %ebp
  100631:	89 e5                	mov    %esp,%ebp
  100633:	83 ec 08             	sub    $0x8,%esp
  100636:	fa                   	cli    
  100637:	b8 10 00 00 00       	mov    $0x10,%eax
  10063c:	89 c0                	mov    %eax,%eax
  10063e:	8e c0                	mov    %eax,%es
  100640:	8e d8                	mov    %eax,%ds
  100642:	8e e0                	mov    %eax,%fs
  100644:	8e e8                	mov    %eax,%gs
  100646:	8b 45 08             	mov    0x8(%ebp),%eax
  100649:	03 05 a4 37 30 00    	add    0x3037a4,%eax
  10064f:	8b 50 30             	mov    0x30(%eax),%edx
  100652:	83 fa 0d             	cmp    $0xd,%edx
  100655:	74 51                	je     1006a8 <irqHandle+0x78>
  100657:	7e 2b                	jle    100684 <irqHandle+0x54>
  100659:	83 fa 20             	cmp    $0x20,%edx
  10065c:	74 16                	je     100674 <irqHandle+0x44>
  10065e:	83 c2 80             	add    $0xffffff80,%edx
  100661:	75 24                	jne    100687 <irqHandle+0x57>
  100663:	83 ec 0c             	sub    $0xc,%esp
  100666:	50                   	push   %eax
  100667:	e8 24 ff ff ff       	call   100590 <syscallHandle>
  10066c:	83 c4 10             	add    $0x10,%esp
  10066f:	fb                   	sti    
  100670:	c9                   	leave  
  100671:	c3                   	ret    
  100672:	66 90                	xchg   %ax,%ax
  100674:	83 ec 0c             	sub    $0xc,%esp
  100677:	50                   	push   %eax
  100678:	e8 ef fa ff ff       	call   10016c <timerHandle>
  10067d:	83 c4 10             	add    $0x10,%esp
  100680:	eb ed                	jmp    10066f <irqHandle+0x3f>
  100682:	66 90                	xchg   %ax,%ax
  100684:	42                   	inc    %edx
  100685:	74 e8                	je     10066f <irqHandle+0x3f>
  100687:	83 ec 0c             	sub    $0xc,%esp
  10068a:	68 55 18 10 00       	push   $0x101855
  10068f:	e8 10 04 00 00       	call   100aa4 <printf>
  100694:	58                   	pop    %eax
  100695:	5a                   	pop    %edx
  100696:	6a 3d                	push   $0x3d
  100698:	68 2d 18 10 00       	push   $0x10182d
  10069d:	e8 a6 10 00 00       	call   101748 <abort>
  1006a2:	83 c4 10             	add    $0x10,%esp
  1006a5:	eb c8                	jmp    10066f <irqHandle+0x3f>
  1006a7:	90                   	nop
  1006a8:	83 ec 0c             	sub    $0xc,%esp
  1006ab:	68 18 18 10 00       	push   $0x101818
  1006b0:	e8 ef 03 00 00       	call   100aa4 <printf>
  1006b5:	59                   	pop    %ecx
  1006b6:	58                   	pop    %eax
  1006b7:	6a 54                	push   $0x54
  1006b9:	68 2d 18 10 00       	push   $0x10182d
  1006be:	e8 85 10 00 00       	call   101748 <abort>
  1006c3:	83 c4 10             	add    $0x10,%esp
  1006c6:	eb a7                	jmp    10066f <irqHandle+0x3f>

001006c8 <initNewSem>:
  1006c8:	55                   	push   %ebp
  1006c9:	89 e5                	mov    %esp,%ebp
  1006cb:	56                   	push   %esi
  1006cc:	53                   	push   %ebx
  1006cd:	8b 1d 08 21 10 00    	mov    0x102108,%ebx
  1006d3:	85 db                	test   %ebx,%ebx
  1006d5:	74 64                	je     10073b <initNewSem+0x73>
  1006d7:	83 3d 68 21 10 00 01 	cmpl   $0x1,0x102168
  1006de:	74 66                	je     100746 <initNewSem+0x7e>
  1006e0:	b9 78 21 10 00       	mov    $0x102178,%ecx
  1006e5:	89 de                	mov    %ebx,%esi
  1006e7:	31 d2                	xor    %edx,%edx
  1006e9:	eb 0a                	jmp    1006f5 <initNewSem+0x2d>
  1006eb:	90                   	nop
  1006ec:	83 c1 10             	add    $0x10,%ecx
  1006ef:	83 79 f0 01          	cmpl   $0x1,-0x10(%ecx)
  1006f3:	74 37                	je     10072c <initNewSem+0x64>
  1006f5:	42                   	inc    %edx
  1006f6:	89 d0                	mov    %edx,%eax
  1006f8:	39 da                	cmp    %ebx,%edx
  1006fa:	75 f0                	jne    1006ec <initNewSem+0x24>
  1006fc:	39 da                	cmp    %ebx,%edx
  1006fe:	74 32                	je     100732 <initNewSem+0x6a>
  100700:	89 f1                	mov    %esi,%ecx
  100702:	c1 e1 04             	shl    $0x4,%ecx
  100705:	8d 91 60 21 10 00    	lea    0x102160(%ecx),%edx
  10070b:	c7 81 6c 21 10 00 00 	movl   $0x0,0x10216c(%ecx)
  100712:	00 00 00 
  100715:	89 b1 60 21 10 00    	mov    %esi,0x102160(%ecx)
  10071b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10071e:	89 4a 04             	mov    %ecx,0x4(%edx)
  100721:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  100728:	5b                   	pop    %ebx
  100729:	5e                   	pop    %esi
  10072a:	5d                   	pop    %ebp
  10072b:	c3                   	ret    
  10072c:	89 d6                	mov    %edx,%esi
  10072e:	39 da                	cmp    %ebx,%edx
  100730:	75 ce                	jne    100700 <initNewSem+0x38>
  100732:	42                   	inc    %edx
  100733:	89 15 08 21 10 00    	mov    %edx,0x102108
  100739:	eb c5                	jmp    100700 <initNewSem+0x38>
  10073b:	31 c0                	xor    %eax,%eax
  10073d:	ba 01 00 00 00       	mov    $0x1,%edx
  100742:	31 f6                	xor    %esi,%esi
  100744:	eb ed                	jmp    100733 <initNewSem+0x6b>
  100746:	31 f6                	xor    %esi,%esi
  100748:	31 c0                	xor    %eax,%eax
  10074a:	eb b4                	jmp    100700 <initNewSem+0x38>

0010074c <P>:
  10074c:	55                   	push   %ebp
  10074d:	89 e5                	mov    %esp,%ebp
  10074f:	53                   	push   %ebx
  100750:	50                   	push   %eax
  100751:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100754:	ff 49 04             	decl   0x4(%ecx)
  100757:	78 07                	js     100760 <P+0x14>
  100759:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10075c:	c9                   	leave  
  10075d:	c3                   	ret    
  10075e:	66 90                	xchg   %ax,%ax
  100760:	8b 1d a4 37 30 00    	mov    0x3037a4,%ebx
  100766:	c7 83 54 00 01 00 02 	movl   $0x2,0x10054(%ebx)
  10076d:	00 00 00 
  100770:	8b 51 0c             	mov    0xc(%ecx),%edx
  100773:	85 d2                	test   %edx,%edx
  100775:	75 07                	jne    10077e <P+0x32>
  100777:	eb 3f                	jmp    1007b8 <P+0x6c>
  100779:	8d 76 00             	lea    0x0(%esi),%esi
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 82 64 00 01 00    	mov    0x10064(%edx),%eax
  100784:	85 c0                	test   %eax,%eax
  100786:	75 f4                	jne    10077c <P+0x30>
  100788:	89 9a 64 00 01 00    	mov    %ebx,0x10064(%edx)
  10078e:	c7 83 64 00 01 00 00 	movl   $0x0,0x10064(%ebx)
  100795:	00 00 00 
  100798:	83 ec 0c             	sub    $0xc,%esp
  10079b:	68 84 18 10 00       	push   $0x101884
  1007a0:	e8 ff 02 00 00       	call   100aa4 <printf>
  1007a5:	e8 fe 0d 00 00       	call   1015a8 <schedule>
  1007aa:	83 c4 10             	add    $0x10,%esp
  1007ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007b0:	c9                   	leave  
  1007b1:	e9 4e 0e 00 00       	jmp    101604 <switchToRunning>
  1007b6:	66 90                	xchg   %ax,%ax
  1007b8:	89 59 0c             	mov    %ebx,0xc(%ecx)
  1007bb:	c7 83 64 00 01 00 00 	movl   $0x0,0x10064(%ebx)
  1007c2:	00 00 00 
  1007c5:	eb d1                	jmp    100798 <P+0x4c>
  1007c7:	90                   	nop

001007c8 <V>:
  1007c8:	55                   	push   %ebp
  1007c9:	89 e5                	mov    %esp,%ebp
  1007cb:	53                   	push   %ebx
  1007cc:	50                   	push   %eax
  1007cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007d0:	8b 43 04             	mov    0x4(%ebx),%eax
  1007d3:	40                   	inc    %eax
  1007d4:	89 43 04             	mov    %eax,0x4(%ebx)
  1007d7:	85 c0                	test   %eax,%eax
  1007d9:	7e 05                	jle    1007e0 <V+0x18>
  1007db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007de:	c9                   	leave  
  1007df:	c3                   	ret    
  1007e0:	8b 43 0c             	mov    0xc(%ebx),%eax
  1007e3:	85 c0                	test   %eax,%eax
  1007e5:	74 39                	je     100820 <V+0x58>
  1007e7:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  1007ed:	89 53 0c             	mov    %edx,0xc(%ebx)
  1007f0:	c7 80 54 00 01 00 01 	movl   $0x1,0x10054(%eax)
  1007f7:	00 00 00 
  1007fa:	c7 80 64 00 01 00 00 	movl   $0x0,0x10064(%eax)
  100801:	00 00 00 
  100804:	83 ec 0c             	sub    $0xc,%esp
  100807:	50                   	push   %eax
  100808:	e8 63 0a 00 00       	call   101270 <addToRunnable>
  10080d:	83 c4 10             	add    $0x10,%esp
  100810:	c7 45 08 a0 18 10 00 	movl   $0x1018a0,0x8(%ebp)
  100817:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10081a:	c9                   	leave  
  10081b:	e9 84 02 00 00       	jmp    100aa4 <printf>
  100820:	83 ec 08             	sub    $0x8,%esp
  100823:	6a 3c                	push   $0x3c
  100825:	68 92 18 10 00       	push   $0x101892
  10082a:	e8 19 0f 00 00       	call   101748 <abort>
  10082f:	8b 43 0c             	mov    0xc(%ebx),%eax
  100832:	83 c4 10             	add    $0x10,%esp
  100835:	eb b0                	jmp    1007e7 <V+0x1f>
  100837:	90                   	nop

00100838 <initIdt>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	53                   	push   %ebx
  10083c:	ba df 17 10 00       	mov    $0x1017df,%edx
  100841:	89 d3                	mov    %edx,%ebx
  100843:	c1 ea 10             	shr    $0x10,%edx
  100846:	b9 e0 29 10 00       	mov    $0x1029e0,%ecx
  10084b:	b8 e0 21 10 00       	mov    $0x1021e0,%eax
  100850:	66 89 18             	mov    %bx,(%eax)
  100853:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100859:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10085d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100861:	66 89 50 06          	mov    %dx,0x6(%eax)
  100865:	83 c0 08             	add    $0x8,%eax
  100868:	39 c1                	cmp    %eax,%ecx
  10086a:	75 e4                	jne    100850 <initIdt+0x18>
  10086c:	b8 e5 17 10 00       	mov    $0x1017e5,%eax
  100871:	66 a3 48 22 10 00    	mov    %ax,0x102248
  100877:	66 c7 05 4a 22 10 00 	movw   $0x8,0x10224a
  10087e:	08 00 
  100880:	c6 05 4c 22 10 00 00 	movb   $0x0,0x10224c
  100887:	c6 05 4d 22 10 00 8f 	movb   $0x8f,0x10224d
  10088e:	c1 e8 10             	shr    $0x10,%eax
  100891:	66 a3 4e 22 10 00    	mov    %ax,0x10224e
  100897:	b8 e9 17 10 00       	mov    $0x1017e9,%eax
  10089c:	66 a3 e0 25 10 00    	mov    %ax,0x1025e0
  1008a2:	66 c7 05 e2 25 10 00 	movw   $0x8,0x1025e2
  1008a9:	08 00 
  1008ab:	c6 05 e4 25 10 00 00 	movb   $0x0,0x1025e4
  1008b2:	c6 05 e5 25 10 00 ee 	movb   $0xee,0x1025e5
  1008b9:	c1 e8 10             	shr    $0x10,%eax
  1008bc:	66 a3 e6 25 10 00    	mov    %ax,0x1025e6
  1008c2:	b8 f2 17 10 00       	mov    $0x1017f2,%eax
  1008c7:	66 a3 e0 22 10 00    	mov    %ax,0x1022e0
  1008cd:	66 c7 05 e2 22 10 00 	movw   $0x8,0x1022e2
  1008d4:	08 00 
  1008d6:	c6 05 e4 22 10 00 00 	movb   $0x0,0x1022e4
  1008dd:	c6 05 e5 22 10 00 8e 	movb   $0x8e,0x1022e5
  1008e4:	c1 e8 10             	shr    $0x10,%eax
  1008e7:	66 a3 e6 22 10 00    	mov    %ax,0x1022e6
  1008ed:	66 c7 05 0c 21 10 00 	movw   $0x7ff,0x10210c
  1008f4:	ff 07 
  1008f6:	b8 e0 21 10 00       	mov    $0x1021e0,%eax
  1008fb:	66 a3 0e 21 10 00    	mov    %ax,0x10210e
  100901:	c1 e8 10             	shr    $0x10,%eax
  100904:	66 a3 10 21 10 00    	mov    %ax,0x102110
  10090a:	b8 0c 21 10 00       	mov    $0x10210c,%eax
  10090f:	0f 01 18             	lidtl  (%eax)
  100912:	5b                   	pop    %ebx
  100913:	5d                   	pop    %ebp
  100914:	c3                   	ret    
  100915:	66 90                	xchg   %ax,%ax
  100917:	90                   	nop

00100918 <printString>:
  100918:	55                   	push   %ebp
  100919:	89 e5                	mov    %esp,%ebp
  10091b:	53                   	push   %ebx
  10091c:	50                   	push   %eax
  10091d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100920:	0f be 03             	movsbl (%ebx),%eax
  100923:	43                   	inc    %ebx
  100924:	84 c0                	test   %al,%al
  100926:	74 15                	je     10093d <printString+0x25>
  100928:	83 ec 0c             	sub    $0xc,%esp
  10092b:	50                   	push   %eax
  10092c:	e8 1f 03 00 00       	call   100c50 <putChar>
  100931:	43                   	inc    %ebx
  100932:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  100936:	83 c4 10             	add    $0x10,%esp
  100939:	84 c0                	test   %al,%al
  10093b:	75 eb                	jne    100928 <printString+0x10>
  10093d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100940:	c9                   	leave  
  100941:	c3                   	ret    
  100942:	66 90                	xchg   %ax,%ax

00100944 <printDemical>:
  100944:	55                   	push   %ebp
  100945:	89 e5                	mov    %esp,%ebp
  100947:	57                   	push   %edi
  100948:	56                   	push   %esi
  100949:	53                   	push   %ebx
  10094a:	83 ec 28             	sub    $0x28,%esp
  10094d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100950:	8d 43 30             	lea    0x30(%ebx),%eax
  100953:	0f be c0             	movsbl %al,%eax
  100956:	50                   	push   %eax
  100957:	e8 f4 02 00 00       	call   100c50 <putChar>
  10095c:	83 c4 10             	add    $0x10,%esp
  10095f:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  100965:	74 6d                	je     1009d4 <printDemical+0x90>
  100967:	85 db                	test   %ebx,%ebx
  100969:	0f 84 8d 00 00 00    	je     1009fc <printDemical+0xb8>
  10096f:	0f 88 9b 00 00 00    	js     100a10 <printDemical+0xcc>
  100975:	be 09 00 00 00       	mov    $0x9,%esi
  10097a:	bf 0a 00 00 00       	mov    $0xa,%edi
  10097f:	eb 05                	jmp    100986 <printDemical+0x42>
  100981:	8d 76 00             	lea    0x0(%esi),%esi
  100984:	89 d6                	mov    %edx,%esi
  100986:	89 d8                	mov    %ebx,%eax
  100988:	99                   	cltd   
  100989:	f7 ff                	idiv   %edi
  10098b:	8d 4a 30             	lea    0x30(%edx),%ecx
  10098e:	88 4c 35 de          	mov    %cl,-0x22(%ebp,%esi,1)
  100992:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100997:	f7 eb                	imul   %ebx
  100999:	89 d0                	mov    %edx,%eax
  10099b:	c1 f8 02             	sar    $0x2,%eax
  10099e:	c1 fb 1f             	sar    $0x1f,%ebx
  1009a1:	8d 56 ff             	lea    -0x1(%esi),%edx
  1009a4:	29 d8                	sub    %ebx,%eax
  1009a6:	89 c3                	mov    %eax,%ebx
  1009a8:	75 da                	jne    100984 <printDemical+0x40>
  1009aa:	8d 5c 35 df          	lea    -0x21(%ebp,%esi,1),%ebx
  1009ae:	8d 75 e8             	lea    -0x18(%ebp),%esi
  1009b1:	eb 04                	jmp    1009b7 <printDemical+0x73>
  1009b3:	90                   	nop
  1009b4:	8a 0b                	mov    (%ebx),%cl
  1009b6:	43                   	inc    %ebx
  1009b7:	83 ec 0c             	sub    $0xc,%esp
  1009ba:	0f be c9             	movsbl %cl,%ecx
  1009bd:	51                   	push   %ecx
  1009be:	e8 8d 02 00 00       	call   100c50 <putChar>
  1009c3:	83 c4 10             	add    $0x10,%esp
  1009c6:	39 de                	cmp    %ebx,%esi
  1009c8:	75 ea                	jne    1009b4 <printDemical+0x70>
  1009ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1009cd:	5b                   	pop    %ebx
  1009ce:	5e                   	pop    %esi
  1009cf:	5f                   	pop    %edi
  1009d0:	5d                   	pop    %ebp
  1009d1:	c3                   	ret    
  1009d2:	66 90                	xchg   %ax,%ax
  1009d4:	bb af 18 10 00       	mov    $0x1018af,%ebx
  1009d9:	b8 2d 00 00 00       	mov    $0x2d,%eax
  1009de:	66 90                	xchg   %ax,%ax
  1009e0:	83 ec 0c             	sub    $0xc,%esp
  1009e3:	50                   	push   %eax
  1009e4:	e8 67 02 00 00       	call   100c50 <putChar>
  1009e9:	43                   	inc    %ebx
  1009ea:	0f be 03             	movsbl (%ebx),%eax
  1009ed:	83 c4 10             	add    $0x10,%esp
  1009f0:	84 c0                	test   %al,%al
  1009f2:	75 ec                	jne    1009e0 <printDemical+0x9c>
  1009f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1009f7:	5b                   	pop    %ebx
  1009f8:	5e                   	pop    %esi
  1009f9:	5f                   	pop    %edi
  1009fa:	5d                   	pop    %ebp
  1009fb:	c3                   	ret    
  1009fc:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
  100a03:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100a06:	5b                   	pop    %ebx
  100a07:	5e                   	pop    %esi
  100a08:	5f                   	pop    %edi
  100a09:	5d                   	pop    %ebp
  100a0a:	e9 41 02 00 00       	jmp    100c50 <putChar>
  100a0f:	90                   	nop
  100a10:	f7 db                	neg    %ebx
  100a12:	83 ec 0c             	sub    $0xc,%esp
  100a15:	6a 2d                	push   $0x2d
  100a17:	e8 34 02 00 00       	call   100c50 <putChar>
  100a1c:	83 c4 10             	add    $0x10,%esp
  100a1f:	e9 51 ff ff ff       	jmp    100975 <printDemical+0x31>

00100a24 <printHex>:
  100a24:	55                   	push   %ebp
  100a25:	89 e5                	mov    %esp,%ebp
  100a27:	56                   	push   %esi
  100a28:	53                   	push   %ebx
  100a29:	83 ec 10             	sub    $0x10,%esp
  100a2c:	8b 55 08             	mov    0x8(%ebp),%edx
  100a2f:	85 d2                	test   %edx,%edx
  100a31:	74 5d                	je     100a90 <printHex+0x6c>
  100a33:	be 07 00 00 00       	mov    $0x7,%esi
  100a38:	eb 13                	jmp    100a4d <printHex+0x29>
  100a3a:	66 90                	xchg   %ax,%ax
  100a3c:	83 c0 30             	add    $0x30,%eax
  100a3f:	88 44 35 f0          	mov    %al,-0x10(%ebp,%esi,1)
  100a43:	8d 4e ff             	lea    -0x1(%esi),%ecx
  100a46:	c1 ea 04             	shr    $0x4,%edx
  100a49:	74 1b                	je     100a66 <printHex+0x42>
  100a4b:	89 ce                	mov    %ecx,%esi
  100a4d:	89 d0                	mov    %edx,%eax
  100a4f:	83 e0 0f             	and    $0xf,%eax
  100a52:	83 f8 09             	cmp    $0x9,%eax
  100a55:	76 e5                	jbe    100a3c <printHex+0x18>
  100a57:	83 c0 57             	add    $0x57,%eax
  100a5a:	88 44 35 f0          	mov    %al,-0x10(%ebp,%esi,1)
  100a5e:	8d 4e ff             	lea    -0x1(%esi),%ecx
  100a61:	c1 ea 04             	shr    $0x4,%edx
  100a64:	75 e5                	jne    100a4b <printHex+0x27>
  100a66:	8d 5d f0             	lea    -0x10(%ebp),%ebx
  100a69:	01 de                	add    %ebx,%esi
  100a6b:	8d 5d f8             	lea    -0x8(%ebp),%ebx
  100a6e:	eb 02                	jmp    100a72 <printHex+0x4e>
  100a70:	8a 06                	mov    (%esi),%al
  100a72:	83 ec 0c             	sub    $0xc,%esp
  100a75:	0f be c0             	movsbl %al,%eax
  100a78:	50                   	push   %eax
  100a79:	e8 d2 01 00 00       	call   100c50 <putChar>
  100a7e:	46                   	inc    %esi
  100a7f:	83 c4 10             	add    $0x10,%esp
  100a82:	39 de                	cmp    %ebx,%esi
  100a84:	75 ea                	jne    100a70 <printHex+0x4c>
  100a86:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a89:	5b                   	pop    %ebx
  100a8a:	5e                   	pop    %esi
  100a8b:	5d                   	pop    %ebp
  100a8c:	c3                   	ret    
  100a8d:	8d 76 00             	lea    0x0(%esi),%esi
  100a90:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
  100a97:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a9a:	5b                   	pop    %ebx
  100a9b:	5e                   	pop    %esi
  100a9c:	5d                   	pop    %ebp
  100a9d:	e9 ae 01 00 00       	jmp    100c50 <putChar>
  100aa2:	66 90                	xchg   %ax,%ax

00100aa4 <printf>:
  100aa4:	55                   	push   %ebp
  100aa5:	89 e5                	mov    %esp,%ebp
  100aa7:	57                   	push   %edi
  100aa8:	56                   	push   %esi
  100aa9:	53                   	push   %ebx
  100aaa:	81 ec ec 00 00 00    	sub    $0xec,%esp
  100ab0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ab3:	85 db                	test   %ebx,%ebx
  100ab5:	74 7a                	je     100b31 <printf+0x8d>
  100ab7:	8d 45 0c             	lea    0xc(%ebp),%eax
  100aba:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
  100ac0:	0f be 03             	movsbl (%ebx),%eax
  100ac3:	31 d2                	xor    %edx,%edx
  100ac5:	84 c0                	test   %al,%al
  100ac7:	74 68                	je     100b31 <printf+0x8d>
  100ac9:	8d 76 00             	lea    0x0(%esi),%esi
  100acc:	89 d7                	mov    %edx,%edi
  100ace:	3c 25                	cmp    $0x25,%al
  100ad0:	74 26                	je     100af8 <printf+0x54>
  100ad2:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
  100ad8:	29 fe                	sub    %edi,%esi
  100ada:	eb 04                	jmp    100ae0 <printf+0x3c>
  100adc:	84 c0                	test   %al,%al
  100ade:	74 51                	je     100b31 <printf+0x8d>
  100ae0:	88 04 3e             	mov    %al,(%esi,%edi,1)
  100ae3:	83 ec 0c             	sub    $0xc,%esp
  100ae6:	50                   	push   %eax
  100ae7:	e8 64 01 00 00       	call   100c50 <putChar>
  100aec:	47                   	inc    %edi
  100aed:	0f be 04 3b          	movsbl (%ebx,%edi,1),%eax
  100af1:	83 c4 10             	add    $0x10,%esp
  100af4:	3c 25                	cmp    $0x25,%al
  100af6:	75 e4                	jne    100adc <printf+0x38>
  100af8:	8a 44 3b 01          	mov    0x1(%ebx,%edi,1),%al
  100afc:	3c 64                	cmp    $0x64,%al
  100afe:	74 60                	je     100b60 <printf+0xbc>
  100b00:	7e 3a                	jle    100b3c <printf+0x98>
  100b02:	3c 73                	cmp    $0x73,%al
  100b04:	74 7a                	je     100b80 <printf+0xdc>
  100b06:	3c 78                	cmp    $0x78,%al
  100b08:	75 1c                	jne    100b26 <printf+0x82>
  100b0a:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
  100b10:	8d 70 04             	lea    0x4(%eax),%esi
  100b13:	83 ec 0c             	sub    $0xc,%esp
  100b16:	ff 30                	pushl  (%eax)
  100b18:	e8 07 ff ff ff       	call   100a24 <printHex>
  100b1d:	83 c4 10             	add    $0x10,%esp
  100b20:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
  100b26:	8d 57 02             	lea    0x2(%edi),%edx
  100b29:	0f be 04 13          	movsbl (%ebx,%edx,1),%eax
  100b2d:	84 c0                	test   %al,%al
  100b2f:	75 9b                	jne    100acc <printf+0x28>
  100b31:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100b34:	5b                   	pop    %ebx
  100b35:	5e                   	pop    %esi
  100b36:	5f                   	pop    %edi
  100b37:	5d                   	pop    %ebp
  100b38:	c3                   	ret    
  100b39:	8d 76 00             	lea    0x0(%esi),%esi
  100b3c:	3c 63                	cmp    $0x63,%al
  100b3e:	75 e6                	jne    100b26 <printf+0x82>
  100b40:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
  100b46:	8d 70 04             	lea    0x4(%eax),%esi
  100b49:	83 ec 0c             	sub    $0xc,%esp
  100b4c:	0f be 00             	movsbl (%eax),%eax
  100b4f:	50                   	push   %eax
  100b50:	e8 fb 00 00 00       	call   100c50 <putChar>
  100b55:	83 c4 10             	add    $0x10,%esp
  100b58:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
  100b5e:	eb c6                	jmp    100b26 <printf+0x82>
  100b60:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
  100b66:	89 c8                	mov    %ecx,%eax
  100b68:	83 c1 04             	add    $0x4,%ecx
  100b6b:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
  100b71:	83 ec 0c             	sub    $0xc,%esp
  100b74:	ff 30                	pushl  (%eax)
  100b76:	e8 c9 fd ff ff       	call   100944 <printDemical>
  100b7b:	83 c4 10             	add    $0x10,%esp
  100b7e:	eb a6                	jmp    100b26 <printf+0x82>
  100b80:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
  100b86:	89 c8                	mov    %ecx,%eax
  100b88:	83 c1 04             	add    $0x4,%ecx
  100b8b:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
  100b91:	8b 30                	mov    (%eax),%esi
  100b93:	0f be 06             	movsbl (%esi),%eax
  100b96:	46                   	inc    %esi
  100b97:	84 c0                	test   %al,%al
  100b99:	74 8b                	je     100b26 <printf+0x82>
  100b9b:	90                   	nop
  100b9c:	83 ec 0c             	sub    $0xc,%esp
  100b9f:	50                   	push   %eax
  100ba0:	e8 ab 00 00 00       	call   100c50 <putChar>
  100ba5:	46                   	inc    %esi
  100ba6:	0f be 46 ff          	movsbl -0x1(%esi),%eax
  100baa:	83 c4 10             	add    $0x10,%esp
  100bad:	84 c0                	test   %al,%al
  100baf:	75 eb                	jne    100b9c <printf+0xf8>
  100bb1:	e9 70 ff ff ff       	jmp    100b26 <printf+0x82>
  100bb6:	66 90                	xchg   %ax,%ax

00100bb8 <initIntr>:
  100bb8:	55                   	push   %ebp
  100bb9:	89 e5                	mov    %esp,%ebp
  100bbb:	ba 21 00 00 00       	mov    $0x21,%edx
  100bc0:	b0 ff                	mov    $0xff,%al
  100bc2:	ee                   	out    %al,(%dx)
  100bc3:	ba a1 00 00 00       	mov    $0xa1,%edx
  100bc8:	ee                   	out    %al,(%dx)
  100bc9:	ba 20 00 00 00       	mov    $0x20,%edx
  100bce:	b0 11                	mov    $0x11,%al
  100bd0:	ee                   	out    %al,(%dx)
  100bd1:	ba 21 00 00 00       	mov    $0x21,%edx
  100bd6:	b0 20                	mov    $0x20,%al
  100bd8:	ee                   	out    %al,(%dx)
  100bd9:	b0 04                	mov    $0x4,%al
  100bdb:	ee                   	out    %al,(%dx)
  100bdc:	b0 03                	mov    $0x3,%al
  100bde:	ee                   	out    %al,(%dx)
  100bdf:	ba a0 00 00 00       	mov    $0xa0,%edx
  100be4:	b0 11                	mov    $0x11,%al
  100be6:	ee                   	out    %al,(%dx)
  100be7:	ba a1 00 00 00       	mov    $0xa1,%edx
  100bec:	b0 28                	mov    $0x28,%al
  100bee:	ee                   	out    %al,(%dx)
  100bef:	b0 02                	mov    $0x2,%al
  100bf1:	ee                   	out    %al,(%dx)
  100bf2:	b0 03                	mov    $0x3,%al
  100bf4:	ee                   	out    %al,(%dx)
  100bf5:	ba 20 00 00 00       	mov    $0x20,%edx
  100bfa:	b0 68                	mov    $0x68,%al
  100bfc:	ee                   	out    %al,(%dx)
  100bfd:	b0 0a                	mov    $0xa,%al
  100bff:	ee                   	out    %al,(%dx)
  100c00:	ba a0 00 00 00       	mov    $0xa0,%edx
  100c05:	b0 68                	mov    $0x68,%al
  100c07:	ee                   	out    %al,(%dx)
  100c08:	b0 0a                	mov    $0xa,%al
  100c0a:	ee                   	out    %al,(%dx)
  100c0b:	5d                   	pop    %ebp
  100c0c:	c3                   	ret    
  100c0d:	66 90                	xchg   %ax,%ax
  100c0f:	90                   	nop

00100c10 <initSerial>:
  100c10:	55                   	push   %ebp
  100c11:	89 e5                	mov    %esp,%ebp
  100c13:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100c18:	31 c0                	xor    %eax,%eax
  100c1a:	ee                   	out    %al,(%dx)
  100c1b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100c20:	b0 80                	mov    $0x80,%al
  100c22:	ee                   	out    %al,(%dx)
  100c23:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100c28:	b0 01                	mov    $0x1,%al
  100c2a:	ee                   	out    %al,(%dx)
  100c2b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100c30:	31 c0                	xor    %eax,%eax
  100c32:	ee                   	out    %al,(%dx)
  100c33:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100c38:	b0 03                	mov    $0x3,%al
  100c3a:	ee                   	out    %al,(%dx)
  100c3b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100c40:	b0 c7                	mov    $0xc7,%al
  100c42:	ee                   	out    %al,(%dx)
  100c43:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100c48:	b0 0b                	mov    $0xb,%al
  100c4a:	ee                   	out    %al,(%dx)
  100c4b:	5d                   	pop    %ebp
  100c4c:	c3                   	ret    
  100c4d:	8d 76 00             	lea    0x0(%esi),%esi

00100c50 <putChar>:
  100c50:	55                   	push   %ebp
  100c51:	89 e5                	mov    %esp,%ebp
  100c53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100c56:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100c5b:	90                   	nop
  100c5c:	ec                   	in     (%dx),%al
  100c5d:	a8 20                	test   $0x20,%al
  100c5f:	74 fb                	je     100c5c <putChar+0xc>
  100c61:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100c66:	88 c8                	mov    %cl,%al
  100c68:	ee                   	out    %al,(%dx)
  100c69:	5d                   	pop    %ebp
  100c6a:	c3                   	ret    
  100c6b:	90                   	nop

00100c6c <initTimer>:
  100c6c:	55                   	push   %ebp
  100c6d:	89 e5                	mov    %esp,%ebp
  100c6f:	ba 43 00 00 00       	mov    $0x43,%edx
  100c74:	b0 34                	mov    $0x34,%al
  100c76:	ee                   	out    %al,(%dx)
  100c77:	ba 40 00 00 00       	mov    $0x40,%edx
  100c7c:	b0 9b                	mov    $0x9b,%al
  100c7e:	ee                   	out    %al,(%dx)
  100c7f:	b0 2e                	mov    $0x2e,%al
  100c81:	ee                   	out    %al,(%dx)
  100c82:	5d                   	pop    %ebp
  100c83:	c3                   	ret    

00100c84 <waitDisk>:
  100c84:	55                   	push   %ebp
  100c85:	89 e5                	mov    %esp,%ebp
  100c87:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100c8c:	ec                   	in     (%dx),%al
  100c8d:	83 e0 c0             	and    $0xffffffc0,%eax
  100c90:	3c 40                	cmp    $0x40,%al
  100c92:	75 f8                	jne    100c8c <waitDisk+0x8>
  100c94:	5d                   	pop    %ebp
  100c95:	c3                   	ret    
  100c96:	66 90                	xchg   %ax,%ax

00100c98 <readSect>:
  100c98:	55                   	push   %ebp
  100c99:	89 e5                	mov    %esp,%ebp
  100c9b:	53                   	push   %ebx
  100c9c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c9f:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100ca4:	ec                   	in     (%dx),%al
  100ca5:	83 e0 c0             	and    $0xffffffc0,%eax
  100ca8:	3c 40                	cmp    $0x40,%al
  100caa:	75 f8                	jne    100ca4 <readSect+0xc>
  100cac:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100cb1:	b0 01                	mov    $0x1,%al
  100cb3:	ee                   	out    %al,(%dx)
  100cb4:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100cb9:	88 c8                	mov    %cl,%al
  100cbb:	ee                   	out    %al,(%dx)
  100cbc:	89 c8                	mov    %ecx,%eax
  100cbe:	c1 f8 08             	sar    $0x8,%eax
  100cc1:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100cc6:	ee                   	out    %al,(%dx)
  100cc7:	89 c8                	mov    %ecx,%eax
  100cc9:	c1 f8 10             	sar    $0x10,%eax
  100ccc:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100cd1:	ee                   	out    %al,(%dx)
  100cd2:	89 c8                	mov    %ecx,%eax
  100cd4:	c1 f8 18             	sar    $0x18,%eax
  100cd7:	83 c8 e0             	or     $0xffffffe0,%eax
  100cda:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100cdf:	ee                   	out    %al,(%dx)
  100ce0:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100ce5:	b0 20                	mov    $0x20,%al
  100ce7:	ee                   	out    %al,(%dx)
  100ce8:	ec                   	in     (%dx),%al
  100ce9:	83 e0 c0             	and    $0xffffffc0,%eax
  100cec:	3c 40                	cmp    $0x40,%al
  100cee:	75 f8                	jne    100ce8 <readSect+0x50>
  100cf0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100cf3:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100cf9:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100cfe:	66 90                	xchg   %ax,%ax
  100d00:	ed                   	in     (%dx),%eax
  100d01:	89 01                	mov    %eax,(%ecx)
  100d03:	83 c1 04             	add    $0x4,%ecx
  100d06:	39 d9                	cmp    %ebx,%ecx
  100d08:	75 f6                	jne    100d00 <readSect+0x68>
  100d0a:	5b                   	pop    %ebx
  100d0b:	5d                   	pop    %ebp
  100d0c:	c3                   	ret    
  100d0d:	8d 76 00             	lea    0x0(%esi),%esi

00100d10 <initSeg>:
  100d10:	55                   	push   %ebp
  100d11:	89 e5                	mov    %esp,%ebp
  100d13:	ba e0 29 10 00       	mov    $0x1029e0,%edx
  100d18:	66 c7 05 e8 29 10 00 	movw   $0xffff,0x1029e8
  100d1f:	ff ff 
  100d21:	66 c7 05 ea 29 10 00 	movw   $0x0,0x1029ea
  100d28:	00 00 
  100d2a:	c6 05 ec 29 10 00 00 	movb   $0x0,0x1029ec
  100d31:	c6 05 ed 29 10 00 9a 	movb   $0x9a,0x1029ed
  100d38:	c6 05 ee 29 10 00 cf 	movb   $0xcf,0x1029ee
  100d3f:	c6 05 ef 29 10 00 00 	movb   $0x0,0x1029ef
  100d46:	66 c7 05 f0 29 10 00 	movw   $0xffff,0x1029f0
  100d4d:	ff ff 
  100d4f:	66 c7 05 f2 29 10 00 	movw   $0x0,0x1029f2
  100d56:	00 00 
  100d58:	c6 05 f4 29 10 00 00 	movb   $0x0,0x1029f4
  100d5f:	c6 05 f5 29 10 00 92 	movb   $0x92,0x1029f5
  100d66:	c6 05 f6 29 10 00 cf 	movb   $0xcf,0x1029f6
  100d6d:	c6 05 f7 29 10 00 00 	movb   $0x0,0x1029f7
  100d74:	66 c7 05 10 2a 10 00 	movw   $0xffff,0x102a10
  100d7b:	ff ff 
  100d7d:	66 c7 05 12 2a 10 00 	movw   $0x0,0x102a12
  100d84:	00 00 
  100d86:	c6 05 14 2a 10 00 00 	movb   $0x0,0x102a14
  100d8d:	c6 05 15 2a 10 00 92 	movb   $0x92,0x102a15
  100d94:	c6 05 16 2a 10 00 cf 	movb   $0xcf,0x102a16
  100d9b:	c6 05 17 2a 10 00 00 	movb   $0x0,0x102a17
  100da2:	66 c7 05 f8 29 10 00 	movw   $0xffff,0x1029f8
  100da9:	ff ff 
  100dab:	66 c7 05 fa 29 10 00 	movw   $0x0,0x1029fa
  100db2:	00 00 
  100db4:	c6 05 fc 29 10 00 00 	movb   $0x0,0x1029fc
  100dbb:	c6 05 fd 29 10 00 fa 	movb   $0xfa,0x1029fd
  100dc2:	c6 05 fe 29 10 00 cf 	movb   $0xcf,0x1029fe
  100dc9:	c6 05 ff 29 10 00 00 	movb   $0x0,0x1029ff
  100dd0:	66 c7 05 00 2a 10 00 	movw   $0xffff,0x102a00
  100dd7:	ff ff 
  100dd9:	66 c7 05 02 2a 10 00 	movw   $0x0,0x102a02
  100de0:	00 00 
  100de2:	c6 05 04 2a 10 00 00 	movb   $0x0,0x102a04
  100de9:	c6 05 05 2a 10 00 f2 	movb   $0xf2,0x102a05
  100df0:	c6 05 06 2a 10 00 cf 	movb   $0xcf,0x102a06
  100df7:	c6 05 07 2a 10 00 00 	movb   $0x0,0x102a07
  100dfe:	66 c7 05 08 2a 10 00 	movw   $0x63,0x102a08
  100e05:	63 00 
  100e07:	b8 20 2a 10 00       	mov    $0x102a20,%eax
  100e0c:	66 a3 0a 2a 10 00    	mov    %ax,0x102a0a
  100e12:	89 c1                	mov    %eax,%ecx
  100e14:	c1 e9 10             	shr    $0x10,%ecx
  100e17:	88 0d 0c 2a 10 00    	mov    %cl,0x102a0c
  100e1d:	c6 05 0d 2a 10 00 89 	movb   $0x89,0x102a0d
  100e24:	c6 05 0e 2a 10 00 40 	movb   $0x40,0x102a0e
  100e2b:	c1 e8 18             	shr    $0x18,%eax
  100e2e:	a2 0f 2a 10 00       	mov    %al,0x102a0f
  100e33:	66 c7 05 14 21 10 00 	movw   $0x37,0x102114
  100e3a:	37 00 
  100e3c:	66 89 15 16 21 10 00 	mov    %dx,0x102116
  100e43:	c1 ea 10             	shr    $0x10,%edx
  100e46:	66 89 15 18 21 10 00 	mov    %dx,0x102118
  100e4d:	b8 14 21 10 00       	mov    $0x102114,%eax
  100e52:	0f 01 10             	lgdtl  (%eax)
  100e55:	c7 05 28 2a 10 00 30 	movl   $0x30,0x102a28
  100e5c:	00 00 00 
  100e5f:	c7 05 24 2a 10 00 00 	movl   $0x10000,0x102a24
  100e66:	00 01 00 
  100e69:	b8 28 00 00 00       	mov    $0x28,%eax
  100e6e:	0f 00 d8             	ltr    %ax
  100e71:	b8 10 00 00 00       	mov    $0x10,%eax
  100e76:	89 c0                	mov    %eax,%eax
  100e78:	8e d8                	mov    %eax,%ds
  100e7a:	8e c0                	mov    %eax,%es
  100e7c:	8e d0                	mov    %eax,%ss
  100e7e:	8e e0                	mov    %eax,%fs
  100e80:	8e e8                	mov    %eax,%gs
  100e82:	31 c0                	xor    %eax,%eax
  100e84:	0f 00 d0             	lldt   %ax
  100e87:	5d                   	pop    %ebp
  100e88:	c3                   	ret    
  100e89:	8d 76 00             	lea    0x0(%esi),%esi

00100e8c <enterUserSpace>:
  100e8c:	55                   	push   %ebp
  100e8d:	89 e5                	mov    %esp,%ebp
  100e8f:	b8 23 00 00 00       	mov    $0x23,%eax
  100e94:	89 c0                	mov    %eax,%eax
  100e96:	8e d8                	mov    %eax,%ds
  100e98:	8e c0                	mov    %eax,%es
  100e9a:	8e e0                	mov    %eax,%fs
  100e9c:	8e e8                	mov    %eax,%gs
  100e9e:	50                   	push   %eax
  100e9f:	b8 00 00 00 08       	mov    $0x8000000,%eax
  100ea4:	50                   	push   %eax
  100ea5:	9c                   	pushf  
  100ea6:	b8 1b 00 00 00       	mov    $0x1b,%eax
  100eab:	50                   	push   %eax
  100eac:	8b 45 08             	mov    0x8(%ebp),%eax
  100eaf:	50                   	push   %eax
  100eb0:	cf                   	iret   
  100eb1:	5d                   	pop    %ebp
  100eb2:	c3                   	ret    
  100eb3:	90                   	nop

00100eb4 <loadUMain>:
  100eb4:	55                   	push   %ebp
  100eb5:	89 e5                	mov    %esp,%ebp
  100eb7:	57                   	push   %edi
  100eb8:	56                   	push   %esi
  100eb9:	53                   	push   %ebx
  100eba:	83 ec 0c             	sub    $0xc,%esp
  100ebd:	be c9 00 00 00       	mov    $0xc9,%esi
  100ec2:	bb 00 00 00 02       	mov    $0x2000000,%ebx
  100ec7:	90                   	nop
  100ec8:	56                   	push   %esi
  100ec9:	53                   	push   %ebx
  100eca:	e8 c9 fd ff ff       	call   100c98 <readSect>
  100ecf:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100ed5:	46                   	inc    %esi
  100ed6:	58                   	pop    %eax
  100ed7:	5a                   	pop    %edx
  100ed8:	81 fb 00 c8 00 02    	cmp    $0x200c800,%ebx
  100ede:	75 e8                	jne    100ec8 <loadUMain+0x14>
  100ee0:	a1 1c 00 00 02       	mov    0x200001c,%eax
  100ee5:	8d 90 00 00 00 02    	lea    0x2000000(%eax),%edx
  100eeb:	31 db                	xor    %ebx,%ebx
  100eed:	66 83 3d 2c 00 00 02 	cmpw   $0x0,0x200002c
  100ef4:	00 
  100ef5:	75 14                	jne    100f0b <loadUMain+0x57>
  100ef7:	eb 49                	jmp    100f42 <loadUMain+0x8e>
  100ef9:	8d 76 00             	lea    0x0(%esi),%esi
  100efc:	43                   	inc    %ebx
  100efd:	83 c2 20             	add    $0x20,%edx
  100f00:	0f b7 05 2c 00 00 02 	movzwl 0x200002c,%eax
  100f07:	39 d8                	cmp    %ebx,%eax
  100f09:	7e 37                	jle    100f42 <loadUMain+0x8e>
  100f0b:	83 3a 01             	cmpl   $0x1,(%edx)
  100f0e:	75 ec                	jne    100efc <loadUMain+0x48>
  100f10:	8b 42 08             	mov    0x8(%edx),%eax
  100f13:	8b 7a 04             	mov    0x4(%edx),%edi
  100f16:	8d b7 00 00 00 02    	lea    0x2000000(%edi),%esi
  100f1c:	8b 4a 10             	mov    0x10(%edx),%ecx
  100f1f:	89 c7                	mov    %eax,%edi
  100f21:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100f23:	8b 72 10             	mov    0x10(%edx),%esi
  100f26:	8b 4a 14             	mov    0x14(%edx),%ecx
  100f29:	29 f1                	sub    %esi,%ecx
  100f2b:	01 c6                	add    %eax,%esi
  100f2d:	89 f7                	mov    %esi,%edi
  100f2f:	31 c0                	xor    %eax,%eax
  100f31:	f3 aa                	rep stos %al,%es:(%edi)
  100f33:	43                   	inc    %ebx
  100f34:	83 c2 20             	add    $0x20,%edx
  100f37:	0f b7 05 2c 00 00 02 	movzwl 0x200002c,%eax
  100f3e:	39 d8                	cmp    %ebx,%eax
  100f40:	7f c9                	jg     100f0b <loadUMain+0x57>
  100f42:	e8 41 00 00 00       	call   100f88 <initNewPCB>
  100f47:	e8 3c 00 00 00       	call   100f88 <initNewPCB>
  100f4c:	89 c2                	mov    %eax,%edx
  100f4e:	c1 e2 0a             	shl    $0xa,%edx
  100f51:	01 c2                	add    %eax,%edx
  100f53:	01 d2                	add    %edx,%edx
  100f55:	01 c2                	add    %eax,%edx
  100f57:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100f5a:	8d 04 c5 a0 2a 10 00 	lea    0x102aa0(,%eax,8),%eax
  100f61:	a3 a4 37 30 00       	mov    %eax,0x3037a4
  100f66:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  100f6d:	00 00 00 
  100f70:	83 ec 0c             	sub    $0xc,%esp
  100f73:	ff 35 18 00 00 02    	pushl  0x2000018
  100f79:	e8 5a 01 00 00       	call   1010d8 <enterProcessSpace>
  100f7e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f81:	5b                   	pop    %ebx
  100f82:	5e                   	pop    %esi
  100f83:	5f                   	pop    %edi
  100f84:	5d                   	pop    %ebp
  100f85:	c3                   	ret    
  100f86:	66 90                	xchg   %ax,%ax

00100f88 <initNewPCB>:
  100f88:	55                   	push   %ebp
  100f89:	89 e5                	mov    %esp,%ebp
  100f8b:	56                   	push   %esi
  100f8c:	53                   	push   %ebx
  100f8d:	8b 1d 1c 21 10 00    	mov    0x10211c,%ebx
  100f93:	85 db                	test   %ebx,%ebx
  100f95:	0f 84 15 01 00 00    	je     1010b0 <initNewPCB+0x128>
  100f9b:	83 3d f4 2a 11 00 03 	cmpl   $0x3,0x112af4
  100fa2:	0f 84 18 01 00 00    	je     1010c0 <initNewPCB+0x138>
  100fa8:	b9 5c 2b 12 00       	mov    $0x122b5c,%ecx
  100fad:	89 de                	mov    %ebx,%esi
  100faf:	31 d2                	xor    %edx,%edx
  100fb1:	eb 14                	jmp    100fc7 <initNewPCB+0x3f>
  100fb3:	90                   	nop
  100fb4:	81 c1 68 00 01 00    	add    $0x10068,%ecx
  100fba:	83 b9 98 ff fe ff 03 	cmpl   $0x3,-0x10068(%ecx)
  100fc1:	0f 84 cd 00 00 00    	je     101094 <initNewPCB+0x10c>
  100fc7:	42                   	inc    %edx
  100fc8:	89 d0                	mov    %edx,%eax
  100fca:	39 da                	cmp    %ebx,%edx
  100fcc:	75 e6                	jne    100fb4 <initNewPCB+0x2c>
  100fce:	39 da                	cmp    %ebx,%edx
  100fd0:	0f 84 c8 00 00 00    	je     10109e <initNewPCB+0x116>
  100fd6:	8d 8e 00 02 00 00    	lea    0x200(%esi),%ecx
  100fdc:	89 f2                	mov    %esi,%edx
  100fde:	c1 e2 0a             	shl    $0xa,%edx
  100fe1:	01 f2                	add    %esi,%edx
  100fe3:	01 d2                	add    %edx,%edx
  100fe5:	01 f2                	add    %esi,%edx
  100fe7:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100fea:	8d 14 d5 a0 2a 10 00 	lea    0x102aa0(,%edx,8),%edx
  100ff1:	c7 82 54 00 01 00 01 	movl   $0x1,0x10054(%edx)
  100ff8:	00 00 00 
  100ffb:	c7 82 5c 00 01 00 00 	movl   $0x0,0x1005c(%edx)
  101002:	00 00 00 
  101005:	c7 82 58 00 01 00 00 	movl   $0x0,0x10058(%edx)
  10100c:	00 00 00 
  10100f:	89 8a 60 00 01 00    	mov    %ecx,0x10060(%edx)
  101015:	c7 82 4c 00 01 00 00 	movl   $0x10000,0x1004c(%edx)
  10101c:	00 01 00 
  10101f:	c7 82 50 00 01 00 00 	movl   $0x10000,0x10050(%edx)
  101026:	00 01 00 
  101029:	c7 82 64 00 01 00 00 	movl   $0x0,0x10064(%edx)
  101030:	00 00 00 
  101033:	c7 82 00 00 01 00 23 	movl   $0x23,0x10000(%edx)
  10103a:	00 00 00 
  10103d:	c7 82 04 00 01 00 23 	movl   $0x23,0x10004(%edx)
  101044:	00 00 00 
  101047:	c7 82 08 00 01 00 23 	movl   $0x23,0x10008(%edx)
  10104e:	00 00 00 
  101051:	c7 82 0c 00 01 00 23 	movl   $0x23,0x1000c(%edx)
  101058:	00 00 00 
  10105b:	c7 82 38 00 01 00 00 	movl   $0x0,0x10038(%edx)
  101062:	00 00 00 
  101065:	c7 82 3c 00 01 00 1b 	movl   $0x1b,0x1003c(%edx)
  10106c:	00 00 00 
  10106f:	c7 82 40 00 01 00 00 	movl   $0x0,0x10040(%edx)
  101076:	00 00 00 
  101079:	c7 82 44 00 01 00 00 	movl   $0x100000,0x10044(%edx)
  101080:	00 10 00 
  101083:	c7 82 48 00 01 00 23 	movl   $0x23,0x10048(%edx)
  10108a:	00 00 00 
  10108d:	5b                   	pop    %ebx
  10108e:	5e                   	pop    %esi
  10108f:	5d                   	pop    %ebp
  101090:	c3                   	ret    
  101091:	8d 76 00             	lea    0x0(%esi),%esi
  101094:	89 d6                	mov    %edx,%esi
  101096:	39 da                	cmp    %ebx,%edx
  101098:	0f 85 38 ff ff ff    	jne    100fd6 <initNewPCB+0x4e>
  10109e:	42                   	inc    %edx
  10109f:	8d 8e 00 02 00 00    	lea    0x200(%esi),%ecx
  1010a5:	89 15 1c 21 10 00    	mov    %edx,0x10211c
  1010ab:	e9 2c ff ff ff       	jmp    100fdc <initNewPCB+0x54>
  1010b0:	31 c0                	xor    %eax,%eax
  1010b2:	b9 00 02 00 00       	mov    $0x200,%ecx
  1010b7:	ba 01 00 00 00       	mov    $0x1,%edx
  1010bc:	31 f6                	xor    %esi,%esi
  1010be:	eb e5                	jmp    1010a5 <initNewPCB+0x11d>
  1010c0:	b9 00 02 00 00       	mov    $0x200,%ecx
  1010c5:	31 f6                	xor    %esi,%esi
  1010c7:	31 c0                	xor    %eax,%eax
  1010c9:	e9 0e ff ff ff       	jmp    100fdc <initNewPCB+0x54>
  1010ce:	66 90                	xchg   %ax,%ax

001010d0 <idle>:
  1010d0:	55                   	push   %ebp
  1010d1:	89 e5                	mov    %esp,%ebp
  1010d3:	fb                   	sti    
  1010d4:	f4                   	hlt    
  1010d5:	eb fd                	jmp    1010d4 <idle+0x4>
  1010d7:	90                   	nop

001010d8 <enterProcessSpace>:
  1010d8:	55                   	push   %ebp
  1010d9:	89 e5                	mov    %esp,%ebp
  1010db:	57                   	push   %edi
  1010dc:	56                   	push   %esi
  1010dd:	53                   	push   %ebx
  1010de:	8b 75 08             	mov    0x8(%ebp),%esi
  1010e1:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  1010e6:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
  1010eb:	c1 f8 03             	sar    $0x3,%eax
  1010ee:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  1010f1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1010f4:	01 d2                	add    %edx,%edx
  1010f6:	01 c2                	add    %eax,%edx
  1010f8:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1010fb:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1010fe:	c1 e2 0b             	shl    $0xb,%edx
  101101:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  101104:	89 ca                	mov    %ecx,%edx
  101106:	c1 e2 04             	shl    $0x4,%edx
  101109:	01 ca                	add    %ecx,%edx
  10110b:	01 d2                	add    %edx,%edx
  10110d:	01 d0                	add    %edx,%eax
  10110f:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101112:	f7 d8                	neg    %eax
  101114:	83 c0 04             	add    $0x4,%eax
  101117:	c1 e0 14             	shl    $0x14,%eax
  10111a:	b9 00 00 02 00       	mov    $0x20000,%ecx
  10111f:	89 c7                	mov    %eax,%edi
  101121:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101123:	8b 15 a4 37 30 00    	mov    0x3037a4,%edx
  101129:	89 d0                	mov    %edx,%eax
  10112b:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
  101130:	c1 f8 03             	sar    $0x3,%eax
  101133:	89 c1                	mov    %eax,%ecx
  101135:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101138:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  10113b:	01 c0                	add    %eax,%eax
  10113d:	01 c8                	add    %ecx,%eax
  10113f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101142:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101145:	c1 e0 0b             	shl    $0xb,%eax
  101148:	01 c8                	add    %ecx,%eax
  10114a:	89 c6                	mov    %eax,%esi
  10114c:	c1 e6 04             	shl    $0x4,%esi
  10114f:	01 f0                	add    %esi,%eax
  101151:	01 c0                	add    %eax,%eax
  101153:	01 c8                	add    %ecx,%eax
  101155:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101158:	f7 d8                	neg    %eax
  10115a:	83 c0 04             	add    $0x4,%eax
  10115d:	c1 e0 14             	shl    $0x14,%eax
  101160:	89 c3                	mov    %eax,%ebx
  101162:	c1 eb 10             	shr    $0x10,%ebx
  101165:	c1 e8 18             	shr    $0x18,%eax
  101168:	b9 e0 29 10 00       	mov    $0x1029e0,%ecx
  10116d:	66 c7 05 f8 29 10 00 	movw   $0x100,0x1029f8
  101174:	00 01 
  101176:	66 c7 05 fa 29 10 00 	movw   $0x0,0x1029fa
  10117d:	00 00 
  10117f:	88 1d fc 29 10 00    	mov    %bl,0x1029fc
  101185:	c6 05 fd 29 10 00 fa 	movb   $0xfa,0x1029fd
  10118c:	c6 05 fe 29 10 00 c0 	movb   $0xc0,0x1029fe
  101193:	a2 ff 29 10 00       	mov    %al,0x1029ff
  101198:	66 c7 05 00 2a 10 00 	movw   $0x100,0x102a00
  10119f:	00 01 
  1011a1:	66 c7 05 02 2a 10 00 	movw   $0x0,0x102a02
  1011a8:	00 00 
  1011aa:	88 1d 04 2a 10 00    	mov    %bl,0x102a04
  1011b0:	c6 05 05 2a 10 00 f2 	movb   $0xf2,0x102a05
  1011b7:	c6 05 06 2a 10 00 c0 	movb   $0xc0,0x102a06
  1011be:	a2 07 2a 10 00       	mov    %al,0x102a07
  1011c3:	66 c7 05 10 2a 10 00 	movw   $0x10,0x102a10
  1011ca:	10 00 
  1011cc:	66 89 15 12 2a 10 00 	mov    %dx,0x102a12
  1011d3:	89 d0                	mov    %edx,%eax
  1011d5:	c1 e8 10             	shr    $0x10,%eax
  1011d8:	a2 14 2a 10 00       	mov    %al,0x102a14
  1011dd:	c6 05 15 2a 10 00 92 	movb   $0x92,0x102a15
  1011e4:	c6 05 16 2a 10 00 c0 	movb   $0xc0,0x102a16
  1011eb:	89 d0                	mov    %edx,%eax
  1011ed:	c1 e8 18             	shr    $0x18,%eax
  1011f0:	a2 17 2a 10 00       	mov    %al,0x102a17
  1011f5:	66 c7 05 20 21 10 00 	movw   $0x37,0x102120
  1011fc:	37 00 
  1011fe:	66 89 0d 22 21 10 00 	mov    %cx,0x102122
  101205:	c1 e9 10             	shr    $0x10,%ecx
  101208:	66 89 0d 24 21 10 00 	mov    %cx,0x102124
  10120f:	b8 20 21 10 00       	mov    $0x102120,%eax
  101214:	0f 01 10             	lgdtl  (%eax)
  101217:	8d 82 44 00 01 00    	lea    0x10044(%edx),%eax
  10121d:	89 c4                	mov    %eax,%esp
  10121f:	9c                   	pushf  
  101220:	81 c2 38 00 01 00    	add    $0x10038,%edx
  101226:	89 d4                	mov    %edx,%esp
  101228:	b8 23 00 00 00       	mov    $0x23,%eax
  10122d:	89 c0                	mov    %eax,%eax
  10122f:	8e d8                	mov    %eax,%ds
  101231:	8e c0                	mov    %eax,%es
  101233:	8e e0                	mov    %eax,%fs
  101235:	8e e8                	mov    %eax,%gs
  101237:	cf                   	iret   
  101238:	5b                   	pop    %ebx
  101239:	5e                   	pop    %esi
  10123a:	5f                   	pop    %edi
  10123b:	5d                   	pop    %ebp
  10123c:	c3                   	ret    
  10123d:	8d 76 00             	lea    0x0(%esi),%esi

00101240 <addToBlocked>:
  101240:	55                   	push   %ebp
  101241:	89 e5                	mov    %esp,%ebp
  101243:	8b 45 08             	mov    0x8(%ebp),%eax
  101246:	8b 15 a0 37 30 00    	mov    0x3037a0,%edx
  10124c:	85 d2                	test   %edx,%edx
  10124e:	74 14                	je     101264 <addToBlocked+0x24>
  101250:	8b 15 b0 37 30 00    	mov    0x3037b0,%edx
  101256:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  10125c:	a3 b0 37 30 00       	mov    %eax,0x3037b0
  101261:	5d                   	pop    %ebp
  101262:	c3                   	ret    
  101263:	90                   	nop
  101264:	a3 a0 37 30 00       	mov    %eax,0x3037a0
  101269:	a3 b0 37 30 00       	mov    %eax,0x3037b0
  10126e:	5d                   	pop    %ebp
  10126f:	c3                   	ret    

00101270 <addToRunnable>:
  101270:	55                   	push   %ebp
  101271:	89 e5                	mov    %esp,%ebp
  101273:	8b 45 08             	mov    0x8(%ebp),%eax
  101276:	8b 15 a8 37 30 00    	mov    0x3037a8,%edx
  10127c:	85 d2                	test   %edx,%edx
  10127e:	74 14                	je     101294 <addToRunnable+0x24>
  101280:	8b 15 ac 37 30 00    	mov    0x3037ac,%edx
  101286:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  10128c:	a3 ac 37 30 00       	mov    %eax,0x3037ac
  101291:	5d                   	pop    %ebp
  101292:	c3                   	ret    
  101293:	90                   	nop
  101294:	a3 a8 37 30 00       	mov    %eax,0x3037a8
  101299:	a3 ac 37 30 00       	mov    %eax,0x3037ac
  10129e:	5d                   	pop    %ebp
  10129f:	c3                   	ret    

001012a0 <updateTime>:
  1012a0:	55                   	push   %ebp
  1012a1:	89 e5                	mov    %esp,%ebp
  1012a3:	a1 a4 37 30 00       	mov    0x3037a4,%eax
  1012a8:	83 b8 54 00 01 00 02 	cmpl   $0x2,0x10054(%eax)
  1012af:	74 06                	je     1012b7 <updateTime+0x17>
  1012b1:	ff 80 58 00 01 00    	incl   0x10058(%eax)
  1012b7:	a1 a0 37 30 00       	mov    0x3037a0,%eax
  1012bc:	85 c0                	test   %eax,%eax
  1012be:	74 3b                	je     1012fb <updateTime+0x5b>
  1012c0:	8b 88 5c 00 01 00    	mov    0x1005c(%eax),%ecx
  1012c6:	8d 51 ff             	lea    -0x1(%ecx),%edx
  1012c9:	89 90 5c 00 01 00    	mov    %edx,0x1005c(%eax)
  1012cf:	85 d2                	test   %edx,%edx
  1012d1:	75 1e                	jne    1012f1 <updateTime+0x51>
  1012d3:	c7 80 54 00 01 00 01 	movl   $0x1,0x10054(%eax)
  1012da:	00 00 00 
  1012dd:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  1012e4:	00 00 00 
  1012e7:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  1012ee:	00 00 00 
  1012f1:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1012f7:	85 c0                	test   %eax,%eax
  1012f9:	75 c5                	jne    1012c0 <updateTime+0x20>
  1012fb:	5d                   	pop    %ebp
  1012fc:	c3                   	ret    
  1012fd:	8d 76 00             	lea    0x0(%esi),%esi

00101300 <checkRunnableList>:
  101300:	55                   	push   %ebp
  101301:	89 e5                	mov    %esp,%ebp
  101303:	57                   	push   %edi
  101304:	56                   	push   %esi
  101305:	53                   	push   %ebx
  101306:	52                   	push   %edx
  101307:	a1 a8 37 30 00       	mov    0x3037a8,%eax
  10130c:	8b 3d a0 37 30 00    	mov    0x3037a0,%edi
  101312:	8b 35 b0 37 30 00    	mov    0x3037b0,%esi
  101318:	31 db                	xor    %ebx,%ebx
  10131a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10131e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101322:	eb 0c                	jmp    101330 <checkRunnableList+0x30>
  101324:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  10132a:	b3 01                	mov    $0x1,%bl
  10132c:	85 c0                	test   %eax,%eax
  10132e:	74 37                	je     101367 <checkRunnableList+0x67>
  101330:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  101336:	8d 4a fe             	lea    -0x2(%edx),%ecx
  101339:	83 f9 01             	cmp    $0x1,%ecx
  10133c:	0f 87 be 00 00 00    	ja     101400 <checkRunnableList+0x100>
  101342:	83 fa 02             	cmp    $0x2,%edx
  101345:	75 dd                	jne    101324 <checkRunnableList+0x24>
  101347:	85 ff                	test   %edi,%edi
  101349:	0f 84 e9 00 00 00    	je     101438 <checkRunnableList+0x138>
  10134f:	89 86 64 00 01 00    	mov    %eax,0x10064(%esi)
  101355:	89 c6                	mov    %eax,%esi
  101357:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10135b:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  101361:	b3 01                	mov    $0x1,%bl
  101363:	85 c0                	test   %eax,%eax
  101365:	75 c9                	jne    101330 <checkRunnableList+0x30>
  101367:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  10136b:	0f 85 fc 00 00 00    	jne    10146d <checkRunnableList+0x16d>
  101371:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  101375:	0f 85 fd 00 00 00    	jne    101478 <checkRunnableList+0x178>
  10137b:	c7 05 a8 37 30 00 00 	movl   $0x0,0x3037a8
  101382:	00 00 00 
  101385:	c7 05 ac 37 30 00 00 	movl   $0x0,0x3037ac
  10138c:	00 00 00 
  10138f:	31 c0                	xor    %eax,%eax
  101391:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  101397:	85 d2                	test   %edx,%edx
  101399:	74 5e                	je     1013f9 <checkRunnableList+0xf9>
  10139b:	8b 3d a0 37 30 00    	mov    0x3037a0,%edi
  1013a1:	8b 35 b0 37 30 00    	mov    0x3037b0,%esi
  1013a7:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1013ab:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1013af:	eb 0f                	jmp    1013c0 <checkRunnableList+0xc0>
  1013b1:	8d 76 00             	lea    0x0(%esi),%esi
  1013b4:	89 d0                	mov    %edx,%eax
  1013b6:	8b 92 64 00 01 00    	mov    0x10064(%edx),%edx
  1013bc:	85 d2                	test   %edx,%edx
  1013be:	74 29                	je     1013e9 <checkRunnableList+0xe9>
  1013c0:	8b 8a 54 00 01 00    	mov    0x10054(%edx),%ecx
  1013c6:	8d 59 fe             	lea    -0x2(%ecx),%ebx
  1013c9:	83 fb 01             	cmp    $0x1,%ebx
  1013cc:	77 e6                	ja     1013b4 <checkRunnableList+0xb4>
  1013ce:	83 f9 02             	cmp    $0x2,%ecx
  1013d1:	74 51                	je     101424 <checkRunnableList+0x124>
  1013d3:	8b 8a 64 00 01 00    	mov    0x10064(%edx),%ecx
  1013d9:	89 88 64 00 01 00    	mov    %ecx,0x10064(%eax)
  1013df:	8b 92 64 00 01 00    	mov    0x10064(%edx),%edx
  1013e5:	85 d2                	test   %edx,%edx
  1013e7:	75 d7                	jne    1013c0 <checkRunnableList+0xc0>
  1013e9:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  1013ed:	0f 85 90 00 00 00    	jne    101483 <checkRunnableList+0x183>
  1013f3:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  1013f7:	75 64                	jne    10145d <checkRunnableList+0x15d>
  1013f9:	58                   	pop    %eax
  1013fa:	5b                   	pop    %ebx
  1013fb:	5e                   	pop    %esi
  1013fc:	5f                   	pop    %edi
  1013fd:	5d                   	pop    %ebp
  1013fe:	c3                   	ret    
  1013ff:	90                   	nop
  101400:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  101404:	75 5f                	jne    101465 <checkRunnableList+0x165>
  101406:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  10140a:	74 06                	je     101412 <checkRunnableList+0x112>
  10140c:	89 35 b0 37 30 00    	mov    %esi,0x3037b0
  101412:	84 db                	test   %bl,%bl
  101414:	0f 84 77 ff ff ff    	je     101391 <checkRunnableList+0x91>
  10141a:	a3 a8 37 30 00       	mov    %eax,0x3037a8
  10141f:	e9 6d ff ff ff       	jmp    101391 <checkRunnableList+0x91>
  101424:	85 ff                	test   %edi,%edi
  101426:	74 24                	je     10144c <checkRunnableList+0x14c>
  101428:	89 96 64 00 01 00    	mov    %edx,0x10064(%esi)
  10142e:	89 d6                	mov    %edx,%esi
  101430:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101434:	eb 9d                	jmp    1013d3 <checkRunnableList+0xd3>
  101436:	66 90                	xchg   %ax,%ax
  101438:	89 c6                	mov    %eax,%esi
  10143a:	89 c7                	mov    %eax,%edi
  10143c:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101440:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101444:	e9 db fe ff ff       	jmp    101324 <checkRunnableList+0x24>
  101449:	8d 76 00             	lea    0x0(%esi),%esi
  10144c:	89 d6                	mov    %edx,%esi
  10144e:	89 d7                	mov    %edx,%edi
  101450:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101454:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101458:	e9 76 ff ff ff       	jmp    1013d3 <checkRunnableList+0xd3>
  10145d:	89 35 b0 37 30 00    	mov    %esi,0x3037b0
  101463:	eb 94                	jmp    1013f9 <checkRunnableList+0xf9>
  101465:	89 3d a0 37 30 00    	mov    %edi,0x3037a0
  10146b:	eb 99                	jmp    101406 <checkRunnableList+0x106>
  10146d:	89 3d a0 37 30 00    	mov    %edi,0x3037a0
  101473:	e9 f9 fe ff ff       	jmp    101371 <checkRunnableList+0x71>
  101478:	89 35 b0 37 30 00    	mov    %esi,0x3037b0
  10147e:	e9 f8 fe ff ff       	jmp    10137b <checkRunnableList+0x7b>
  101483:	89 3d a0 37 30 00    	mov    %edi,0x3037a0
  101489:	e9 65 ff ff ff       	jmp    1013f3 <checkRunnableList+0xf3>
  10148e:	66 90                	xchg   %ax,%ax

00101490 <checkBlockedList>:
  101490:	55                   	push   %ebp
  101491:	89 e5                	mov    %esp,%ebp
  101493:	56                   	push   %esi
  101494:	53                   	push   %ebx
  101495:	a1 a0 37 30 00       	mov    0x3037a0,%eax
  10149a:	eb 18                	jmp    1014b4 <checkBlockedList+0x24>
  10149c:	83 fa 03             	cmp    $0x3,%edx
  10149f:	0f 85 d3 00 00 00    	jne    101578 <checkBlockedList+0xe8>
  1014a5:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1014ab:	a3 a0 37 30 00       	mov    %eax,0x3037a0
  1014b0:	85 c0                	test   %eax,%eax
  1014b2:	74 50                	je     101504 <checkBlockedList+0x74>
  1014b4:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  1014ba:	83 fa 01             	cmp    $0x1,%edx
  1014bd:	75 dd                	jne    10149c <checkBlockedList+0xc>
  1014bf:	83 ec 0c             	sub    $0xc,%esp
  1014c2:	68 bb 18 10 00       	push   $0x1018bb
  1014c7:	e8 d8 f5 ff ff       	call   100aa4 <printf>
  1014cc:	a1 a0 37 30 00       	mov    0x3037a0,%eax
  1014d1:	83 c4 10             	add    $0x10,%esp
  1014d4:	8b 15 a8 37 30 00    	mov    0x3037a8,%edx
  1014da:	85 d2                	test   %edx,%edx
  1014dc:	0f 84 9a 00 00 00    	je     10157c <checkBlockedList+0xec>
  1014e2:	8b 15 ac 37 30 00    	mov    0x3037ac,%edx
  1014e8:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  1014ee:	a3 ac 37 30 00       	mov    %eax,0x3037ac
  1014f3:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1014f9:	a3 a0 37 30 00       	mov    %eax,0x3037a0
  1014fe:	85 c0                	test   %eax,%eax
  101500:	75 b2                	jne    1014b4 <checkBlockedList+0x24>
  101502:	66 90                	xchg   %ax,%ax
  101504:	c7 05 b0 37 30 00 00 	movl   $0x0,0x3037b0
  10150b:	00 00 00 
  10150e:	31 db                	xor    %ebx,%ebx
  101510:	8b b3 64 00 01 00    	mov    0x10064(%ebx),%esi
  101516:	66 90                	xchg   %ax,%ax
  101518:	85 f6                	test   %esi,%esi
  10151a:	74 1c                	je     101538 <checkBlockedList+0xa8>
  10151c:	8b 86 54 00 01 00    	mov    0x10054(%esi),%eax
  101522:	83 f8 01             	cmp    $0x1,%eax
  101525:	74 19                	je     101540 <checkBlockedList+0xb0>
  101527:	83 f8 03             	cmp    $0x3,%eax
  10152a:	74 3e                	je     10156a <checkBlockedList+0xda>
  10152c:	89 f3                	mov    %esi,%ebx
  10152e:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101534:	85 f6                	test   %esi,%esi
  101536:	75 e4                	jne    10151c <checkBlockedList+0x8c>
  101538:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10153b:	5b                   	pop    %ebx
  10153c:	5e                   	pop    %esi
  10153d:	5d                   	pop    %ebp
  10153e:	c3                   	ret    
  10153f:	90                   	nop
  101540:	83 ec 0c             	sub    $0xc,%esp
  101543:	68 bb 18 10 00       	push   $0x1018bb
  101548:	e8 57 f5 ff ff       	call   100aa4 <printf>
  10154d:	83 c4 10             	add    $0x10,%esp
  101550:	a1 a8 37 30 00       	mov    0x3037a8,%eax
  101555:	85 c0                	test   %eax,%eax
  101557:	74 32                	je     10158b <checkBlockedList+0xfb>
  101559:	a1 ac 37 30 00       	mov    0x3037ac,%eax
  10155e:	89 b0 64 00 01 00    	mov    %esi,0x10064(%eax)
  101564:	89 35 ac 37 30 00    	mov    %esi,0x3037ac
  10156a:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101570:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  101576:	eb a0                	jmp    101518 <checkBlockedList+0x88>
  101578:	89 c3                	mov    %eax,%ebx
  10157a:	eb 94                	jmp    101510 <checkBlockedList+0x80>
  10157c:	a3 a8 37 30 00       	mov    %eax,0x3037a8
  101581:	a3 ac 37 30 00       	mov    %eax,0x3037ac
  101586:	e9 1a ff ff ff       	jmp    1014a5 <checkBlockedList+0x15>
  10158b:	89 35 a8 37 30 00    	mov    %esi,0x3037a8
  101591:	89 35 ac 37 30 00    	mov    %esi,0x3037ac
  101597:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  10159d:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  1015a3:	e9 70 ff ff ff       	jmp    101518 <checkBlockedList+0x88>

001015a8 <schedule>:
  1015a8:	a1 a8 37 30 00       	mov    0x3037a8,%eax
  1015ad:	85 c0                	test   %eax,%eax
  1015af:	74 4a                	je     1015fb <schedule+0x53>
  1015b1:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  1015b8:	00 00 00 
  1015bb:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  1015c2:	00 00 00 
  1015c5:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  1015cc:	00 00 00 
  1015cf:	a3 a4 37 30 00       	mov    %eax,0x3037a4
  1015d4:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  1015da:	89 15 a8 37 30 00    	mov    %edx,0x3037a8
  1015e0:	c7 80 64 00 01 00 00 	movl   $0x0,0x10064(%eax)
  1015e7:	00 00 00 
  1015ea:	85 d2                	test   %edx,%edx
  1015ec:	74 02                	je     1015f0 <schedule+0x48>
  1015ee:	c3                   	ret    
  1015ef:	90                   	nop
  1015f0:	c7 05 ac 37 30 00 00 	movl   $0x0,0x3037ac
  1015f7:	00 00 00 
  1015fa:	c3                   	ret    
  1015fb:	55                   	push   %ebp
  1015fc:	89 e5                	mov    %esp,%ebp
  1015fe:	e8 cd fa ff ff       	call   1010d0 <idle>
  101603:	90                   	nop

00101604 <switchToRunning>:
  101604:	55                   	push   %ebp
  101605:	89 e5                	mov    %esp,%ebp
  101607:	53                   	push   %ebx
  101608:	83 ec 10             	sub    $0x10,%esp
  10160b:	68 c1 18 10 00       	push   $0x1018c1
  101610:	e8 8f f4 ff ff       	call   100aa4 <printf>
  101615:	c7 05 28 2a 10 00 30 	movl   $0x30,0x102a28
  10161c:	00 00 00 
  10161f:	8b 15 a4 37 30 00    	mov    0x3037a4,%edx
  101625:	8b 82 4c 00 01 00    	mov    0x1004c(%edx),%eax
  10162b:	a3 24 2a 10 00       	mov    %eax,0x102a24
  101630:	89 d0                	mov    %edx,%eax
  101632:	2d a0 2a 10 00       	sub    $0x102aa0,%eax
  101637:	c1 f8 03             	sar    $0x3,%eax
  10163a:	8d 0c c0             	lea    (%eax,%eax,8),%ecx
  10163d:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  101640:	01 c9                	add    %ecx,%ecx
  101642:	01 c1                	add    %eax,%ecx
  101644:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  101647:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  10164a:	c1 e1 0b             	shl    $0xb,%ecx
  10164d:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
  101650:	89 d9                	mov    %ebx,%ecx
  101652:	c1 e1 04             	shl    $0x4,%ecx
  101655:	01 d9                	add    %ebx,%ecx
  101657:	01 c9                	add    %ecx,%ecx
  101659:	01 c8                	add    %ecx,%eax
  10165b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  10165e:	f7 d8                	neg    %eax
  101660:	83 c0 04             	add    $0x4,%eax
  101663:	c1 e0 14             	shl    $0x14,%eax
  101666:	89 c3                	mov    %eax,%ebx
  101668:	c1 eb 10             	shr    $0x10,%ebx
  10166b:	c1 e8 18             	shr    $0x18,%eax
  10166e:	b9 e0 29 10 00       	mov    $0x1029e0,%ecx
  101673:	66 c7 05 f8 29 10 00 	movw   $0x100,0x1029f8
  10167a:	00 01 
  10167c:	66 c7 05 fa 29 10 00 	movw   $0x0,0x1029fa
  101683:	00 00 
  101685:	88 1d fc 29 10 00    	mov    %bl,0x1029fc
  10168b:	c6 05 fd 29 10 00 fa 	movb   $0xfa,0x1029fd
  101692:	c6 05 fe 29 10 00 c0 	movb   $0xc0,0x1029fe
  101699:	a2 ff 29 10 00       	mov    %al,0x1029ff
  10169e:	66 c7 05 00 2a 10 00 	movw   $0x100,0x102a00
  1016a5:	00 01 
  1016a7:	66 c7 05 02 2a 10 00 	movw   $0x0,0x102a02
  1016ae:	00 00 
  1016b0:	88 1d 04 2a 10 00    	mov    %bl,0x102a04
  1016b6:	c6 05 05 2a 10 00 f2 	movb   $0xf2,0x102a05
  1016bd:	c6 05 06 2a 10 00 c0 	movb   $0xc0,0x102a06
  1016c4:	a2 07 2a 10 00       	mov    %al,0x102a07
  1016c9:	66 c7 05 10 2a 10 00 	movw   $0x10,0x102a10
  1016d0:	10 00 
  1016d2:	66 89 15 12 2a 10 00 	mov    %dx,0x102a12
  1016d9:	89 d0                	mov    %edx,%eax
  1016db:	c1 e8 10             	shr    $0x10,%eax
  1016de:	a2 14 2a 10 00       	mov    %al,0x102a14
  1016e3:	c6 05 15 2a 10 00 92 	movb   $0x92,0x102a15
  1016ea:	c6 05 16 2a 10 00 c0 	movb   $0xc0,0x102a16
  1016f1:	c1 ea 18             	shr    $0x18,%edx
  1016f4:	88 15 17 2a 10 00    	mov    %dl,0x102a17
  1016fa:	66 c7 05 20 21 10 00 	movw   $0x37,0x102120
  101701:	37 00 
  101703:	66 89 0d 22 21 10 00 	mov    %cx,0x102122
  10170a:	c1 e9 10             	shr    $0x10,%ecx
  10170d:	66 89 0d 24 21 10 00 	mov    %cx,0x102124
  101714:	b8 20 21 10 00       	mov    $0x102120,%eax
  101719:	0f 01 10             	lgdtl  (%eax)
  10171c:	b8 30 00 00 00       	mov    $0x30,%eax
  101721:	8e d0                	mov    %eax,%ss
  101723:	b8 44 00 01 00       	mov    $0x10044,%eax
  101728:	89 c4                	mov    %eax,%esp
  10172a:	9c                   	pushf  
  10172b:	b8 00 00 01 00       	mov    $0x10000,%eax
  101730:	89 c4                	mov    %eax,%esp
  101732:	0f a9                	pop    %gs
  101734:	0f a1                	pop    %fs
  101736:	07                   	pop    %es
  101737:	1f                   	pop    %ds
  101738:	61                   	popa   
  101739:	83 c4 08             	add    $0x8,%esp
  10173c:	cf                   	iret   
  10173d:	83 c4 10             	add    $0x10,%esp
  101740:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101743:	c9                   	leave  
  101744:	c3                   	ret    
  101745:	66 90                	xchg   %ax,%ax
  101747:	90                   	nop

00101748 <abort>:
  101748:	55                   	push   %ebp
  101749:	89 e5                	mov    %esp,%ebp
  10174b:	57                   	push   %edi
  10174c:	56                   	push   %esi
  10174d:	53                   	push   %ebx
  10174e:	83 ec 1c             	sub    $0x1c,%esp
  101751:	8b 55 08             	mov    0x8(%ebp),%edx
  101754:	fa                   	cli    
  101755:	8a 02                	mov    (%edx),%al
  101757:	b9 12 20 10 00       	mov    $0x102012,%ecx
  10175c:	84 c0                	test   %al,%al
  10175e:	74 0b                	je     10176b <abort+0x23>
  101760:	41                   	inc    %ecx
  101761:	42                   	inc    %edx
  101762:	88 41 ff             	mov    %al,-0x1(%ecx)
  101765:	8a 02                	mov    (%edx),%al
  101767:	84 c0                	test   %al,%al
  101769:	75 f5                	jne    101760 <abort+0x18>
  10176b:	c6 01 3a             	movb   $0x3a,(%ecx)
  10176e:	bb 45 21 10 00       	mov    $0x102145,%ebx
  101773:	be 0a 00 00 00       	mov    $0xa,%esi
  101778:	bf 67 66 66 66       	mov    $0x66666667,%edi
  10177d:	4b                   	dec    %ebx
  10177e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101781:	99                   	cltd   
  101782:	f7 fe                	idiv   %esi
  101784:	8d 42 30             	lea    0x30(%edx),%eax
  101787:	88 45 e7             	mov    %al,-0x19(%ebp)
  10178a:	88 03                	mov    %al,(%ebx)
  10178c:	89 f8                	mov    %edi,%eax
  10178e:	f7 6d 0c             	imull  0xc(%ebp)
  101791:	c1 fa 02             	sar    $0x2,%edx
  101794:	8b 45 0c             	mov    0xc(%ebp),%eax
  101797:	c1 f8 1f             	sar    $0x1f,%eax
  10179a:	29 c2                	sub    %eax,%edx
  10179c:	89 55 0c             	mov    %edx,0xc(%ebp)
  10179f:	75 dc                	jne    10177d <abort+0x35>
  1017a1:	41                   	inc    %ecx
  1017a2:	41                   	inc    %ecx
  1017a3:	43                   	inc    %ebx
  1017a4:	8a 45 e7             	mov    -0x19(%ebp),%al
  1017a7:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017aa:	8a 03                	mov    (%ebx),%al
  1017ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017af:	84 c0                	test   %al,%al
  1017b1:	75 ef                	jne    1017a2 <abort+0x5a>
  1017b3:	c6 01 0a             	movb   $0xa,(%ecx)
  1017b6:	0f be 05 00 20 10 00 	movsbl 0x102000,%eax
  1017bd:	84 c0                	test   %al,%al
  1017bf:	74 1b                	je     1017dc <abort+0x94>
  1017c1:	bb 00 20 10 00       	mov    $0x102000,%ebx
  1017c6:	83 ec 0c             	sub    $0xc,%esp
  1017c9:	50                   	push   %eax
  1017ca:	e8 81 f4 ff ff       	call   100c50 <putChar>
  1017cf:	43                   	inc    %ebx
  1017d0:	0f be 03             	movsbl (%ebx),%eax
  1017d3:	83 c4 10             	add    $0x10,%esp
  1017d6:	84 c0                	test   %al,%al
  1017d8:	75 ec                	jne    1017c6 <abort+0x7e>
  1017da:	66 90                	xchg   %ax,%ax
  1017dc:	f4                   	hlt    
  1017dd:	eb fd                	jmp    1017dc <abort+0x94>

001017df <irqEmpty>:
  1017df:	6a 00                	push   $0x0
  1017e1:	6a ff                	push   $0xffffffff
  1017e3:	eb 13                	jmp    1017f8 <asmDoIrq>

001017e5 <irqGProtectFault>:
  1017e5:	6a 0d                	push   $0xd
  1017e7:	eb 0f                	jmp    1017f8 <asmDoIrq>

001017e9 <irqSyscall>:
  1017e9:	6a 00                	push   $0x0
  1017eb:	68 80 00 00 00       	push   $0x80
  1017f0:	eb 06                	jmp    1017f8 <asmDoIrq>

001017f2 <irqTimer>:
  1017f2:	6a 00                	push   $0x0
  1017f4:	6a 20                	push   $0x20
  1017f6:	eb 00                	jmp    1017f8 <asmDoIrq>

001017f8 <asmDoIrq>:
  1017f8:	60                   	pusha  
  1017f9:	1e                   	push   %ds
  1017fa:	06                   	push   %es
  1017fb:	0f a0                	push   %fs
  1017fd:	0f a8                	push   %gs
  1017ff:	54                   	push   %esp
  101800:	e8 2b ee ff ff       	call   100630 <irqHandle>
  101805:	83 c4 04             	add    $0x4,%esp
  101808:	0f a9                	pop    %gs
  10180a:	0f a1                	pop    %fs
  10180c:	07                   	pop    %es
  10180d:	1f                   	pop    %ds
  10180e:	61                   	popa   
  10180f:	83 c4 04             	add    $0x4,%esp
  101812:	83 c4 04             	add    $0x4,%esp
  101815:	cf                   	iret   

Disassembly of section .rodata:

00101818 <.rodata>:
  101818:	47                   	inc    %edi
  101819:	50                   	push   %eax
  10181a:	72 6f                	jb     10188b <asmDoIrq+0x93>
  10181c:	74 65                	je     101883 <asmDoIrq+0x8b>
  10181e:	78 74                	js     101894 <asmDoIrq+0x9c>
  101820:	46                   	inc    %esi
  101821:	61                   	popa   
  101822:	75 6c                	jne    101890 <asmDoIrq+0x98>
  101824:	74 48                	je     10186e <asmDoIrq+0x76>
  101826:	61                   	popa   
  101827:	6e                   	outsb  %ds:(%esi),(%dx)
  101828:	64 6c                	fs insb (%dx),%es:(%edi)
  10182a:	65 0a 00             	or     %gs:(%eax),%al
  10182d:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  101831:	65 6c                	gs insb (%dx),%es:(%edi)
  101833:	2f                   	das    
  101834:	69 72 71 48 61 6e 64 	imul   $0x646e6148,0x71(%edx),%esi
  10183b:	6c                   	insb   (%dx),%es:(%edi)
  10183c:	65 2e 63 00          	gs arpl %ax,%cs:(%eax)
  101840:	2d 00 66 6f 72       	sub    $0x726f6600,%eax
  101845:	6b 20 00             	imul   $0x0,(%eax),%esp
  101848:	73 6c                	jae    1018b6 <asmDoIrq+0xbe>
  10184a:	65 65 70 20          	gs gs jo 10186e <asmDoIrq+0x76>
  10184e:	00 65 78             	add    %ah,0x78(%ebp)
  101851:	69 74 20 00 65 72 72 	imul   $0x6f727265,0x0(%eax,%eiz,1),%esi
  101858:	6f 
  101859:	72 20                	jb     10187b <asmDoIrq+0x83>
  10185b:	69 72 71 0a 00 18 06 	imul   $0x618000a,0x71(%edx),%esi
  101862:	10 00                	adc    %al,(%eax)
  101864:	b4 05                	mov    $0x5,%ah
  101866:	10 00                	adc    %al,(%eax)
  101868:	c0 05 10 00 cc 05 10 	rolb   $0x10,0x5cc0010
  10186f:	00 d8                	add    %bl,%al
  101871:	05 10 00 f4 05       	add    $0x5f40010,%eax
  101876:	10 00                	adc    %al,(%eax)
  101878:	00 06                	add    %al,(%esi)
  10187a:	10 00                	adc    %al,(%eax)
  10187c:	0c 06                	or     $0x6,%al
  10187e:	10 00                	adc    %al,(%eax)
  101880:	a8 05                	test   $0x5,%al
  101882:	10 00                	adc    %al,(%eax)
  101884:	53                   	push   %ebx
  101885:	65 6d                	gs insl (%dx),%es:(%edi)
  101887:	61                   	popa   
  101888:	20 62 6c             	and    %ah,0x6c(%edx)
  10188b:	6f                   	outsl  %ds:(%esi),(%dx)
  10188c:	63 6b 65             	arpl   %bp,0x65(%ebx)
  10188f:	64 20 00             	and    %al,%fs:(%eax)
  101892:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  101896:	65 6c                	gs insb (%dx),%es:(%edi)
  101898:	2f                   	das    
  101899:	73 65                	jae    101900 <asmDoIrq+0x108>
  10189b:	6d                   	insl   (%dx),%es:(%edi)
  10189c:	61                   	popa   
  10189d:	2e 63 00             	arpl   %ax,%cs:(%eax)
  1018a0:	53                   	push   %ebx
  1018a1:	65 6d                	gs insl (%dx),%es:(%edi)
  1018a3:	61                   	popa   
  1018a4:	20 72 65             	and    %dh,0x65(%edx)
  1018a7:	61                   	popa   
  1018a8:	6c                   	insb   (%dx),%es:(%edi)
  1018a9:	61                   	popa   
  1018aa:	73 65                	jae    101911 <asmDoIrq+0x119>
  1018ac:	64 20 00             	and    %al,%fs:(%eax)
  1018af:	2d 32 31 34 37       	sub    $0x37343132,%eax
  1018b4:	34 38                	xor    $0x38,%al
  1018b6:	33 37                	xor    (%edi),%esi
  1018b8:	34 38                	xor    $0x38,%al
  1018ba:	00 77 61             	add    %dh,0x61(%edi)
  1018bd:	6b 65 20 00          	imul   $0x0,0x20(%ebp),%esp
  1018c1:	73 77                	jae    10193a <asmDoIrq+0x142>
  1018c3:	69                   	.byte 0x69
  1018c4:	74 63                	je     101929 <asmDoIrq+0x131>
  1018c6:	68                   	.byte 0x68
  1018c7:	20 00                	and    %al,(%eax)

Disassembly of section .eh_frame:

001018cc <.eh_frame>:
  1018cc:	14 00                	adc    $0x0,%al
  1018ce:	00 00                	add    %al,(%eax)
  1018d0:	00 00                	add    %al,(%eax)
  1018d2:	00 00                	add    %al,(%eax)
  1018d4:	01 7a 52             	add    %edi,0x52(%edx)
  1018d7:	00 01                	add    %al,(%ecx)
  1018d9:	7c 08                	jl     1018e3 <asmDoIrq+0xeb>
  1018db:	01 1b                	add    %ebx,(%ebx)
  1018dd:	0c 04                	or     $0x4,%al
  1018df:	04 88                	add    $0x88,%al
  1018e1:	01 00                	add    %eax,(%eax)
  1018e3:	00 18                	add    %bl,(%eax)
  1018e5:	00 00                	add    %al,(%eax)
  1018e7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1018ea:	00 00                	add    %al,(%eax)
  1018ec:	14 e7                	adc    $0xe7,%al
  1018ee:	ff                   	(bad)  
  1018ef:	ff 26                	jmp    *(%esi)
  1018f1:	00 00                	add    %al,(%eax)
  1018f3:	00 00                	add    %al,(%eax)
  1018f5:	41                   	inc    %ecx
  1018f6:	0e                   	push   %cs
  1018f7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1018fd:	00 00                	add    %al,(%eax)
  1018ff:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101902:	00 00                	add    %al,(%eax)
  101904:	38 00                	cmp    %al,(%eax)
  101906:	00 00                	add    %al,(%eax)
  101908:	20 e7                	and    %ah,%bh
  10190a:	ff                   	(bad)  
  10190b:	ff 23                	jmp    *(%ebx)
  10190d:	00 00                	add    %al,(%eax)
  10190f:	00 00                	add    %al,(%eax)
  101911:	41                   	inc    %ecx
  101912:	0e                   	push   %cs
  101913:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101919:	5f                   	pop    %edi
  10191a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10191d:	04 00                	add    $0x0,%al
  10191f:	00 3c 00             	add    %bh,(%eax,%eax,1)
  101922:	00 00                	add    %al,(%eax)
  101924:	58                   	pop    %eax
  101925:	00 00                	add    %al,(%eax)
  101927:	00 24 e7             	add    %ah,(%edi,%eiz,8)
  10192a:	ff                   	(bad)  
  10192b:	ff                   	(bad)  
  10192c:	d8 00                	fadds  (%eax)
  10192e:	00 00                	add    %al,(%eax)
  101930:	00 41 0e             	add    %al,0xe(%ecx)
  101933:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101939:	46                   	inc    %esi
  10193a:	87 03                	xchg   %eax,(%ebx)
  10193c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10193f:	05 02 a8 0a c3       	add    $0xc30aa802,%eax
  101944:	41                   	inc    %ecx
  101945:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101949:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10194c:	04 44                	add    $0x44,%al
  10194e:	0b 58 0a             	or     0xa(%eax),%ebx
  101951:	c3                   	ret    
  101952:	41                   	inc    %ecx
  101953:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101957:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10195a:	04 41                	add    $0x41,%al
  10195c:	0b 00                	or     (%eax),%eax
  10195e:	00 00                	add    %al,(%eax)
  101960:	20 00                	and    %al,(%eax)
  101962:	00 00                	add    %al,(%eax)
  101964:	98                   	cwtl   
  101965:	00 00                	add    %al,(%eax)
  101967:	00 bc e7 ff ff 23 00 	add    %bh,0x23ffff(%edi,%eiz,8)
  10196e:	00 00                	add    %al,(%eax)
  101970:	00 41 0e             	add    %al,0xe(%ecx)
  101973:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101979:	44                   	inc    %esp
  10197a:	83 03 5b             	addl   $0x5b,(%ebx)
  10197d:	c5 c3 0c             	(bad)  
  101980:	04 04                	add    $0x4,%al
  101982:	00 00                	add    %al,(%eax)
  101984:	1c 00                	sbb    $0x0,%al
  101986:	00 00                	add    %al,(%eax)
  101988:	bc 00 00 00 bc       	mov    $0xbc000000,%esp
  10198d:	e7 ff                	out    %eax,$0xff
  10198f:	ff 21                	jmp    *(%ecx)
  101991:	00 00                	add    %al,(%eax)
  101993:	00 00                	add    %al,(%eax)
  101995:	41                   	inc    %ecx
  101996:	0e                   	push   %cs
  101997:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10199d:	5d                   	pop    %ebp
  10199e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1019a1:	04 00                	add    $0x0,%al
  1019a3:	00 24 00             	add    %ah,(%eax,%eax,1)
  1019a6:	00 00                	add    %al,(%eax)
  1019a8:	dc 00                	faddl  (%eax)
  1019aa:	00 00                	add    %al,(%eax)
  1019ac:	c0 e7 ff             	shl    $0xff,%bh
  1019af:	ff 42 00             	incl   0x0(%edx)
  1019b2:	00 00                	add    %al,(%eax)
  1019b4:	00 41 0e             	add    %al,0xe(%ecx)
  1019b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019bd:	78 0a                	js     1019c9 <asmDoIrq+0x1d1>
  1019bf:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1019c2:	04 45                	add    $0x45,%al
  1019c4:	0b 41 c5             	or     -0x3b(%ecx),%eax
  1019c7:	0c 04                	or     $0x4,%al
  1019c9:	04 00                	add    $0x0,%al
  1019cb:	00 28                	add    %ch,(%eax)
  1019cd:	00 00                	add    %al,(%eax)
  1019cf:	00 04 01             	add    %al,(%ecx,%eax,1)
  1019d2:	00 00                	add    %al,(%eax)
  1019d4:	dc e7                	fsub   %st,%st(7)
  1019d6:	ff                   	(bad)  
  1019d7:	ff f4                	push   %esp
  1019d9:	00 00                	add    %al,(%eax)
  1019db:	00 00                	add    %al,(%eax)
  1019dd:	41                   	inc    %ecx
  1019de:	0e                   	push   %cs
  1019df:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019e5:	46                   	inc    %esi
  1019e6:	87 03                	xchg   %eax,(%ebx)
  1019e8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1019eb:	05 02 e3 c3 41       	add    $0x41c3e302,%eax
  1019f0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1019f4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1019f7:	04 28                	add    $0x28,%al
  1019f9:	00 00                	add    %al,(%eax)
  1019fb:	00 30                	add    %dh,(%eax)
  1019fd:	01 00                	add    %eax,(%eax)
  1019ff:	00 a4 e8 ff ff 6b 00 	add    %ah,0x6bffff(%eax,%ebp,8)
  101a06:	00 00                	add    %al,(%eax)
  101a08:	00 41 0e             	add    %al,0xe(%ecx)
  101a0b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a11:	46                   	inc    %esi
  101a12:	87 03                	xchg   %eax,(%ebx)
  101a14:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101a17:	05 02 5a c3 41       	add    $0x41c35a02,%eax
  101a1c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101a20:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101a23:	04 1c                	add    $0x1c,%al
  101a25:	00 00                	add    %al,(%eax)
  101a27:	00 5c 01 00          	add    %bl,0x0(%ecx,%eax,1)
  101a2b:	00 e4                	add    %ah,%ah
  101a2d:	e8 ff ff 2d 00       	call   3e1a31 <_end+0xde27d>
  101a32:	00 00                	add    %al,(%eax)
  101a34:	00 41 0e             	add    %al,0xe(%ecx)
  101a37:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a3d:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  101a41:	04 00                	add    $0x0,%al
  101a43:	00 24 00             	add    %ah,(%eax,%eax,1)
  101a46:	00 00                	add    %al,(%eax)
  101a48:	7c 01                	jl     101a4b <asmDoIrq+0x253>
  101a4a:	00 00                	add    %al,(%eax)
  101a4c:	f4                   	hlt    
  101a4d:	e8 ff ff 62 00       	call   731a51 <_end+0x42e29d>
  101a52:	00 00                	add    %al,(%eax)
  101a54:	00 41 0e             	add    %al,0xe(%ecx)
  101a57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a5d:	42                   	inc    %edx
  101a5e:	86 03                	xchg   %al,(%ebx)
  101a60:	83 04 02 5a          	addl   $0x5a,(%edx,%eax,1)
  101a64:	c3                   	ret    
  101a65:	41                   	inc    %ecx
  101a66:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101a6a:	04 04                	add    $0x4,%al
  101a6c:	28 00                	sub    %al,(%eax)
  101a6e:	00 00                	add    %al,(%eax)
  101a70:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  101a71:	01 00                	add    %eax,(%eax)
  101a73:	00 30                	add    %dh,(%eax)
  101a75:	e9 ff ff 9c 00       	jmp    ad1a79 <_end+0x7ce2c5>
  101a7a:	00 00                	add    %al,(%eax)
  101a7c:	00 41 0e             	add    %al,0xe(%ecx)
  101a7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a85:	42                   	inc    %edx
  101a86:	83 03 02             	addl   $0x2,(%ebx)
  101a89:	77 0a                	ja     101a95 <asmDoIrq+0x29d>
  101a8b:	c5 c3 0c             	(bad)  
  101a8e:	04 04                	add    $0x4,%al
  101a90:	44                   	inc    %esp
  101a91:	0b 5b c3             	or     -0x3d(%ebx),%ebx
  101a94:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101a97:	04 38                	add    $0x38,%al
  101a99:	00 00                	add    %al,(%eax)
  101a9b:	00 d0                	add    %dl,%al
  101a9d:	01 00                	add    %eax,(%eax)
  101a9f:	00 a0 e9 ff ff b7    	add    %ah,-0x48000017(%eax)
  101aa5:	00 00                	add    %al,(%eax)
  101aa7:	00 00                	add    %al,(%eax)
  101aa9:	41                   	inc    %ecx
  101aaa:	0e                   	push   %cs
  101aab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ab1:	46                   	inc    %esi
  101ab2:	87 03                	xchg   %eax,(%ebx)
  101ab4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101ab7:	05 02 7b 0a c3       	add    $0xc30a7b02,%eax
  101abc:	41                   	inc    %ecx
  101abd:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101ac1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101ac4:	04 41                	add    $0x41,%al
  101ac6:	0b 6b c3             	or     -0x3d(%ebx),%ebp
  101ac9:	41                   	inc    %ecx
  101aca:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101ace:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101ad1:	04 00                	add    $0x0,%al
  101ad3:	00 28                	add    %ch,(%eax)
  101ad5:	00 00                	add    %al,(%eax)
  101ad7:	00 0c 02             	add    %cl,(%edx,%eax,1)
  101ada:	00 00                	add    %al,(%eax)
  101adc:	1c ea                	sbb    $0xea,%al
  101ade:	ff                   	(bad)  
  101adf:	ff 96 00 00 00 00    	call   *0x0(%esi)
  101ae5:	41                   	inc    %ecx
  101ae6:	0e                   	push   %cs
  101ae7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101aed:	42                   	inc    %edx
  101aee:	83 03 02             	addl   $0x2,(%ebx)
  101af1:	77 0a                	ja     101afd <asmDoIrq+0x305>
  101af3:	c5 c3 0c             	(bad)  
  101af6:	04 04                	add    $0x4,%al
  101af8:	44                   	inc    %esp
  101af9:	0b 55 c3             	or     -0x3d(%ebp),%edx
  101afc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101aff:	04 68                	add    $0x68,%al
  101b01:	00 00                	add    %al,(%eax)
  101b03:	00 38                	add    %bh,(%eax)
  101b05:	02 00                	add    (%eax),%al
  101b07:	00 88 ea ff ff 9f    	add    %cl,-0x60000016(%eax)
  101b0d:	00 00                	add    %al,(%eax)
  101b0f:	00 00                	add    %al,(%eax)
  101b11:	41                   	inc    %ecx
  101b12:	0e                   	push   %cs
  101b13:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101b19:	42                   	inc    %edx
  101b1a:	83 03 5a             	addl   $0x5a,(%ebx)
  101b1d:	0a c5                	or     %ch,%al
  101b1f:	c3                   	ret    
  101b20:	0c 04                	or     $0x4,%al
  101b22:	04 45                	add    $0x45,%al
  101b24:	0b 47 0a             	or     0xa(%edi),%eax
  101b27:	c5 c3 0c             	(bad)  
  101b2a:	04 04                	add    $0x4,%al
  101b2c:	45                   	inc    %ebp
  101b2d:	0b 47 0a             	or     0xa(%edi),%eax
  101b30:	c5 c3 0c             	(bad)  
  101b33:	04 04                	add    $0x4,%al
  101b35:	45                   	inc    %ebp
  101b36:	0b 47 0a             	or     0xa(%edi),%eax
  101b39:	c5 c3 0c             	(bad)  
  101b3c:	04 04                	add    $0x4,%al
  101b3e:	45                   	inc    %ebp
  101b3f:	0b 59 0a             	or     0xa(%ecx),%ebx
  101b42:	c5 c3 0c             	(bad)  
  101b45:	04 04                	add    $0x4,%al
  101b47:	43                   	inc    %ebx
  101b48:	0b 47 0a             	or     0xa(%edi),%eax
  101b4b:	c5 c3 0c             	(bad)  
  101b4e:	04 04                	add    $0x4,%al
  101b50:	45                   	inc    %ebp
  101b51:	0b 47 0a             	or     0xa(%edi),%eax
  101b54:	c5 c3 0c             	(bad)  
  101b57:	04 04                	add    $0x4,%al
  101b59:	45                   	inc    %ebp
  101b5a:	0b 47 0a             	or     0xa(%edi),%eax
  101b5d:	c5 c3 0c             	(bad)  
  101b60:	04 04                	add    $0x4,%al
  101b62:	45                   	inc    %ebp
  101b63:	0b 56 c3             	or     -0x3d(%esi),%edx
  101b66:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101b69:	04 00                	add    $0x0,%al
  101b6b:	00 20                	add    %ah,(%eax)
  101b6d:	00 00                	add    %al,(%eax)
  101b6f:	00 a4 02 00 00 bc ea 	add    %ah,-0x15440000(%edx,%eax,1)
  101b76:	ff                   	(bad)  
  101b77:	ff 98 00 00 00 00    	lcall  *0x0(%eax)
  101b7d:	41                   	inc    %ecx
  101b7e:	0e                   	push   %cs
  101b7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101b85:	7e 0a                	jle    101b91 <asmDoIrq+0x399>
  101b87:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101b8a:	04 43                	add    $0x43,%al
  101b8c:	0b 00                	or     (%eax),%eax
  101b8e:	00 00                	add    %al,(%eax)
  101b90:	28 00                	sub    %al,(%eax)
  101b92:	00 00                	add    %al,(%eax)
  101b94:	c8 02 00 00          	enter  $0x2,$0x0
  101b98:	30 eb                	xor    %ch,%bl
  101b9a:	ff                   	(bad)  
  101b9b:	ff 84 00 00 00 00 41 	incl   0x41000000(%eax,%eax,1)
  101ba2:	0e                   	push   %cs
  101ba3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ba9:	42                   	inc    %edx
  101baa:	86 03                	xchg   %al,(%ebx)
  101bac:	83 04 02 5c          	addl   $0x5c,(%edx,%eax,1)
  101bb0:	0a c3                	or     %bl,%al
  101bb2:	41                   	inc    %ecx
  101bb3:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101bb7:	04 04                	add    $0x4,%al
  101bb9:	41                   	inc    %ecx
  101bba:	0b 00                	or     (%eax),%eax
  101bbc:	2c 00                	sub    $0x0,%al
  101bbe:	00 00                	add    %al,(%eax)
  101bc0:	f4                   	hlt    
  101bc1:	02 00                	add    (%eax),%al
  101bc3:	00 88 eb ff ff 7b    	add    %cl,0x7bffffeb(%eax)
  101bc9:	00 00                	add    %al,(%eax)
  101bcb:	00 00                	add    %al,(%eax)
  101bcd:	41                   	inc    %ecx
  101bce:	0e                   	push   %cs
  101bcf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101bd5:	42                   	inc    %edx
  101bd6:	83 03 4c             	addl   $0x4c,(%ebx)
  101bd9:	0a c5                	or     %ch,%al
  101bdb:	c3                   	ret    
  101bdc:	0c 04                	or     $0x4,%al
  101bde:	04 43                	add    $0x43,%al
  101be0:	0b 02                	or     (%edx),%eax
  101be2:	51                   	push   %ecx
  101be3:	0a c5                	or     %ch,%al
  101be5:	c3                   	ret    
  101be6:	0c 04                	or     $0x4,%al
  101be8:	04 47                	add    $0x47,%al
  101bea:	0b 00                	or     (%eax),%eax
  101bec:	2c 00                	sub    $0x0,%al
  101bee:	00 00                	add    %al,(%eax)
  101bf0:	24 03                	and    $0x3,%al
  101bf2:	00 00                	add    %al,(%eax)
  101bf4:	d4 eb                	aam    $0xeb
  101bf6:	ff                   	(bad)  
  101bf7:	ff 6f 00             	ljmp   *0x0(%edi)
  101bfa:	00 00                	add    %al,(%eax)
  101bfc:	00 41 0e             	add    %al,0xe(%ecx)
  101bff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c05:	42                   	inc    %edx
  101c06:	83 03 52             	addl   $0x52,(%ebx)
  101c09:	0a c5                	or     %ch,%al
  101c0b:	c3                   	ret    
  101c0c:	0c 04                	or     $0x4,%al
  101c0e:	04 41                	add    $0x41,%al
  101c10:	0b 7b 0a             	or     0xa(%ebx),%edi
  101c13:	c5 c3 0c             	(bad)  
  101c16:	04 04                	add    $0x4,%al
  101c18:	45                   	inc    %ebp
  101c19:	0b 00                	or     (%eax),%eax
  101c1b:	00 20                	add    %ah,(%eax)
  101c1d:	00 00                	add    %al,(%eax)
  101c1f:	00 54 03 00          	add    %dl,0x0(%ebx,%eax,1)
  101c23:	00 14 ec             	add    %dl,(%esp,%ebp,8)
  101c26:	ff                   	(bad)  
  101c27:	ff                   	(bad)  
  101c28:	dd 00                	fldl   (%eax)
  101c2a:	00 00                	add    %al,(%eax)
  101c2c:	00 41 0e             	add    %al,0xe(%ecx)
  101c2f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c35:	41                   	inc    %ecx
  101c36:	83 03 02             	addl   $0x2,(%ebx)
  101c39:	d7                   	xlat   %ds:(%ebx)
  101c3a:	c3                   	ret    
  101c3b:	41                   	inc    %ecx
  101c3c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101c3f:	04 20                	add    $0x20,%al
  101c41:	00 00                	add    %al,(%eax)
  101c43:	00 78 03             	add    %bh,0x3(%eax)
  101c46:	00 00                	add    %al,(%eax)
  101c48:	d0 ec                	shr    %ah
  101c4a:	ff                   	(bad)  
  101c4b:	ff 2a                	ljmp   *(%edx)
  101c4d:	00 00                	add    %al,(%eax)
  101c4f:	00 00                	add    %al,(%eax)
  101c51:	41                   	inc    %ecx
  101c52:	0e                   	push   %cs
  101c53:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c59:	42                   	inc    %edx
  101c5a:	83 03 64             	addl   $0x64,(%ebx)
  101c5d:	c5 c3 0c             	(bad)  
  101c60:	04 04                	add    $0x4,%al
  101c62:	00 00                	add    %al,(%eax)
  101c64:	48                   	dec    %eax
  101c65:	00 00                	add    %al,(%eax)
  101c67:	00 9c 03 00 00 d8 ec 	add    %bl,-0x13280000(%ebx,%eax,1)
  101c6e:	ff                   	(bad)  
  101c6f:	ff e0                	jmp    *%eax
  101c71:	00 00                	add    %al,(%eax)
  101c73:	00 00                	add    %al,(%eax)
  101c75:	41                   	inc    %ecx
  101c76:	0e                   	push   %cs
  101c77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c7d:	46                   	inc    %esi
  101c7e:	87 03                	xchg   %eax,(%ebx)
  101c80:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101c83:	05 02 81 0a c3       	add    $0xc30a8102,%eax
  101c88:	41                   	inc    %ecx
  101c89:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101c8d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101c90:	04 43                	add    $0x43,%al
  101c92:	0b 64 0a c3          	or     -0x3d(%edx,%ecx,1),%esp
  101c96:	41                   	inc    %ecx
  101c97:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101c9b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101c9e:	04 41                	add    $0x41,%al
  101ca0:	0b 4b 0a             	or     0xa(%ebx),%ecx
  101ca3:	c3                   	ret    
  101ca4:	41                   	inc    %ecx
  101ca5:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101ca9:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101cac:	04 46                	add    $0x46,%al
  101cae:	0b 00                	or     (%eax),%eax
  101cb0:	30 00                	xor    %al,(%eax)
  101cb2:	00 00                	add    %al,(%eax)
  101cb4:	e8 03 00 00 6c       	call   6c101cbc <_end+0x6bdfe508>
  101cb9:	ed                   	in     (%dx),%eax
  101cba:	ff                   	(bad)  
  101cbb:	ff                   	(bad)  
  101cbc:	7e 00                	jle    101cbe <asmDoIrq+0x4c6>
  101cbe:	00 00                	add    %al,(%eax)
  101cc0:	00 41 0e             	add    %al,0xe(%ecx)
  101cc3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101cc9:	45                   	inc    %ebp
  101cca:	86 03                	xchg   %al,(%ebx)
  101ccc:	83 04 02 5e          	addl   $0x5e,(%edx,%eax,1)
  101cd0:	0a c3                	or     %bl,%al
  101cd2:	41                   	inc    %ecx
  101cd3:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101cd7:	04 04                	add    $0x4,%al
  101cd9:	44                   	inc    %esp
  101cda:	0b 4b c3             	or     -0x3d(%ebx),%ecx
  101cdd:	41                   	inc    %ecx
  101cde:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101ce2:	04 04                	add    $0x4,%al
  101ce4:	2c 00                	sub    $0x0,%al
  101ce6:	00 00                	add    %al,(%eax)
  101ce8:	1c 04                	sbb    $0x4,%al
  101cea:	00 00                	add    %al,(%eax)
  101cec:	b8 ed ff ff 12       	mov    $0x12ffffed,%eax
  101cf1:	01 00                	add    %eax,(%eax)
  101cf3:	00 00                	add    %al,(%eax)
  101cf5:	41                   	inc    %ecx
  101cf6:	0e                   	push   %cs
  101cf7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101cfd:	49                   	dec    %ecx
  101cfe:	87 03                	xchg   %eax,(%ebx)
  101d00:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101d03:	05 02 85 0a c3       	add    $0xc30a8502,%eax
  101d08:	41                   	inc    %ecx
  101d09:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101d0d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101d10:	04 44                	add    $0x44,%al
  101d12:	0b 00                	or     (%eax),%eax
  101d14:	1c 00                	sbb    $0x0,%al
  101d16:	00 00                	add    %al,(%eax)
  101d18:	4c                   	dec    %esp
  101d19:	04 00                	add    $0x0,%al
  101d1b:	00 9c ee ff ff 55 00 	add    %bl,0x55ffff(%esi,%ebp,8)
  101d22:	00 00                	add    %al,(%eax)
  101d24:	00 41 0e             	add    %al,0xe(%ecx)
  101d27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d2d:	02 51 c5             	add    -0x3b(%ecx),%dl
  101d30:	0c 04                	or     $0x4,%al
  101d32:	04 00                	add    $0x0,%al
  101d34:	1c 00                	sbb    $0x0,%al
  101d36:	00 00                	add    %al,(%eax)
  101d38:	6c                   	insb   (%dx),%es:(%edi)
  101d39:	04 00                	add    $0x0,%al
  101d3b:	00 d4                	add    %dl,%ah
  101d3d:	ee                   	out    %al,(%dx)
  101d3e:	ff                   	(bad)  
  101d3f:	ff                   	(bad)  
  101d40:	3d 00 00 00 00       	cmp    $0x0,%eax
  101d45:	41                   	inc    %ecx
  101d46:	0e                   	push   %cs
  101d47:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d4d:	79 c5                	jns    101d14 <asmDoIrq+0x51c>
  101d4f:	0c 04                	or     $0x4,%al
  101d51:	04 00                	add    $0x0,%al
  101d53:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101d56:	00 00                	add    %al,(%eax)
  101d58:	8c 04 00             	mov    %es,(%eax,%eax,1)
  101d5b:	00 f4                	add    %dh,%ah
  101d5d:	ee                   	out    %al,(%dx)
  101d5e:	ff                   	(bad)  
  101d5f:	ff 1b                	lcall  *(%ebx)
  101d61:	00 00                	add    %al,(%eax)
  101d63:	00 00                	add    %al,(%eax)
  101d65:	41                   	inc    %ecx
  101d66:	0e                   	push   %cs
  101d67:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d6d:	57                   	push   %edi
  101d6e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101d71:	04 00                	add    $0x0,%al
  101d73:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101d76:	00 00                	add    %al,(%eax)
  101d78:	ac                   	lods   %ds:(%esi),%al
  101d79:	04 00                	add    $0x0,%al
  101d7b:	00 f0                	add    %dh,%al
  101d7d:	ee                   	out    %al,(%dx)
  101d7e:	ff                   	(bad)  
  101d7f:	ff 18                	lcall  *(%eax)
  101d81:	00 00                	add    %al,(%eax)
  101d83:	00 00                	add    %al,(%eax)
  101d85:	41                   	inc    %ecx
  101d86:	0e                   	push   %cs
  101d87:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d8d:	54                   	push   %esp
  101d8e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101d91:	04 00                	add    $0x0,%al
  101d93:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101d96:	00 00                	add    %al,(%eax)
  101d98:	cc                   	int3   
  101d99:	04 00                	add    $0x0,%al
  101d9b:	00 e8                	add    %ch,%al
  101d9d:	ee                   	out    %al,(%dx)
  101d9e:	ff                   	(bad)  
  101d9f:	ff 12                	call   *(%edx)
  101da1:	00 00                	add    %al,(%eax)
  101da3:	00 00                	add    %al,(%eax)
  101da5:	41                   	inc    %ecx
  101da6:	0e                   	push   %cs
  101da7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101dad:	4e                   	dec    %esi
  101dae:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101db1:	04 00                	add    $0x0,%al
  101db3:	00 20                	add    %ah,(%eax)
  101db5:	00 00                	add    %al,(%eax)
  101db7:	00 ec                	add    %ch,%ah
  101db9:	04 00                	add    $0x0,%al
  101dbb:	00 dc                	add    %bl,%ah
  101dbd:	ee                   	out    %al,(%dx)
  101dbe:	ff                   	(bad)  
  101dbf:	ff 75 00             	pushl  0x0(%ebp)
  101dc2:	00 00                	add    %al,(%eax)
  101dc4:	00 41 0e             	add    %al,0xe(%ecx)
  101dc7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101dcd:	41                   	inc    %ecx
  101dce:	83 03 02             	addl   $0x2,(%ebx)
  101dd1:	6f                   	outsl  %ds:(%esi),(%dx)
  101dd2:	c3                   	ret    
  101dd3:	41                   	inc    %ecx
  101dd4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101dd7:	04 1c                	add    $0x1c,%al
  101dd9:	00 00                	add    %al,(%eax)
  101ddb:	00 10                	add    %dl,(%eax)
  101ddd:	05 00 00 30 ef       	add    $0xef300000,%eax
  101de2:	ff                   	(bad)  
  101de3:	ff                   	(bad)  
  101de4:	79 01                	jns    101de7 <asmDoIrq+0x5ef>
  101de6:	00 00                	add    %al,(%eax)
  101de8:	00 41 0e             	add    %al,0xe(%ecx)
  101deb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101df1:	03 75 01             	add    0x1(%ebp),%esi
  101df4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101df7:	04 1c                	add    $0x1c,%al
  101df9:	00 00                	add    %al,(%eax)
  101dfb:	00 30                	add    %dh,(%eax)
  101dfd:	05 00 00 8c f0       	add    $0xf08c0000,%eax
  101e02:	ff                   	(bad)  
  101e03:	ff 27                	jmp    *(%edi)
  101e05:	00 00                	add    %al,(%eax)
  101e07:	00 00                	add    %al,(%eax)
  101e09:	41                   	inc    %ecx
  101e0a:	0e                   	push   %cs
  101e0b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e11:	63 c5                	arpl   %ax,%bp
  101e13:	0c 04                	or     $0x4,%al
  101e15:	04 00                	add    $0x0,%al
  101e17:	00 28                	add    %ch,(%eax)
  101e19:	00 00                	add    %al,(%eax)
  101e1b:	00 50 05             	add    %dl,0x5(%eax)
  101e1e:	00 00                	add    %al,(%eax)
  101e20:	94                   	xchg   %eax,%esp
  101e21:	f0 ff                	lock (bad) 
  101e23:	ff d2                	call   *%edx
  101e25:	00 00                	add    %al,(%eax)
  101e27:	00 00                	add    %al,(%eax)
  101e29:	41                   	inc    %ecx
  101e2a:	0e                   	push   %cs
  101e2b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e31:	46                   	inc    %esi
  101e32:	87 03                	xchg   %eax,(%ebx)
  101e34:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101e37:	05 02 c5 c3 41       	add    $0x41c3c502,%eax
  101e3c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101e40:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101e43:	04 28                	add    $0x28,%al
  101e45:	00 00                	add    %al,(%eax)
  101e47:	00 7c 05 00          	add    %bh,0x0(%ebp,%eax,1)
  101e4b:	00 3c f1             	add    %bh,(%ecx,%esi,8)
  101e4e:	ff                   	(bad)  
  101e4f:	ff 46 01             	incl   0x1(%esi)
  101e52:	00 00                	add    %al,(%eax)
  101e54:	00 41 0e             	add    %al,0xe(%ecx)
  101e57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e5d:	42                   	inc    %edx
  101e5e:	86 03                	xchg   %al,(%ebx)
  101e60:	83 04 03 01          	addl   $0x1,(%ebx,%eax,1)
  101e64:	01 0a                	add    %ecx,(%edx)
  101e66:	c3                   	ret    
  101e67:	41                   	inc    %ecx
  101e68:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101e6c:	04 04                	add    $0x4,%al
  101e6e:	44                   	inc    %esp
  101e6f:	0b 18                	or     (%eax),%ebx
  101e71:	00 00                	add    %al,(%eax)
  101e73:	00 a8 05 00 00 58    	add    %ch,0x58000005(%eax)
  101e79:	f2 ff                	repnz (bad) 
  101e7b:	ff 07                	incl   (%edi)
  101e7d:	00 00                	add    %al,(%eax)
  101e7f:	00 00                	add    %al,(%eax)
  101e81:	41                   	inc    %ecx
  101e82:	0e                   	push   %cs
  101e83:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e89:	00 00                	add    %al,(%eax)
  101e8b:	00 2c 00             	add    %ch,(%eax,%eax,1)
  101e8e:	00 00                	add    %al,(%eax)
  101e90:	c4 05 00 00 44 f2    	les    0xf2440000,%eax
  101e96:	ff                   	(bad)  
  101e97:	ff 65 01             	jmp    *0x1(%ebp)
  101e9a:	00 00                	add    %al,(%eax)
  101e9c:	00 41 0e             	add    %al,0xe(%ecx)
  101e9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ea5:	43                   	inc    %ebx
  101ea6:	87 03                	xchg   %eax,(%ebx)
  101ea8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101eab:	05 03 5b 01 c3       	add    $0xc3015b03,%eax
  101eb0:	41                   	inc    %ecx
  101eb1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101eb5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101eb8:	04 00                	add    $0x0,%al
  101eba:	00 00                	add    %al,(%eax)
  101ebc:	24 00                	and    $0x0,%al
  101ebe:	00 00                	add    %al,(%eax)
  101ec0:	f4                   	hlt    
  101ec1:	05 00 00 7c f3       	add    $0xf37c0000,%eax
  101ec6:	ff                   	(bad)  
  101ec7:	ff 30                	pushl  (%eax)
  101ec9:	00 00                	add    %al,(%eax)
  101ecb:	00 00                	add    %al,(%eax)
  101ecd:	41                   	inc    %ecx
  101ece:	0e                   	push   %cs
  101ecf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ed5:	5f                   	pop    %edi
  101ed6:	0a c5                	or     %ch,%al
  101ed8:	0c 04                	or     $0x4,%al
  101eda:	04 42                	add    $0x42,%al
  101edc:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  101edf:	0c 04                	or     $0x4,%al
  101ee1:	04 00                	add    $0x0,%al
  101ee3:	00 24 00             	add    %ah,(%eax,%eax,1)
  101ee6:	00 00                	add    %al,(%eax)
  101ee8:	1c 06                	sbb    $0x6,%al
  101eea:	00 00                	add    %al,(%eax)
  101eec:	84 f3                	test   %dh,%bl
  101eee:	ff                   	(bad)  
  101eef:	ff 30                	pushl  (%eax)
  101ef1:	00 00                	add    %al,(%eax)
  101ef3:	00 00                	add    %al,(%eax)
  101ef5:	41                   	inc    %ecx
  101ef6:	0e                   	push   %cs
  101ef7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101efd:	5f                   	pop    %edi
  101efe:	0a c5                	or     %ch,%al
  101f00:	0c 04                	or     $0x4,%al
  101f02:	04 42                	add    $0x42,%al
  101f04:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  101f07:	0c 04                	or     $0x4,%al
  101f09:	04 00                	add    $0x0,%al
  101f0b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101f0e:	00 00                	add    %al,(%eax)
  101f10:	44                   	inc    %esp
  101f11:	06                   	push   %es
  101f12:	00 00                	add    %al,(%eax)
  101f14:	8c f3                	mov    %?,%ebx
  101f16:	ff                   	(bad)  
  101f17:	ff 5d 00             	lcall  *0x0(%ebp)
  101f1a:	00 00                	add    %al,(%eax)
  101f1c:	00 41 0e             	add    %al,0xe(%ecx)
  101f1f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f25:	02 59 c5             	add    -0x3b(%ecx),%bl
  101f28:	0c 04                	or     $0x4,%al
  101f2a:	04 00                	add    $0x0,%al
  101f2c:	2c 00                	sub    $0x0,%al
  101f2e:	00 00                	add    %al,(%eax)
  101f30:	64 06                	fs push %es
  101f32:	00 00                	add    %al,(%eax)
  101f34:	cc                   	int3   
  101f35:	f3 ff                	repz (bad) 
  101f37:	ff 8e 01 00 00 00    	decl   0x1(%esi)
  101f3d:	41                   	inc    %ecx
  101f3e:	0e                   	push   %cs
  101f3f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f45:	44                   	inc    %esp
  101f46:	87 03                	xchg   %eax,(%ebx)
  101f48:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101f4b:	05 02 f4 0a c3       	add    $0xc30af402,%eax
  101f50:	41                   	inc    %ecx
  101f51:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101f55:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101f58:	04 42                	add    $0x42,%al
  101f5a:	0b 00                	or     (%eax),%eax
  101f5c:	28 00                	sub    %al,(%eax)
  101f5e:	00 00                	add    %al,(%eax)
  101f60:	94                   	xchg   %eax,%esp
  101f61:	06                   	push   %es
  101f62:	00 00                	add    %al,(%eax)
  101f64:	2c f5                	sub    $0xf5,%al
  101f66:	ff                   	(bad)  
  101f67:	ff 18                	lcall  *(%eax)
  101f69:	01 00                	add    %eax,(%eax)
  101f6b:	00 00                	add    %al,(%eax)
  101f6d:	41                   	inc    %ecx
  101f6e:	0e                   	push   %cs
  101f6f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f75:	42                   	inc    %edx
  101f76:	86 03                	xchg   %al,(%ebx)
  101f78:	83 04 02 a7          	addl   $0xffffffa7,(%edx,%eax,1)
  101f7c:	0a c3                	or     %bl,%al
  101f7e:	41                   	inc    %ecx
  101f7f:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101f83:	04 04                	add    $0x4,%al
  101f85:	42                   	inc    %edx
  101f86:	0b 00                	or     (%eax),%eax
  101f88:	18 00                	sbb    %al,(%eax)
  101f8a:	00 00                	add    %al,(%eax)
  101f8c:	c0 06 00             	rolb   $0x0,(%esi)
  101f8f:	00 18                	add    %bl,(%eax)
  101f91:	f6 ff                	idiv   %bh
  101f93:	ff 5b 00             	lcall  *0x0(%ebx)
  101f96:	00 00                	add    %al,(%eax)
  101f98:	00 02                	add    %al,(%edx)
  101f9a:	54                   	push   %esp
  101f9b:	0e                   	push   %cs
  101f9c:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101fa2:	00 00                	add    %al,(%eax)
  101fa4:	20 00                	and    %al,(%eax)
  101fa6:	00 00                	add    %al,(%eax)
  101fa8:	dc 06                	faddl  (%esi)
  101faa:	00 00                	add    %al,(%eax)
  101fac:	58                   	pop    %eax
  101fad:	f6 ff                	idiv   %bh
  101faf:	ff 41 01             	incl   0x1(%ecx)
  101fb2:	00 00                	add    %al,(%eax)
  101fb4:	00 41 0e             	add    %al,0xe(%ecx)
  101fb7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101fbd:	44                   	inc    %esp
  101fbe:	83 03 03             	addl   $0x3,(%ebx)
  101fc1:	39 01                	cmp    %eax,(%ecx)
  101fc3:	c5 c3 0c             	(bad)  
  101fc6:	04 04                	add    $0x4,%al
  101fc8:	1c 00                	sbb    $0x0,%al
  101fca:	00 00                	add    %al,(%eax)
  101fcc:	00 07                	add    %al,(%edi)
  101fce:	00 00                	add    %al,(%eax)
  101fd0:	78 f7                	js     101fc9 <asmDoIrq+0x7d1>
  101fd2:	ff                   	(bad)  
  101fd3:	ff 97 00 00 00 00    	call   *0x0(%edi)
  101fd9:	41                   	inc    %ecx
  101fda:	0e                   	push   %cs
  101fdb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101fe1:	46                   	inc    %esi
  101fe2:	87 03                	xchg   %eax,(%ebx)
  101fe4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101fe7:	05                   	.byte 0x5

Disassembly of section .data:

00102000 <buf.1239>:
  102000:	41                   	inc    %ecx
  102001:	73 73                	jae    102076 <buf.1239+0x76>
  102003:	65 72 74             	gs jb  10207a <buf.1239+0x7a>
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

00102108 <endOfSem>:
  102108:	00 00                	add    %al,(%eax)
	...

0010210c <data.1016>:
	...

00102114 <data.1103>:
	...

0010211c <endOfPCB>:
  10211c:	00 00                	add    %al,(%eax)
	...

00102120 <data.1103>:
	...

00102128 <buf.1224>:
	...

00102160 <semaphoreTable>:
	...

001021e0 <idt>:
	...

001029e0 <gdt>:
	...

00102a20 <tss>:
	...

00102aa0 <processTable>:
	...

003037a0 <blocked>:
  3037a0:	00 00                	add    %al,(%eax)
	...

003037a4 <current>:
  3037a4:	00 00                	add    %al,(%eax)
	...

003037a8 <runnable>:
  3037a8:	00 00                	add    %al,(%eax)
	...

003037ac <erunnable>:
  3037ac:	00 00                	add    %al,(%eax)
	...

003037b0 <eblocked>:
  3037b0:	00 00                	add    %al,(%eax)
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

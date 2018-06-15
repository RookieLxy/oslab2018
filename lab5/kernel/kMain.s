
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
  10002e:	68 70 18 10 00       	push   $0x101870
  100033:	e8 6c 0a 00 00       	call   100aa4 <printf>
  100038:	58                   	pop    %eax
  100039:	5a                   	pop    %edx
  10003a:	6a 54                	push   $0x54
  10003c:	68 85 18 10 00       	push   $0x101885
  100041:	e8 5a 17 00 00       	call   1017a0 <abort>
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
  100062:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  100067:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  1000a8:	8b 1d 00 31 10 00    	mov    0x103100,%ebx
  1000ae:	83 fb 50             	cmp    $0x50,%ebx
  1000b1:	74 2f                	je     1000e2 <fsWrite+0x96>
  1000b3:	8b 35 04 31 10 00    	mov    0x103104,%esi
  1000b9:	8d 34 b6             	lea    (%esi,%esi,4),%esi
  1000bc:	c1 e6 04             	shl    $0x4,%esi
  1000bf:	01 de                	add    %ebx,%esi
  1000c1:	80 cd 0c             	or     $0xc,%ch
  1000c4:	66 89 8c 36 00 80 0b 	mov    %cx,0xb8000(%esi,%esi,1)
  1000cb:	00 
  1000cc:	43                   	inc    %ebx
  1000cd:	89 1d 00 31 10 00    	mov    %ebx,0x103100
  1000d3:	4f                   	dec    %edi
  1000d4:	42                   	inc    %edx
  1000d5:	39 c2                	cmp    %eax,%edx
  1000d7:	74 1e                	je     1000f7 <fsWrite+0xab>
  1000d9:	66 0f be 0a          	movsbw (%edx),%cx
  1000dd:	80 f9 0a             	cmp    $0xa,%cl
  1000e0:	75 c6                	jne    1000a8 <fsWrite+0x5c>
  1000e2:	ff 05 04 31 10 00    	incl   0x103104
  1000e8:	c7 05 00 31 10 00 00 	movl   $0x0,0x103100
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
  100109:	68 85 18 10 00       	push   $0x101885
  10010e:	e8 8d 16 00 00       	call   1017a0 <abort>
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
  100172:	68 98 18 10 00       	push   $0x101898
  100177:	e8 28 09 00 00       	call   100aa4 <printf>
  10017c:	e8 1f 11 00 00       	call   1012a0 <updateTime>
  100181:	e8 0a 13 00 00       	call   101490 <checkBlockedList>
  100186:	83 c4 10             	add    $0x10,%esp
  100189:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  10018e:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  100194:	85 d2                	test   %edx,%edx
  100196:	74 14                	je     1001ac <timerHandle+0x40>
  100198:	a1 a8 47 30 00       	mov    0x3047a8,%eax
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
  1001bf:	68 9a 18 10 00       	push   $0x10189a
  1001c4:	e8 db 08 00 00       	call   100aa4 <printf>
  1001c9:	e8 ba 0d 00 00       	call   100f88 <initNewPCB>
  1001ce:	89 c2                	mov    %eax,%edx
  1001d0:	c1 e0 0a             	shl    $0xa,%eax
  1001d3:	01 d0                	add    %edx,%eax
  1001d5:	01 c0                	add    %eax,%eax
  1001d7:	01 d0                	add    %edx,%eax
  1001d9:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1001dc:	c1 e0 03             	shl    $0x3,%eax
  1001df:	8d 98 a0 3a 10 00    	lea    0x103aa0(%eax),%ebx
  1001e5:	b9 00 40 00 00       	mov    $0x4000,%ecx
  1001ea:	89 df                	mov    %ebx,%edi
  1001ec:	8b 35 a4 47 30 00    	mov    0x3047a4,%esi
  1001f2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1001f4:	8b 3d a4 47 30 00    	mov    0x3047a4,%edi
  1001fa:	81 c7 00 00 01 00    	add    $0x10000,%edi
  100200:	b9 13 00 00 00       	mov    $0x13,%ecx
  100205:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100208:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10020a:	05 a0 3a 11 00       	add    $0x113aa0,%eax
  10020f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100214:	89 c7                	mov    %eax,%edi
  100216:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100219:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10021b:	8d 42 04             	lea    0x4(%edx),%eax
  10021e:	c1 e0 14             	shl    $0x14,%eax
  100221:	8b 0d a4 47 30 00    	mov    0x3047a4,%ecx
  100227:	81 e9 a0 3a 10 00    	sub    $0x103aa0,%ecx
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
  100265:	a1 a4 47 30 00       	mov    0x3047a4,%eax
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
  1002b0:	68 a0 18 10 00       	push   $0x1018a0
  1002b5:	e8 ea 07 00 00       	call   100aa4 <printf>
  1002ba:	8b 15 a4 47 30 00    	mov    0x3047a4,%edx
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
  100316:	68 a7 18 10 00       	push   $0x1018a7
  10031b:	e8 84 07 00 00       	call   100aa4 <printf>
  100320:	a1 a4 47 30 00       	mov    0x3047a4,%eax
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
  100348:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  10034d:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  1003ac:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  1003b1:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  1003ea:	a1 08 31 10 00       	mov    0x103108,%eax
  1003ef:	8b 15 60 31 10 00    	mov    0x103160,%edx
  1003f5:	eb 05                	jmp    1003fc <sysSemPost+0x58>
  1003f7:	90                   	nop
  1003f8:	39 d1                	cmp    %edx,%ecx
  1003fa:	74 28                	je     100424 <sysSemPost+0x80>
  1003fc:	85 c0                	test   %eax,%eax
  1003fe:	75 f8                	jne    1003f8 <sysSemPost+0x54>
  100400:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  100407:	83 ec 08             	sub    $0x8,%esp
  10040a:	68 be 00 00 00       	push   $0xbe
  10040f:	68 85 18 10 00       	push   $0x101885
  100414:	e8 87 13 00 00       	call   1017a0 <abort>
  100419:	83 c4 10             	add    $0x10,%esp
  10041c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10041f:	c9                   	leave  
  100420:	c3                   	ret    
  100421:	8d 76 00             	lea    0x0(%esi),%esi
  100424:	83 ec 0c             	sub    $0xc,%esp
  100427:	68 60 31 10 00       	push   $0x103160
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
  10044c:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  100451:	89 c2                	mov    %eax,%edx
  100453:	81 ea a0 3a 10 00    	sub    $0x103aa0,%edx
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
  10048d:	8b 15 08 31 10 00    	mov    0x103108,%edx
  100493:	8b 0d 60 31 10 00    	mov    0x103160,%ecx
  100499:	eb 05                	jmp    1004a0 <sysSemWait+0x60>
  10049b:	90                   	nop
  10049c:	39 ce                	cmp    %ecx,%esi
  10049e:	74 28                	je     1004c8 <sysSemWait+0x88>
  1004a0:	85 d2                	test   %edx,%edx
  1004a2:	75 f8                	jne    10049c <sysSemWait+0x5c>
  1004a4:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  1004ab:	83 ec 08             	sub    $0x8,%esp
  1004ae:	68 ce 00 00 00       	push   $0xce
  1004b3:	68 85 18 10 00       	push   $0x101885
  1004b8:	e8 e3 12 00 00       	call   1017a0 <abort>
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
  1004db:	68 60 31 10 00       	push   $0x103160
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
  100500:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  100505:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  10053e:	a1 08 31 10 00       	mov    0x103108,%eax
  100543:	8b 15 60 31 10 00    	mov    0x103160,%edx
  100549:	eb 05                	jmp    100550 <sysSemDestroy+0x58>
  10054b:	90                   	nop
  10054c:	39 d1                	cmp    %edx,%ecx
  10054e:	74 28                	je     100578 <sysSemDestroy+0x80>
  100550:	85 c0                	test   %eax,%eax
  100552:	75 f8                	jne    10054c <sysSemDestroy+0x54>
  100554:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  10055b:	83 ec 08             	sub    $0x8,%esp
  10055e:	68 dd 00 00 00       	push   $0xdd
  100563:	68 85 18 10 00       	push   $0x101885
  100568:	e8 33 12 00 00       	call   1017a0 <abort>
  10056d:	83 c4 10             	add    $0x10,%esp
  100570:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100573:	c9                   	leave  
  100574:	c3                   	ret    
  100575:	8d 76 00             	lea    0x0(%esi),%esi
  100578:	c7 05 68 31 10 00 01 	movl   $0x1,0x103168
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
  1005a1:	ff 24 85 b8 18 10 00 	jmp    *0x1018b8(,%eax,4)
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
  10061d:	68 85 18 10 00       	push   $0x101885
  100622:	e8 79 11 00 00       	call   1017a0 <abort>
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
  100649:	03 05 a4 47 30 00    	add    0x3047a4,%eax
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
  10068a:	68 ad 18 10 00       	push   $0x1018ad
  10068f:	e8 10 04 00 00       	call   100aa4 <printf>
  100694:	58                   	pop    %eax
  100695:	5a                   	pop    %edx
  100696:	6a 3d                	push   $0x3d
  100698:	68 85 18 10 00       	push   $0x101885
  10069d:	e8 fe 10 00 00       	call   1017a0 <abort>
  1006a2:	83 c4 10             	add    $0x10,%esp
  1006a5:	eb c8                	jmp    10066f <irqHandle+0x3f>
  1006a7:	90                   	nop
  1006a8:	83 ec 0c             	sub    $0xc,%esp
  1006ab:	68 70 18 10 00       	push   $0x101870
  1006b0:	e8 ef 03 00 00       	call   100aa4 <printf>
  1006b5:	59                   	pop    %ecx
  1006b6:	58                   	pop    %eax
  1006b7:	6a 54                	push   $0x54
  1006b9:	68 85 18 10 00       	push   $0x101885
  1006be:	e8 dd 10 00 00       	call   1017a0 <abort>
  1006c3:	83 c4 10             	add    $0x10,%esp
  1006c6:	eb a7                	jmp    10066f <irqHandle+0x3f>

001006c8 <initNewSem>:
  1006c8:	55                   	push   %ebp
  1006c9:	89 e5                	mov    %esp,%ebp
  1006cb:	56                   	push   %esi
  1006cc:	53                   	push   %ebx
  1006cd:	8b 1d 08 31 10 00    	mov    0x103108,%ebx
  1006d3:	85 db                	test   %ebx,%ebx
  1006d5:	74 64                	je     10073b <initNewSem+0x73>
  1006d7:	83 3d 68 31 10 00 01 	cmpl   $0x1,0x103168
  1006de:	74 66                	je     100746 <initNewSem+0x7e>
  1006e0:	b9 78 31 10 00       	mov    $0x103178,%ecx
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
  100705:	8d 91 60 31 10 00    	lea    0x103160(%ecx),%edx
  10070b:	c7 81 6c 31 10 00 00 	movl   $0x0,0x10316c(%ecx)
  100712:	00 00 00 
  100715:	89 b1 60 31 10 00    	mov    %esi,0x103160(%ecx)
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
  100733:	89 15 08 31 10 00    	mov    %edx,0x103108
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
  100760:	8b 1d a4 47 30 00    	mov    0x3047a4,%ebx
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
  10079b:	68 dc 18 10 00       	push   $0x1018dc
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
  100810:	c7 45 08 f8 18 10 00 	movl   $0x1018f8,0x8(%ebp)
  100817:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10081a:	c9                   	leave  
  10081b:	e9 84 02 00 00       	jmp    100aa4 <printf>
  100820:	83 ec 08             	sub    $0x8,%esp
  100823:	6a 3c                	push   $0x3c
  100825:	68 ea 18 10 00       	push   $0x1018ea
  10082a:	e8 71 0f 00 00       	call   1017a0 <abort>
  10082f:	8b 43 0c             	mov    0xc(%ebx),%eax
  100832:	83 c4 10             	add    $0x10,%esp
  100835:	eb b0                	jmp    1007e7 <V+0x1f>
  100837:	90                   	nop

00100838 <initIdt>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	53                   	push   %ebx
  10083c:	ba 37 18 10 00       	mov    $0x101837,%edx
  100841:	89 d3                	mov    %edx,%ebx
  100843:	c1 ea 10             	shr    $0x10,%edx
  100846:	b9 e0 39 10 00       	mov    $0x1039e0,%ecx
  10084b:	b8 e0 31 10 00       	mov    $0x1031e0,%eax
  100850:	66 89 18             	mov    %bx,(%eax)
  100853:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100859:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10085d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100861:	66 89 50 06          	mov    %dx,0x6(%eax)
  100865:	83 c0 08             	add    $0x8,%eax
  100868:	39 c1                	cmp    %eax,%ecx
  10086a:	75 e4                	jne    100850 <initIdt+0x18>
  10086c:	b8 3d 18 10 00       	mov    $0x10183d,%eax
  100871:	66 a3 48 32 10 00    	mov    %ax,0x103248
  100877:	66 c7 05 4a 32 10 00 	movw   $0x8,0x10324a
  10087e:	08 00 
  100880:	c6 05 4c 32 10 00 00 	movb   $0x0,0x10324c
  100887:	c6 05 4d 32 10 00 8f 	movb   $0x8f,0x10324d
  10088e:	c1 e8 10             	shr    $0x10,%eax
  100891:	66 a3 4e 32 10 00    	mov    %ax,0x10324e
  100897:	b8 41 18 10 00       	mov    $0x101841,%eax
  10089c:	66 a3 e0 35 10 00    	mov    %ax,0x1035e0
  1008a2:	66 c7 05 e2 35 10 00 	movw   $0x8,0x1035e2
  1008a9:	08 00 
  1008ab:	c6 05 e4 35 10 00 00 	movb   $0x0,0x1035e4
  1008b2:	c6 05 e5 35 10 00 ee 	movb   $0xee,0x1035e5
  1008b9:	c1 e8 10             	shr    $0x10,%eax
  1008bc:	66 a3 e6 35 10 00    	mov    %ax,0x1035e6
  1008c2:	b8 4a 18 10 00       	mov    $0x10184a,%eax
  1008c7:	66 a3 e0 32 10 00    	mov    %ax,0x1032e0
  1008cd:	66 c7 05 e2 32 10 00 	movw   $0x8,0x1032e2
  1008d4:	08 00 
  1008d6:	c6 05 e4 32 10 00 00 	movb   $0x0,0x1032e4
  1008dd:	c6 05 e5 32 10 00 8e 	movb   $0x8e,0x1032e5
  1008e4:	c1 e8 10             	shr    $0x10,%eax
  1008e7:	66 a3 e6 32 10 00    	mov    %ax,0x1032e6
  1008ed:	66 c7 05 0c 31 10 00 	movw   $0x7ff,0x10310c
  1008f4:	ff 07 
  1008f6:	b8 e0 31 10 00       	mov    $0x1031e0,%eax
  1008fb:	66 a3 0e 31 10 00    	mov    %ax,0x10310e
  100901:	c1 e8 10             	shr    $0x10,%eax
  100904:	66 a3 10 31 10 00    	mov    %ax,0x103110
  10090a:	b8 0c 31 10 00       	mov    $0x10310c,%eax
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
  1009d4:	bb 07 19 10 00       	mov    $0x101907,%ebx
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
  100d13:	ba e0 39 10 00       	mov    $0x1039e0,%edx
  100d18:	66 c7 05 e8 39 10 00 	movw   $0xffff,0x1039e8
  100d1f:	ff ff 
  100d21:	66 c7 05 ea 39 10 00 	movw   $0x0,0x1039ea
  100d28:	00 00 
  100d2a:	c6 05 ec 39 10 00 00 	movb   $0x0,0x1039ec
  100d31:	c6 05 ed 39 10 00 9a 	movb   $0x9a,0x1039ed
  100d38:	c6 05 ee 39 10 00 cf 	movb   $0xcf,0x1039ee
  100d3f:	c6 05 ef 39 10 00 00 	movb   $0x0,0x1039ef
  100d46:	66 c7 05 f0 39 10 00 	movw   $0xffff,0x1039f0
  100d4d:	ff ff 
  100d4f:	66 c7 05 f2 39 10 00 	movw   $0x0,0x1039f2
  100d56:	00 00 
  100d58:	c6 05 f4 39 10 00 00 	movb   $0x0,0x1039f4
  100d5f:	c6 05 f5 39 10 00 92 	movb   $0x92,0x1039f5
  100d66:	c6 05 f6 39 10 00 cf 	movb   $0xcf,0x1039f6
  100d6d:	c6 05 f7 39 10 00 00 	movb   $0x0,0x1039f7
  100d74:	66 c7 05 10 3a 10 00 	movw   $0xffff,0x103a10
  100d7b:	ff ff 
  100d7d:	66 c7 05 12 3a 10 00 	movw   $0x0,0x103a12
  100d84:	00 00 
  100d86:	c6 05 14 3a 10 00 00 	movb   $0x0,0x103a14
  100d8d:	c6 05 15 3a 10 00 92 	movb   $0x92,0x103a15
  100d94:	c6 05 16 3a 10 00 cf 	movb   $0xcf,0x103a16
  100d9b:	c6 05 17 3a 10 00 00 	movb   $0x0,0x103a17
  100da2:	66 c7 05 f8 39 10 00 	movw   $0xffff,0x1039f8
  100da9:	ff ff 
  100dab:	66 c7 05 fa 39 10 00 	movw   $0x0,0x1039fa
  100db2:	00 00 
  100db4:	c6 05 fc 39 10 00 00 	movb   $0x0,0x1039fc
  100dbb:	c6 05 fd 39 10 00 fa 	movb   $0xfa,0x1039fd
  100dc2:	c6 05 fe 39 10 00 cf 	movb   $0xcf,0x1039fe
  100dc9:	c6 05 ff 39 10 00 00 	movb   $0x0,0x1039ff
  100dd0:	66 c7 05 00 3a 10 00 	movw   $0xffff,0x103a00
  100dd7:	ff ff 
  100dd9:	66 c7 05 02 3a 10 00 	movw   $0x0,0x103a02
  100de0:	00 00 
  100de2:	c6 05 04 3a 10 00 00 	movb   $0x0,0x103a04
  100de9:	c6 05 05 3a 10 00 f2 	movb   $0xf2,0x103a05
  100df0:	c6 05 06 3a 10 00 cf 	movb   $0xcf,0x103a06
  100df7:	c6 05 07 3a 10 00 00 	movb   $0x0,0x103a07
  100dfe:	66 c7 05 08 3a 10 00 	movw   $0x63,0x103a08
  100e05:	63 00 
  100e07:	b8 20 3a 10 00       	mov    $0x103a20,%eax
  100e0c:	66 a3 0a 3a 10 00    	mov    %ax,0x103a0a
  100e12:	89 c1                	mov    %eax,%ecx
  100e14:	c1 e9 10             	shr    $0x10,%ecx
  100e17:	88 0d 0c 3a 10 00    	mov    %cl,0x103a0c
  100e1d:	c6 05 0d 3a 10 00 89 	movb   $0x89,0x103a0d
  100e24:	c6 05 0e 3a 10 00 40 	movb   $0x40,0x103a0e
  100e2b:	c1 e8 18             	shr    $0x18,%eax
  100e2e:	a2 0f 3a 10 00       	mov    %al,0x103a0f
  100e33:	66 c7 05 14 31 10 00 	movw   $0x37,0x103114
  100e3a:	37 00 
  100e3c:	66 89 15 16 31 10 00 	mov    %dx,0x103116
  100e43:	c1 ea 10             	shr    $0x10,%edx
  100e46:	66 89 15 18 31 10 00 	mov    %dx,0x103118
  100e4d:	b8 14 31 10 00       	mov    $0x103114,%eax
  100e52:	0f 01 10             	lgdtl  (%eax)
  100e55:	c7 05 28 3a 10 00 30 	movl   $0x30,0x103a28
  100e5c:	00 00 00 
  100e5f:	c7 05 24 3a 10 00 00 	movl   $0x10000,0x103a24
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
  100f5a:	8d 04 c5 a0 3a 10 00 	lea    0x103aa0(,%eax,8),%eax
  100f61:	a3 a4 47 30 00       	mov    %eax,0x3047a4
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
  100f8d:	8b 1d 1c 31 10 00    	mov    0x10311c,%ebx
  100f93:	85 db                	test   %ebx,%ebx
  100f95:	0f 84 15 01 00 00    	je     1010b0 <initNewPCB+0x128>
  100f9b:	83 3d f4 3a 11 00 03 	cmpl   $0x3,0x113af4
  100fa2:	0f 84 18 01 00 00    	je     1010c0 <initNewPCB+0x138>
  100fa8:	b9 5c 3b 12 00       	mov    $0x123b5c,%ecx
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
  100fea:	8d 14 d5 a0 3a 10 00 	lea    0x103aa0(,%edx,8),%edx
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
  1010a5:	89 15 1c 31 10 00    	mov    %edx,0x10311c
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
  1010e1:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  1010e6:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  101123:	8b 15 a4 47 30 00    	mov    0x3047a4,%edx
  101129:	89 d0                	mov    %edx,%eax
  10112b:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  101168:	b9 e0 39 10 00       	mov    $0x1039e0,%ecx
  10116d:	66 c7 05 f8 39 10 00 	movw   $0x100,0x1039f8
  101174:	00 01 
  101176:	66 c7 05 fa 39 10 00 	movw   $0x0,0x1039fa
  10117d:	00 00 
  10117f:	88 1d fc 39 10 00    	mov    %bl,0x1039fc
  101185:	c6 05 fd 39 10 00 fa 	movb   $0xfa,0x1039fd
  10118c:	c6 05 fe 39 10 00 c0 	movb   $0xc0,0x1039fe
  101193:	a2 ff 39 10 00       	mov    %al,0x1039ff
  101198:	66 c7 05 00 3a 10 00 	movw   $0x100,0x103a00
  10119f:	00 01 
  1011a1:	66 c7 05 02 3a 10 00 	movw   $0x0,0x103a02
  1011a8:	00 00 
  1011aa:	88 1d 04 3a 10 00    	mov    %bl,0x103a04
  1011b0:	c6 05 05 3a 10 00 f2 	movb   $0xf2,0x103a05
  1011b7:	c6 05 06 3a 10 00 c0 	movb   $0xc0,0x103a06
  1011be:	a2 07 3a 10 00       	mov    %al,0x103a07
  1011c3:	66 c7 05 10 3a 10 00 	movw   $0x10,0x103a10
  1011ca:	10 00 
  1011cc:	66 89 15 12 3a 10 00 	mov    %dx,0x103a12
  1011d3:	89 d0                	mov    %edx,%eax
  1011d5:	c1 e8 10             	shr    $0x10,%eax
  1011d8:	a2 14 3a 10 00       	mov    %al,0x103a14
  1011dd:	c6 05 15 3a 10 00 92 	movb   $0x92,0x103a15
  1011e4:	c6 05 16 3a 10 00 c0 	movb   $0xc0,0x103a16
  1011eb:	89 d0                	mov    %edx,%eax
  1011ed:	c1 e8 18             	shr    $0x18,%eax
  1011f0:	a2 17 3a 10 00       	mov    %al,0x103a17
  1011f5:	66 c7 05 20 31 10 00 	movw   $0x37,0x103120
  1011fc:	37 00 
  1011fe:	66 89 0d 22 31 10 00 	mov    %cx,0x103122
  101205:	c1 e9 10             	shr    $0x10,%ecx
  101208:	66 89 0d 24 31 10 00 	mov    %cx,0x103124
  10120f:	b8 20 31 10 00       	mov    $0x103120,%eax
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
  101246:	8b 15 a0 47 30 00    	mov    0x3047a0,%edx
  10124c:	85 d2                	test   %edx,%edx
  10124e:	74 14                	je     101264 <addToBlocked+0x24>
  101250:	8b 15 b0 47 30 00    	mov    0x3047b0,%edx
  101256:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  10125c:	a3 b0 47 30 00       	mov    %eax,0x3047b0
  101261:	5d                   	pop    %ebp
  101262:	c3                   	ret    
  101263:	90                   	nop
  101264:	a3 a0 47 30 00       	mov    %eax,0x3047a0
  101269:	a3 b0 47 30 00       	mov    %eax,0x3047b0
  10126e:	5d                   	pop    %ebp
  10126f:	c3                   	ret    

00101270 <addToRunnable>:
  101270:	55                   	push   %ebp
  101271:	89 e5                	mov    %esp,%ebp
  101273:	8b 45 08             	mov    0x8(%ebp),%eax
  101276:	8b 15 a8 47 30 00    	mov    0x3047a8,%edx
  10127c:	85 d2                	test   %edx,%edx
  10127e:	74 14                	je     101294 <addToRunnable+0x24>
  101280:	8b 15 ac 47 30 00    	mov    0x3047ac,%edx
  101286:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  10128c:	a3 ac 47 30 00       	mov    %eax,0x3047ac
  101291:	5d                   	pop    %ebp
  101292:	c3                   	ret    
  101293:	90                   	nop
  101294:	a3 a8 47 30 00       	mov    %eax,0x3047a8
  101299:	a3 ac 47 30 00       	mov    %eax,0x3047ac
  10129e:	5d                   	pop    %ebp
  10129f:	c3                   	ret    

001012a0 <updateTime>:
  1012a0:	55                   	push   %ebp
  1012a1:	89 e5                	mov    %esp,%ebp
  1012a3:	a1 a4 47 30 00       	mov    0x3047a4,%eax
  1012a8:	83 b8 54 00 01 00 02 	cmpl   $0x2,0x10054(%eax)
  1012af:	74 06                	je     1012b7 <updateTime+0x17>
  1012b1:	ff 80 58 00 01 00    	incl   0x10058(%eax)
  1012b7:	a1 a0 47 30 00       	mov    0x3047a0,%eax
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
  101307:	a1 a8 47 30 00       	mov    0x3047a8,%eax
  10130c:	8b 3d a0 47 30 00    	mov    0x3047a0,%edi
  101312:	8b 35 b0 47 30 00    	mov    0x3047b0,%esi
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
  10137b:	c7 05 a8 47 30 00 00 	movl   $0x0,0x3047a8
  101382:	00 00 00 
  101385:	c7 05 ac 47 30 00 00 	movl   $0x0,0x3047ac
  10138c:	00 00 00 
  10138f:	31 c0                	xor    %eax,%eax
  101391:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  101397:	85 d2                	test   %edx,%edx
  101399:	74 5e                	je     1013f9 <checkRunnableList+0xf9>
  10139b:	8b 3d a0 47 30 00    	mov    0x3047a0,%edi
  1013a1:	8b 35 b0 47 30 00    	mov    0x3047b0,%esi
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
  10140c:	89 35 b0 47 30 00    	mov    %esi,0x3047b0
  101412:	84 db                	test   %bl,%bl
  101414:	0f 84 77 ff ff ff    	je     101391 <checkRunnableList+0x91>
  10141a:	a3 a8 47 30 00       	mov    %eax,0x3047a8
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
  10145d:	89 35 b0 47 30 00    	mov    %esi,0x3047b0
  101463:	eb 94                	jmp    1013f9 <checkRunnableList+0xf9>
  101465:	89 3d a0 47 30 00    	mov    %edi,0x3047a0
  10146b:	eb 99                	jmp    101406 <checkRunnableList+0x106>
  10146d:	89 3d a0 47 30 00    	mov    %edi,0x3047a0
  101473:	e9 f9 fe ff ff       	jmp    101371 <checkRunnableList+0x71>
  101478:	89 35 b0 47 30 00    	mov    %esi,0x3047b0
  10147e:	e9 f8 fe ff ff       	jmp    10137b <checkRunnableList+0x7b>
  101483:	89 3d a0 47 30 00    	mov    %edi,0x3047a0
  101489:	e9 65 ff ff ff       	jmp    1013f3 <checkRunnableList+0xf3>
  10148e:	66 90                	xchg   %ax,%ax

00101490 <checkBlockedList>:
  101490:	55                   	push   %ebp
  101491:	89 e5                	mov    %esp,%ebp
  101493:	56                   	push   %esi
  101494:	53                   	push   %ebx
  101495:	a1 a0 47 30 00       	mov    0x3047a0,%eax
  10149a:	eb 18                	jmp    1014b4 <checkBlockedList+0x24>
  10149c:	83 fa 03             	cmp    $0x3,%edx
  10149f:	0f 85 d3 00 00 00    	jne    101578 <checkBlockedList+0xe8>
  1014a5:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1014ab:	a3 a0 47 30 00       	mov    %eax,0x3047a0
  1014b0:	85 c0                	test   %eax,%eax
  1014b2:	74 50                	je     101504 <checkBlockedList+0x74>
  1014b4:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  1014ba:	83 fa 01             	cmp    $0x1,%edx
  1014bd:	75 dd                	jne    10149c <checkBlockedList+0xc>
  1014bf:	83 ec 0c             	sub    $0xc,%esp
  1014c2:	68 13 19 10 00       	push   $0x101913
  1014c7:	e8 d8 f5 ff ff       	call   100aa4 <printf>
  1014cc:	a1 a0 47 30 00       	mov    0x3047a0,%eax
  1014d1:	83 c4 10             	add    $0x10,%esp
  1014d4:	8b 15 a8 47 30 00    	mov    0x3047a8,%edx
  1014da:	85 d2                	test   %edx,%edx
  1014dc:	0f 84 9a 00 00 00    	je     10157c <checkBlockedList+0xec>
  1014e2:	8b 15 ac 47 30 00    	mov    0x3047ac,%edx
  1014e8:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  1014ee:	a3 ac 47 30 00       	mov    %eax,0x3047ac
  1014f3:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1014f9:	a3 a0 47 30 00       	mov    %eax,0x3047a0
  1014fe:	85 c0                	test   %eax,%eax
  101500:	75 b2                	jne    1014b4 <checkBlockedList+0x24>
  101502:	66 90                	xchg   %ax,%ax
  101504:	c7 05 b0 47 30 00 00 	movl   $0x0,0x3047b0
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
  101543:	68 13 19 10 00       	push   $0x101913
  101548:	e8 57 f5 ff ff       	call   100aa4 <printf>
  10154d:	83 c4 10             	add    $0x10,%esp
  101550:	a1 a8 47 30 00       	mov    0x3047a8,%eax
  101555:	85 c0                	test   %eax,%eax
  101557:	74 32                	je     10158b <checkBlockedList+0xfb>
  101559:	a1 ac 47 30 00       	mov    0x3047ac,%eax
  10155e:	89 b0 64 00 01 00    	mov    %esi,0x10064(%eax)
  101564:	89 35 ac 47 30 00    	mov    %esi,0x3047ac
  10156a:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101570:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  101576:	eb a0                	jmp    101518 <checkBlockedList+0x88>
  101578:	89 c3                	mov    %eax,%ebx
  10157a:	eb 94                	jmp    101510 <checkBlockedList+0x80>
  10157c:	a3 a8 47 30 00       	mov    %eax,0x3047a8
  101581:	a3 ac 47 30 00       	mov    %eax,0x3047ac
  101586:	e9 1a ff ff ff       	jmp    1014a5 <checkBlockedList+0x15>
  10158b:	89 35 a8 47 30 00    	mov    %esi,0x3047a8
  101591:	89 35 ac 47 30 00    	mov    %esi,0x3047ac
  101597:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  10159d:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  1015a3:	e9 70 ff ff ff       	jmp    101518 <checkBlockedList+0x88>

001015a8 <schedule>:
  1015a8:	a1 a8 47 30 00       	mov    0x3047a8,%eax
  1015ad:	85 c0                	test   %eax,%eax
  1015af:	74 4a                	je     1015fb <schedule+0x53>
  1015b1:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  1015b8:	00 00 00 
  1015bb:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  1015c2:	00 00 00 
  1015c5:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  1015cc:	00 00 00 
  1015cf:	a3 a4 47 30 00       	mov    %eax,0x3047a4
  1015d4:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  1015da:	89 15 a8 47 30 00    	mov    %edx,0x3047a8
  1015e0:	c7 80 64 00 01 00 00 	movl   $0x0,0x10064(%eax)
  1015e7:	00 00 00 
  1015ea:	85 d2                	test   %edx,%edx
  1015ec:	74 02                	je     1015f0 <schedule+0x48>
  1015ee:	c3                   	ret    
  1015ef:	90                   	nop
  1015f0:	c7 05 ac 47 30 00 00 	movl   $0x0,0x3047ac
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
  10160b:	68 19 19 10 00       	push   $0x101919
  101610:	e8 8f f4 ff ff       	call   100aa4 <printf>
  101615:	c7 05 28 3a 10 00 30 	movl   $0x30,0x103a28
  10161c:	00 00 00 
  10161f:	8b 15 a4 47 30 00    	mov    0x3047a4,%edx
  101625:	8b 82 4c 00 01 00    	mov    0x1004c(%edx),%eax
  10162b:	a3 24 3a 10 00       	mov    %eax,0x103a24
  101630:	89 d0                	mov    %edx,%eax
  101632:	2d a0 3a 10 00       	sub    $0x103aa0,%eax
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
  10166e:	b9 e0 39 10 00       	mov    $0x1039e0,%ecx
  101673:	66 c7 05 f8 39 10 00 	movw   $0x100,0x1039f8
  10167a:	00 01 
  10167c:	66 c7 05 fa 39 10 00 	movw   $0x0,0x1039fa
  101683:	00 00 
  101685:	88 1d fc 39 10 00    	mov    %bl,0x1039fc
  10168b:	c6 05 fd 39 10 00 fa 	movb   $0xfa,0x1039fd
  101692:	c6 05 fe 39 10 00 c0 	movb   $0xc0,0x1039fe
  101699:	a2 ff 39 10 00       	mov    %al,0x1039ff
  10169e:	66 c7 05 00 3a 10 00 	movw   $0x100,0x103a00
  1016a5:	00 01 
  1016a7:	66 c7 05 02 3a 10 00 	movw   $0x0,0x103a02
  1016ae:	00 00 
  1016b0:	88 1d 04 3a 10 00    	mov    %bl,0x103a04
  1016b6:	c6 05 05 3a 10 00 f2 	movb   $0xf2,0x103a05
  1016bd:	c6 05 06 3a 10 00 c0 	movb   $0xc0,0x103a06
  1016c4:	a2 07 3a 10 00       	mov    %al,0x103a07
  1016c9:	66 c7 05 10 3a 10 00 	movw   $0x10,0x103a10
  1016d0:	10 00 
  1016d2:	66 89 15 12 3a 10 00 	mov    %dx,0x103a12
  1016d9:	89 d0                	mov    %edx,%eax
  1016db:	c1 e8 10             	shr    $0x10,%eax
  1016de:	a2 14 3a 10 00       	mov    %al,0x103a14
  1016e3:	c6 05 15 3a 10 00 92 	movb   $0x92,0x103a15
  1016ea:	c6 05 16 3a 10 00 c0 	movb   $0xc0,0x103a16
  1016f1:	c1 ea 18             	shr    $0x18,%edx
  1016f4:	88 15 17 3a 10 00    	mov    %dl,0x103a17
  1016fa:	66 c7 05 20 31 10 00 	movw   $0x37,0x103120
  101701:	37 00 
  101703:	66 89 0d 22 31 10 00 	mov    %cx,0x103122
  10170a:	c1 e9 10             	shr    $0x10,%ecx
  10170d:	66 89 0d 24 31 10 00 	mov    %cx,0x103124
  101714:	b8 20 31 10 00       	mov    $0x103120,%eax
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

00101748 <initDisk>:
  101748:	55                   	push   %ebp
  101749:	89 e5                	mov    %esp,%ebp
  10174b:	c7 05 c0 4b 30 00 00 	movl   $0x400,0x304bc0
  101752:	04 00 00 
  101755:	c7 05 c4 4b 30 00 00 	movl   $0x200,0x304bc4
  10175c:	02 00 00 
  10175f:	c7 05 c8 4b 30 00 00 	movl   $0x200,0x304bc8
  101766:	02 00 00 
  101769:	c7 05 cc 4b 30 00 00 	movl   $0x200,0x304bcc
  101770:	02 00 00 
  101773:	c7 05 d0 4b 30 00 00 	movl   $0x200,0x304bd0
  10177a:	02 00 00 
  10177d:	c7 05 d4 4b 30 00 00 	movl   $0x200,0x304bd4
  101784:	02 00 00 
  101787:	c7 05 d8 4b 30 00 00 	movl   $0x200,0x304bd8
  10178e:	02 00 00 
  101791:	c7 05 dc 4b 30 00 00 	movl   $0x200,0x304bdc
  101798:	02 00 00 
  10179b:	5d                   	pop    %ebp
  10179c:	c3                   	ret    
  10179d:	66 90                	xchg   %ax,%ax
  10179f:	90                   	nop

001017a0 <abort>:
  1017a0:	55                   	push   %ebp
  1017a1:	89 e5                	mov    %esp,%ebp
  1017a3:	57                   	push   %edi
  1017a4:	56                   	push   %esi
  1017a5:	53                   	push   %ebx
  1017a6:	83 ec 1c             	sub    $0x1c,%esp
  1017a9:	8b 55 08             	mov    0x8(%ebp),%edx
  1017ac:	fa                   	cli    
  1017ad:	8a 02                	mov    (%edx),%al
  1017af:	b9 12 30 10 00       	mov    $0x103012,%ecx
  1017b4:	84 c0                	test   %al,%al
  1017b6:	74 0b                	je     1017c3 <abort+0x23>
  1017b8:	41                   	inc    %ecx
  1017b9:	42                   	inc    %edx
  1017ba:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017bd:	8a 02                	mov    (%edx),%al
  1017bf:	84 c0                	test   %al,%al
  1017c1:	75 f5                	jne    1017b8 <abort+0x18>
  1017c3:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017c6:	bb 45 31 10 00       	mov    $0x103145,%ebx
  1017cb:	be 0a 00 00 00       	mov    $0xa,%esi
  1017d0:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017d5:	4b                   	dec    %ebx
  1017d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017d9:	99                   	cltd   
  1017da:	f7 fe                	idiv   %esi
  1017dc:	8d 42 30             	lea    0x30(%edx),%eax
  1017df:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017e2:	88 03                	mov    %al,(%ebx)
  1017e4:	89 f8                	mov    %edi,%eax
  1017e6:	f7 6d 0c             	imull  0xc(%ebp)
  1017e9:	c1 fa 02             	sar    $0x2,%edx
  1017ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017ef:	c1 f8 1f             	sar    $0x1f,%eax
  1017f2:	29 c2                	sub    %eax,%edx
  1017f4:	89 55 0c             	mov    %edx,0xc(%ebp)
  1017f7:	75 dc                	jne    1017d5 <abort+0x35>
  1017f9:	41                   	inc    %ecx
  1017fa:	41                   	inc    %ecx
  1017fb:	43                   	inc    %ebx
  1017fc:	8a 45 e7             	mov    -0x19(%ebp),%al
  1017ff:	88 41 ff             	mov    %al,-0x1(%ecx)
  101802:	8a 03                	mov    (%ebx),%al
  101804:	88 45 e7             	mov    %al,-0x19(%ebp)
  101807:	84 c0                	test   %al,%al
  101809:	75 ef                	jne    1017fa <abort+0x5a>
  10180b:	c6 01 0a             	movb   $0xa,(%ecx)
  10180e:	0f be 05 00 30 10 00 	movsbl 0x103000,%eax
  101815:	84 c0                	test   %al,%al
  101817:	74 1b                	je     101834 <abort+0x94>
  101819:	bb 00 30 10 00       	mov    $0x103000,%ebx
  10181e:	83 ec 0c             	sub    $0xc,%esp
  101821:	50                   	push   %eax
  101822:	e8 29 f4 ff ff       	call   100c50 <putChar>
  101827:	43                   	inc    %ebx
  101828:	0f be 03             	movsbl (%ebx),%eax
  10182b:	83 c4 10             	add    $0x10,%esp
  10182e:	84 c0                	test   %al,%al
  101830:	75 ec                	jne    10181e <abort+0x7e>
  101832:	66 90                	xchg   %ax,%ax
  101834:	f4                   	hlt    
  101835:	eb fd                	jmp    101834 <abort+0x94>

00101837 <irqEmpty>:
  101837:	6a 00                	push   $0x0
  101839:	6a ff                	push   $0xffffffff
  10183b:	eb 13                	jmp    101850 <asmDoIrq>

0010183d <irqGProtectFault>:
  10183d:	6a 0d                	push   $0xd
  10183f:	eb 0f                	jmp    101850 <asmDoIrq>

00101841 <irqSyscall>:
  101841:	6a 00                	push   $0x0
  101843:	68 80 00 00 00       	push   $0x80
  101848:	eb 06                	jmp    101850 <asmDoIrq>

0010184a <irqTimer>:
  10184a:	6a 00                	push   $0x0
  10184c:	6a 20                	push   $0x20
  10184e:	eb 00                	jmp    101850 <asmDoIrq>

00101850 <asmDoIrq>:
  101850:	60                   	pusha  
  101851:	1e                   	push   %ds
  101852:	06                   	push   %es
  101853:	0f a0                	push   %fs
  101855:	0f a8                	push   %gs
  101857:	54                   	push   %esp
  101858:	e8 d3 ed ff ff       	call   100630 <irqHandle>
  10185d:	83 c4 04             	add    $0x4,%esp
  101860:	0f a9                	pop    %gs
  101862:	0f a1                	pop    %fs
  101864:	07                   	pop    %es
  101865:	1f                   	pop    %ds
  101866:	61                   	popa   
  101867:	83 c4 04             	add    $0x4,%esp
  10186a:	83 c4 04             	add    $0x4,%esp
  10186d:	cf                   	iret   

Disassembly of section .rodata:

00101870 <.rodata>:
  101870:	47                   	inc    %edi
  101871:	50                   	push   %eax
  101872:	72 6f                	jb     1018e3 <asmDoIrq+0x93>
  101874:	74 65                	je     1018db <asmDoIrq+0x8b>
  101876:	78 74                	js     1018ec <asmDoIrq+0x9c>
  101878:	46                   	inc    %esi
  101879:	61                   	popa   
  10187a:	75 6c                	jne    1018e8 <asmDoIrq+0x98>
  10187c:	74 48                	je     1018c6 <asmDoIrq+0x76>
  10187e:	61                   	popa   
  10187f:	6e                   	outsb  %ds:(%esi),(%dx)
  101880:	64 6c                	fs insb (%dx),%es:(%edi)
  101882:	65 0a 00             	or     %gs:(%eax),%al
  101885:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  101889:	65 6c                	gs insb (%dx),%es:(%edi)
  10188b:	2f                   	das    
  10188c:	69 72 71 48 61 6e 64 	imul   $0x646e6148,0x71(%edx),%esi
  101893:	6c                   	insb   (%dx),%es:(%edi)
  101894:	65 2e 63 00          	gs arpl %ax,%cs:(%eax)
  101898:	2d 00 66 6f 72       	sub    $0x726f6600,%eax
  10189d:	6b 20 00             	imul   $0x0,(%eax),%esp
  1018a0:	73 6c                	jae    10190e <asmDoIrq+0xbe>
  1018a2:	65 65 70 20          	gs gs jo 1018c6 <asmDoIrq+0x76>
  1018a6:	00 65 78             	add    %ah,0x78(%ebp)
  1018a9:	69 74 20 00 65 72 72 	imul   $0x6f727265,0x0(%eax,%eiz,1),%esi
  1018b0:	6f 
  1018b1:	72 20                	jb     1018d3 <asmDoIrq+0x83>
  1018b3:	69 72 71 0a 00 18 06 	imul   $0x618000a,0x71(%edx),%esi
  1018ba:	10 00                	adc    %al,(%eax)
  1018bc:	b4 05                	mov    $0x5,%ah
  1018be:	10 00                	adc    %al,(%eax)
  1018c0:	c0 05 10 00 cc 05 10 	rolb   $0x10,0x5cc0010
  1018c7:	00 d8                	add    %bl,%al
  1018c9:	05 10 00 f4 05       	add    $0x5f40010,%eax
  1018ce:	10 00                	adc    %al,(%eax)
  1018d0:	00 06                	add    %al,(%esi)
  1018d2:	10 00                	adc    %al,(%eax)
  1018d4:	0c 06                	or     $0x6,%al
  1018d6:	10 00                	adc    %al,(%eax)
  1018d8:	a8 05                	test   $0x5,%al
  1018da:	10 00                	adc    %al,(%eax)
  1018dc:	53                   	push   %ebx
  1018dd:	65 6d                	gs insl (%dx),%es:(%edi)
  1018df:	61                   	popa   
  1018e0:	20 62 6c             	and    %ah,0x6c(%edx)
  1018e3:	6f                   	outsl  %ds:(%esi),(%dx)
  1018e4:	63 6b 65             	arpl   %bp,0x65(%ebx)
  1018e7:	64 20 00             	and    %al,%fs:(%eax)
  1018ea:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  1018ee:	65 6c                	gs insb (%dx),%es:(%edi)
  1018f0:	2f                   	das    
  1018f1:	73 65                	jae    101958 <asmDoIrq+0x108>
  1018f3:	6d                   	insl   (%dx),%es:(%edi)
  1018f4:	61                   	popa   
  1018f5:	2e 63 00             	arpl   %ax,%cs:(%eax)
  1018f8:	53                   	push   %ebx
  1018f9:	65 6d                	gs insl (%dx),%es:(%edi)
  1018fb:	61                   	popa   
  1018fc:	20 72 65             	and    %dh,0x65(%edx)
  1018ff:	61                   	popa   
  101900:	6c                   	insb   (%dx),%es:(%edi)
  101901:	61                   	popa   
  101902:	73 65                	jae    101969 <asmDoIrq+0x119>
  101904:	64 20 00             	and    %al,%fs:(%eax)
  101907:	2d 32 31 34 37       	sub    $0x37343132,%eax
  10190c:	34 38                	xor    $0x38,%al
  10190e:	33 37                	xor    (%edi),%esi
  101910:	34 38                	xor    $0x38,%al
  101912:	00 77 61             	add    %dh,0x61(%edi)
  101915:	6b 65 20 00          	imul   $0x0,0x20(%ebp),%esp
  101919:	73 77                	jae    101992 <asmDoIrq+0x142>
  10191b:	69                   	.byte 0x69
  10191c:	74 63                	je     101981 <asmDoIrq+0x131>
  10191e:	68                   	.byte 0x68
  10191f:	20 00                	and    %al,(%eax)

Disassembly of section .eh_frame:

00101924 <.eh_frame>:
  101924:	14 00                	adc    $0x0,%al
  101926:	00 00                	add    %al,(%eax)
  101928:	00 00                	add    %al,(%eax)
  10192a:	00 00                	add    %al,(%eax)
  10192c:	01 7a 52             	add    %edi,0x52(%edx)
  10192f:	00 01                	add    %al,(%ecx)
  101931:	7c 08                	jl     10193b <asmDoIrq+0xeb>
  101933:	01 1b                	add    %ebx,(%ebx)
  101935:	0c 04                	or     $0x4,%al
  101937:	04 88                	add    $0x88,%al
  101939:	01 00                	add    %eax,(%eax)
  10193b:	00 18                	add    %bl,(%eax)
  10193d:	00 00                	add    %al,(%eax)
  10193f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101942:	00 00                	add    %al,(%eax)
  101944:	bc e6 ff ff 26       	mov    $0x26ffffe6,%esp
  101949:	00 00                	add    %al,(%eax)
  10194b:	00 00                	add    %al,(%eax)
  10194d:	41                   	inc    %ecx
  10194e:	0e                   	push   %cs
  10194f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101955:	00 00                	add    %al,(%eax)
  101957:	00 1c 00             	add    %bl,(%eax,%eax,1)
  10195a:	00 00                	add    %al,(%eax)
  10195c:	38 00                	cmp    %al,(%eax)
  10195e:	00 00                	add    %al,(%eax)
  101960:	c8 e6 ff ff          	enter  $0xffe6,$0xff
  101964:	23 00                	and    (%eax),%eax
  101966:	00 00                	add    %al,(%eax)
  101968:	00 41 0e             	add    %al,0xe(%ecx)
  10196b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101971:	5f                   	pop    %edi
  101972:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101975:	04 00                	add    $0x0,%al
  101977:	00 3c 00             	add    %bh,(%eax,%eax,1)
  10197a:	00 00                	add    %al,(%eax)
  10197c:	58                   	pop    %eax
  10197d:	00 00                	add    %al,(%eax)
  10197f:	00 cc                	add    %cl,%ah
  101981:	e6 ff                	out    %al,$0xff
  101983:	ff                   	(bad)  
  101984:	d8 00                	fadds  (%eax)
  101986:	00 00                	add    %al,(%eax)
  101988:	00 41 0e             	add    %al,0xe(%ecx)
  10198b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101991:	46                   	inc    %esi
  101992:	87 03                	xchg   %eax,(%ebx)
  101994:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101997:	05 02 a8 0a c3       	add    $0xc30aa802,%eax
  10199c:	41                   	inc    %ecx
  10199d:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1019a1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1019a4:	04 44                	add    $0x44,%al
  1019a6:	0b 58 0a             	or     0xa(%eax),%ebx
  1019a9:	c3                   	ret    
  1019aa:	41                   	inc    %ecx
  1019ab:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1019af:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1019b2:	04 41                	add    $0x41,%al
  1019b4:	0b 00                	or     (%eax),%eax
  1019b6:	00 00                	add    %al,(%eax)
  1019b8:	20 00                	and    %al,(%eax)
  1019ba:	00 00                	add    %al,(%eax)
  1019bc:	98                   	cwtl   
  1019bd:	00 00                	add    %al,(%eax)
  1019bf:	00 64 e7 ff          	add    %ah,-0x1(%edi,%eiz,8)
  1019c3:	ff 23                	jmp    *(%ebx)
  1019c5:	00 00                	add    %al,(%eax)
  1019c7:	00 00                	add    %al,(%eax)
  1019c9:	41                   	inc    %ecx
  1019ca:	0e                   	push   %cs
  1019cb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019d1:	44                   	inc    %esp
  1019d2:	83 03 5b             	addl   $0x5b,(%ebx)
  1019d5:	c5 c3 0c             	(bad)  
  1019d8:	04 04                	add    $0x4,%al
  1019da:	00 00                	add    %al,(%eax)
  1019dc:	1c 00                	sbb    $0x0,%al
  1019de:	00 00                	add    %al,(%eax)
  1019e0:	bc 00 00 00 64       	mov    $0x64000000,%esp
  1019e5:	e7 ff                	out    %eax,$0xff
  1019e7:	ff 21                	jmp    *(%ecx)
  1019e9:	00 00                	add    %al,(%eax)
  1019eb:	00 00                	add    %al,(%eax)
  1019ed:	41                   	inc    %ecx
  1019ee:	0e                   	push   %cs
  1019ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1019f5:	5d                   	pop    %ebp
  1019f6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1019f9:	04 00                	add    $0x0,%al
  1019fb:	00 24 00             	add    %ah,(%eax,%eax,1)
  1019fe:	00 00                	add    %al,(%eax)
  101a00:	dc 00                	faddl  (%eax)
  101a02:	00 00                	add    %al,(%eax)
  101a04:	68 e7 ff ff 42       	push   $0x42ffffe7
  101a09:	00 00                	add    %al,(%eax)
  101a0b:	00 00                	add    %al,(%eax)
  101a0d:	41                   	inc    %ecx
  101a0e:	0e                   	push   %cs
  101a0f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a15:	78 0a                	js     101a21 <asmDoIrq+0x1d1>
  101a17:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101a1a:	04 45                	add    $0x45,%al
  101a1c:	0b 41 c5             	or     -0x3b(%ecx),%eax
  101a1f:	0c 04                	or     $0x4,%al
  101a21:	04 00                	add    $0x0,%al
  101a23:	00 28                	add    %ch,(%eax)
  101a25:	00 00                	add    %al,(%eax)
  101a27:	00 04 01             	add    %al,(%ecx,%eax,1)
  101a2a:	00 00                	add    %al,(%eax)
  101a2c:	84 e7                	test   %ah,%bh
  101a2e:	ff                   	(bad)  
  101a2f:	ff f4                	push   %esp
  101a31:	00 00                	add    %al,(%eax)
  101a33:	00 00                	add    %al,(%eax)
  101a35:	41                   	inc    %ecx
  101a36:	0e                   	push   %cs
  101a37:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a3d:	46                   	inc    %esi
  101a3e:	87 03                	xchg   %eax,(%ebx)
  101a40:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101a43:	05 02 e3 c3 41       	add    $0x41c3e302,%eax
  101a48:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101a4c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101a4f:	04 28                	add    $0x28,%al
  101a51:	00 00                	add    %al,(%eax)
  101a53:	00 30                	add    %dh,(%eax)
  101a55:	01 00                	add    %eax,(%eax)
  101a57:	00 4c e8 ff          	add    %cl,-0x1(%eax,%ebp,8)
  101a5b:	ff 6b 00             	ljmp   *0x0(%ebx)
  101a5e:	00 00                	add    %al,(%eax)
  101a60:	00 41 0e             	add    %al,0xe(%ecx)
  101a63:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a69:	46                   	inc    %esi
  101a6a:	87 03                	xchg   %eax,(%ebx)
  101a6c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101a6f:	05 02 5a c3 41       	add    $0x41c35a02,%eax
  101a74:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101a78:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101a7b:	04 1c                	add    $0x1c,%al
  101a7d:	00 00                	add    %al,(%eax)
  101a7f:	00 5c 01 00          	add    %bl,0x0(%ecx,%eax,1)
  101a83:	00 8c e8 ff ff 2d 00 	add    %cl,0x2dffff(%eax,%ebp,8)
  101a8a:	00 00                	add    %al,(%eax)
  101a8c:	00 41 0e             	add    %al,0xe(%ecx)
  101a8f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101a95:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  101a99:	04 00                	add    $0x0,%al
  101a9b:	00 24 00             	add    %ah,(%eax,%eax,1)
  101a9e:	00 00                	add    %al,(%eax)
  101aa0:	7c 01                	jl     101aa3 <asmDoIrq+0x253>
  101aa2:	00 00                	add    %al,(%eax)
  101aa4:	9c                   	pushf  
  101aa5:	e8 ff ff 62 00       	call   731aa9 <_end+0x42cae9>
  101aaa:	00 00                	add    %al,(%eax)
  101aac:	00 41 0e             	add    %al,0xe(%ecx)
  101aaf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ab5:	42                   	inc    %edx
  101ab6:	86 03                	xchg   %al,(%ebx)
  101ab8:	83 04 02 5a          	addl   $0x5a,(%edx,%eax,1)
  101abc:	c3                   	ret    
  101abd:	41                   	inc    %ecx
  101abe:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101ac2:	04 04                	add    $0x4,%al
  101ac4:	28 00                	sub    %al,(%eax)
  101ac6:	00 00                	add    %al,(%eax)
  101ac8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  101ac9:	01 00                	add    %eax,(%eax)
  101acb:	00 d8                	add    %bl,%al
  101acd:	e8 ff ff 9c 00       	call   ad1ad1 <_end+0x7ccb11>
  101ad2:	00 00                	add    %al,(%eax)
  101ad4:	00 41 0e             	add    %al,0xe(%ecx)
  101ad7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101add:	42                   	inc    %edx
  101ade:	83 03 02             	addl   $0x2,(%ebx)
  101ae1:	77 0a                	ja     101aed <asmDoIrq+0x29d>
  101ae3:	c5 c3 0c             	(bad)  
  101ae6:	04 04                	add    $0x4,%al
  101ae8:	44                   	inc    %esp
  101ae9:	0b 5b c3             	or     -0x3d(%ebx),%ebx
  101aec:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101aef:	04 38                	add    $0x38,%al
  101af1:	00 00                	add    %al,(%eax)
  101af3:	00 d0                	add    %dl,%al
  101af5:	01 00                	add    %eax,(%eax)
  101af7:	00 48 e9             	add    %cl,-0x17(%eax)
  101afa:	ff                   	(bad)  
  101afb:	ff b7 00 00 00 00    	pushl  0x0(%edi)
  101b01:	41                   	inc    %ecx
  101b02:	0e                   	push   %cs
  101b03:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101b09:	46                   	inc    %esi
  101b0a:	87 03                	xchg   %eax,(%ebx)
  101b0c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101b0f:	05 02 7b 0a c3       	add    $0xc30a7b02,%eax
  101b14:	41                   	inc    %ecx
  101b15:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101b19:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101b1c:	04 41                	add    $0x41,%al
  101b1e:	0b 6b c3             	or     -0x3d(%ebx),%ebp
  101b21:	41                   	inc    %ecx
  101b22:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101b26:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101b29:	04 00                	add    $0x0,%al
  101b2b:	00 28                	add    %ch,(%eax)
  101b2d:	00 00                	add    %al,(%eax)
  101b2f:	00 0c 02             	add    %cl,(%edx,%eax,1)
  101b32:	00 00                	add    %al,(%eax)
  101b34:	c4                   	(bad)  
  101b35:	e9 ff ff 96 00       	jmp    a71b39 <_end+0x76cb79>
  101b3a:	00 00                	add    %al,(%eax)
  101b3c:	00 41 0e             	add    %al,0xe(%ecx)
  101b3f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101b45:	42                   	inc    %edx
  101b46:	83 03 02             	addl   $0x2,(%ebx)
  101b49:	77 0a                	ja     101b55 <asmDoIrq+0x305>
  101b4b:	c5 c3 0c             	(bad)  
  101b4e:	04 04                	add    $0x4,%al
  101b50:	44                   	inc    %esp
  101b51:	0b 55 c3             	or     -0x3d(%ebp),%edx
  101b54:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101b57:	04 68                	add    $0x68,%al
  101b59:	00 00                	add    %al,(%eax)
  101b5b:	00 38                	add    %bh,(%eax)
  101b5d:	02 00                	add    (%eax),%al
  101b5f:	00 30                	add    %dh,(%eax)
  101b61:	ea ff ff 9f 00 00 00 	ljmp   $0x0,$0x9fffff
  101b68:	00 41 0e             	add    %al,0xe(%ecx)
  101b6b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101b71:	42                   	inc    %edx
  101b72:	83 03 5a             	addl   $0x5a,(%ebx)
  101b75:	0a c5                	or     %ch,%al
  101b77:	c3                   	ret    
  101b78:	0c 04                	or     $0x4,%al
  101b7a:	04 45                	add    $0x45,%al
  101b7c:	0b 47 0a             	or     0xa(%edi),%eax
  101b7f:	c5 c3 0c             	(bad)  
  101b82:	04 04                	add    $0x4,%al
  101b84:	45                   	inc    %ebp
  101b85:	0b 47 0a             	or     0xa(%edi),%eax
  101b88:	c5 c3 0c             	(bad)  
  101b8b:	04 04                	add    $0x4,%al
  101b8d:	45                   	inc    %ebp
  101b8e:	0b 47 0a             	or     0xa(%edi),%eax
  101b91:	c5 c3 0c             	(bad)  
  101b94:	04 04                	add    $0x4,%al
  101b96:	45                   	inc    %ebp
  101b97:	0b 59 0a             	or     0xa(%ecx),%ebx
  101b9a:	c5 c3 0c             	(bad)  
  101b9d:	04 04                	add    $0x4,%al
  101b9f:	43                   	inc    %ebx
  101ba0:	0b 47 0a             	or     0xa(%edi),%eax
  101ba3:	c5 c3 0c             	(bad)  
  101ba6:	04 04                	add    $0x4,%al
  101ba8:	45                   	inc    %ebp
  101ba9:	0b 47 0a             	or     0xa(%edi),%eax
  101bac:	c5 c3 0c             	(bad)  
  101baf:	04 04                	add    $0x4,%al
  101bb1:	45                   	inc    %ebp
  101bb2:	0b 47 0a             	or     0xa(%edi),%eax
  101bb5:	c5 c3 0c             	(bad)  
  101bb8:	04 04                	add    $0x4,%al
  101bba:	45                   	inc    %ebp
  101bbb:	0b 56 c3             	or     -0x3d(%esi),%edx
  101bbe:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101bc1:	04 00                	add    $0x0,%al
  101bc3:	00 20                	add    %ah,(%eax)
  101bc5:	00 00                	add    %al,(%eax)
  101bc7:	00 a4 02 00 00 64 ea 	add    %ah,-0x159c0000(%edx,%eax,1)
  101bce:	ff                   	(bad)  
  101bcf:	ff 98 00 00 00 00    	lcall  *0x0(%eax)
  101bd5:	41                   	inc    %ecx
  101bd6:	0e                   	push   %cs
  101bd7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101bdd:	7e 0a                	jle    101be9 <asmDoIrq+0x399>
  101bdf:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101be2:	04 43                	add    $0x43,%al
  101be4:	0b 00                	or     (%eax),%eax
  101be6:	00 00                	add    %al,(%eax)
  101be8:	28 00                	sub    %al,(%eax)
  101bea:	00 00                	add    %al,(%eax)
  101bec:	c8 02 00 00          	enter  $0x2,$0x0
  101bf0:	d8 ea                	fsubr  %st(2),%st
  101bf2:	ff                   	(bad)  
  101bf3:	ff 84 00 00 00 00 41 	incl   0x41000000(%eax,%eax,1)
  101bfa:	0e                   	push   %cs
  101bfb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c01:	42                   	inc    %edx
  101c02:	86 03                	xchg   %al,(%ebx)
  101c04:	83 04 02 5c          	addl   $0x5c,(%edx,%eax,1)
  101c08:	0a c3                	or     %bl,%al
  101c0a:	41                   	inc    %ecx
  101c0b:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101c0f:	04 04                	add    $0x4,%al
  101c11:	41                   	inc    %ecx
  101c12:	0b 00                	or     (%eax),%eax
  101c14:	2c 00                	sub    $0x0,%al
  101c16:	00 00                	add    %al,(%eax)
  101c18:	f4                   	hlt    
  101c19:	02 00                	add    (%eax),%al
  101c1b:	00 30                	add    %dh,(%eax)
  101c1d:	eb ff                	jmp    101c1e <asmDoIrq+0x3ce>
  101c1f:	ff                   	(bad)  
  101c20:	7b 00                	jnp    101c22 <asmDoIrq+0x3d2>
  101c22:	00 00                	add    %al,(%eax)
  101c24:	00 41 0e             	add    %al,0xe(%ecx)
  101c27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c2d:	42                   	inc    %edx
  101c2e:	83 03 4c             	addl   $0x4c,(%ebx)
  101c31:	0a c5                	or     %ch,%al
  101c33:	c3                   	ret    
  101c34:	0c 04                	or     $0x4,%al
  101c36:	04 43                	add    $0x43,%al
  101c38:	0b 02                	or     (%edx),%eax
  101c3a:	51                   	push   %ecx
  101c3b:	0a c5                	or     %ch,%al
  101c3d:	c3                   	ret    
  101c3e:	0c 04                	or     $0x4,%al
  101c40:	04 47                	add    $0x47,%al
  101c42:	0b 00                	or     (%eax),%eax
  101c44:	2c 00                	sub    $0x0,%al
  101c46:	00 00                	add    %al,(%eax)
  101c48:	24 03                	and    $0x3,%al
  101c4a:	00 00                	add    %al,(%eax)
  101c4c:	7c eb                	jl     101c39 <asmDoIrq+0x3e9>
  101c4e:	ff                   	(bad)  
  101c4f:	ff 6f 00             	ljmp   *0x0(%edi)
  101c52:	00 00                	add    %al,(%eax)
  101c54:	00 41 0e             	add    %al,0xe(%ecx)
  101c57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c5d:	42                   	inc    %edx
  101c5e:	83 03 52             	addl   $0x52,(%ebx)
  101c61:	0a c5                	or     %ch,%al
  101c63:	c3                   	ret    
  101c64:	0c 04                	or     $0x4,%al
  101c66:	04 41                	add    $0x41,%al
  101c68:	0b 7b 0a             	or     0xa(%ebx),%edi
  101c6b:	c5 c3 0c             	(bad)  
  101c6e:	04 04                	add    $0x4,%al
  101c70:	45                   	inc    %ebp
  101c71:	0b 00                	or     (%eax),%eax
  101c73:	00 20                	add    %ah,(%eax)
  101c75:	00 00                	add    %al,(%eax)
  101c77:	00 54 03 00          	add    %dl,0x0(%ebx,%eax,1)
  101c7b:	00 bc eb ff ff dd 00 	add    %bh,0xddffff(%ebx,%ebp,8)
  101c82:	00 00                	add    %al,(%eax)
  101c84:	00 41 0e             	add    %al,0xe(%ecx)
  101c87:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101c8d:	41                   	inc    %ecx
  101c8e:	83 03 02             	addl   $0x2,(%ebx)
  101c91:	d7                   	xlat   %ds:(%ebx)
  101c92:	c3                   	ret    
  101c93:	41                   	inc    %ecx
  101c94:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101c97:	04 20                	add    $0x20,%al
  101c99:	00 00                	add    %al,(%eax)
  101c9b:	00 78 03             	add    %bh,0x3(%eax)
  101c9e:	00 00                	add    %al,(%eax)
  101ca0:	78 ec                	js     101c8e <asmDoIrq+0x43e>
  101ca2:	ff                   	(bad)  
  101ca3:	ff 2a                	ljmp   *(%edx)
  101ca5:	00 00                	add    %al,(%eax)
  101ca7:	00 00                	add    %al,(%eax)
  101ca9:	41                   	inc    %ecx
  101caa:	0e                   	push   %cs
  101cab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101cb1:	42                   	inc    %edx
  101cb2:	83 03 64             	addl   $0x64,(%ebx)
  101cb5:	c5 c3 0c             	(bad)  
  101cb8:	04 04                	add    $0x4,%al
  101cba:	00 00                	add    %al,(%eax)
  101cbc:	48                   	dec    %eax
  101cbd:	00 00                	add    %al,(%eax)
  101cbf:	00 9c 03 00 00 80 ec 	add    %bl,-0x13800000(%ebx,%eax,1)
  101cc6:	ff                   	(bad)  
  101cc7:	ff e0                	jmp    *%eax
  101cc9:	00 00                	add    %al,(%eax)
  101ccb:	00 00                	add    %al,(%eax)
  101ccd:	41                   	inc    %ecx
  101cce:	0e                   	push   %cs
  101ccf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101cd5:	46                   	inc    %esi
  101cd6:	87 03                	xchg   %eax,(%ebx)
  101cd8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101cdb:	05 02 81 0a c3       	add    $0xc30a8102,%eax
  101ce0:	41                   	inc    %ecx
  101ce1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101ce5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101ce8:	04 43                	add    $0x43,%al
  101cea:	0b 64 0a c3          	or     -0x3d(%edx,%ecx,1),%esp
  101cee:	41                   	inc    %ecx
  101cef:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101cf3:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101cf6:	04 41                	add    $0x41,%al
  101cf8:	0b 4b 0a             	or     0xa(%ebx),%ecx
  101cfb:	c3                   	ret    
  101cfc:	41                   	inc    %ecx
  101cfd:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101d01:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101d04:	04 46                	add    $0x46,%al
  101d06:	0b 00                	or     (%eax),%eax
  101d08:	30 00                	xor    %al,(%eax)
  101d0a:	00 00                	add    %al,(%eax)
  101d0c:	e8 03 00 00 14       	call   14101d14 <_end+0x13dfcd54>
  101d11:	ed                   	in     (%dx),%eax
  101d12:	ff                   	(bad)  
  101d13:	ff                   	(bad)  
  101d14:	7e 00                	jle    101d16 <asmDoIrq+0x4c6>
  101d16:	00 00                	add    %al,(%eax)
  101d18:	00 41 0e             	add    %al,0xe(%ecx)
  101d1b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d21:	45                   	inc    %ebp
  101d22:	86 03                	xchg   %al,(%ebx)
  101d24:	83 04 02 5e          	addl   $0x5e,(%edx,%eax,1)
  101d28:	0a c3                	or     %bl,%al
  101d2a:	41                   	inc    %ecx
  101d2b:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101d2f:	04 04                	add    $0x4,%al
  101d31:	44                   	inc    %esp
  101d32:	0b 4b c3             	or     -0x3d(%ebx),%ecx
  101d35:	41                   	inc    %ecx
  101d36:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101d3a:	04 04                	add    $0x4,%al
  101d3c:	2c 00                	sub    $0x0,%al
  101d3e:	00 00                	add    %al,(%eax)
  101d40:	1c 04                	sbb    $0x4,%al
  101d42:	00 00                	add    %al,(%eax)
  101d44:	60                   	pusha  
  101d45:	ed                   	in     (%dx),%eax
  101d46:	ff                   	(bad)  
  101d47:	ff 12                	call   *(%edx)
  101d49:	01 00                	add    %eax,(%eax)
  101d4b:	00 00                	add    %al,(%eax)
  101d4d:	41                   	inc    %ecx
  101d4e:	0e                   	push   %cs
  101d4f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d55:	49                   	dec    %ecx
  101d56:	87 03                	xchg   %eax,(%ebx)
  101d58:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101d5b:	05 02 85 0a c3       	add    $0xc30a8502,%eax
  101d60:	41                   	inc    %ecx
  101d61:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101d65:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101d68:	04 44                	add    $0x44,%al
  101d6a:	0b 00                	or     (%eax),%eax
  101d6c:	1c 00                	sbb    $0x0,%al
  101d6e:	00 00                	add    %al,(%eax)
  101d70:	4c                   	dec    %esp
  101d71:	04 00                	add    $0x0,%al
  101d73:	00 44 ee ff          	add    %al,-0x1(%esi,%ebp,8)
  101d77:	ff 55 00             	call   *0x0(%ebp)
  101d7a:	00 00                	add    %al,(%eax)
  101d7c:	00 41 0e             	add    %al,0xe(%ecx)
  101d7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101d85:	02 51 c5             	add    -0x3b(%ecx),%dl
  101d88:	0c 04                	or     $0x4,%al
  101d8a:	04 00                	add    $0x0,%al
  101d8c:	1c 00                	sbb    $0x0,%al
  101d8e:	00 00                	add    %al,(%eax)
  101d90:	6c                   	insb   (%dx),%es:(%edi)
  101d91:	04 00                	add    $0x0,%al
  101d93:	00 7c ee ff          	add    %bh,-0x1(%esi,%ebp,8)
  101d97:	ff                   	(bad)  
  101d98:	3d 00 00 00 00       	cmp    $0x0,%eax
  101d9d:	41                   	inc    %ecx
  101d9e:	0e                   	push   %cs
  101d9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101da5:	79 c5                	jns    101d6c <asmDoIrq+0x51c>
  101da7:	0c 04                	or     $0x4,%al
  101da9:	04 00                	add    $0x0,%al
  101dab:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101dae:	00 00                	add    %al,(%eax)
  101db0:	8c 04 00             	mov    %es,(%eax,%eax,1)
  101db3:	00 9c ee ff ff 1b 00 	add    %bl,0x1bffff(%esi,%ebp,8)
  101dba:	00 00                	add    %al,(%eax)
  101dbc:	00 41 0e             	add    %al,0xe(%ecx)
  101dbf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101dc5:	57                   	push   %edi
  101dc6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101dc9:	04 00                	add    $0x0,%al
  101dcb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101dce:	00 00                	add    %al,(%eax)
  101dd0:	ac                   	lods   %ds:(%esi),%al
  101dd1:	04 00                	add    $0x0,%al
  101dd3:	00 98 ee ff ff 18    	add    %bl,0x18ffffee(%eax)
  101dd9:	00 00                	add    %al,(%eax)
  101ddb:	00 00                	add    %al,(%eax)
  101ddd:	41                   	inc    %ecx
  101dde:	0e                   	push   %cs
  101ddf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101de5:	54                   	push   %esp
  101de6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101de9:	04 00                	add    $0x0,%al
  101deb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101dee:	00 00                	add    %al,(%eax)
  101df0:	cc                   	int3   
  101df1:	04 00                	add    $0x0,%al
  101df3:	00 90 ee ff ff 12    	add    %dl,0x12ffffee(%eax)
  101df9:	00 00                	add    %al,(%eax)
  101dfb:	00 00                	add    %al,(%eax)
  101dfd:	41                   	inc    %ecx
  101dfe:	0e                   	push   %cs
  101dff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e05:	4e                   	dec    %esi
  101e06:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101e09:	04 00                	add    $0x0,%al
  101e0b:	00 20                	add    %ah,(%eax)
  101e0d:	00 00                	add    %al,(%eax)
  101e0f:	00 ec                	add    %ch,%ah
  101e11:	04 00                	add    $0x0,%al
  101e13:	00 84 ee ff ff 75 00 	add    %al,0x75ffff(%esi,%ebp,8)
  101e1a:	00 00                	add    %al,(%eax)
  101e1c:	00 41 0e             	add    %al,0xe(%ecx)
  101e1f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e25:	41                   	inc    %ecx
  101e26:	83 03 02             	addl   $0x2,(%ebx)
  101e29:	6f                   	outsl  %ds:(%esi),(%dx)
  101e2a:	c3                   	ret    
  101e2b:	41                   	inc    %ecx
  101e2c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101e2f:	04 1c                	add    $0x1c,%al
  101e31:	00 00                	add    %al,(%eax)
  101e33:	00 10                	add    %dl,(%eax)
  101e35:	05 00 00 d8 ee       	add    $0xeed80000,%eax
  101e3a:	ff                   	(bad)  
  101e3b:	ff                   	(bad)  
  101e3c:	79 01                	jns    101e3f <asmDoIrq+0x5ef>
  101e3e:	00 00                	add    %al,(%eax)
  101e40:	00 41 0e             	add    %al,0xe(%ecx)
  101e43:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e49:	03 75 01             	add    0x1(%ebp),%esi
  101e4c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101e4f:	04 1c                	add    $0x1c,%al
  101e51:	00 00                	add    %al,(%eax)
  101e53:	00 30                	add    %dh,(%eax)
  101e55:	05 00 00 34 f0       	add    $0xf0340000,%eax
  101e5a:	ff                   	(bad)  
  101e5b:	ff 27                	jmp    *(%edi)
  101e5d:	00 00                	add    %al,(%eax)
  101e5f:	00 00                	add    %al,(%eax)
  101e61:	41                   	inc    %ecx
  101e62:	0e                   	push   %cs
  101e63:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e69:	63 c5                	arpl   %ax,%bp
  101e6b:	0c 04                	or     $0x4,%al
  101e6d:	04 00                	add    $0x0,%al
  101e6f:	00 28                	add    %ch,(%eax)
  101e71:	00 00                	add    %al,(%eax)
  101e73:	00 50 05             	add    %dl,0x5(%eax)
  101e76:	00 00                	add    %al,(%eax)
  101e78:	3c f0                	cmp    $0xf0,%al
  101e7a:	ff                   	(bad)  
  101e7b:	ff d2                	call   *%edx
  101e7d:	00 00                	add    %al,(%eax)
  101e7f:	00 00                	add    %al,(%eax)
  101e81:	41                   	inc    %ecx
  101e82:	0e                   	push   %cs
  101e83:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101e89:	46                   	inc    %esi
  101e8a:	87 03                	xchg   %eax,(%ebx)
  101e8c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101e8f:	05 02 c5 c3 41       	add    $0x41c3c502,%eax
  101e94:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101e98:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101e9b:	04 28                	add    $0x28,%al
  101e9d:	00 00                	add    %al,(%eax)
  101e9f:	00 7c 05 00          	add    %bh,0x0(%ebp,%eax,1)
  101ea3:	00 e4                	add    %ah,%ah
  101ea5:	f0 ff                	lock (bad) 
  101ea7:	ff 46 01             	incl   0x1(%esi)
  101eaa:	00 00                	add    %al,(%eax)
  101eac:	00 41 0e             	add    %al,0xe(%ecx)
  101eaf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101eb5:	42                   	inc    %edx
  101eb6:	86 03                	xchg   %al,(%ebx)
  101eb8:	83 04 03 01          	addl   $0x1,(%ebx,%eax,1)
  101ebc:	01 0a                	add    %ecx,(%edx)
  101ebe:	c3                   	ret    
  101ebf:	41                   	inc    %ecx
  101ec0:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101ec4:	04 04                	add    $0x4,%al
  101ec6:	44                   	inc    %esp
  101ec7:	0b 18                	or     (%eax),%ebx
  101ec9:	00 00                	add    %al,(%eax)
  101ecb:	00 a8 05 00 00 00    	add    %ch,0x5(%eax)
  101ed1:	f2 ff                	repnz (bad) 
  101ed3:	ff 07                	incl   (%edi)
  101ed5:	00 00                	add    %al,(%eax)
  101ed7:	00 00                	add    %al,(%eax)
  101ed9:	41                   	inc    %ecx
  101eda:	0e                   	push   %cs
  101edb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ee1:	00 00                	add    %al,(%eax)
  101ee3:	00 2c 00             	add    %ch,(%eax,%eax,1)
  101ee6:	00 00                	add    %al,(%eax)
  101ee8:	c4 05 00 00 ec f1    	les    0xf1ec0000,%eax
  101eee:	ff                   	(bad)  
  101eef:	ff 65 01             	jmp    *0x1(%ebp)
  101ef2:	00 00                	add    %al,(%eax)
  101ef4:	00 41 0e             	add    %al,0xe(%ecx)
  101ef7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101efd:	43                   	inc    %ebx
  101efe:	87 03                	xchg   %eax,(%ebx)
  101f00:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101f03:	05 03 5b 01 c3       	add    $0xc3015b03,%eax
  101f08:	41                   	inc    %ecx
  101f09:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101f0d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101f10:	04 00                	add    $0x0,%al
  101f12:	00 00                	add    %al,(%eax)
  101f14:	24 00                	and    $0x0,%al
  101f16:	00 00                	add    %al,(%eax)
  101f18:	f4                   	hlt    
  101f19:	05 00 00 24 f3       	add    $0xf3240000,%eax
  101f1e:	ff                   	(bad)  
  101f1f:	ff 30                	pushl  (%eax)
  101f21:	00 00                	add    %al,(%eax)
  101f23:	00 00                	add    %al,(%eax)
  101f25:	41                   	inc    %ecx
  101f26:	0e                   	push   %cs
  101f27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f2d:	5f                   	pop    %edi
  101f2e:	0a c5                	or     %ch,%al
  101f30:	0c 04                	or     $0x4,%al
  101f32:	04 42                	add    $0x42,%al
  101f34:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  101f37:	0c 04                	or     $0x4,%al
  101f39:	04 00                	add    $0x0,%al
  101f3b:	00 24 00             	add    %ah,(%eax,%eax,1)
  101f3e:	00 00                	add    %al,(%eax)
  101f40:	1c 06                	sbb    $0x6,%al
  101f42:	00 00                	add    %al,(%eax)
  101f44:	2c f3                	sub    $0xf3,%al
  101f46:	ff                   	(bad)  
  101f47:	ff 30                	pushl  (%eax)
  101f49:	00 00                	add    %al,(%eax)
  101f4b:	00 00                	add    %al,(%eax)
  101f4d:	41                   	inc    %ecx
  101f4e:	0e                   	push   %cs
  101f4f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f55:	5f                   	pop    %edi
  101f56:	0a c5                	or     %ch,%al
  101f58:	0c 04                	or     $0x4,%al
  101f5a:	04 42                	add    $0x42,%al
  101f5c:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  101f5f:	0c 04                	or     $0x4,%al
  101f61:	04 00                	add    $0x0,%al
  101f63:	00 1c 00             	add    %bl,(%eax,%eax,1)
  101f66:	00 00                	add    %al,(%eax)
  101f68:	44                   	inc    %esp
  101f69:	06                   	push   %es
  101f6a:	00 00                	add    %al,(%eax)
  101f6c:	34 f3                	xor    $0xf3,%al
  101f6e:	ff                   	(bad)  
  101f6f:	ff 5d 00             	lcall  *0x0(%ebp)
  101f72:	00 00                	add    %al,(%eax)
  101f74:	00 41 0e             	add    %al,0xe(%ecx)
  101f77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f7d:	02 59 c5             	add    -0x3b(%ecx),%bl
  101f80:	0c 04                	or     $0x4,%al
  101f82:	04 00                	add    $0x0,%al
  101f84:	2c 00                	sub    $0x0,%al
  101f86:	00 00                	add    %al,(%eax)
  101f88:	64 06                	fs push %es
  101f8a:	00 00                	add    %al,(%eax)
  101f8c:	74 f3                	je     101f81 <asmDoIrq+0x731>
  101f8e:	ff                   	(bad)  
  101f8f:	ff 8e 01 00 00 00    	decl   0x1(%esi)
  101f95:	41                   	inc    %ecx
  101f96:	0e                   	push   %cs
  101f97:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101f9d:	44                   	inc    %esp
  101f9e:	87 03                	xchg   %eax,(%ebx)
  101fa0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  101fa3:	05 02 f4 0a c3       	add    $0xc30af402,%eax
  101fa8:	41                   	inc    %ecx
  101fa9:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  101fad:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  101fb0:	04 42                	add    $0x42,%al
  101fb2:	0b 00                	or     (%eax),%eax
  101fb4:	28 00                	sub    %al,(%eax)
  101fb6:	00 00                	add    %al,(%eax)
  101fb8:	94                   	xchg   %eax,%esp
  101fb9:	06                   	push   %es
  101fba:	00 00                	add    %al,(%eax)
  101fbc:	d4 f4                	aam    $0xf4
  101fbe:	ff                   	(bad)  
  101fbf:	ff 18                	lcall  *(%eax)
  101fc1:	01 00                	add    %eax,(%eax)
  101fc3:	00 00                	add    %al,(%eax)
  101fc5:	41                   	inc    %ecx
  101fc6:	0e                   	push   %cs
  101fc7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101fcd:	42                   	inc    %edx
  101fce:	86 03                	xchg   %al,(%ebx)
  101fd0:	83 04 02 a7          	addl   $0xffffffa7,(%edx,%eax,1)
  101fd4:	0a c3                	or     %bl,%al
  101fd6:	41                   	inc    %ecx
  101fd7:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  101fdb:	04 04                	add    $0x4,%al
  101fdd:	42                   	inc    %edx
  101fde:	0b 00                	or     (%eax),%eax
  101fe0:	18 00                	sbb    %al,(%eax)
  101fe2:	00 00                	add    %al,(%eax)
  101fe4:	c0 06 00             	rolb   $0x0,(%esi)
  101fe7:	00 c0                	add    %al,%al
  101fe9:	f5                   	cmc    
  101fea:	ff                   	(bad)  
  101feb:	ff 5b 00             	lcall  *0x0(%ebx)
  101fee:	00 00                	add    %al,(%eax)
  101ff0:	00 02                	add    %al,(%edx)
  101ff2:	54                   	push   %esp
  101ff3:	0e                   	push   %cs
  101ff4:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  101ffa:	00 00                	add    %al,(%eax)
  101ffc:	20 00                	and    %al,(%eax)
  101ffe:	00 00                	add    %al,(%eax)
  102000:	dc 06                	faddl  (%esi)
  102002:	00 00                	add    %al,(%eax)
  102004:	00 f6                	add    %dh,%dh
  102006:	ff                   	(bad)  
  102007:	ff 41 01             	incl   0x1(%ecx)
  10200a:	00 00                	add    %al,(%eax)
  10200c:	00 41 0e             	add    %al,0xe(%ecx)
  10200f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102015:	44                   	inc    %esp
  102016:	83 03 03             	addl   $0x3,(%ebx)
  102019:	39 01                	cmp    %eax,(%ecx)
  10201b:	c5 c3 0c             	(bad)  
  10201e:	04 04                	add    $0x4,%al
  102020:	1c 00                	sbb    $0x0,%al
  102022:	00 00                	add    %al,(%eax)
  102024:	00 07                	add    %al,(%edi)
  102026:	00 00                	add    %al,(%eax)
  102028:	20 f7                	and    %dh,%bh
  10202a:	ff                   	(bad)  
  10202b:	ff 55 00             	call   *0x0(%ebp)
  10202e:	00 00                	add    %al,(%eax)
  102030:	00 41 0e             	add    %al,0xe(%ecx)
  102033:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102039:	02 51 c5             	add    -0x3b(%ecx),%dl
  10203c:	0c 04                	or     $0x4,%al
  10203e:	04 00                	add    $0x0,%al
  102040:	1c 00                	sbb    $0x0,%al
  102042:	00 00                	add    %al,(%eax)
  102044:	20 07                	and    %al,(%edi)
  102046:	00 00                	add    %al,(%eax)
  102048:	58                   	pop    %eax
  102049:	f7 ff                	idiv   %edi
  10204b:	ff 97 00 00 00 00    	call   *0x0(%edi)
  102051:	41                   	inc    %ecx
  102052:	0e                   	push   %cs
  102053:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102059:	46                   	inc    %esi
  10205a:	87 03                	xchg   %eax,(%ebx)
  10205c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10205f:	05                   	.byte 0x5

Disassembly of section .data:

00103000 <buf.1287>:
  103000:	41                   	inc    %ecx
  103001:	73 73                	jae    103076 <buf.1287+0x76>
  103003:	65 72 74             	gs jb  10307a <buf.1287+0x7a>
  103006:	69 6f 6e 20 66 61 69 	imul   $0x69616620,0x6e(%edi),%ebp
  10300d:	6c                   	insb   (%dx),%es:(%edi)
  10300e:	65 64 3a 20          	gs cmp %fs:(%eax),%ah
	...

Disassembly of section .bss:

00103100 <__bss_start>:
  103100:	00 00                	add    %al,(%eax)
	...

00103104 <row>:
  103104:	00 00                	add    %al,(%eax)
	...

00103108 <endOfSem>:
  103108:	00 00                	add    %al,(%eax)
	...

0010310c <data.1016>:
	...

00103114 <data.1103>:
	...

0010311c <endOfPCB>:
  10311c:	00 00                	add    %al,(%eax)
	...

00103120 <data.1103>:
	...

00103128 <buf.1272>:
	...

00103160 <semaphoreTable>:
	...

001031e0 <idt>:
	...

001039e0 <gdt>:
	...

00103a20 <tss>:
	...

00103aa0 <processTable>:
	...

003047a0 <blocked>:
  3047a0:	00 00                	add    %al,(%eax)
	...

003047a4 <current>:
  3047a4:	00 00                	add    %al,(%eax)
	...

003047a8 <runnable>:
  3047a8:	00 00                	add    %al,(%eax)
	...

003047ac <erunnable>:
  3047ac:	00 00                	add    %al,(%eax)
	...

003047b0 <eblocked>:
	...

003047c0 <blockBitmap>:
	...

003049c0 <groupDesc>:
	...

00304bc0 <superBlock>:
	...

00304dc0 <inodeBitmap>:
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

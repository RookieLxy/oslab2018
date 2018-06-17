
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 6d 0f 00 00       	call   100f78 <initSerial>
  10000b:	e8 b4 0c 00 00       	call   100cc4 <initIdt>
  100010:	e8 0b 0f 00 00       	call   100f20 <initIntr>
  100015:	e8 ba 0f 00 00       	call   100fd4 <initTimer>
  10001a:	e8 d1 10 00 00       	call   1010f0 <initSeg>
  10001f:	e8 70 12 00 00       	call   101294 <loadUMain>
  100024:	eb fe                	jmp    100024 <kEntry+0x24>
  100026:	66 90                	xchg   %ax,%ax

00100028 <strcpy>:
  100028:	55                   	push   %ebp
  100029:	89 e5                	mov    %esp,%ebp
  10002b:	8b 45 08             	mov    0x8(%ebp),%eax
  10002e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100031:	8a 11                	mov    (%ecx),%dl
  100033:	84 d2                	test   %dl,%dl
  100035:	74 0b                	je     100042 <strcpy+0x1a>
  100037:	90                   	nop
  100038:	88 10                	mov    %dl,(%eax)
  10003a:	41                   	inc    %ecx
  10003b:	40                   	inc    %eax
  10003c:	8a 11                	mov    (%ecx),%dl
  10003e:	84 d2                	test   %dl,%dl
  100040:	75 f6                	jne    100038 <strcpy+0x10>
  100042:	c6 00 00             	movb   $0x0,(%eax)
  100045:	5d                   	pop    %ebp
  100046:	c3                   	ret    
  100047:	90                   	nop

00100048 <strcmp>:
  100048:	55                   	push   %ebp
  100049:	89 e5                	mov    %esp,%ebp
  10004b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10004e:	8b 55 0c             	mov    0xc(%ebp),%edx
  100051:	0f b6 01             	movzbl (%ecx),%eax
  100054:	84 c0                	test   %al,%al
  100056:	75 0d                	jne    100065 <strcmp+0x1d>
  100058:	eb 16                	jmp    100070 <strcmp+0x28>
  10005a:	66 90                	xchg   %ax,%ax
  10005c:	41                   	inc    %ecx
  10005d:	42                   	inc    %edx
  10005e:	0f b6 01             	movzbl (%ecx),%eax
  100061:	84 c0                	test   %al,%al
  100063:	74 0b                	je     100070 <strcmp+0x28>
  100065:	3a 02                	cmp    (%edx),%al
  100067:	74 f3                	je     10005c <strcmp+0x14>
  100069:	0f b6 12             	movzbl (%edx),%edx
  10006c:	29 d0                	sub    %edx,%eax
  10006e:	5d                   	pop    %ebp
  10006f:	c3                   	ret    
  100070:	31 c0                	xor    %eax,%eax
  100072:	0f b6 12             	movzbl (%edx),%edx
  100075:	29 d0                	sub    %edx,%eax
  100077:	5d                   	pop    %ebp
  100078:	c3                   	ret    
  100079:	8d 76 00             	lea    0x0(%esi),%esi

0010007c <strchr>:
  10007c:	55                   	push   %ebp
  10007d:	89 e5                	mov    %esp,%ebp
  10007f:	53                   	push   %ebx
  100080:	8b 45 08             	mov    0x8(%ebp),%eax
  100083:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100086:	0f be 10             	movsbl (%eax),%edx
  100089:	84 d2                	test   %dl,%dl
  10008b:	74 16                	je     1000a3 <strchr+0x27>
  10008d:	88 d9                	mov    %bl,%cl
  10008f:	38 da                	cmp    %bl,%dl
  100091:	75 09                	jne    10009c <strchr+0x20>
  100093:	eb 10                	jmp    1000a5 <strchr+0x29>
  100095:	8d 76 00             	lea    0x0(%esi),%esi
  100098:	38 ca                	cmp    %cl,%dl
  10009a:	74 10                	je     1000ac <strchr+0x30>
  10009c:	40                   	inc    %eax
  10009d:	8a 10                	mov    (%eax),%dl
  10009f:	84 d2                	test   %dl,%dl
  1000a1:	75 f5                	jne    100098 <strchr+0x1c>
  1000a3:	31 d2                	xor    %edx,%edx
  1000a5:	39 d3                	cmp    %edx,%ebx
  1000a7:	75 0a                	jne    1000b3 <strchr+0x37>
  1000a9:	5b                   	pop    %ebx
  1000aa:	5d                   	pop    %ebp
  1000ab:	c3                   	ret    
  1000ac:	0f be d3             	movsbl %bl,%edx
  1000af:	39 d3                	cmp    %edx,%ebx
  1000b1:	74 f6                	je     1000a9 <strchr+0x2d>
  1000b3:	31 c0                	xor    %eax,%eax
  1000b5:	5b                   	pop    %ebx
  1000b6:	5d                   	pop    %ebp
  1000b7:	c3                   	ret    

001000b8 <strcspn>:
  1000b8:	55                   	push   %ebp
  1000b9:	89 e5                	mov    %esp,%ebp
  1000bb:	57                   	push   %edi
  1000bc:	56                   	push   %esi
  1000bd:	53                   	push   %ebx
  1000be:	8b 7d 08             	mov    0x8(%ebp),%edi
  1000c1:	8a 1f                	mov    (%edi),%bl
  1000c3:	84 db                	test   %bl,%bl
  1000c5:	74 33                	je     1000fa <strcspn+0x42>
  1000c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1000ca:	8a 00                	mov    (%eax),%al
  1000cc:	31 f6                	xor    %esi,%esi
  1000ce:	66 90                	xchg   %ax,%ax
  1000d0:	84 c0                	test   %al,%al
  1000d2:	74 17                	je     1000eb <strcspn+0x33>
  1000d4:	38 d8                	cmp    %bl,%al
  1000d6:	74 1b                	je     1000f3 <strcspn+0x3b>
  1000d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000db:	eb 07                	jmp    1000e4 <strcspn+0x2c>
  1000dd:	8d 76 00             	lea    0x0(%esi),%esi
  1000e0:	38 d9                	cmp    %bl,%cl
  1000e2:	74 0f                	je     1000f3 <strcspn+0x3b>
  1000e4:	42                   	inc    %edx
  1000e5:	8a 0a                	mov    (%edx),%cl
  1000e7:	84 c9                	test   %cl,%cl
  1000e9:	75 f5                	jne    1000e0 <strcspn+0x28>
  1000eb:	46                   	inc    %esi
  1000ec:	8a 1c 37             	mov    (%edi,%esi,1),%bl
  1000ef:	84 db                	test   %bl,%bl
  1000f1:	75 dd                	jne    1000d0 <strcspn+0x18>
  1000f3:	89 f0                	mov    %esi,%eax
  1000f5:	5b                   	pop    %ebx
  1000f6:	5e                   	pop    %esi
  1000f7:	5f                   	pop    %edi
  1000f8:	5d                   	pop    %ebp
  1000f9:	c3                   	ret    
  1000fa:	31 f6                	xor    %esi,%esi
  1000fc:	eb f5                	jmp    1000f3 <strcspn+0x3b>
  1000fe:	66 90                	xchg   %ax,%ax

00100100 <strspn>:
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	57                   	push   %edi
  100104:	56                   	push   %esi
  100105:	53                   	push   %ebx
  100106:	8b 7d 08             	mov    0x8(%ebp),%edi
  100109:	8a 1f                	mov    (%edi),%bl
  10010b:	84 db                	test   %bl,%bl
  10010d:	74 3c                	je     10014b <strspn+0x4b>
  10010f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100112:	8a 00                	mov    (%eax),%al
  100114:	31 f6                	xor    %esi,%esi
  100116:	66 90                	xchg   %ax,%ax
  100118:	84 c0                	test   %al,%al
  10011a:	74 17                	je     100133 <strspn+0x33>
  10011c:	38 d8                	cmp    %bl,%al
  10011e:	74 1c                	je     10013c <strspn+0x3c>
  100120:	8b 55 0c             	mov    0xc(%ebp),%edx
  100123:	eb 07                	jmp    10012c <strspn+0x2c>
  100125:	8d 76 00             	lea    0x0(%esi),%esi
  100128:	38 d9                	cmp    %bl,%cl
  10012a:	74 10                	je     10013c <strspn+0x3c>
  10012c:	42                   	inc    %edx
  10012d:	8a 0a                	mov    (%edx),%cl
  10012f:	84 c9                	test   %cl,%cl
  100131:	75 f5                	jne    100128 <strspn+0x28>
  100133:	89 f0                	mov    %esi,%eax
  100135:	5b                   	pop    %ebx
  100136:	5e                   	pop    %esi
  100137:	5f                   	pop    %edi
  100138:	5d                   	pop    %ebp
  100139:	c3                   	ret    
  10013a:	66 90                	xchg   %ax,%ax
  10013c:	46                   	inc    %esi
  10013d:	8a 1c 37             	mov    (%edi,%esi,1),%bl
  100140:	84 db                	test   %bl,%bl
  100142:	75 d4                	jne    100118 <strspn+0x18>
  100144:	89 f0                	mov    %esi,%eax
  100146:	5b                   	pop    %ebx
  100147:	5e                   	pop    %esi
  100148:	5f                   	pop    %edi
  100149:	5d                   	pop    %ebp
  10014a:	c3                   	ret    
  10014b:	31 f6                	xor    %esi,%esi
  10014d:	eb e4                	jmp    100133 <strspn+0x33>
  10014f:	90                   	nop

00100150 <strtok>:
  100150:	55                   	push   %ebp
  100151:	89 e5                	mov    %esp,%ebp
  100153:	57                   	push   %edi
  100154:	56                   	push   %esi
  100155:	53                   	push   %ebx
  100156:	8b 75 08             	mov    0x8(%ebp),%esi
  100159:	85 f6                	test   %esi,%esi
  10015b:	0f 84 95 00 00 00    	je     1001f6 <strtok+0xa6>
  100161:	89 35 60 46 10 00    	mov    %esi,0x104660
  100167:	8a 06                	mov    (%esi),%al
  100169:	84 c0                	test   %al,%al
  10016b:	0f 84 97 00 00 00    	je     100208 <strtok+0xb8>
  100171:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100174:	8a 1b                	mov    (%ebx),%bl
  100176:	31 ff                	xor    %edi,%edi
  100178:	84 db                	test   %bl,%bl
  10017a:	74 17                	je     100193 <strtok+0x43>
  10017c:	38 c3                	cmp    %al,%bl
  10017e:	74 68                	je     1001e8 <strtok+0x98>
  100180:	8b 55 0c             	mov    0xc(%ebp),%edx
  100183:	eb 07                	jmp    10018c <strtok+0x3c>
  100185:	8d 76 00             	lea    0x0(%esi),%esi
  100188:	38 c1                	cmp    %al,%cl
  10018a:	74 5c                	je     1001e8 <strtok+0x98>
  10018c:	42                   	inc    %edx
  10018d:	8a 0a                	mov    (%edx),%cl
  10018f:	84 c9                	test   %cl,%cl
  100191:	75 f5                	jne    100188 <strtok+0x38>
  100193:	01 f7                	add    %esi,%edi
  100195:	8a 07                	mov    (%edi),%al
  100197:	84 c0                	test   %al,%al
  100199:	74 6d                	je     100208 <strtok+0xb8>
  10019b:	31 f6                	xor    %esi,%esi
  10019d:	8d 76 00             	lea    0x0(%esi),%esi
  1001a0:	84 db                	test   %bl,%bl
  1001a2:	74 17                	je     1001bb <strtok+0x6b>
  1001a4:	38 c3                	cmp    %al,%bl
  1001a6:	74 1c                	je     1001c4 <strtok+0x74>
  1001a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001ab:	eb 07                	jmp    1001b4 <strtok+0x64>
  1001ad:	8d 76 00             	lea    0x0(%esi),%esi
  1001b0:	38 c1                	cmp    %al,%cl
  1001b2:	74 10                	je     1001c4 <strtok+0x74>
  1001b4:	42                   	inc    %edx
  1001b5:	8a 0a                	mov    (%edx),%cl
  1001b7:	84 c9                	test   %cl,%cl
  1001b9:	75 f5                	jne    1001b0 <strtok+0x60>
  1001bb:	46                   	inc    %esi
  1001bc:	8a 04 37             	mov    (%edi,%esi,1),%al
  1001bf:	84 c0                	test   %al,%al
  1001c1:	75 dd                	jne    1001a0 <strtok+0x50>
  1001c3:	90                   	nop
  1001c4:	01 fe                	add    %edi,%esi
  1001c6:	89 35 60 46 10 00    	mov    %esi,0x104660
  1001cc:	39 f7                	cmp    %esi,%edi
  1001ce:	74 38                	je     100208 <strtok+0xb8>
  1001d0:	80 3e 00             	cmpb   $0x0,(%esi)
  1001d3:	74 1d                	je     1001f2 <strtok+0xa2>
  1001d5:	c6 06 00             	movb   $0x0,(%esi)
  1001d8:	46                   	inc    %esi
  1001d9:	89 35 60 46 10 00    	mov    %esi,0x104660
  1001df:	89 fe                	mov    %edi,%esi
  1001e1:	89 f0                	mov    %esi,%eax
  1001e3:	5b                   	pop    %ebx
  1001e4:	5e                   	pop    %esi
  1001e5:	5f                   	pop    %edi
  1001e6:	5d                   	pop    %ebp
  1001e7:	c3                   	ret    
  1001e8:	47                   	inc    %edi
  1001e9:	8a 04 3e             	mov    (%esi,%edi,1),%al
  1001ec:	84 c0                	test   %al,%al
  1001ee:	75 88                	jne    100178 <strtok+0x28>
  1001f0:	eb a1                	jmp    100193 <strtok+0x43>
  1001f2:	31 f6                	xor    %esi,%esi
  1001f4:	eb e3                	jmp    1001d9 <strtok+0x89>
  1001f6:	8b 35 60 46 10 00    	mov    0x104660,%esi
  1001fc:	85 f6                	test   %esi,%esi
  1001fe:	0f 85 63 ff ff ff    	jne    100167 <strtok+0x17>
  100204:	eb db                	jmp    1001e1 <strtok+0x91>
  100206:	66 90                	xchg   %ax,%ax
  100208:	c7 05 60 46 10 00 00 	movl   $0x0,0x104660
  10020f:	00 00 00 
  100212:	31 f6                	xor    %esi,%esi
  100214:	eb cb                	jmp    1001e1 <strtok+0x91>
  100216:	66 90                	xchg   %ax,%ax

00100218 <memcpy>:
  100218:	55                   	push   %ebp
  100219:	89 e5                	mov    %esp,%ebp
  10021b:	56                   	push   %esi
  10021c:	53                   	push   %ebx
  10021d:	8b 45 08             	mov    0x8(%ebp),%eax
  100220:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100223:	8b 75 10             	mov    0x10(%ebp),%esi
  100226:	85 f6                	test   %esi,%esi
  100228:	74 0f                	je     100239 <memcpy+0x21>
  10022a:	31 d2                	xor    %edx,%edx
  10022c:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  10022f:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100232:	42                   	inc    %edx
  100233:	39 d6                	cmp    %edx,%esi
  100235:	75 f5                	jne    10022c <memcpy+0x14>
  100237:	01 f0                	add    %esi,%eax
  100239:	5b                   	pop    %ebx
  10023a:	5e                   	pop    %esi
  10023b:	5d                   	pop    %ebp
  10023c:	c3                   	ret    
  10023d:	8d 76 00             	lea    0x0(%esi),%esi

00100240 <memset>:
  100240:	55                   	push   %ebp
  100241:	89 e5                	mov    %esp,%ebp
  100243:	8b 55 08             	mov    0x8(%ebp),%edx
  100246:	8b 45 10             	mov    0x10(%ebp),%eax
  100249:	85 c0                	test   %eax,%eax
  10024b:	74 10                	je     10025d <memset+0x1d>
  10024d:	8a 4d 0c             	mov    0xc(%ebp),%cl
  100250:	01 d0                	add    %edx,%eax
  100252:	66 90                	xchg   %ax,%ax
  100254:	88 0a                	mov    %cl,(%edx)
  100256:	42                   	inc    %edx
  100257:	39 d0                	cmp    %edx,%eax
  100259:	75 f9                	jne    100254 <memset+0x14>
  10025b:	5d                   	pop    %ebp
  10025c:	c3                   	ret    
  10025d:	89 d0                	mov    %edx,%eax
  10025f:	5d                   	pop    %ebp
  100260:	c3                   	ret    
  100261:	66 90                	xchg   %ax,%ax
  100263:	90                   	nop

00100264 <GProtectFaultHandle>:
  100264:	55                   	push   %ebp
  100265:	89 e5                	mov    %esp,%ebp
  100267:	83 ec 14             	sub    $0x14,%esp
  10026a:	68 3c 28 10 00       	push   $0x10283c
  10026f:	e8 30 0b 00 00       	call   100da4 <printString>
  100274:	58                   	pop    %eax
  100275:	5a                   	pop    %edx
  100276:	6a 64                	push   $0x64
  100278:	68 51 28 10 00       	push   $0x102851
  10027d:	e8 ea 24 00 00       	call   10276c <abort>
  100282:	83 c4 10             	add    $0x10,%esp
  100285:	c9                   	leave  
  100286:	c3                   	ret    
  100287:	90                   	nop

00100288 <fsWrite>:
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	57                   	push   %edi
  10028c:	56                   	push   %esi
  10028d:	53                   	push   %ebx
  10028e:	83 ec 0c             	sub    $0xc,%esp
  100291:	8b 75 10             	mov    0x10(%ebp),%esi
  100294:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  100298:	7f 66                	jg     100300 <fsWrite+0x78>
  10029a:	85 f6                	test   %esi,%esi
  10029c:	74 58                	je     1002f6 <fsWrite+0x6e>
  10029e:	8b 55 0c             	mov    0xc(%ebp),%edx
  1002a1:	8d 3c 32             	lea    (%edx,%esi,1),%edi
  1002a4:	eb 33                	jmp    1002d9 <fsWrite+0x51>
  1002a6:	66 90                	xchg   %ax,%ax
  1002a8:	8b 0d 64 46 10 00    	mov    0x104664,%ecx
  1002ae:	83 f9 50             	cmp    $0x50,%ecx
  1002b1:	74 2e                	je     1002e1 <fsWrite+0x59>
  1002b3:	8b 1d 68 46 10 00    	mov    0x104668,%ebx
  1002b9:	8d 1c 9b             	lea    (%ebx,%ebx,4),%ebx
  1002bc:	c1 e3 04             	shl    $0x4,%ebx
  1002bf:	01 cb                	add    %ecx,%ebx
  1002c1:	80 cc 0c             	or     $0xc,%ah
  1002c4:	66 89 84 1b 00 80 0b 	mov    %ax,0xb8000(%ebx,%ebx,1)
  1002cb:	00 
  1002cc:	41                   	inc    %ecx
  1002cd:	89 0d 64 46 10 00    	mov    %ecx,0x104664
  1002d3:	4e                   	dec    %esi
  1002d4:	42                   	inc    %edx
  1002d5:	39 fa                	cmp    %edi,%edx
  1002d7:	74 1d                	je     1002f6 <fsWrite+0x6e>
  1002d9:	66 0f be 02          	movsbw (%edx),%ax
  1002dd:	3c 0a                	cmp    $0xa,%al
  1002df:	75 c7                	jne    1002a8 <fsWrite+0x20>
  1002e1:	ff 05 68 46 10 00    	incl   0x104668
  1002e7:	c7 05 64 46 10 00 00 	movl   $0x0,0x104664
  1002ee:	00 00 00 
  1002f1:	42                   	inc    %edx
  1002f2:	39 fa                	cmp    %edi,%edx
  1002f4:	75 e3                	jne    1002d9 <fsWrite+0x51>
  1002f6:	89 f0                	mov    %esi,%eax
  1002f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1002fb:	5b                   	pop    %ebx
  1002fc:	5e                   	pop    %esi
  1002fd:	5f                   	pop    %edi
  1002fe:	5d                   	pop    %ebp
  1002ff:	c3                   	ret    
  100300:	83 ec 08             	sub    $0x8,%esp
  100303:	6a 7e                	push   $0x7e
  100305:	68 51 28 10 00       	push   $0x102851
  10030a:	e8 5d 24 00 00       	call   10276c <abort>
  10030f:	83 c4 10             	add    $0x10,%esp
  100312:	89 f0                	mov    %esi,%eax
  100314:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100317:	5b                   	pop    %ebx
  100318:	5e                   	pop    %esi
  100319:	5f                   	pop    %edi
  10031a:	5d                   	pop    %ebp
  10031b:	c3                   	ret    

0010031c <sysWrite>:
  10031c:	55                   	push   %ebp
  10031d:	89 e5                	mov    %esp,%ebp
  10031f:	53                   	push   %ebx
  100320:	83 ec 08             	sub    $0x8,%esp
  100323:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100326:	ff 73 24             	pushl  0x24(%ebx)
  100329:	a1 04 5d 30 00       	mov    0x305d04,%eax
  10032e:	2d 00 50 10 00       	sub    $0x105000,%eax
  100333:	c1 f8 03             	sar    $0x3,%eax
  100336:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100339:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10033c:	01 d2                	add    %edx,%edx
  10033e:	01 c2                	add    %eax,%edx
  100340:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100343:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100346:	c1 e2 0b             	shl    $0xb,%edx
  100349:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  10034c:	89 ca                	mov    %ecx,%edx
  10034e:	c1 e2 04             	shl    $0x4,%edx
  100351:	01 ca                	add    %ecx,%edx
  100353:	01 d2                	add    %edx,%edx
  100355:	01 d0                	add    %edx,%eax
  100357:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  10035a:	f7 d8                	neg    %eax
  10035c:	83 c0 04             	add    $0x4,%eax
  10035f:	c1 e0 14             	shl    $0x14,%eax
  100362:	03 43 28             	add    0x28(%ebx),%eax
  100365:	50                   	push   %eax
  100366:	ff 73 20             	pushl  0x20(%ebx)
  100369:	e8 1a ff ff ff       	call   100288 <fsWrite>
  10036e:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100371:	83 c4 10             	add    $0x10,%esp
  100374:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100377:	c9                   	leave  
  100378:	c3                   	ret    
  100379:	8d 76 00             	lea    0x0(%esi),%esi

0010037c <writeVMem>:
  10037c:	55                   	push   %ebp
  10037d:	89 e5                	mov    %esp,%ebp
  10037f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100382:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100385:	c1 e0 04             	shl    $0x4,%eax
  100388:	03 45 10             	add    0x10(%ebp),%eax
  10038b:	66 0f be 55 08       	movsbw 0x8(%ebp),%dx
  100390:	80 ce 0c             	or     $0xc,%dh
  100393:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%eax,%eax,1)
  10039a:	00 
  10039b:	5d                   	pop    %ebp
  10039c:	c3                   	ret    
  10039d:	8d 76 00             	lea    0x0(%esi),%esi

001003a0 <timerHandle>:
  1003a0:	55                   	push   %ebp
  1003a1:	89 e5                	mov    %esp,%ebp
  1003a3:	83 ec 08             	sub    $0x8,%esp
  1003a6:	e8 e5 12 00 00       	call   101690 <updateTime>
  1003ab:	e8 d0 14 00 00       	call   101880 <checkBlockedList>
  1003b0:	a1 04 5d 30 00       	mov    0x305d04,%eax
  1003b5:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  1003bb:	85 d2                	test   %edx,%edx
  1003bd:	74 15                	je     1003d4 <timerHandle+0x34>
  1003bf:	a1 08 5d 30 00       	mov    0x305d08,%eax
  1003c4:	85 c0                	test   %eax,%eax
  1003c6:	74 0c                	je     1003d4 <timerHandle+0x34>
  1003c8:	e8 cb 15 00 00       	call   101998 <schedule>
  1003cd:	c9                   	leave  
  1003ce:	e9 21 16 00 00       	jmp    1019f4 <switchToRunning>
  1003d3:	90                   	nop
  1003d4:	c9                   	leave  
  1003d5:	c3                   	ret    
  1003d6:	66 90                	xchg   %ax,%ax

001003d8 <sysFork>:
  1003d8:	55                   	push   %ebp
  1003d9:	89 e5                	mov    %esp,%ebp
  1003db:	57                   	push   %edi
  1003dc:	56                   	push   %esi
  1003dd:	53                   	push   %ebx
  1003de:	83 ec 28             	sub    $0x28,%esp
  1003e1:	8b 75 08             	mov    0x8(%ebp),%esi
  1003e4:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1003e7:	68 64 28 10 00       	push   $0x102864
  1003ec:	e8 b3 09 00 00       	call   100da4 <printString>
  1003f1:	e8 7e 0f 00 00       	call   101374 <initNewPCB>
  1003f6:	89 c2                	mov    %eax,%edx
  1003f8:	c1 e0 0a             	shl    $0xa,%eax
  1003fb:	01 d0                	add    %edx,%eax
  1003fd:	01 c0                	add    %eax,%eax
  1003ff:	01 d0                	add    %edx,%eax
  100401:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100404:	c1 e0 03             	shl    $0x3,%eax
  100407:	8d 98 00 50 10 00    	lea    0x105000(%eax),%ebx
  10040d:	b9 00 40 00 00       	mov    $0x4000,%ecx
  100412:	89 df                	mov    %ebx,%edi
  100414:	8b 35 04 5d 30 00    	mov    0x305d04,%esi
  10041a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10041c:	8b 3d 04 5d 30 00    	mov    0x305d04,%edi
  100422:	81 c7 00 00 01 00    	add    $0x10000,%edi
  100428:	b9 13 00 00 00       	mov    $0x13,%ecx
  10042d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100430:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100432:	05 00 50 11 00       	add    $0x115000,%eax
  100437:	b9 13 00 00 00       	mov    $0x13,%ecx
  10043c:	89 c7                	mov    %eax,%edi
  10043e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100441:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100443:	8d 42 04             	lea    0x4(%edx),%eax
  100446:	c1 e0 14             	shl    $0x14,%eax
  100449:	8b 0d 04 5d 30 00    	mov    0x305d04,%ecx
  10044f:	81 e9 00 50 10 00    	sub    $0x105000,%ecx
  100455:	c1 f9 03             	sar    $0x3,%ecx
  100458:	8d 34 c9             	lea    (%ecx,%ecx,8),%esi
  10045b:	8d 34 f6             	lea    (%esi,%esi,8),%esi
  10045e:	01 f6                	add    %esi,%esi
  100460:	01 ce                	add    %ecx,%esi
  100462:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  100465:	8d 34 f6             	lea    (%esi,%esi,8),%esi
  100468:	c1 e6 0b             	shl    $0xb,%esi
  10046b:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
  10046e:	89 fe                	mov    %edi,%esi
  100470:	c1 e6 04             	shl    $0x4,%esi
  100473:	01 fe                	add    %edi,%esi
  100475:	01 f6                	add    %esi,%esi
  100477:	01 f1                	add    %esi,%ecx
  100479:	8d 34 c9             	lea    (%ecx,%ecx,8),%esi
  10047c:	f7 de                	neg    %esi
  10047e:	83 c6 04             	add    $0x4,%esi
  100481:	c1 e6 14             	shl    $0x14,%esi
  100484:	b9 00 00 04 00       	mov    $0x40000,%ecx
  100489:	89 c7                	mov    %eax,%edi
  10048b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10048d:	a1 04 5d 30 00       	mov    0x305d04,%eax
  100492:	89 90 2c 00 01 00    	mov    %edx,0x1002c(%eax)
  100498:	c7 83 2c 00 01 00 00 	movl   $0x0,0x1002c(%ebx)
  10049f:	00 00 00 
  1004a2:	8b 90 4c 00 01 00    	mov    0x1004c(%eax),%edx
  1004a8:	89 93 4c 00 01 00    	mov    %edx,0x1004c(%ebx)
  1004ae:	8b 80 50 00 01 00    	mov    0x10050(%eax),%eax
  1004b4:	89 83 50 00 01 00    	mov    %eax,0x10050(%ebx)
  1004ba:	83 c4 10             	add    $0x10,%esp
  1004bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1004c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1004c3:	5b                   	pop    %ebx
  1004c4:	5e                   	pop    %esi
  1004c5:	5f                   	pop    %edi
  1004c6:	5d                   	pop    %ebp
  1004c7:	e9 94 11 00 00       	jmp    101660 <addToRunnable>

001004cc <sysSleep>:
  1004cc:	55                   	push   %ebp
  1004cd:	89 e5                	mov    %esp,%ebp
  1004cf:	57                   	push   %edi
  1004d0:	56                   	push   %esi
  1004d1:	53                   	push   %ebx
  1004d2:	83 ec 18             	sub    $0x18,%esp
  1004d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004d8:	68 6a 28 10 00       	push   $0x10286a
  1004dd:	e8 c2 08 00 00       	call   100da4 <printString>
  1004e2:	8b 15 04 5d 30 00    	mov    0x305d04,%edx
  1004e8:	8d 82 00 00 01 00    	lea    0x10000(%edx),%eax
  1004ee:	b9 13 00 00 00       	mov    $0x13,%ecx
  1004f3:	89 c7                	mov    %eax,%edi
  1004f5:	89 de                	mov    %ebx,%esi
  1004f7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1004f9:	c7 82 54 00 01 00 02 	movl   $0x2,0x10054(%edx)
  100500:	00 00 00 
  100503:	c7 82 58 00 01 00 00 	movl   $0x0,0x10058(%edx)
  10050a:	00 00 00 
  10050d:	8b 43 20             	mov    0x20(%ebx),%eax
  100510:	89 82 5c 00 01 00    	mov    %eax,0x1005c(%edx)
  100516:	89 14 24             	mov    %edx,(%esp)
  100519:	e8 12 11 00 00       	call   101630 <addToBlocked>
  10051e:	e8 cd 11 00 00       	call   1016f0 <checkRunnableList>
  100523:	e8 70 14 00 00       	call   101998 <schedule>
  100528:	83 c4 10             	add    $0x10,%esp
  10052b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10052e:	5b                   	pop    %ebx
  10052f:	5e                   	pop    %esi
  100530:	5f                   	pop    %edi
  100531:	5d                   	pop    %ebp
  100532:	e9 bd 14 00 00       	jmp    1019f4 <switchToRunning>
  100537:	90                   	nop

00100538 <sysExit>:
  100538:	55                   	push   %ebp
  100539:	89 e5                	mov    %esp,%ebp
  10053b:	83 ec 08             	sub    $0x8,%esp
  10053e:	a1 04 5d 30 00       	mov    0x305d04,%eax
  100543:	c7 80 54 00 01 00 03 	movl   $0x3,0x10054(%eax)
  10054a:	00 00 00 
  10054d:	e8 46 14 00 00       	call   101998 <schedule>
  100552:	c9                   	leave  
  100553:	e9 9c 14 00 00       	jmp    1019f4 <switchToRunning>

00100558 <sysSemInit>:
  100558:	55                   	push   %ebp
  100559:	89 e5                	mov    %esp,%ebp
  10055b:	56                   	push   %esi
  10055c:	53                   	push   %ebx
  10055d:	8b 75 08             	mov    0x8(%ebp),%esi
  100560:	a1 04 5d 30 00       	mov    0x305d04,%eax
  100565:	2d 00 50 10 00       	sub    $0x105000,%eax
  10056a:	c1 f8 03             	sar    $0x3,%eax
  10056d:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100570:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100573:	01 d2                	add    %edx,%edx
  100575:	01 c2                	add    %eax,%edx
  100577:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10057a:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10057d:	c1 e2 0b             	shl    $0xb,%edx
  100580:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  100583:	89 ca                	mov    %ecx,%edx
  100585:	c1 e2 04             	shl    $0x4,%edx
  100588:	01 ca                	add    %ecx,%edx
  10058a:	01 d2                	add    %edx,%edx
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  100591:	f7 db                	neg    %ebx
  100593:	83 c3 04             	add    $0x4,%ebx
  100596:	c1 e3 14             	shl    $0x14,%ebx
  100599:	03 5e 20             	add    0x20(%esi),%ebx
  10059c:	83 ec 0c             	sub    $0xc,%esp
  10059f:	ff 76 28             	pushl  0x28(%esi)
  1005a2:	e8 ad 05 00 00       	call   100b54 <initNewSem>
  1005a7:	89 03                	mov    %eax,(%ebx)
  1005a9:	c7 46 2c 00 00 00 00 	movl   $0x0,0x2c(%esi)
  1005b0:	83 c4 10             	add    $0x10,%esp
  1005b3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1005b6:	5b                   	pop    %ebx
  1005b7:	5e                   	pop    %esi
  1005b8:	5d                   	pop    %ebp
  1005b9:	c3                   	ret    
  1005ba:	66 90                	xchg   %ax,%ax

001005bc <sysSemPost>:
  1005bc:	55                   	push   %ebp
  1005bd:	89 e5                	mov    %esp,%ebp
  1005bf:	53                   	push   %ebx
  1005c0:	50                   	push   %eax
  1005c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005c4:	a1 04 5d 30 00       	mov    0x305d04,%eax
  1005c9:	2d 00 50 10 00       	sub    $0x105000,%eax
  1005ce:	c1 f8 03             	sar    $0x3,%eax
  1005d1:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  1005d4:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1005d7:	01 d2                	add    %edx,%edx
  1005d9:	01 c2                	add    %eax,%edx
  1005db:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1005de:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1005e1:	c1 e2 0b             	shl    $0xb,%edx
  1005e4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  1005e7:	89 ca                	mov    %ecx,%edx
  1005e9:	c1 e2 04             	shl    $0x4,%edx
  1005ec:	01 ca                	add    %ecx,%edx
  1005ee:	01 d2                	add    %edx,%edx
  1005f0:	01 d0                	add    %edx,%eax
  1005f2:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  1005f5:	f7 d8                	neg    %eax
  1005f7:	83 c0 04             	add    $0x4,%eax
  1005fa:	c1 e0 14             	shl    $0x14,%eax
  1005fd:	03 43 20             	add    0x20(%ebx),%eax
  100600:	8b 08                	mov    (%eax),%ecx
  100602:	a1 6c 46 10 00       	mov    0x10466c,%eax
  100607:	8b 15 c0 46 10 00    	mov    0x1046c0,%edx
  10060d:	eb 05                	jmp    100614 <sysSemPost+0x58>
  10060f:	90                   	nop
  100610:	39 d1                	cmp    %edx,%ecx
  100612:	74 28                	je     10063c <sysSemPost+0x80>
  100614:	85 c0                	test   %eax,%eax
  100616:	75 f8                	jne    100610 <sysSemPost+0x54>
  100618:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  10061f:	83 ec 08             	sub    $0x8,%esp
  100622:	68 ce 00 00 00       	push   $0xce
  100627:	68 51 28 10 00       	push   $0x102851
  10062c:	e8 3b 21 00 00       	call   10276c <abort>
  100631:	83 c4 10             	add    $0x10,%esp
  100634:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100637:	c9                   	leave  
  100638:	c3                   	ret    
  100639:	8d 76 00             	lea    0x0(%esi),%esi
  10063c:	83 ec 0c             	sub    $0xc,%esp
  10063f:	68 c0 46 10 00       	push   $0x1046c0
  100644:	e8 0b 06 00 00       	call   100c54 <V>
  100649:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
  100650:	83 c4 10             	add    $0x10,%esp
  100653:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100656:	c9                   	leave  
  100657:	c3                   	ret    

00100658 <sysSemWait>:
  100658:	55                   	push   %ebp
  100659:	89 e5                	mov    %esp,%ebp
  10065b:	57                   	push   %edi
  10065c:	56                   	push   %esi
  10065d:	53                   	push   %ebx
  10065e:	83 ec 0c             	sub    $0xc,%esp
  100661:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100664:	a1 04 5d 30 00       	mov    0x305d04,%eax
  100669:	89 c2                	mov    %eax,%edx
  10066b:	81 ea 00 50 10 00    	sub    $0x105000,%edx
  100671:	c1 fa 03             	sar    $0x3,%edx
  100674:	8d 0c d2             	lea    (%edx,%edx,8),%ecx
  100677:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  10067a:	01 c9                	add    %ecx,%ecx
  10067c:	01 d1                	add    %edx,%ecx
  10067e:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100681:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  100684:	c1 e1 0b             	shl    $0xb,%ecx
  100687:	8d 34 11             	lea    (%ecx,%edx,1),%esi
  10068a:	89 f1                	mov    %esi,%ecx
  10068c:	c1 e1 04             	shl    $0x4,%ecx
  10068f:	01 f1                	add    %esi,%ecx
  100691:	01 c9                	add    %ecx,%ecx
  100693:	01 ca                	add    %ecx,%edx
  100695:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100698:	f7 da                	neg    %edx
  10069a:	83 c2 04             	add    $0x4,%edx
  10069d:	c1 e2 14             	shl    $0x14,%edx
  1006a0:	03 53 20             	add    0x20(%ebx),%edx
  1006a3:	8b 32                	mov    (%edx),%esi
  1006a5:	8b 15 6c 46 10 00    	mov    0x10466c,%edx
  1006ab:	8b 0d c0 46 10 00    	mov    0x1046c0,%ecx
  1006b1:	eb 05                	jmp    1006b8 <sysSemWait+0x60>
  1006b3:	90                   	nop
  1006b4:	39 ce                	cmp    %ecx,%esi
  1006b6:	74 28                	je     1006e0 <sysSemWait+0x88>
  1006b8:	85 d2                	test   %edx,%edx
  1006ba:	75 f8                	jne    1006b4 <sysSemWait+0x5c>
  1006bc:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  1006c3:	83 ec 08             	sub    $0x8,%esp
  1006c6:	68 de 00 00 00       	push   $0xde
  1006cb:	68 51 28 10 00       	push   $0x102851
  1006d0:	e8 97 20 00 00       	call   10276c <abort>
  1006d5:	83 c4 10             	add    $0x10,%esp
  1006d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006db:	5b                   	pop    %ebx
  1006dc:	5e                   	pop    %esi
  1006dd:	5f                   	pop    %edi
  1006de:	5d                   	pop    %ebp
  1006df:	c3                   	ret    
  1006e0:	05 00 00 01 00       	add    $0x10000,%eax
  1006e5:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006ea:	89 c7                	mov    %eax,%edi
  1006ec:	89 de                	mov    %ebx,%esi
  1006ee:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006f0:	83 ec 0c             	sub    $0xc,%esp
  1006f3:	68 c0 46 10 00       	push   $0x1046c0
  1006f8:	e8 db 04 00 00       	call   100bd8 <P>
  1006fd:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
  100704:	83 c4 10             	add    $0x10,%esp
  100707:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10070a:	5b                   	pop    %ebx
  10070b:	5e                   	pop    %esi
  10070c:	5f                   	pop    %edi
  10070d:	5d                   	pop    %ebp
  10070e:	c3                   	ret    
  10070f:	90                   	nop

00100710 <sysSemDestroy>:
  100710:	55                   	push   %ebp
  100711:	89 e5                	mov    %esp,%ebp
  100713:	53                   	push   %ebx
  100714:	50                   	push   %eax
  100715:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100718:	a1 04 5d 30 00       	mov    0x305d04,%eax
  10071d:	2d 00 50 10 00       	sub    $0x105000,%eax
  100722:	c1 f8 03             	sar    $0x3,%eax
  100725:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100728:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10072b:	01 d2                	add    %edx,%edx
  10072d:	01 c2                	add    %eax,%edx
  10072f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100732:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100735:	c1 e2 0b             	shl    $0xb,%edx
  100738:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  10073b:	89 ca                	mov    %ecx,%edx
  10073d:	c1 e2 04             	shl    $0x4,%edx
  100740:	01 ca                	add    %ecx,%edx
  100742:	01 d2                	add    %edx,%edx
  100744:	01 d0                	add    %edx,%eax
  100746:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100749:	f7 d8                	neg    %eax
  10074b:	83 c0 04             	add    $0x4,%eax
  10074e:	c1 e0 14             	shl    $0x14,%eax
  100751:	03 43 20             	add    0x20(%ebx),%eax
  100754:	8b 08                	mov    (%eax),%ecx
  100756:	a1 6c 46 10 00       	mov    0x10466c,%eax
  10075b:	8b 15 c0 46 10 00    	mov    0x1046c0,%edx
  100761:	eb 05                	jmp    100768 <sysSemDestroy+0x58>
  100763:	90                   	nop
  100764:	39 d1                	cmp    %edx,%ecx
  100766:	74 28                	je     100790 <sysSemDestroy+0x80>
  100768:	85 c0                	test   %eax,%eax
  10076a:	75 f8                	jne    100764 <sysSemDestroy+0x54>
  10076c:	c7 43 2c ff ff ff ff 	movl   $0xffffffff,0x2c(%ebx)
  100773:	83 ec 08             	sub    $0x8,%esp
  100776:	68 ed 00 00 00       	push   $0xed
  10077b:	68 51 28 10 00       	push   $0x102851
  100780:	e8 e7 1f 00 00       	call   10276c <abort>
  100785:	83 c4 10             	add    $0x10,%esp
  100788:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10078b:	c9                   	leave  
  10078c:	c3                   	ret    
  10078d:	8d 76 00             	lea    0x0(%esi),%esi
  100790:	c7 05 c8 46 10 00 01 	movl   $0x1,0x1046c8
  100797:	00 00 00 
  10079a:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
  1007a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007a4:	c9                   	leave  
  1007a5:	c3                   	ret    
  1007a6:	66 90                	xchg   %ax,%ax

001007a8 <sysList>:
  1007a8:	55                   	push   %ebp
  1007a9:	89 e5                	mov    %esp,%ebp
  1007ab:	a1 04 5d 30 00       	mov    0x305d04,%eax
  1007b0:	2d 00 50 10 00       	sub    $0x105000,%eax
  1007b5:	c1 f8 03             	sar    $0x3,%eax
  1007b8:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  1007bb:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1007be:	01 d2                	add    %edx,%edx
  1007c0:	01 c2                	add    %eax,%edx
  1007c2:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007c5:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1007c8:	c1 e2 0b             	shl    $0xb,%edx
  1007cb:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  1007ce:	89 ca                	mov    %ecx,%edx
  1007d0:	c1 e2 04             	shl    $0x4,%edx
  1007d3:	01 ca                	add    %ecx,%edx
  1007d5:	01 d2                	add    %edx,%edx
  1007d7:	01 d0                	add    %edx,%eax
  1007d9:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  1007dc:	f7 d8                	neg    %eax
  1007de:	83 c0 04             	add    $0x4,%eax
  1007e1:	c1 e0 14             	shl    $0x14,%eax
  1007e4:	8b 55 08             	mov    0x8(%ebp),%edx
  1007e7:	03 42 20             	add    0x20(%edx),%eax
  1007ea:	89 45 08             	mov    %eax,0x8(%ebp)
  1007ed:	5d                   	pop    %ebp
  1007ee:	e9 ed 15 00 00       	jmp    101de0 <ls>
  1007f3:	90                   	nop

001007f4 <kernelPrint>:
  1007f4:	55                   	push   %ebp
  1007f5:	89 e5                	mov    %esp,%ebp
  1007f7:	83 ec 08             	sub    $0x8,%esp
  1007fa:	8b 55 08             	mov    0x8(%ebp),%edx
  1007fd:	80 3a 00             	cmpb   $0x0,(%edx)
  100800:	74 1a                	je     10081c <kernelPrint+0x28>
  100802:	31 c0                	xor    %eax,%eax
  100804:	40                   	inc    %eax
  100805:	89 c1                	mov    %eax,%ecx
  100807:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  10080b:	75 f7                	jne    100804 <kernelPrint+0x10>
  10080d:	50                   	push   %eax
  10080e:	51                   	push   %ecx
  10080f:	52                   	push   %edx
  100810:	6a 02                	push   $0x2
  100812:	e8 71 fa ff ff       	call   100288 <fsWrite>
  100817:	83 c4 10             	add    $0x10,%esp
  10081a:	c9                   	leave  
  10081b:	c3                   	ret    
  10081c:	31 c9                	xor    %ecx,%ecx
  10081e:	eb ed                	jmp    10080d <kernelPrint+0x19>

00100820 <kernelPrintN>:
  100820:	55                   	push   %ebp
  100821:	89 e5                	mov    %esp,%ebp
  100823:	83 ec 0c             	sub    $0xc,%esp
  100826:	ff 75 0c             	pushl  0xc(%ebp)
  100829:	ff 75 08             	pushl  0x8(%ebp)
  10082c:	6a 02                	push   $0x2
  10082e:	e8 55 fa ff ff       	call   100288 <fsWrite>
  100833:	83 c4 10             	add    $0x10,%esp
  100836:	c9                   	leave  
  100837:	c3                   	ret    

00100838 <sysOpen>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	53                   	push   %ebx
  10083c:	83 ec 0c             	sub    $0xc,%esp
  10083f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100842:	ff 73 28             	pushl  0x28(%ebx)
  100845:	a1 04 5d 30 00       	mov    0x305d04,%eax
  10084a:	2d 00 50 10 00       	sub    $0x105000,%eax
  10084f:	c1 f8 03             	sar    $0x3,%eax
  100852:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100855:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100858:	01 d2                	add    %edx,%edx
  10085a:	01 c2                	add    %eax,%edx
  10085c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10085f:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100862:	c1 e2 0b             	shl    $0xb,%edx
  100865:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  100868:	89 ca                	mov    %ecx,%edx
  10086a:	c1 e2 04             	shl    $0x4,%edx
  10086d:	01 ca                	add    %ecx,%edx
  10086f:	01 d2                	add    %edx,%edx
  100871:	01 d0                	add    %edx,%eax
  100873:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100876:	f7 d8                	neg    %eax
  100878:	83 c0 04             	add    $0x4,%eax
  10087b:	c1 e0 14             	shl    $0x14,%eax
  10087e:	03 43 20             	add    0x20(%ebx),%eax
  100881:	50                   	push   %eax
  100882:	e8 a5 18 00 00       	call   10212c <open>
  100887:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10088a:	83 c4 10             	add    $0x10,%esp
  10088d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100890:	c9                   	leave  
  100891:	c3                   	ret    
  100892:	66 90                	xchg   %ax,%ax

00100894 <sysFwrite>:
  100894:	55                   	push   %ebp
  100895:	89 e5                	mov    %esp,%ebp
  100897:	53                   	push   %ebx
  100898:	83 ec 08             	sub    $0x8,%esp
  10089b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10089e:	ff 73 24             	pushl  0x24(%ebx)
  1008a1:	a1 04 5d 30 00       	mov    0x305d04,%eax
  1008a6:	2d 00 50 10 00       	sub    $0x105000,%eax
  1008ab:	c1 f8 03             	sar    $0x3,%eax
  1008ae:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  1008b1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1008b4:	01 d2                	add    %edx,%edx
  1008b6:	01 c2                	add    %eax,%edx
  1008b8:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008bb:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1008be:	c1 e2 0b             	shl    $0xb,%edx
  1008c1:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  1008c4:	89 ca                	mov    %ecx,%edx
  1008c6:	c1 e2 04             	shl    $0x4,%edx
  1008c9:	01 ca                	add    %ecx,%edx
  1008cb:	01 d2                	add    %edx,%edx
  1008cd:	01 d0                	add    %edx,%eax
  1008cf:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  1008d2:	f7 d8                	neg    %eax
  1008d4:	83 c0 04             	add    $0x4,%eax
  1008d7:	c1 e0 14             	shl    $0x14,%eax
  1008da:	03 43 28             	add    0x28(%ebx),%eax
  1008dd:	50                   	push   %eax
  1008de:	ff 73 20             	pushl  0x20(%ebx)
  1008e1:	e8 1e 1b 00 00       	call   102404 <write>
  1008e6:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1008e9:	83 c4 10             	add    $0x10,%esp
  1008ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008ef:	c9                   	leave  
  1008f0:	c3                   	ret    
  1008f1:	8d 76 00             	lea    0x0(%esi),%esi

001008f4 <syscallHandle>:
  1008f4:	55                   	push   %ebp
  1008f5:	89 e5                	mov    %esp,%ebp
  1008f7:	53                   	push   %ebx
  1008f8:	50                   	push   %eax
  1008f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fc:	83 78 2c 0d          	cmpl   $0xd,0x2c(%eax)
  100900:	0f 87 3e 01 00 00    	ja     100a44 <syscallHandle+0x150>
  100906:	8b 50 2c             	mov    0x2c(%eax),%edx
  100909:	ff 24 95 7c 28 10 00 	jmp    *0x10287c(,%edx,4)
  100910:	8b 40 20             	mov    0x20(%eax),%eax
  100913:	89 45 08             	mov    %eax,0x8(%ebp)
  100916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100919:	c9                   	leave  
  10091a:	e9 b9 18 00 00       	jmp    1021d8 <close>
  10091f:	90                   	nop
  100920:	89 45 08             	mov    %eax,0x8(%ebp)
  100923:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100926:	c9                   	leave  
  100927:	e9 ac fa ff ff       	jmp    1003d8 <sysFork>
  10092c:	89 45 08             	mov    %eax,0x8(%ebp)
  10092f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100932:	c9                   	leave  
  100933:	e9 94 fb ff ff       	jmp    1004cc <sysSleep>
  100938:	a1 04 5d 30 00       	mov    0x305d04,%eax
  10093d:	c7 80 54 00 01 00 03 	movl   $0x3,0x10054(%eax)
  100944:	00 00 00 
  100947:	e8 4c 10 00 00       	call   101998 <schedule>
  10094c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10094f:	c9                   	leave  
  100950:	e9 9f 10 00 00       	jmp    1019f4 <switchToRunning>
  100955:	8d 76 00             	lea    0x0(%esi),%esi
  100958:	89 45 08             	mov    %eax,0x8(%ebp)
  10095b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10095e:	c9                   	leave  
  10095f:	e9 b8 f9 ff ff       	jmp    10031c <sysWrite>
  100964:	89 45 08             	mov    %eax,0x8(%ebp)
  100967:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10096a:	c9                   	leave  
  10096b:	e9 e8 fb ff ff       	jmp    100558 <sysSemInit>
  100970:	89 45 08             	mov    %eax,0x8(%ebp)
  100973:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100976:	c9                   	leave  
  100977:	e9 40 fc ff ff       	jmp    1005bc <sysSemPost>
  10097c:	89 45 08             	mov    %eax,0x8(%ebp)
  10097f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100982:	c9                   	leave  
  100983:	e9 d0 fc ff ff       	jmp    100658 <sysSemWait>
  100988:	89 45 08             	mov    %eax,0x8(%ebp)
  10098b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10098e:	c9                   	leave  
  10098f:	e9 7c fd ff ff       	jmp    100710 <sysSemDestroy>
  100994:	8b 15 04 5d 30 00    	mov    0x305d04,%edx
  10099a:	81 ea 00 50 10 00    	sub    $0x105000,%edx
  1009a0:	c1 fa 03             	sar    $0x3,%edx
  1009a3:	8d 0c d2             	lea    (%edx,%edx,8),%ecx
  1009a6:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  1009a9:	01 c9                	add    %ecx,%ecx
  1009ab:	01 d1                	add    %edx,%ecx
  1009ad:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1009b0:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  1009b3:	c1 e1 0b             	shl    $0xb,%ecx
  1009b6:	8d 1c 11             	lea    (%ecx,%edx,1),%ebx
  1009b9:	89 d9                	mov    %ebx,%ecx
  1009bb:	c1 e1 04             	shl    $0x4,%ecx
  1009be:	01 d9                	add    %ebx,%ecx
  1009c0:	01 c9                	add    %ecx,%ecx
  1009c2:	01 ca                	add    %ecx,%edx
  1009c4:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1009c7:	f7 da                	neg    %edx
  1009c9:	83 c2 04             	add    $0x4,%edx
  1009cc:	c1 e2 14             	shl    $0x14,%edx
  1009cf:	03 50 20             	add    0x20(%eax),%edx
  1009d2:	89 55 08             	mov    %edx,0x8(%ebp)
  1009d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009d8:	c9                   	leave  
  1009d9:	e9 02 14 00 00       	jmp    101de0 <ls>
  1009de:	66 90                	xchg   %ax,%ax
  1009e0:	89 45 08             	mov    %eax,0x8(%ebp)
  1009e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009e6:	c9                   	leave  
  1009e7:	e9 4c fe ff ff       	jmp    100838 <sysOpen>
  1009ec:	89 45 08             	mov    %eax,0x8(%ebp)
  1009ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009f2:	c9                   	leave  
  1009f3:	e9 9c fe ff ff       	jmp    100894 <sysFwrite>
  1009f8:	8b 15 04 5d 30 00    	mov    0x305d04,%edx
  1009fe:	81 ea 00 50 10 00    	sub    $0x105000,%edx
  100a04:	c1 fa 03             	sar    $0x3,%edx
  100a07:	8d 0c d2             	lea    (%edx,%edx,8),%ecx
  100a0a:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  100a0d:	01 c9                	add    %ecx,%ecx
  100a0f:	01 d1                	add    %edx,%ecx
  100a11:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a14:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  100a17:	c1 e1 0b             	shl    $0xb,%ecx
  100a1a:	8d 1c 11             	lea    (%ecx,%edx,1),%ebx
  100a1d:	89 d9                	mov    %ebx,%ecx
  100a1f:	c1 e1 04             	shl    $0x4,%ecx
  100a22:	01 d9                	add    %ebx,%ecx
  100a24:	01 c9                	add    %ecx,%ecx
  100a26:	01 ca                	add    %ecx,%edx
  100a28:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100a2b:	f7 da                	neg    %edx
  100a2d:	83 c2 04             	add    $0x4,%edx
  100a30:	c1 e2 14             	shl    $0x14,%edx
  100a33:	03 50 20             	add    0x20(%eax),%edx
  100a36:	89 55 08             	mov    %edx,0x8(%ebp)
  100a39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a3c:	c9                   	leave  
  100a3d:	e9 6e 1c 00 00       	jmp    1026b0 <cat>
  100a42:	66 90                	xchg   %ax,%ax
  100a44:	83 ec 08             	sub    $0x8,%esp
  100a47:	6a 5e                	push   $0x5e
  100a49:	68 51 28 10 00       	push   $0x102851
  100a4e:	e8 19 1d 00 00       	call   10276c <abort>
  100a53:	83 c4 10             	add    $0x10,%esp
  100a56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a59:	c9                   	leave  
  100a5a:	c3                   	ret    
  100a5b:	90                   	nop

00100a5c <irqHandle>:
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	83 ec 08             	sub    $0x8,%esp
  100a62:	fa                   	cli    
  100a63:	b8 10 00 00 00       	mov    $0x10,%eax
  100a68:	89 c0                	mov    %eax,%eax
  100a6a:	8e c0                	mov    %eax,%es
  100a6c:	8e d8                	mov    %eax,%ds
  100a6e:	8e e0                	mov    %eax,%fs
  100a70:	8e e8                	mov    %eax,%gs
  100a72:	8b 45 08             	mov    0x8(%ebp),%eax
  100a75:	03 05 04 5d 30 00    	add    0x305d04,%eax
  100a7b:	8b 50 30             	mov    0x30(%eax),%edx
  100a7e:	83 fa 0d             	cmp    $0xd,%edx
  100a81:	74 51                	je     100ad4 <irqHandle+0x78>
  100a83:	7e 2b                	jle    100ab0 <irqHandle+0x54>
  100a85:	83 fa 20             	cmp    $0x20,%edx
  100a88:	74 16                	je     100aa0 <irqHandle+0x44>
  100a8a:	83 c2 80             	add    $0xffffff80,%edx
  100a8d:	75 24                	jne    100ab3 <irqHandle+0x57>
  100a8f:	83 ec 0c             	sub    $0xc,%esp
  100a92:	50                   	push   %eax
  100a93:	e8 5c fe ff ff       	call   1008f4 <syscallHandle>
  100a98:	83 c4 10             	add    $0x10,%esp
  100a9b:	fb                   	sti    
  100a9c:	c9                   	leave  
  100a9d:	c3                   	ret    
  100a9e:	66 90                	xchg   %ax,%ax
  100aa0:	83 ec 0c             	sub    $0xc,%esp
  100aa3:	50                   	push   %eax
  100aa4:	e8 f7 f8 ff ff       	call   1003a0 <timerHandle>
  100aa9:	83 c4 10             	add    $0x10,%esp
  100aac:	eb ed                	jmp    100a9b <irqHandle+0x3f>
  100aae:	66 90                	xchg   %ax,%ax
  100ab0:	42                   	inc    %edx
  100ab1:	74 e8                	je     100a9b <irqHandle+0x3f>
  100ab3:	83 ec 0c             	sub    $0xc,%esp
  100ab6:	68 71 28 10 00       	push   $0x102871
  100abb:	e8 e4 02 00 00       	call   100da4 <printString>
  100ac0:	58                   	pop    %eax
  100ac1:	5a                   	pop    %edx
  100ac2:	6a 48                	push   $0x48
  100ac4:	68 51 28 10 00       	push   $0x102851
  100ac9:	e8 9e 1c 00 00       	call   10276c <abort>
  100ace:	83 c4 10             	add    $0x10,%esp
  100ad1:	eb c8                	jmp    100a9b <irqHandle+0x3f>
  100ad3:	90                   	nop
  100ad4:	83 ec 0c             	sub    $0xc,%esp
  100ad7:	68 3c 28 10 00       	push   $0x10283c
  100adc:	e8 c3 02 00 00       	call   100da4 <printString>
  100ae1:	59                   	pop    %ecx
  100ae2:	58                   	pop    %eax
  100ae3:	6a 64                	push   $0x64
  100ae5:	68 51 28 10 00       	push   $0x102851
  100aea:	e8 7d 1c 00 00       	call   10276c <abort>
  100aef:	83 c4 10             	add    $0x10,%esp
  100af2:	eb a7                	jmp    100a9b <irqHandle+0x3f>

00100af4 <sysCat>:
  100af4:	55                   	push   %ebp
  100af5:	89 e5                	mov    %esp,%ebp
  100af7:	a1 04 5d 30 00       	mov    0x305d04,%eax
  100afc:	2d 00 50 10 00       	sub    $0x105000,%eax
  100b01:	c1 f8 03             	sar    $0x3,%eax
  100b04:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100b07:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100b0a:	01 d2                	add    %edx,%edx
  100b0c:	01 c2                	add    %eax,%edx
  100b0e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b11:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100b14:	c1 e2 0b             	shl    $0xb,%edx
  100b17:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  100b1a:	89 ca                	mov    %ecx,%edx
  100b1c:	c1 e2 04             	shl    $0x4,%edx
  100b1f:	01 ca                	add    %ecx,%edx
  100b21:	01 d2                	add    %edx,%edx
  100b23:	01 d0                	add    %edx,%eax
  100b25:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  100b28:	f7 d8                	neg    %eax
  100b2a:	83 c0 04             	add    $0x4,%eax
  100b2d:	c1 e0 14             	shl    $0x14,%eax
  100b30:	8b 55 08             	mov    0x8(%ebp),%edx
  100b33:	03 42 20             	add    0x20(%edx),%eax
  100b36:	89 45 08             	mov    %eax,0x8(%ebp)
  100b39:	5d                   	pop    %ebp
  100b3a:	e9 71 1b 00 00       	jmp    1026b0 <cat>
  100b3f:	90                   	nop

00100b40 <sysClose>:
  100b40:	55                   	push   %ebp
  100b41:	89 e5                	mov    %esp,%ebp
  100b43:	8b 45 08             	mov    0x8(%ebp),%eax
  100b46:	8b 40 20             	mov    0x20(%eax),%eax
  100b49:	89 45 08             	mov    %eax,0x8(%ebp)
  100b4c:	5d                   	pop    %ebp
  100b4d:	e9 86 16 00 00       	jmp    1021d8 <close>
  100b52:	66 90                	xchg   %ax,%ax

00100b54 <initNewSem>:
  100b54:	55                   	push   %ebp
  100b55:	89 e5                	mov    %esp,%ebp
  100b57:	56                   	push   %esi
  100b58:	53                   	push   %ebx
  100b59:	8b 1d 6c 46 10 00    	mov    0x10466c,%ebx
  100b5f:	85 db                	test   %ebx,%ebx
  100b61:	74 64                	je     100bc7 <initNewSem+0x73>
  100b63:	83 3d c8 46 10 00 01 	cmpl   $0x1,0x1046c8
  100b6a:	74 66                	je     100bd2 <initNewSem+0x7e>
  100b6c:	b9 d8 46 10 00       	mov    $0x1046d8,%ecx
  100b71:	89 de                	mov    %ebx,%esi
  100b73:	31 d2                	xor    %edx,%edx
  100b75:	eb 0a                	jmp    100b81 <initNewSem+0x2d>
  100b77:	90                   	nop
  100b78:	83 c1 10             	add    $0x10,%ecx
  100b7b:	83 79 f0 01          	cmpl   $0x1,-0x10(%ecx)
  100b7f:	74 37                	je     100bb8 <initNewSem+0x64>
  100b81:	42                   	inc    %edx
  100b82:	89 d0                	mov    %edx,%eax
  100b84:	39 da                	cmp    %ebx,%edx
  100b86:	75 f0                	jne    100b78 <initNewSem+0x24>
  100b88:	39 da                	cmp    %ebx,%edx
  100b8a:	74 32                	je     100bbe <initNewSem+0x6a>
  100b8c:	89 f1                	mov    %esi,%ecx
  100b8e:	c1 e1 04             	shl    $0x4,%ecx
  100b91:	8d 91 c0 46 10 00    	lea    0x1046c0(%ecx),%edx
  100b97:	c7 81 cc 46 10 00 00 	movl   $0x0,0x1046cc(%ecx)
  100b9e:	00 00 00 
  100ba1:	89 b1 c0 46 10 00    	mov    %esi,0x1046c0(%ecx)
  100ba7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100baa:	89 4a 04             	mov    %ecx,0x4(%edx)
  100bad:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  100bb4:	5b                   	pop    %ebx
  100bb5:	5e                   	pop    %esi
  100bb6:	5d                   	pop    %ebp
  100bb7:	c3                   	ret    
  100bb8:	89 d6                	mov    %edx,%esi
  100bba:	39 da                	cmp    %ebx,%edx
  100bbc:	75 ce                	jne    100b8c <initNewSem+0x38>
  100bbe:	42                   	inc    %edx
  100bbf:	89 15 6c 46 10 00    	mov    %edx,0x10466c
  100bc5:	eb c5                	jmp    100b8c <initNewSem+0x38>
  100bc7:	31 c0                	xor    %eax,%eax
  100bc9:	ba 01 00 00 00       	mov    $0x1,%edx
  100bce:	31 f6                	xor    %esi,%esi
  100bd0:	eb ed                	jmp    100bbf <initNewSem+0x6b>
  100bd2:	31 f6                	xor    %esi,%esi
  100bd4:	31 c0                	xor    %eax,%eax
  100bd6:	eb b4                	jmp    100b8c <initNewSem+0x38>

00100bd8 <P>:
  100bd8:	55                   	push   %ebp
  100bd9:	89 e5                	mov    %esp,%ebp
  100bdb:	53                   	push   %ebx
  100bdc:	50                   	push   %eax
  100bdd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100be0:	ff 49 04             	decl   0x4(%ecx)
  100be3:	78 07                	js     100bec <P+0x14>
  100be5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100be8:	c9                   	leave  
  100be9:	c3                   	ret    
  100bea:	66 90                	xchg   %ax,%ax
  100bec:	8b 1d 04 5d 30 00    	mov    0x305d04,%ebx
  100bf2:	c7 83 54 00 01 00 02 	movl   $0x2,0x10054(%ebx)
  100bf9:	00 00 00 
  100bfc:	8b 51 0c             	mov    0xc(%ecx),%edx
  100bff:	85 d2                	test   %edx,%edx
  100c01:	75 07                	jne    100c0a <P+0x32>
  100c03:	eb 3f                	jmp    100c44 <P+0x6c>
  100c05:	8d 76 00             	lea    0x0(%esi),%esi
  100c08:	89 c2                	mov    %eax,%edx
  100c0a:	8b 82 64 00 01 00    	mov    0x10064(%edx),%eax
  100c10:	85 c0                	test   %eax,%eax
  100c12:	75 f4                	jne    100c08 <P+0x30>
  100c14:	89 9a 64 00 01 00    	mov    %ebx,0x10064(%edx)
  100c1a:	c7 83 64 00 01 00 00 	movl   $0x0,0x10064(%ebx)
  100c21:	00 00 00 
  100c24:	83 ec 0c             	sub    $0xc,%esp
  100c27:	68 b4 28 10 00       	push   $0x1028b4
  100c2c:	e8 73 01 00 00       	call   100da4 <printString>
  100c31:	e8 62 0d 00 00       	call   101998 <schedule>
  100c36:	83 c4 10             	add    $0x10,%esp
  100c39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c3c:	c9                   	leave  
  100c3d:	e9 b2 0d 00 00       	jmp    1019f4 <switchToRunning>
  100c42:	66 90                	xchg   %ax,%ax
  100c44:	89 59 0c             	mov    %ebx,0xc(%ecx)
  100c47:	c7 83 64 00 01 00 00 	movl   $0x0,0x10064(%ebx)
  100c4e:	00 00 00 
  100c51:	eb d1                	jmp    100c24 <P+0x4c>
  100c53:	90                   	nop

00100c54 <V>:
  100c54:	55                   	push   %ebp
  100c55:	89 e5                	mov    %esp,%ebp
  100c57:	53                   	push   %ebx
  100c58:	50                   	push   %eax
  100c59:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c5c:	8b 43 04             	mov    0x4(%ebx),%eax
  100c5f:	40                   	inc    %eax
  100c60:	89 43 04             	mov    %eax,0x4(%ebx)
  100c63:	85 c0                	test   %eax,%eax
  100c65:	7e 05                	jle    100c6c <V+0x18>
  100c67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c6a:	c9                   	leave  
  100c6b:	c3                   	ret    
  100c6c:	8b 43 0c             	mov    0xc(%ebx),%eax
  100c6f:	85 c0                	test   %eax,%eax
  100c71:	74 39                	je     100cac <V+0x58>
  100c73:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  100c79:	89 53 0c             	mov    %edx,0xc(%ebx)
  100c7c:	c7 80 54 00 01 00 01 	movl   $0x1,0x10054(%eax)
  100c83:	00 00 00 
  100c86:	c7 80 64 00 01 00 00 	movl   $0x0,0x10064(%eax)
  100c8d:	00 00 00 
  100c90:	83 ec 0c             	sub    $0xc,%esp
  100c93:	50                   	push   %eax
  100c94:	e8 c7 09 00 00       	call   101660 <addToRunnable>
  100c99:	83 c4 10             	add    $0x10,%esp
  100c9c:	c7 45 08 d0 28 10 00 	movl   $0x1028d0,0x8(%ebp)
  100ca3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ca6:	c9                   	leave  
  100ca7:	e9 f8 00 00 00       	jmp    100da4 <printString>
  100cac:	83 ec 08             	sub    $0x8,%esp
  100caf:	6a 3c                	push   $0x3c
  100cb1:	68 c2 28 10 00       	push   $0x1028c2
  100cb6:	e8 b1 1a 00 00       	call   10276c <abort>
  100cbb:	8b 43 0c             	mov    0xc(%ebx),%eax
  100cbe:	83 c4 10             	add    $0x10,%esp
  100cc1:	eb b0                	jmp    100c73 <V+0x1f>
  100cc3:	90                   	nop

00100cc4 <initIdt>:
  100cc4:	55                   	push   %ebp
  100cc5:	89 e5                	mov    %esp,%ebp
  100cc7:	53                   	push   %ebx
  100cc8:	ba 03 28 10 00       	mov    $0x102803,%edx
  100ccd:	89 d3                	mov    %edx,%ebx
  100ccf:	c1 ea 10             	shr    $0x10,%edx
  100cd2:	b9 40 4f 10 00       	mov    $0x104f40,%ecx
  100cd7:	b8 40 47 10 00       	mov    $0x104740,%eax
  100cdc:	66 89 18             	mov    %bx,(%eax)
  100cdf:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100ce5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100ce9:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100ced:	66 89 50 06          	mov    %dx,0x6(%eax)
  100cf1:	83 c0 08             	add    $0x8,%eax
  100cf4:	39 c1                	cmp    %eax,%ecx
  100cf6:	75 e4                	jne    100cdc <initIdt+0x18>
  100cf8:	b8 09 28 10 00       	mov    $0x102809,%eax
  100cfd:	66 a3 a8 47 10 00    	mov    %ax,0x1047a8
  100d03:	66 c7 05 aa 47 10 00 	movw   $0x8,0x1047aa
  100d0a:	08 00 
  100d0c:	c6 05 ac 47 10 00 00 	movb   $0x0,0x1047ac
  100d13:	c6 05 ad 47 10 00 8f 	movb   $0x8f,0x1047ad
  100d1a:	c1 e8 10             	shr    $0x10,%eax
  100d1d:	66 a3 ae 47 10 00    	mov    %ax,0x1047ae
  100d23:	b8 0d 28 10 00       	mov    $0x10280d,%eax
  100d28:	66 a3 40 4b 10 00    	mov    %ax,0x104b40
  100d2e:	66 c7 05 42 4b 10 00 	movw   $0x8,0x104b42
  100d35:	08 00 
  100d37:	c6 05 44 4b 10 00 00 	movb   $0x0,0x104b44
  100d3e:	c6 05 45 4b 10 00 ee 	movb   $0xee,0x104b45
  100d45:	c1 e8 10             	shr    $0x10,%eax
  100d48:	66 a3 46 4b 10 00    	mov    %ax,0x104b46
  100d4e:	b8 16 28 10 00       	mov    $0x102816,%eax
  100d53:	66 a3 40 48 10 00    	mov    %ax,0x104840
  100d59:	66 c7 05 42 48 10 00 	movw   $0x8,0x104842
  100d60:	08 00 
  100d62:	c6 05 44 48 10 00 00 	movb   $0x0,0x104844
  100d69:	c6 05 45 48 10 00 8e 	movb   $0x8e,0x104845
  100d70:	c1 e8 10             	shr    $0x10,%eax
  100d73:	66 a3 46 48 10 00    	mov    %ax,0x104846
  100d79:	66 c7 05 70 46 10 00 	movw   $0x7ff,0x104670
  100d80:	ff 07 
  100d82:	b8 40 47 10 00       	mov    $0x104740,%eax
  100d87:	66 a3 72 46 10 00    	mov    %ax,0x104672
  100d8d:	c1 e8 10             	shr    $0x10,%eax
  100d90:	66 a3 74 46 10 00    	mov    %ax,0x104674
  100d96:	b8 70 46 10 00       	mov    $0x104670,%eax
  100d9b:	0f 01 18             	lidtl  (%eax)
  100d9e:	5b                   	pop    %ebx
  100d9f:	5d                   	pop    %ebp
  100da0:	c3                   	ret    
  100da1:	66 90                	xchg   %ax,%ax
  100da3:	90                   	nop

00100da4 <printString>:
  100da4:	55                   	push   %ebp
  100da5:	89 e5                	mov    %esp,%ebp
  100da7:	53                   	push   %ebx
  100da8:	50                   	push   %eax
  100da9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100dac:	0f be 03             	movsbl (%ebx),%eax
  100daf:	43                   	inc    %ebx
  100db0:	84 c0                	test   %al,%al
  100db2:	74 15                	je     100dc9 <printString+0x25>
  100db4:	83 ec 0c             	sub    $0xc,%esp
  100db7:	50                   	push   %eax
  100db8:	e8 fb 01 00 00       	call   100fb8 <putChar>
  100dbd:	43                   	inc    %ebx
  100dbe:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  100dc2:	83 c4 10             	add    $0x10,%esp
  100dc5:	84 c0                	test   %al,%al
  100dc7:	75 eb                	jne    100db4 <printString+0x10>
  100dc9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100dcc:	c9                   	leave  
  100dcd:	c3                   	ret    
  100dce:	66 90                	xchg   %ax,%ax

00100dd0 <printDemical>:
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	57                   	push   %edi
  100dd4:	56                   	push   %esi
  100dd5:	53                   	push   %ebx
  100dd6:	83 ec 1c             	sub    $0x1c,%esp
  100dd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ddc:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  100de2:	74 6c                	je     100e50 <printDemical+0x80>
  100de4:	85 db                	test   %ebx,%ebx
  100de6:	0f 84 8c 00 00 00    	je     100e78 <printDemical+0xa8>
  100dec:	0f 88 9a 00 00 00    	js     100e8c <printDemical+0xbc>
  100df2:	be 09 00 00 00       	mov    $0x9,%esi
  100df7:	bf 0a 00 00 00       	mov    $0xa,%edi
  100dfc:	eb 04                	jmp    100e02 <printDemical+0x32>
  100dfe:	66 90                	xchg   %ax,%ax
  100e00:	89 d6                	mov    %edx,%esi
  100e02:	89 d8                	mov    %ebx,%eax
  100e04:	99                   	cltd   
  100e05:	f7 ff                	idiv   %edi
  100e07:	8d 4a 30             	lea    0x30(%edx),%ecx
  100e0a:	88 4c 35 de          	mov    %cl,-0x22(%ebp,%esi,1)
  100e0e:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100e13:	f7 eb                	imul   %ebx
  100e15:	89 d0                	mov    %edx,%eax
  100e17:	c1 f8 02             	sar    $0x2,%eax
  100e1a:	c1 fb 1f             	sar    $0x1f,%ebx
  100e1d:	8d 56 ff             	lea    -0x1(%esi),%edx
  100e20:	29 d8                	sub    %ebx,%eax
  100e22:	89 c3                	mov    %eax,%ebx
  100e24:	75 da                	jne    100e00 <printDemical+0x30>
  100e26:	8d 5c 35 df          	lea    -0x21(%ebp,%esi,1),%ebx
  100e2a:	8d 75 e8             	lea    -0x18(%ebp),%esi
  100e2d:	eb 04                	jmp    100e33 <printDemical+0x63>
  100e2f:	90                   	nop
  100e30:	8a 0b                	mov    (%ebx),%cl
  100e32:	43                   	inc    %ebx
  100e33:	83 ec 0c             	sub    $0xc,%esp
  100e36:	0f be c9             	movsbl %cl,%ecx
  100e39:	51                   	push   %ecx
  100e3a:	e8 79 01 00 00       	call   100fb8 <putChar>
  100e3f:	83 c4 10             	add    $0x10,%esp
  100e42:	39 de                	cmp    %ebx,%esi
  100e44:	75 ea                	jne    100e30 <printDemical+0x60>
  100e46:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e49:	5b                   	pop    %ebx
  100e4a:	5e                   	pop    %esi
  100e4b:	5f                   	pop    %edi
  100e4c:	5d                   	pop    %ebp
  100e4d:	c3                   	ret    
  100e4e:	66 90                	xchg   %ax,%ax
  100e50:	bb df 28 10 00       	mov    $0x1028df,%ebx
  100e55:	b8 2d 00 00 00       	mov    $0x2d,%eax
  100e5a:	66 90                	xchg   %ax,%ax
  100e5c:	83 ec 0c             	sub    $0xc,%esp
  100e5f:	50                   	push   %eax
  100e60:	e8 53 01 00 00       	call   100fb8 <putChar>
  100e65:	43                   	inc    %ebx
  100e66:	0f be 03             	movsbl (%ebx),%eax
  100e69:	83 c4 10             	add    $0x10,%esp
  100e6c:	84 c0                	test   %al,%al
  100e6e:	75 ec                	jne    100e5c <printDemical+0x8c>
  100e70:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e73:	5b                   	pop    %ebx
  100e74:	5e                   	pop    %esi
  100e75:	5f                   	pop    %edi
  100e76:	5d                   	pop    %ebp
  100e77:	c3                   	ret    
  100e78:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
  100e7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e82:	5b                   	pop    %ebx
  100e83:	5e                   	pop    %esi
  100e84:	5f                   	pop    %edi
  100e85:	5d                   	pop    %ebp
  100e86:	e9 2d 01 00 00       	jmp    100fb8 <putChar>
  100e8b:	90                   	nop
  100e8c:	f7 db                	neg    %ebx
  100e8e:	83 ec 0c             	sub    $0xc,%esp
  100e91:	6a 2d                	push   $0x2d
  100e93:	e8 20 01 00 00       	call   100fb8 <putChar>
  100e98:	83 c4 10             	add    $0x10,%esp
  100e9b:	e9 52 ff ff ff       	jmp    100df2 <printDemical+0x22>

00100ea0 <printHex>:
  100ea0:	55                   	push   %ebp
  100ea1:	89 e5                	mov    %esp,%ebp
  100ea3:	56                   	push   %esi
  100ea4:	53                   	push   %ebx
  100ea5:	83 ec 10             	sub    $0x10,%esp
  100ea8:	8b 55 08             	mov    0x8(%ebp),%edx
  100eab:	85 d2                	test   %edx,%edx
  100ead:	74 5d                	je     100f0c <printHex+0x6c>
  100eaf:	be 07 00 00 00       	mov    $0x7,%esi
  100eb4:	eb 13                	jmp    100ec9 <printHex+0x29>
  100eb6:	66 90                	xchg   %ax,%ax
  100eb8:	83 c0 30             	add    $0x30,%eax
  100ebb:	88 44 35 f0          	mov    %al,-0x10(%ebp,%esi,1)
  100ebf:	8d 4e ff             	lea    -0x1(%esi),%ecx
  100ec2:	c1 ea 04             	shr    $0x4,%edx
  100ec5:	74 1b                	je     100ee2 <printHex+0x42>
  100ec7:	89 ce                	mov    %ecx,%esi
  100ec9:	89 d0                	mov    %edx,%eax
  100ecb:	83 e0 0f             	and    $0xf,%eax
  100ece:	83 f8 09             	cmp    $0x9,%eax
  100ed1:	76 e5                	jbe    100eb8 <printHex+0x18>
  100ed3:	83 c0 57             	add    $0x57,%eax
  100ed6:	88 44 35 f0          	mov    %al,-0x10(%ebp,%esi,1)
  100eda:	8d 4e ff             	lea    -0x1(%esi),%ecx
  100edd:	c1 ea 04             	shr    $0x4,%edx
  100ee0:	75 e5                	jne    100ec7 <printHex+0x27>
  100ee2:	8d 5d f0             	lea    -0x10(%ebp),%ebx
  100ee5:	01 de                	add    %ebx,%esi
  100ee7:	8d 5d f8             	lea    -0x8(%ebp),%ebx
  100eea:	eb 02                	jmp    100eee <printHex+0x4e>
  100eec:	8a 06                	mov    (%esi),%al
  100eee:	83 ec 0c             	sub    $0xc,%esp
  100ef1:	0f be c0             	movsbl %al,%eax
  100ef4:	50                   	push   %eax
  100ef5:	e8 be 00 00 00       	call   100fb8 <putChar>
  100efa:	46                   	inc    %esi
  100efb:	83 c4 10             	add    $0x10,%esp
  100efe:	39 de                	cmp    %ebx,%esi
  100f00:	75 ea                	jne    100eec <printHex+0x4c>
  100f02:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f05:	5b                   	pop    %ebx
  100f06:	5e                   	pop    %esi
  100f07:	5d                   	pop    %ebp
  100f08:	c3                   	ret    
  100f09:	8d 76 00             	lea    0x0(%esi),%esi
  100f0c:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
  100f13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f16:	5b                   	pop    %ebx
  100f17:	5e                   	pop    %esi
  100f18:	5d                   	pop    %ebp
  100f19:	e9 9a 00 00 00       	jmp    100fb8 <putChar>
  100f1e:	66 90                	xchg   %ax,%ax

00100f20 <initIntr>:
  100f20:	55                   	push   %ebp
  100f21:	89 e5                	mov    %esp,%ebp
  100f23:	ba 21 00 00 00       	mov    $0x21,%edx
  100f28:	b0 ff                	mov    $0xff,%al
  100f2a:	ee                   	out    %al,(%dx)
  100f2b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100f30:	ee                   	out    %al,(%dx)
  100f31:	ba 20 00 00 00       	mov    $0x20,%edx
  100f36:	b0 11                	mov    $0x11,%al
  100f38:	ee                   	out    %al,(%dx)
  100f39:	ba 21 00 00 00       	mov    $0x21,%edx
  100f3e:	b0 20                	mov    $0x20,%al
  100f40:	ee                   	out    %al,(%dx)
  100f41:	b0 04                	mov    $0x4,%al
  100f43:	ee                   	out    %al,(%dx)
  100f44:	b0 03                	mov    $0x3,%al
  100f46:	ee                   	out    %al,(%dx)
  100f47:	ba a0 00 00 00       	mov    $0xa0,%edx
  100f4c:	b0 11                	mov    $0x11,%al
  100f4e:	ee                   	out    %al,(%dx)
  100f4f:	ba a1 00 00 00       	mov    $0xa1,%edx
  100f54:	b0 28                	mov    $0x28,%al
  100f56:	ee                   	out    %al,(%dx)
  100f57:	b0 02                	mov    $0x2,%al
  100f59:	ee                   	out    %al,(%dx)
  100f5a:	b0 03                	mov    $0x3,%al
  100f5c:	ee                   	out    %al,(%dx)
  100f5d:	ba 20 00 00 00       	mov    $0x20,%edx
  100f62:	b0 68                	mov    $0x68,%al
  100f64:	ee                   	out    %al,(%dx)
  100f65:	b0 0a                	mov    $0xa,%al
  100f67:	ee                   	out    %al,(%dx)
  100f68:	ba a0 00 00 00       	mov    $0xa0,%edx
  100f6d:	b0 68                	mov    $0x68,%al
  100f6f:	ee                   	out    %al,(%dx)
  100f70:	b0 0a                	mov    $0xa,%al
  100f72:	ee                   	out    %al,(%dx)
  100f73:	5d                   	pop    %ebp
  100f74:	c3                   	ret    
  100f75:	66 90                	xchg   %ax,%ax
  100f77:	90                   	nop

00100f78 <initSerial>:
  100f78:	55                   	push   %ebp
  100f79:	89 e5                	mov    %esp,%ebp
  100f7b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100f80:	31 c0                	xor    %eax,%eax
  100f82:	ee                   	out    %al,(%dx)
  100f83:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100f88:	b0 80                	mov    $0x80,%al
  100f8a:	ee                   	out    %al,(%dx)
  100f8b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100f90:	b0 01                	mov    $0x1,%al
  100f92:	ee                   	out    %al,(%dx)
  100f93:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100f98:	31 c0                	xor    %eax,%eax
  100f9a:	ee                   	out    %al,(%dx)
  100f9b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100fa0:	b0 03                	mov    $0x3,%al
  100fa2:	ee                   	out    %al,(%dx)
  100fa3:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100fa8:	b0 c7                	mov    $0xc7,%al
  100faa:	ee                   	out    %al,(%dx)
  100fab:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100fb0:	b0 0b                	mov    $0xb,%al
  100fb2:	ee                   	out    %al,(%dx)
  100fb3:	5d                   	pop    %ebp
  100fb4:	c3                   	ret    
  100fb5:	8d 76 00             	lea    0x0(%esi),%esi

00100fb8 <putChar>:
  100fb8:	55                   	push   %ebp
  100fb9:	89 e5                	mov    %esp,%ebp
  100fbb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100fbe:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100fc3:	90                   	nop
  100fc4:	ec                   	in     (%dx),%al
  100fc5:	a8 20                	test   $0x20,%al
  100fc7:	74 fb                	je     100fc4 <putChar+0xc>
  100fc9:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100fce:	88 c8                	mov    %cl,%al
  100fd0:	ee                   	out    %al,(%dx)
  100fd1:	5d                   	pop    %ebp
  100fd2:	c3                   	ret    
  100fd3:	90                   	nop

00100fd4 <initTimer>:
  100fd4:	55                   	push   %ebp
  100fd5:	89 e5                	mov    %esp,%ebp
  100fd7:	ba 43 00 00 00       	mov    $0x43,%edx
  100fdc:	b0 34                	mov    $0x34,%al
  100fde:	ee                   	out    %al,(%dx)
  100fdf:	ba 40 00 00 00       	mov    $0x40,%edx
  100fe4:	b0 9b                	mov    $0x9b,%al
  100fe6:	ee                   	out    %al,(%dx)
  100fe7:	b0 2e                	mov    $0x2e,%al
  100fe9:	ee                   	out    %al,(%dx)
  100fea:	5d                   	pop    %ebp
  100feb:	c3                   	ret    

00100fec <waitDisk>:
  100fec:	55                   	push   %ebp
  100fed:	89 e5                	mov    %esp,%ebp
  100fef:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100ff4:	ec                   	in     (%dx),%al
  100ff5:	83 e0 c0             	and    $0xffffffc0,%eax
  100ff8:	3c 40                	cmp    $0x40,%al
  100ffa:	75 f8                	jne    100ff4 <waitDisk+0x8>
  100ffc:	5d                   	pop    %ebp
  100ffd:	c3                   	ret    
  100ffe:	66 90                	xchg   %ax,%ax

00101000 <readSect>:
  101000:	55                   	push   %ebp
  101001:	89 e5                	mov    %esp,%ebp
  101003:	53                   	push   %ebx
  101004:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101007:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10100c:	ec                   	in     (%dx),%al
  10100d:	83 e0 c0             	and    $0xffffffc0,%eax
  101010:	3c 40                	cmp    $0x40,%al
  101012:	75 f8                	jne    10100c <readSect+0xc>
  101014:	ba f2 01 00 00       	mov    $0x1f2,%edx
  101019:	b0 01                	mov    $0x1,%al
  10101b:	ee                   	out    %al,(%dx)
  10101c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  101021:	88 c8                	mov    %cl,%al
  101023:	ee                   	out    %al,(%dx)
  101024:	89 c8                	mov    %ecx,%eax
  101026:	c1 f8 08             	sar    $0x8,%eax
  101029:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10102e:	ee                   	out    %al,(%dx)
  10102f:	89 c8                	mov    %ecx,%eax
  101031:	c1 f8 10             	sar    $0x10,%eax
  101034:	ba f5 01 00 00       	mov    $0x1f5,%edx
  101039:	ee                   	out    %al,(%dx)
  10103a:	89 c8                	mov    %ecx,%eax
  10103c:	c1 f8 18             	sar    $0x18,%eax
  10103f:	83 c8 e0             	or     $0xffffffe0,%eax
  101042:	ba f6 01 00 00       	mov    $0x1f6,%edx
  101047:	ee                   	out    %al,(%dx)
  101048:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10104d:	b0 20                	mov    $0x20,%al
  10104f:	ee                   	out    %al,(%dx)
  101050:	ec                   	in     (%dx),%al
  101051:	83 e0 c0             	and    $0xffffffc0,%eax
  101054:	3c 40                	cmp    $0x40,%al
  101056:	75 f8                	jne    101050 <readSect+0x50>
  101058:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10105b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101061:	ba f0 01 00 00       	mov    $0x1f0,%edx
  101066:	66 90                	xchg   %ax,%ax
  101068:	ed                   	in     (%dx),%eax
  101069:	89 01                	mov    %eax,(%ecx)
  10106b:	83 c1 04             	add    $0x4,%ecx
  10106e:	39 d9                	cmp    %ebx,%ecx
  101070:	75 f6                	jne    101068 <readSect+0x68>
  101072:	5b                   	pop    %ebx
  101073:	5d                   	pop    %ebp
  101074:	c3                   	ret    
  101075:	8d 76 00             	lea    0x0(%esi),%esi

00101078 <writeSect>:
  101078:	55                   	push   %ebp
  101079:	89 e5                	mov    %esp,%ebp
  10107b:	53                   	push   %ebx
  10107c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10107f:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101084:	ec                   	in     (%dx),%al
  101085:	83 e0 c0             	and    $0xffffffc0,%eax
  101088:	3c 40                	cmp    $0x40,%al
  10108a:	75 f8                	jne    101084 <writeSect+0xc>
  10108c:	ba f2 01 00 00       	mov    $0x1f2,%edx
  101091:	b0 01                	mov    $0x1,%al
  101093:	ee                   	out    %al,(%dx)
  101094:	ba f3 01 00 00       	mov    $0x1f3,%edx
  101099:	88 c8                	mov    %cl,%al
  10109b:	ee                   	out    %al,(%dx)
  10109c:	89 c8                	mov    %ecx,%eax
  10109e:	c1 f8 08             	sar    $0x8,%eax
  1010a1:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1010a6:	ee                   	out    %al,(%dx)
  1010a7:	89 c8                	mov    %ecx,%eax
  1010a9:	c1 f8 10             	sar    $0x10,%eax
  1010ac:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1010b1:	ee                   	out    %al,(%dx)
  1010b2:	89 c8                	mov    %ecx,%eax
  1010b4:	c1 f8 18             	sar    $0x18,%eax
  1010b7:	83 c8 e0             	or     $0xffffffe0,%eax
  1010ba:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1010bf:	ee                   	out    %al,(%dx)
  1010c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1010c5:	b0 30                	mov    $0x30,%al
  1010c7:	ee                   	out    %al,(%dx)
  1010c8:	ec                   	in     (%dx),%al
  1010c9:	83 e0 c0             	and    $0xffffffc0,%eax
  1010cc:	3c 40                	cmp    $0x40,%al
  1010ce:	75 f8                	jne    1010c8 <writeSect+0x50>
  1010d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1010d3:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1010d9:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1010de:	66 90                	xchg   %ax,%ax
  1010e0:	8b 01                	mov    (%ecx),%eax
  1010e2:	ef                   	out    %eax,(%dx)
  1010e3:	83 c1 04             	add    $0x4,%ecx
  1010e6:	39 d9                	cmp    %ebx,%ecx
  1010e8:	75 f6                	jne    1010e0 <writeSect+0x68>
  1010ea:	5b                   	pop    %ebx
  1010eb:	5d                   	pop    %ebp
  1010ec:	c3                   	ret    
  1010ed:	8d 76 00             	lea    0x0(%esi),%esi

001010f0 <initSeg>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	ba 40 4f 10 00       	mov    $0x104f40,%edx
  1010f8:	66 c7 05 48 4f 10 00 	movw   $0xffff,0x104f48
  1010ff:	ff ff 
  101101:	66 c7 05 4a 4f 10 00 	movw   $0x0,0x104f4a
  101108:	00 00 
  10110a:	c6 05 4c 4f 10 00 00 	movb   $0x0,0x104f4c
  101111:	c6 05 4d 4f 10 00 9a 	movb   $0x9a,0x104f4d
  101118:	c6 05 4e 4f 10 00 cf 	movb   $0xcf,0x104f4e
  10111f:	c6 05 4f 4f 10 00 00 	movb   $0x0,0x104f4f
  101126:	66 c7 05 50 4f 10 00 	movw   $0xffff,0x104f50
  10112d:	ff ff 
  10112f:	66 c7 05 52 4f 10 00 	movw   $0x0,0x104f52
  101136:	00 00 
  101138:	c6 05 54 4f 10 00 00 	movb   $0x0,0x104f54
  10113f:	c6 05 55 4f 10 00 92 	movb   $0x92,0x104f55
  101146:	c6 05 56 4f 10 00 cf 	movb   $0xcf,0x104f56
  10114d:	c6 05 57 4f 10 00 00 	movb   $0x0,0x104f57
  101154:	66 c7 05 70 4f 10 00 	movw   $0xffff,0x104f70
  10115b:	ff ff 
  10115d:	66 c7 05 72 4f 10 00 	movw   $0x0,0x104f72
  101164:	00 00 
  101166:	c6 05 74 4f 10 00 00 	movb   $0x0,0x104f74
  10116d:	c6 05 75 4f 10 00 92 	movb   $0x92,0x104f75
  101174:	c6 05 76 4f 10 00 cf 	movb   $0xcf,0x104f76
  10117b:	c6 05 77 4f 10 00 00 	movb   $0x0,0x104f77
  101182:	66 c7 05 58 4f 10 00 	movw   $0xffff,0x104f58
  101189:	ff ff 
  10118b:	66 c7 05 5a 4f 10 00 	movw   $0x0,0x104f5a
  101192:	00 00 
  101194:	c6 05 5c 4f 10 00 00 	movb   $0x0,0x104f5c
  10119b:	c6 05 5d 4f 10 00 fa 	movb   $0xfa,0x104f5d
  1011a2:	c6 05 5e 4f 10 00 cf 	movb   $0xcf,0x104f5e
  1011a9:	c6 05 5f 4f 10 00 00 	movb   $0x0,0x104f5f
  1011b0:	66 c7 05 60 4f 10 00 	movw   $0xffff,0x104f60
  1011b7:	ff ff 
  1011b9:	66 c7 05 62 4f 10 00 	movw   $0x0,0x104f62
  1011c0:	00 00 
  1011c2:	c6 05 64 4f 10 00 00 	movb   $0x0,0x104f64
  1011c9:	c6 05 65 4f 10 00 f2 	movb   $0xf2,0x104f65
  1011d0:	c6 05 66 4f 10 00 cf 	movb   $0xcf,0x104f66
  1011d7:	c6 05 67 4f 10 00 00 	movb   $0x0,0x104f67
  1011de:	66 c7 05 68 4f 10 00 	movw   $0x63,0x104f68
  1011e5:	63 00 
  1011e7:	b8 80 4f 10 00       	mov    $0x104f80,%eax
  1011ec:	66 a3 6a 4f 10 00    	mov    %ax,0x104f6a
  1011f2:	89 c1                	mov    %eax,%ecx
  1011f4:	c1 e9 10             	shr    $0x10,%ecx
  1011f7:	88 0d 6c 4f 10 00    	mov    %cl,0x104f6c
  1011fd:	c6 05 6d 4f 10 00 89 	movb   $0x89,0x104f6d
  101204:	c6 05 6e 4f 10 00 40 	movb   $0x40,0x104f6e
  10120b:	c1 e8 18             	shr    $0x18,%eax
  10120e:	a2 6f 4f 10 00       	mov    %al,0x104f6f
  101213:	66 c7 05 78 46 10 00 	movw   $0x37,0x104678
  10121a:	37 00 
  10121c:	66 89 15 7a 46 10 00 	mov    %dx,0x10467a
  101223:	c1 ea 10             	shr    $0x10,%edx
  101226:	66 89 15 7c 46 10 00 	mov    %dx,0x10467c
  10122d:	b8 78 46 10 00       	mov    $0x104678,%eax
  101232:	0f 01 10             	lgdtl  (%eax)
  101235:	c7 05 88 4f 10 00 30 	movl   $0x30,0x104f88
  10123c:	00 00 00 
  10123f:	c7 05 84 4f 10 00 00 	movl   $0x10000,0x104f84
  101246:	00 01 00 
  101249:	b8 28 00 00 00       	mov    $0x28,%eax
  10124e:	0f 00 d8             	ltr    %ax
  101251:	b8 10 00 00 00       	mov    $0x10,%eax
  101256:	89 c0                	mov    %eax,%eax
  101258:	8e d8                	mov    %eax,%ds
  10125a:	8e c0                	mov    %eax,%es
  10125c:	8e d0                	mov    %eax,%ss
  10125e:	8e e0                	mov    %eax,%fs
  101260:	8e e8                	mov    %eax,%gs
  101262:	31 c0                	xor    %eax,%eax
  101264:	0f 00 d0             	lldt   %ax
  101267:	5d                   	pop    %ebp
  101268:	c3                   	ret    
  101269:	8d 76 00             	lea    0x0(%esi),%esi

0010126c <enterUserSpace>:
  10126c:	55                   	push   %ebp
  10126d:	89 e5                	mov    %esp,%ebp
  10126f:	b8 23 00 00 00       	mov    $0x23,%eax
  101274:	89 c0                	mov    %eax,%eax
  101276:	8e d8                	mov    %eax,%ds
  101278:	8e c0                	mov    %eax,%es
  10127a:	8e e0                	mov    %eax,%fs
  10127c:	8e e8                	mov    %eax,%gs
  10127e:	50                   	push   %eax
  10127f:	b8 00 00 00 08       	mov    $0x8000000,%eax
  101284:	50                   	push   %eax
  101285:	9c                   	pushf  
  101286:	b8 1b 00 00 00       	mov    $0x1b,%eax
  10128b:	50                   	push   %eax
  10128c:	8b 45 08             	mov    0x8(%ebp),%eax
  10128f:	50                   	push   %eax
  101290:	cf                   	iret   
  101291:	5d                   	pop    %ebp
  101292:	c3                   	ret    
  101293:	90                   	nop

00101294 <loadUMain>:
  101294:	55                   	push   %ebp
  101295:	89 e5                	mov    %esp,%ebp
  101297:	57                   	push   %edi
  101298:	56                   	push   %esi
  101299:	53                   	push   %ebx
  10129a:	83 ec 0c             	sub    $0xc,%esp
  10129d:	e8 96 08 00 00       	call   101b38 <initFS>
  1012a2:	83 ec 08             	sub    $0x8,%esp
  1012a5:	6a 00                	push   $0x0
  1012a7:	68 eb 28 10 00       	push   $0x1028eb
  1012ac:	e8 7b 0e 00 00       	call   10212c <open>
  1012b1:	83 c4 0c             	add    $0xc,%esp
  1012b4:	68 00 c8 00 00       	push   $0xc800
  1012b9:	68 00 00 00 02       	push   $0x2000000
  1012be:	50                   	push   %eax
  1012bf:	e8 44 0f 00 00       	call   102208 <read>
  1012c4:	a1 1c 00 00 02       	mov    0x200001c,%eax
  1012c9:	83 c4 10             	add    $0x10,%esp
  1012cc:	66 83 3d 2c 00 00 02 	cmpw   $0x0,0x200002c
  1012d3:	00 
  1012d4:	74 5c                	je     101332 <loadUMain+0x9e>
  1012d6:	8d 98 00 00 00 02    	lea    0x2000000(%eax),%ebx
  1012dc:	31 f6                	xor    %esi,%esi
  1012de:	eb 0f                	jmp    1012ef <loadUMain+0x5b>
  1012e0:	46                   	inc    %esi
  1012e1:	83 c3 20             	add    $0x20,%ebx
  1012e4:	0f b7 05 2c 00 00 02 	movzwl 0x200002c,%eax
  1012eb:	39 f0                	cmp    %esi,%eax
  1012ed:	7e 43                	jle    101332 <loadUMain+0x9e>
  1012ef:	83 3b 01             	cmpl   $0x1,(%ebx)
  1012f2:	75 ec                	jne    1012e0 <loadUMain+0x4c>
  1012f4:	8b 7b 08             	mov    0x8(%ebx),%edi
  1012f7:	50                   	push   %eax
  1012f8:	ff 73 10             	pushl  0x10(%ebx)
  1012fb:	8b 43 04             	mov    0x4(%ebx),%eax
  1012fe:	05 00 00 00 02       	add    $0x2000000,%eax
  101303:	50                   	push   %eax
  101304:	57                   	push   %edi
  101305:	e8 0e ef ff ff       	call   100218 <memcpy>
  10130a:	8b 43 10             	mov    0x10(%ebx),%eax
  10130d:	83 c4 0c             	add    $0xc,%esp
  101310:	8b 53 14             	mov    0x14(%ebx),%edx
  101313:	29 c2                	sub    %eax,%edx
  101315:	52                   	push   %edx
  101316:	6a 00                	push   $0x0
  101318:	01 f8                	add    %edi,%eax
  10131a:	50                   	push   %eax
  10131b:	e8 20 ef ff ff       	call   100240 <memset>
  101320:	83 c4 10             	add    $0x10,%esp
  101323:	46                   	inc    %esi
  101324:	83 c3 20             	add    $0x20,%ebx
  101327:	0f b7 05 2c 00 00 02 	movzwl 0x200002c,%eax
  10132e:	39 f0                	cmp    %esi,%eax
  101330:	7f bd                	jg     1012ef <loadUMain+0x5b>
  101332:	e8 3d 00 00 00       	call   101374 <initNewPCB>
  101337:	89 c2                	mov    %eax,%edx
  101339:	c1 e2 0a             	shl    $0xa,%edx
  10133c:	01 c2                	add    %eax,%edx
  10133e:	01 d2                	add    %edx,%edx
  101340:	01 c2                	add    %eax,%edx
  101342:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101345:	8d 04 c5 00 50 10 00 	lea    0x105000(,%eax,8),%eax
  10134c:	a3 04 5d 30 00       	mov    %eax,0x305d04
  101351:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  101358:	00 00 00 
  10135b:	83 ec 0c             	sub    $0xc,%esp
  10135e:	ff 35 18 00 00 02    	pushl  0x2000018
  101364:	e8 5b 01 00 00       	call   1014c4 <enterProcessSpace>
  101369:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10136c:	5b                   	pop    %ebx
  10136d:	5e                   	pop    %esi
  10136e:	5f                   	pop    %edi
  10136f:	5d                   	pop    %ebp
  101370:	c3                   	ret    
  101371:	66 90                	xchg   %ax,%ax
  101373:	90                   	nop

00101374 <initNewPCB>:
  101374:	55                   	push   %ebp
  101375:	89 e5                	mov    %esp,%ebp
  101377:	56                   	push   %esi
  101378:	53                   	push   %ebx
  101379:	8b 1d 80 46 10 00    	mov    0x104680,%ebx
  10137f:	85 db                	test   %ebx,%ebx
  101381:	0f 84 15 01 00 00    	je     10149c <initNewPCB+0x128>
  101387:	83 3d 54 50 11 00 03 	cmpl   $0x3,0x115054
  10138e:	0f 84 18 01 00 00    	je     1014ac <initNewPCB+0x138>
  101394:	b9 bc 50 12 00       	mov    $0x1250bc,%ecx
  101399:	89 de                	mov    %ebx,%esi
  10139b:	31 d2                	xor    %edx,%edx
  10139d:	eb 14                	jmp    1013b3 <initNewPCB+0x3f>
  10139f:	90                   	nop
  1013a0:	81 c1 68 00 01 00    	add    $0x10068,%ecx
  1013a6:	83 b9 98 ff fe ff 03 	cmpl   $0x3,-0x10068(%ecx)
  1013ad:	0f 84 cd 00 00 00    	je     101480 <initNewPCB+0x10c>
  1013b3:	42                   	inc    %edx
  1013b4:	89 d0                	mov    %edx,%eax
  1013b6:	39 da                	cmp    %ebx,%edx
  1013b8:	75 e6                	jne    1013a0 <initNewPCB+0x2c>
  1013ba:	39 da                	cmp    %ebx,%edx
  1013bc:	0f 84 c8 00 00 00    	je     10148a <initNewPCB+0x116>
  1013c2:	8d 8e 00 02 00 00    	lea    0x200(%esi),%ecx
  1013c8:	89 f2                	mov    %esi,%edx
  1013ca:	c1 e2 0a             	shl    $0xa,%edx
  1013cd:	01 f2                	add    %esi,%edx
  1013cf:	01 d2                	add    %edx,%edx
  1013d1:	01 f2                	add    %esi,%edx
  1013d3:	8d 14 96             	lea    (%esi,%edx,4),%edx
  1013d6:	8d 14 d5 00 50 10 00 	lea    0x105000(,%edx,8),%edx
  1013dd:	c7 82 54 00 01 00 01 	movl   $0x1,0x10054(%edx)
  1013e4:	00 00 00 
  1013e7:	c7 82 5c 00 01 00 00 	movl   $0x0,0x1005c(%edx)
  1013ee:	00 00 00 
  1013f1:	c7 82 58 00 01 00 00 	movl   $0x0,0x10058(%edx)
  1013f8:	00 00 00 
  1013fb:	89 8a 60 00 01 00    	mov    %ecx,0x10060(%edx)
  101401:	c7 82 4c 00 01 00 00 	movl   $0x10000,0x1004c(%edx)
  101408:	00 01 00 
  10140b:	c7 82 50 00 01 00 00 	movl   $0x10000,0x10050(%edx)
  101412:	00 01 00 
  101415:	c7 82 64 00 01 00 00 	movl   $0x0,0x10064(%edx)
  10141c:	00 00 00 
  10141f:	c7 82 00 00 01 00 23 	movl   $0x23,0x10000(%edx)
  101426:	00 00 00 
  101429:	c7 82 04 00 01 00 23 	movl   $0x23,0x10004(%edx)
  101430:	00 00 00 
  101433:	c7 82 08 00 01 00 23 	movl   $0x23,0x10008(%edx)
  10143a:	00 00 00 
  10143d:	c7 82 0c 00 01 00 23 	movl   $0x23,0x1000c(%edx)
  101444:	00 00 00 
  101447:	c7 82 38 00 01 00 00 	movl   $0x0,0x10038(%edx)
  10144e:	00 00 00 
  101451:	c7 82 3c 00 01 00 1b 	movl   $0x1b,0x1003c(%edx)
  101458:	00 00 00 
  10145b:	c7 82 40 00 01 00 00 	movl   $0x0,0x10040(%edx)
  101462:	00 00 00 
  101465:	c7 82 44 00 01 00 00 	movl   $0x100000,0x10044(%edx)
  10146c:	00 10 00 
  10146f:	c7 82 48 00 01 00 23 	movl   $0x23,0x10048(%edx)
  101476:	00 00 00 
  101479:	5b                   	pop    %ebx
  10147a:	5e                   	pop    %esi
  10147b:	5d                   	pop    %ebp
  10147c:	c3                   	ret    
  10147d:	8d 76 00             	lea    0x0(%esi),%esi
  101480:	89 d6                	mov    %edx,%esi
  101482:	39 da                	cmp    %ebx,%edx
  101484:	0f 85 38 ff ff ff    	jne    1013c2 <initNewPCB+0x4e>
  10148a:	42                   	inc    %edx
  10148b:	8d 8e 00 02 00 00    	lea    0x200(%esi),%ecx
  101491:	89 15 80 46 10 00    	mov    %edx,0x104680
  101497:	e9 2c ff ff ff       	jmp    1013c8 <initNewPCB+0x54>
  10149c:	31 c0                	xor    %eax,%eax
  10149e:	b9 00 02 00 00       	mov    $0x200,%ecx
  1014a3:	ba 01 00 00 00       	mov    $0x1,%edx
  1014a8:	31 f6                	xor    %esi,%esi
  1014aa:	eb e5                	jmp    101491 <initNewPCB+0x11d>
  1014ac:	b9 00 02 00 00       	mov    $0x200,%ecx
  1014b1:	31 f6                	xor    %esi,%esi
  1014b3:	31 c0                	xor    %eax,%eax
  1014b5:	e9 0e ff ff ff       	jmp    1013c8 <initNewPCB+0x54>
  1014ba:	66 90                	xchg   %ax,%ax

001014bc <idle>:
  1014bc:	55                   	push   %ebp
  1014bd:	89 e5                	mov    %esp,%ebp
  1014bf:	fb                   	sti    
  1014c0:	f4                   	hlt    
  1014c1:	eb fd                	jmp    1014c0 <idle+0x4>
  1014c3:	90                   	nop

001014c4 <enterProcessSpace>:
  1014c4:	55                   	push   %ebp
  1014c5:	89 e5                	mov    %esp,%ebp
  1014c7:	53                   	push   %ebx
  1014c8:	83 ec 08             	sub    $0x8,%esp
  1014cb:	68 00 00 08 00       	push   $0x80000
  1014d0:	ff 75 08             	pushl  0x8(%ebp)
  1014d3:	a1 04 5d 30 00       	mov    0x305d04,%eax
  1014d8:	2d 00 50 10 00       	sub    $0x105000,%eax
  1014dd:	c1 f8 03             	sar    $0x3,%eax
  1014e0:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  1014e3:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1014e6:	01 d2                	add    %edx,%edx
  1014e8:	01 c2                	add    %eax,%edx
  1014ea:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1014ed:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1014f0:	c1 e2 0b             	shl    $0xb,%edx
  1014f3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  1014f6:	89 ca                	mov    %ecx,%edx
  1014f8:	c1 e2 04             	shl    $0x4,%edx
  1014fb:	01 ca                	add    %ecx,%edx
  1014fd:	01 d2                	add    %edx,%edx
  1014ff:	01 d0                	add    %edx,%eax
  101501:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101504:	f7 d8                	neg    %eax
  101506:	83 c0 04             	add    $0x4,%eax
  101509:	c1 e0 14             	shl    $0x14,%eax
  10150c:	50                   	push   %eax
  10150d:	e8 06 ed ff ff       	call   100218 <memcpy>
  101512:	8b 15 04 5d 30 00    	mov    0x305d04,%edx
  101518:	89 d0                	mov    %edx,%eax
  10151a:	2d 00 50 10 00       	sub    $0x105000,%eax
  10151f:	c1 f8 03             	sar    $0x3,%eax
  101522:	89 c1                	mov    %eax,%ecx
  101524:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101527:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  10152a:	01 c0                	add    %eax,%eax
  10152c:	01 c8                	add    %ecx,%eax
  10152e:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101531:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101534:	c1 e0 0b             	shl    $0xb,%eax
  101537:	01 c8                	add    %ecx,%eax
  101539:	89 c3                	mov    %eax,%ebx
  10153b:	c1 e3 04             	shl    $0x4,%ebx
  10153e:	01 d8                	add    %ebx,%eax
  101540:	01 c0                	add    %eax,%eax
  101542:	01 c8                	add    %ecx,%eax
  101544:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101547:	f7 d8                	neg    %eax
  101549:	83 c0 04             	add    $0x4,%eax
  10154c:	c1 e0 14             	shl    $0x14,%eax
  10154f:	89 c3                	mov    %eax,%ebx
  101551:	c1 eb 10             	shr    $0x10,%ebx
  101554:	c1 e8 18             	shr    $0x18,%eax
  101557:	b9 40 4f 10 00       	mov    $0x104f40,%ecx
  10155c:	66 c7 05 58 4f 10 00 	movw   $0x100,0x104f58
  101563:	00 01 
  101565:	66 c7 05 5a 4f 10 00 	movw   $0x0,0x104f5a
  10156c:	00 00 
  10156e:	88 1d 5c 4f 10 00    	mov    %bl,0x104f5c
  101574:	c6 05 5d 4f 10 00 fa 	movb   $0xfa,0x104f5d
  10157b:	c6 05 5e 4f 10 00 c0 	movb   $0xc0,0x104f5e
  101582:	a2 5f 4f 10 00       	mov    %al,0x104f5f
  101587:	66 c7 05 60 4f 10 00 	movw   $0x100,0x104f60
  10158e:	00 01 
  101590:	66 c7 05 62 4f 10 00 	movw   $0x0,0x104f62
  101597:	00 00 
  101599:	88 1d 64 4f 10 00    	mov    %bl,0x104f64
  10159f:	c6 05 65 4f 10 00 f2 	movb   $0xf2,0x104f65
  1015a6:	c6 05 66 4f 10 00 c0 	movb   $0xc0,0x104f66
  1015ad:	a2 67 4f 10 00       	mov    %al,0x104f67
  1015b2:	66 c7 05 70 4f 10 00 	movw   $0x10,0x104f70
  1015b9:	10 00 
  1015bb:	66 89 15 72 4f 10 00 	mov    %dx,0x104f72
  1015c2:	89 d0                	mov    %edx,%eax
  1015c4:	c1 e8 10             	shr    $0x10,%eax
  1015c7:	a2 74 4f 10 00       	mov    %al,0x104f74
  1015cc:	c6 05 75 4f 10 00 92 	movb   $0x92,0x104f75
  1015d3:	c6 05 76 4f 10 00 c0 	movb   $0xc0,0x104f76
  1015da:	89 d0                	mov    %edx,%eax
  1015dc:	c1 e8 18             	shr    $0x18,%eax
  1015df:	a2 77 4f 10 00       	mov    %al,0x104f77
  1015e4:	66 c7 05 84 46 10 00 	movw   $0x37,0x104684
  1015eb:	37 00 
  1015ed:	66 89 0d 86 46 10 00 	mov    %cx,0x104686
  1015f4:	c1 e9 10             	shr    $0x10,%ecx
  1015f7:	66 89 0d 88 46 10 00 	mov    %cx,0x104688
  1015fe:	b8 84 46 10 00       	mov    $0x104684,%eax
  101603:	0f 01 10             	lgdtl  (%eax)
  101606:	8d 82 44 00 01 00    	lea    0x10044(%edx),%eax
  10160c:	89 c4                	mov    %eax,%esp
  10160e:	9c                   	pushf  
  10160f:	81 c2 38 00 01 00    	add    $0x10038,%edx
  101615:	89 d4                	mov    %edx,%esp
  101617:	b8 23 00 00 00       	mov    $0x23,%eax
  10161c:	89 c0                	mov    %eax,%eax
  10161e:	8e d8                	mov    %eax,%ds
  101620:	8e c0                	mov    %eax,%es
  101622:	8e e0                	mov    %eax,%fs
  101624:	8e e8                	mov    %eax,%gs
  101626:	cf                   	iret   
  101627:	83 c4 10             	add    $0x10,%esp
  10162a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10162d:	c9                   	leave  
  10162e:	c3                   	ret    
  10162f:	90                   	nop

00101630 <addToBlocked>:
  101630:	55                   	push   %ebp
  101631:	89 e5                	mov    %esp,%ebp
  101633:	8b 45 08             	mov    0x8(%ebp),%eax
  101636:	8b 15 00 5d 30 00    	mov    0x305d00,%edx
  10163c:	85 d2                	test   %edx,%edx
  10163e:	74 14                	je     101654 <addToBlocked+0x24>
  101640:	8b 15 10 5d 30 00    	mov    0x305d10,%edx
  101646:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  10164c:	a3 10 5d 30 00       	mov    %eax,0x305d10
  101651:	5d                   	pop    %ebp
  101652:	c3                   	ret    
  101653:	90                   	nop
  101654:	a3 00 5d 30 00       	mov    %eax,0x305d00
  101659:	a3 10 5d 30 00       	mov    %eax,0x305d10
  10165e:	5d                   	pop    %ebp
  10165f:	c3                   	ret    

00101660 <addToRunnable>:
  101660:	55                   	push   %ebp
  101661:	89 e5                	mov    %esp,%ebp
  101663:	8b 45 08             	mov    0x8(%ebp),%eax
  101666:	8b 15 08 5d 30 00    	mov    0x305d08,%edx
  10166c:	85 d2                	test   %edx,%edx
  10166e:	74 14                	je     101684 <addToRunnable+0x24>
  101670:	8b 15 0c 5d 30 00    	mov    0x305d0c,%edx
  101676:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  10167c:	a3 0c 5d 30 00       	mov    %eax,0x305d0c
  101681:	5d                   	pop    %ebp
  101682:	c3                   	ret    
  101683:	90                   	nop
  101684:	a3 08 5d 30 00       	mov    %eax,0x305d08
  101689:	a3 0c 5d 30 00       	mov    %eax,0x305d0c
  10168e:	5d                   	pop    %ebp
  10168f:	c3                   	ret    

00101690 <updateTime>:
  101690:	55                   	push   %ebp
  101691:	89 e5                	mov    %esp,%ebp
  101693:	a1 04 5d 30 00       	mov    0x305d04,%eax
  101698:	83 b8 54 00 01 00 02 	cmpl   $0x2,0x10054(%eax)
  10169f:	74 06                	je     1016a7 <updateTime+0x17>
  1016a1:	ff 80 58 00 01 00    	incl   0x10058(%eax)
  1016a7:	a1 00 5d 30 00       	mov    0x305d00,%eax
  1016ac:	85 c0                	test   %eax,%eax
  1016ae:	74 3b                	je     1016eb <updateTime+0x5b>
  1016b0:	8b 88 5c 00 01 00    	mov    0x1005c(%eax),%ecx
  1016b6:	8d 51 ff             	lea    -0x1(%ecx),%edx
  1016b9:	89 90 5c 00 01 00    	mov    %edx,0x1005c(%eax)
  1016bf:	85 d2                	test   %edx,%edx
  1016c1:	75 1e                	jne    1016e1 <updateTime+0x51>
  1016c3:	c7 80 54 00 01 00 01 	movl   $0x1,0x10054(%eax)
  1016ca:	00 00 00 
  1016cd:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  1016d4:	00 00 00 
  1016d7:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  1016de:	00 00 00 
  1016e1:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1016e7:	85 c0                	test   %eax,%eax
  1016e9:	75 c5                	jne    1016b0 <updateTime+0x20>
  1016eb:	5d                   	pop    %ebp
  1016ec:	c3                   	ret    
  1016ed:	8d 76 00             	lea    0x0(%esi),%esi

001016f0 <checkRunnableList>:
  1016f0:	55                   	push   %ebp
  1016f1:	89 e5                	mov    %esp,%ebp
  1016f3:	57                   	push   %edi
  1016f4:	56                   	push   %esi
  1016f5:	53                   	push   %ebx
  1016f6:	52                   	push   %edx
  1016f7:	a1 08 5d 30 00       	mov    0x305d08,%eax
  1016fc:	8b 3d 00 5d 30 00    	mov    0x305d00,%edi
  101702:	8b 35 10 5d 30 00    	mov    0x305d10,%esi
  101708:	31 db                	xor    %ebx,%ebx
  10170a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10170e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101712:	eb 0c                	jmp    101720 <checkRunnableList+0x30>
  101714:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  10171a:	b3 01                	mov    $0x1,%bl
  10171c:	85 c0                	test   %eax,%eax
  10171e:	74 37                	je     101757 <checkRunnableList+0x67>
  101720:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  101726:	8d 4a fe             	lea    -0x2(%edx),%ecx
  101729:	83 f9 01             	cmp    $0x1,%ecx
  10172c:	0f 87 be 00 00 00    	ja     1017f0 <checkRunnableList+0x100>
  101732:	83 fa 02             	cmp    $0x2,%edx
  101735:	75 dd                	jne    101714 <checkRunnableList+0x24>
  101737:	85 ff                	test   %edi,%edi
  101739:	0f 84 e9 00 00 00    	je     101828 <checkRunnableList+0x138>
  10173f:	89 86 64 00 01 00    	mov    %eax,0x10064(%esi)
  101745:	89 c6                	mov    %eax,%esi
  101747:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10174b:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  101751:	b3 01                	mov    $0x1,%bl
  101753:	85 c0                	test   %eax,%eax
  101755:	75 c9                	jne    101720 <checkRunnableList+0x30>
  101757:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  10175b:	0f 85 fc 00 00 00    	jne    10185d <checkRunnableList+0x16d>
  101761:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  101765:	0f 85 fd 00 00 00    	jne    101868 <checkRunnableList+0x178>
  10176b:	c7 05 08 5d 30 00 00 	movl   $0x0,0x305d08
  101772:	00 00 00 
  101775:	c7 05 0c 5d 30 00 00 	movl   $0x0,0x305d0c
  10177c:	00 00 00 
  10177f:	31 c0                	xor    %eax,%eax
  101781:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  101787:	85 d2                	test   %edx,%edx
  101789:	74 5e                	je     1017e9 <checkRunnableList+0xf9>
  10178b:	8b 3d 00 5d 30 00    	mov    0x305d00,%edi
  101791:	8b 35 10 5d 30 00    	mov    0x305d10,%esi
  101797:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10179b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10179f:	eb 0f                	jmp    1017b0 <checkRunnableList+0xc0>
  1017a1:	8d 76 00             	lea    0x0(%esi),%esi
  1017a4:	89 d0                	mov    %edx,%eax
  1017a6:	8b 92 64 00 01 00    	mov    0x10064(%edx),%edx
  1017ac:	85 d2                	test   %edx,%edx
  1017ae:	74 29                	je     1017d9 <checkRunnableList+0xe9>
  1017b0:	8b 8a 54 00 01 00    	mov    0x10054(%edx),%ecx
  1017b6:	8d 59 fe             	lea    -0x2(%ecx),%ebx
  1017b9:	83 fb 01             	cmp    $0x1,%ebx
  1017bc:	77 e6                	ja     1017a4 <checkRunnableList+0xb4>
  1017be:	83 f9 02             	cmp    $0x2,%ecx
  1017c1:	74 51                	je     101814 <checkRunnableList+0x124>
  1017c3:	8b 8a 64 00 01 00    	mov    0x10064(%edx),%ecx
  1017c9:	89 88 64 00 01 00    	mov    %ecx,0x10064(%eax)
  1017cf:	8b 92 64 00 01 00    	mov    0x10064(%edx),%edx
  1017d5:	85 d2                	test   %edx,%edx
  1017d7:	75 d7                	jne    1017b0 <checkRunnableList+0xc0>
  1017d9:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  1017dd:	0f 85 90 00 00 00    	jne    101873 <checkRunnableList+0x183>
  1017e3:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  1017e7:	75 64                	jne    10184d <checkRunnableList+0x15d>
  1017e9:	58                   	pop    %eax
  1017ea:	5b                   	pop    %ebx
  1017eb:	5e                   	pop    %esi
  1017ec:	5f                   	pop    %edi
  1017ed:	5d                   	pop    %ebp
  1017ee:	c3                   	ret    
  1017ef:	90                   	nop
  1017f0:	80 7d f2 00          	cmpb   $0x0,-0xe(%ebp)
  1017f4:	75 5f                	jne    101855 <checkRunnableList+0x165>
  1017f6:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  1017fa:	74 06                	je     101802 <checkRunnableList+0x112>
  1017fc:	89 35 10 5d 30 00    	mov    %esi,0x305d10
  101802:	84 db                	test   %bl,%bl
  101804:	0f 84 77 ff ff ff    	je     101781 <checkRunnableList+0x91>
  10180a:	a3 08 5d 30 00       	mov    %eax,0x305d08
  10180f:	e9 6d ff ff ff       	jmp    101781 <checkRunnableList+0x91>
  101814:	85 ff                	test   %edi,%edi
  101816:	74 24                	je     10183c <checkRunnableList+0x14c>
  101818:	89 96 64 00 01 00    	mov    %edx,0x10064(%esi)
  10181e:	89 d6                	mov    %edx,%esi
  101820:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101824:	eb 9d                	jmp    1017c3 <checkRunnableList+0xd3>
  101826:	66 90                	xchg   %ax,%ax
  101828:	89 c6                	mov    %eax,%esi
  10182a:	89 c7                	mov    %eax,%edi
  10182c:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101830:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101834:	e9 db fe ff ff       	jmp    101714 <checkRunnableList+0x24>
  101839:	8d 76 00             	lea    0x0(%esi),%esi
  10183c:	89 d6                	mov    %edx,%esi
  10183e:	89 d7                	mov    %edx,%edi
  101840:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101844:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101848:	e9 76 ff ff ff       	jmp    1017c3 <checkRunnableList+0xd3>
  10184d:	89 35 10 5d 30 00    	mov    %esi,0x305d10
  101853:	eb 94                	jmp    1017e9 <checkRunnableList+0xf9>
  101855:	89 3d 00 5d 30 00    	mov    %edi,0x305d00
  10185b:	eb 99                	jmp    1017f6 <checkRunnableList+0x106>
  10185d:	89 3d 00 5d 30 00    	mov    %edi,0x305d00
  101863:	e9 f9 fe ff ff       	jmp    101761 <checkRunnableList+0x71>
  101868:	89 35 10 5d 30 00    	mov    %esi,0x305d10
  10186e:	e9 f8 fe ff ff       	jmp    10176b <checkRunnableList+0x7b>
  101873:	89 3d 00 5d 30 00    	mov    %edi,0x305d00
  101879:	e9 65 ff ff ff       	jmp    1017e3 <checkRunnableList+0xf3>
  10187e:	66 90                	xchg   %ax,%ax

00101880 <checkBlockedList>:
  101880:	55                   	push   %ebp
  101881:	89 e5                	mov    %esp,%ebp
  101883:	56                   	push   %esi
  101884:	53                   	push   %ebx
  101885:	a1 00 5d 30 00       	mov    0x305d00,%eax
  10188a:	eb 18                	jmp    1018a4 <checkBlockedList+0x24>
  10188c:	83 fa 03             	cmp    $0x3,%edx
  10188f:	0f 85 d3 00 00 00    	jne    101968 <checkBlockedList+0xe8>
  101895:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  10189b:	a3 00 5d 30 00       	mov    %eax,0x305d00
  1018a0:	85 c0                	test   %eax,%eax
  1018a2:	74 50                	je     1018f4 <checkBlockedList+0x74>
  1018a4:	8b 90 54 00 01 00    	mov    0x10054(%eax),%edx
  1018aa:	83 fa 01             	cmp    $0x1,%edx
  1018ad:	75 dd                	jne    10188c <checkBlockedList+0xc>
  1018af:	83 ec 0c             	sub    $0xc,%esp
  1018b2:	68 f6 28 10 00       	push   $0x1028f6
  1018b7:	e8 e8 f4 ff ff       	call   100da4 <printString>
  1018bc:	a1 00 5d 30 00       	mov    0x305d00,%eax
  1018c1:	83 c4 10             	add    $0x10,%esp
  1018c4:	8b 15 08 5d 30 00    	mov    0x305d08,%edx
  1018ca:	85 d2                	test   %edx,%edx
  1018cc:	0f 84 9a 00 00 00    	je     10196c <checkBlockedList+0xec>
  1018d2:	8b 15 0c 5d 30 00    	mov    0x305d0c,%edx
  1018d8:	89 82 64 00 01 00    	mov    %eax,0x10064(%edx)
  1018de:	a3 0c 5d 30 00       	mov    %eax,0x305d0c
  1018e3:	8b 80 64 00 01 00    	mov    0x10064(%eax),%eax
  1018e9:	a3 00 5d 30 00       	mov    %eax,0x305d00
  1018ee:	85 c0                	test   %eax,%eax
  1018f0:	75 b2                	jne    1018a4 <checkBlockedList+0x24>
  1018f2:	66 90                	xchg   %ax,%ax
  1018f4:	c7 05 10 5d 30 00 00 	movl   $0x0,0x305d10
  1018fb:	00 00 00 
  1018fe:	31 db                	xor    %ebx,%ebx
  101900:	8b b3 64 00 01 00    	mov    0x10064(%ebx),%esi
  101906:	66 90                	xchg   %ax,%ax
  101908:	85 f6                	test   %esi,%esi
  10190a:	74 1c                	je     101928 <checkBlockedList+0xa8>
  10190c:	8b 86 54 00 01 00    	mov    0x10054(%esi),%eax
  101912:	83 f8 01             	cmp    $0x1,%eax
  101915:	74 19                	je     101930 <checkBlockedList+0xb0>
  101917:	83 f8 03             	cmp    $0x3,%eax
  10191a:	74 3e                	je     10195a <checkBlockedList+0xda>
  10191c:	89 f3                	mov    %esi,%ebx
  10191e:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101924:	85 f6                	test   %esi,%esi
  101926:	75 e4                	jne    10190c <checkBlockedList+0x8c>
  101928:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10192b:	5b                   	pop    %ebx
  10192c:	5e                   	pop    %esi
  10192d:	5d                   	pop    %ebp
  10192e:	c3                   	ret    
  10192f:	90                   	nop
  101930:	83 ec 0c             	sub    $0xc,%esp
  101933:	68 f6 28 10 00       	push   $0x1028f6
  101938:	e8 67 f4 ff ff       	call   100da4 <printString>
  10193d:	83 c4 10             	add    $0x10,%esp
  101940:	a1 08 5d 30 00       	mov    0x305d08,%eax
  101945:	85 c0                	test   %eax,%eax
  101947:	74 32                	je     10197b <checkBlockedList+0xfb>
  101949:	a1 0c 5d 30 00       	mov    0x305d0c,%eax
  10194e:	89 b0 64 00 01 00    	mov    %esi,0x10064(%eax)
  101954:	89 35 0c 5d 30 00    	mov    %esi,0x305d0c
  10195a:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  101960:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  101966:	eb a0                	jmp    101908 <checkBlockedList+0x88>
  101968:	89 c3                	mov    %eax,%ebx
  10196a:	eb 94                	jmp    101900 <checkBlockedList+0x80>
  10196c:	a3 08 5d 30 00       	mov    %eax,0x305d08
  101971:	a3 0c 5d 30 00       	mov    %eax,0x305d0c
  101976:	e9 1a ff ff ff       	jmp    101895 <checkBlockedList+0x15>
  10197b:	89 35 08 5d 30 00    	mov    %esi,0x305d08
  101981:	89 35 0c 5d 30 00    	mov    %esi,0x305d0c
  101987:	8b b6 64 00 01 00    	mov    0x10064(%esi),%esi
  10198d:	89 b3 64 00 01 00    	mov    %esi,0x10064(%ebx)
  101993:	e9 70 ff ff ff       	jmp    101908 <checkBlockedList+0x88>

00101998 <schedule>:
  101998:	a1 08 5d 30 00       	mov    0x305d08,%eax
  10199d:	85 c0                	test   %eax,%eax
  10199f:	74 4a                	je     1019eb <schedule+0x53>
  1019a1:	c7 80 54 00 01 00 00 	movl   $0x0,0x10054(%eax)
  1019a8:	00 00 00 
  1019ab:	c7 80 5c 00 01 00 00 	movl   $0x0,0x1005c(%eax)
  1019b2:	00 00 00 
  1019b5:	c7 80 58 00 01 00 00 	movl   $0x0,0x10058(%eax)
  1019bc:	00 00 00 
  1019bf:	a3 04 5d 30 00       	mov    %eax,0x305d04
  1019c4:	8b 90 64 00 01 00    	mov    0x10064(%eax),%edx
  1019ca:	89 15 08 5d 30 00    	mov    %edx,0x305d08
  1019d0:	c7 80 64 00 01 00 00 	movl   $0x0,0x10064(%eax)
  1019d7:	00 00 00 
  1019da:	85 d2                	test   %edx,%edx
  1019dc:	74 02                	je     1019e0 <schedule+0x48>
  1019de:	c3                   	ret    
  1019df:	90                   	nop
  1019e0:	c7 05 0c 5d 30 00 00 	movl   $0x0,0x305d0c
  1019e7:	00 00 00 
  1019ea:	c3                   	ret    
  1019eb:	55                   	push   %ebp
  1019ec:	89 e5                	mov    %esp,%ebp
  1019ee:	e8 c9 fa ff ff       	call   1014bc <idle>
  1019f3:	90                   	nop

001019f4 <switchToRunning>:
  1019f4:	55                   	push   %ebp
  1019f5:	89 e5                	mov    %esp,%ebp
  1019f7:	53                   	push   %ebx
  1019f8:	83 ec 10             	sub    $0x10,%esp
  1019fb:	68 fc 28 10 00       	push   $0x1028fc
  101a00:	e8 9f f3 ff ff       	call   100da4 <printString>
  101a05:	c7 05 88 4f 10 00 30 	movl   $0x30,0x104f88
  101a0c:	00 00 00 
  101a0f:	8b 15 04 5d 30 00    	mov    0x305d04,%edx
  101a15:	8b 82 4c 00 01 00    	mov    0x1004c(%edx),%eax
  101a1b:	a3 84 4f 10 00       	mov    %eax,0x104f84
  101a20:	89 d0                	mov    %edx,%eax
  101a22:	2d 00 50 10 00       	sub    $0x105000,%eax
  101a27:	c1 f8 03             	sar    $0x3,%eax
  101a2a:	8d 0c c0             	lea    (%eax,%eax,8),%ecx
  101a2d:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  101a30:	01 c9                	add    %ecx,%ecx
  101a32:	01 c1                	add    %eax,%ecx
  101a34:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  101a37:	8d 0c c9             	lea    (%ecx,%ecx,8),%ecx
  101a3a:	c1 e1 0b             	shl    $0xb,%ecx
  101a3d:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
  101a40:	89 d9                	mov    %ebx,%ecx
  101a42:	c1 e1 04             	shl    $0x4,%ecx
  101a45:	01 d9                	add    %ebx,%ecx
  101a47:	01 c9                	add    %ecx,%ecx
  101a49:	01 c8                	add    %ecx,%eax
  101a4b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
  101a4e:	f7 d8                	neg    %eax
  101a50:	83 c0 04             	add    $0x4,%eax
  101a53:	c1 e0 14             	shl    $0x14,%eax
  101a56:	89 c3                	mov    %eax,%ebx
  101a58:	c1 eb 10             	shr    $0x10,%ebx
  101a5b:	c1 e8 18             	shr    $0x18,%eax
  101a5e:	b9 40 4f 10 00       	mov    $0x104f40,%ecx
  101a63:	66 c7 05 58 4f 10 00 	movw   $0x100,0x104f58
  101a6a:	00 01 
  101a6c:	66 c7 05 5a 4f 10 00 	movw   $0x0,0x104f5a
  101a73:	00 00 
  101a75:	88 1d 5c 4f 10 00    	mov    %bl,0x104f5c
  101a7b:	c6 05 5d 4f 10 00 fa 	movb   $0xfa,0x104f5d
  101a82:	c6 05 5e 4f 10 00 c0 	movb   $0xc0,0x104f5e
  101a89:	a2 5f 4f 10 00       	mov    %al,0x104f5f
  101a8e:	66 c7 05 60 4f 10 00 	movw   $0x100,0x104f60
  101a95:	00 01 
  101a97:	66 c7 05 62 4f 10 00 	movw   $0x0,0x104f62
  101a9e:	00 00 
  101aa0:	88 1d 64 4f 10 00    	mov    %bl,0x104f64
  101aa6:	c6 05 65 4f 10 00 f2 	movb   $0xf2,0x104f65
  101aad:	c6 05 66 4f 10 00 c0 	movb   $0xc0,0x104f66
  101ab4:	a2 67 4f 10 00       	mov    %al,0x104f67
  101ab9:	66 c7 05 70 4f 10 00 	movw   $0x10,0x104f70
  101ac0:	10 00 
  101ac2:	66 89 15 72 4f 10 00 	mov    %dx,0x104f72
  101ac9:	89 d0                	mov    %edx,%eax
  101acb:	c1 e8 10             	shr    $0x10,%eax
  101ace:	a2 74 4f 10 00       	mov    %al,0x104f74
  101ad3:	c6 05 75 4f 10 00 92 	movb   $0x92,0x104f75
  101ada:	c6 05 76 4f 10 00 c0 	movb   $0xc0,0x104f76
  101ae1:	c1 ea 18             	shr    $0x18,%edx
  101ae4:	88 15 77 4f 10 00    	mov    %dl,0x104f77
  101aea:	66 c7 05 84 46 10 00 	movw   $0x37,0x104684
  101af1:	37 00 
  101af3:	66 89 0d 86 46 10 00 	mov    %cx,0x104686
  101afa:	c1 e9 10             	shr    $0x10,%ecx
  101afd:	66 89 0d 88 46 10 00 	mov    %cx,0x104688
  101b04:	b8 84 46 10 00       	mov    $0x104684,%eax
  101b09:	0f 01 10             	lgdtl  (%eax)
  101b0c:	b8 30 00 00 00       	mov    $0x30,%eax
  101b11:	8e d0                	mov    %eax,%ss
  101b13:	b8 44 00 01 00       	mov    $0x10044,%eax
  101b18:	89 c4                	mov    %eax,%esp
  101b1a:	9c                   	pushf  
  101b1b:	b8 00 00 01 00       	mov    $0x10000,%eax
  101b20:	89 c4                	mov    %eax,%esp
  101b22:	0f a9                	pop    %gs
  101b24:	0f a1                	pop    %fs
  101b26:	07                   	pop    %es
  101b27:	1f                   	pop    %ds
  101b28:	61                   	popa   
  101b29:	83 c4 08             	add    $0x8,%esp
  101b2c:	cf                   	iret   
  101b2d:	83 c4 10             	add    $0x10,%esp
  101b30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101b33:	c9                   	leave  
  101b34:	c3                   	ret    
  101b35:	66 90                	xchg   %ax,%ax
  101b37:	90                   	nop

00101b38 <initFS>:
  101b38:	55                   	push   %ebp
  101b39:	89 e5                	mov    %esp,%ebp
  101b3b:	56                   	push   %esi
  101b3c:	53                   	push   %ebx
  101b3d:	be 40 5f 30 00       	mov    $0x305f40,%esi
  101b42:	31 db                	xor    %ebx,%ebx
  101b44:	83 ec 08             	sub    $0x8,%esp
  101b47:	53                   	push   %ebx
  101b48:	56                   	push   %esi
  101b49:	e8 b2 f4 ff ff       	call   101000 <readSect>
  101b4e:	43                   	inc    %ebx
  101b4f:	81 c6 00 02 00 00    	add    $0x200,%esi
  101b55:	83 c4 10             	add    $0x10,%esp
  101b58:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  101b5e:	75 e4                	jne    101b44 <initFS+0xc>
  101b60:	c7 05 28 5d 30 00 40 	movl   $0x31f140,0x305d28
  101b67:	f1 31 00 
  101b6a:	c7 05 40 5f 38 00 40 	movl   $0x31f540,0x385f40
  101b71:	f5 31 00 
  101b74:	c7 05 20 5d 30 00 40 	movl   $0x31f740,0x305d20
  101b7b:	f7 31 00 
  101b7e:	c7 05 24 5d 30 00 40 	movl   $0x31f940,0x305d24
  101b85:	f9 31 00 
  101b88:	c7 05 34 5f 30 00 40 	movl   $0x32f940,0x305f34
  101b8f:	f9 32 00 
  101b92:	b8 40 5e 30 00       	mov    $0x305e40,%eax
  101b97:	90                   	nop
  101b98:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  101b9e:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
  101ba5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  101bac:	83 c0 0c             	add    $0xc,%eax
  101baf:	3d 00 5f 30 00       	cmp    $0x305f00,%eax
  101bb4:	75 e2                	jne    101b98 <initFS+0x60>
  101bb6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101bb9:	5b                   	pop    %ebx
  101bba:	5e                   	pop    %esi
  101bbb:	5d                   	pop    %ebp
  101bbc:	c3                   	ret    
  101bbd:	8d 76 00             	lea    0x0(%esi),%esi

00101bc0 <splitFileName>:
  101bc0:	55                   	push   %ebp
  101bc1:	89 e5                	mov    %esp,%ebp
  101bc3:	57                   	push   %edi
  101bc4:	56                   	push   %esi
  101bc5:	53                   	push   %ebx
  101bc6:	83 ec 24             	sub    $0x24,%esp
  101bc9:	8b 75 0c             	mov    0xc(%ebp),%esi
  101bcc:	8b 5d 10             	mov    0x10(%ebp),%ebx
  101bcf:	ff 75 08             	pushl  0x8(%ebp)
  101bd2:	68 c0 5d 30 00       	push   $0x305dc0
  101bd7:	e8 4c e4 ff ff       	call   100028 <strcpy>
  101bdc:	8a 15 c0 5d 30 00    	mov    0x305dc0,%dl
  101be2:	83 c4 10             	add    $0x10,%esp
  101be5:	84 d2                	test   %dl,%dl
  101be7:	74 56                	je     101c3f <splitFileName+0x7f>
  101be9:	31 ff                	xor    %edi,%edi
  101beb:	b8 c0 5d 30 00       	mov    $0x305dc0,%eax
  101bf0:	eb 09                	jmp    101bfb <splitFileName+0x3b>
  101bf2:	66 90                	xchg   %ax,%ax
  101bf4:	40                   	inc    %eax
  101bf5:	8a 10                	mov    (%eax),%dl
  101bf7:	84 d2                	test   %dl,%dl
  101bf9:	74 0e                	je     101c09 <splitFileName+0x49>
  101bfb:	80 fa 2f             	cmp    $0x2f,%dl
  101bfe:	75 f4                	jne    101bf4 <splitFileName+0x34>
  101c00:	89 c7                	mov    %eax,%edi
  101c02:	40                   	inc    %eax
  101c03:	8a 10                	mov    (%eax),%dl
  101c05:	84 d2                	test   %dl,%dl
  101c07:	75 f2                	jne    101bfb <splitFileName+0x3b>
  101c09:	85 ff                	test   %edi,%edi
  101c0b:	74 32                	je     101c3f <splitFileName+0x7f>
  101c0d:	8d 57 01             	lea    0x1(%edi),%edx
  101c10:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  101c13:	c6 07 00             	movb   $0x0,(%edi)
  101c16:	83 ec 08             	sub    $0x8,%esp
  101c19:	68 c0 5d 30 00       	push   $0x305dc0
  101c1e:	56                   	push   %esi
  101c1f:	e8 04 e4 ff ff       	call   100028 <strcpy>
  101c24:	c6 07 2f             	movb   $0x2f,(%edi)
  101c27:	83 c4 10             	add    $0x10,%esp
  101c2a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  101c2d:	89 55 0c             	mov    %edx,0xc(%ebp)
  101c30:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101c33:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101c36:	5b                   	pop    %ebx
  101c37:	5e                   	pop    %esi
  101c38:	5f                   	pop    %edi
  101c39:	5d                   	pop    %ebp
  101c3a:	e9 e9 e3 ff ff       	jmp    100028 <strcpy>
  101c3f:	83 ec 0c             	sub    $0xc,%esp
  101c42:	68 04 29 10 00       	push   $0x102904
  101c47:	e8 58 f1 ff ff       	call   100da4 <printString>
  101c4c:	58                   	pop    %eax
  101c4d:	5a                   	pop    %edx
  101c4e:	6a 2d                	push   $0x2d
  101c50:	68 0d 29 10 00       	push   $0x10290d
  101c55:	e8 12 0b 00 00       	call   10276c <abort>
  101c5a:	83 c4 10             	add    $0x10,%esp
  101c5d:	ba 01 00 00 00       	mov    $0x1,%edx
  101c62:	31 ff                	xor    %edi,%edi
  101c64:	eb aa                	jmp    101c10 <splitFileName+0x50>
  101c66:	66 90                	xchg   %ax,%ax

00101c68 <findFile>:
  101c68:	55                   	push   %ebp
  101c69:	89 e5                	mov    %esp,%ebp
  101c6b:	57                   	push   %edi
  101c6c:	56                   	push   %esi
  101c6d:	53                   	push   %ebx
  101c6e:	83 ec 2c             	sub    $0x2c,%esp
  101c71:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101c74:	85 db                	test   %ebx,%ebx
  101c76:	0f 84 39 01 00 00    	je     101db5 <findFile+0x14d>
  101c7c:	8a 03                	mov    (%ebx),%al
  101c7e:	84 c0                	test   %al,%al
  101c80:	74 1c                	je     101c9e <findFile+0x36>
  101c82:	3c 2f                	cmp    $0x2f,%al
  101c84:	74 12                	je     101c98 <findFile+0x30>
  101c86:	83 ec 08             	sub    $0x8,%esp
  101c89:	6a 3b                	push   $0x3b
  101c8b:	68 0d 29 10 00       	push   $0x10290d
  101c90:	e8 d7 0a 00 00       	call   10276c <abort>
  101c95:	83 c4 10             	add    $0x10,%esp
  101c98:	80 7b 01 00          	cmpb   $0x0,0x1(%ebx)
  101c9c:	75 0a                	jne    101ca8 <findFile+0x40>
  101c9e:	31 c0                	xor    %eax,%eax
  101ca0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101ca3:	5b                   	pop    %ebx
  101ca4:	5e                   	pop    %esi
  101ca5:	5f                   	pop    %edi
  101ca6:	5d                   	pop    %ebp
  101ca7:	c3                   	ret    
  101ca8:	83 ec 08             	sub    $0x8,%esp
  101cab:	53                   	push   %ebx
  101cac:	68 00 5e 30 00       	push   $0x305e00
  101cb1:	e8 72 e3 ff ff       	call   100028 <strcpy>
  101cb6:	58                   	pop    %eax
  101cb7:	5a                   	pop    %edx
  101cb8:	68 19 29 10 00       	push   $0x102919
  101cbd:	68 00 5e 30 00       	push   $0x305e00
  101cc2:	e8 89 e4 ff ff       	call   100150 <strtok>
  101cc7:	89 c7                	mov    %eax,%edi
  101cc9:	83 c4 10             	add    $0x10,%esp
  101ccc:	85 c0                	test   %eax,%eax
  101cce:	0f 84 f8 00 00 00    	je     101dcc <findFile+0x164>
  101cd4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  101cdb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  101ce2:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  101ce9:	8d 76 00             	lea    0x0(%esi),%esi
  101cec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101cef:	c1 e0 07             	shl    $0x7,%eax
  101cf2:	03 05 24 5d 30 00    	add    0x305d24,%eax
  101cf8:	8b 58 08             	mov    0x8(%eax),%ebx
  101cfb:	8b 50 0c             	mov    0xc(%eax),%edx
  101cfe:	83 fa ff             	cmp    $0xffffffff,%edx
  101d01:	74 69                	je     101d6c <findFile+0x104>
  101d03:	83 c0 10             	add    $0x10,%eax
  101d06:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101d09:	89 fe                	mov    %edi,%esi
  101d0b:	90                   	nop
  101d0c:	c1 e2 09             	shl    $0x9,%edx
  101d0f:	03 15 34 5f 30 00    	add    0x305f34,%edx
  101d15:	89 d7                	mov    %edx,%edi
  101d17:	8d 43 f8             	lea    -0x8(%ebx),%eax
  101d1a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101d1d:	8d 76 00             	lea    0x0(%esi),%esi
  101d20:	83 ec 08             	sub    $0x8,%esp
  101d23:	8d 47 04             	lea    0x4(%edi),%eax
  101d26:	50                   	push   %eax
  101d27:	56                   	push   %esi
  101d28:	e8 1b e3 ff ff       	call   100048 <strcmp>
  101d2d:	83 c4 10             	add    $0x10,%esp
  101d30:	85 c0                	test   %eax,%eax
  101d32:	74 68                	je     101d9c <findFile+0x134>
  101d34:	4b                   	dec    %ebx
  101d35:	74 75                	je     101dac <findFile+0x144>
  101d37:	83 c7 40             	add    $0x40,%edi
  101d3a:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  101d3d:	75 e1                	jne    101d20 <findFile+0xb8>
  101d3f:	83 7d d8 01          	cmpl   $0x1,-0x28(%ebp)
  101d43:	74 27                	je     101d6c <findFile+0x104>
  101d45:	83 7d dc 01          	cmpl   $0x1,-0x24(%ebp)
  101d49:	0f 84 87 00 00 00    	je     101dd6 <findFile+0x16e>
  101d4f:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
  101d53:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101d56:	8b 50 fc             	mov    -0x4(%eax),%edx
  101d59:	83 fa ff             	cmp    $0xffffffff,%edx
  101d5c:	75 ae                	jne    101d0c <findFile+0xa4>
  101d5e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  101d65:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  101d6c:	83 ec 08             	sub    $0x8,%esp
  101d6f:	68 19 29 10 00       	push   $0x102919
  101d74:	6a 00                	push   $0x0
  101d76:	e8 d5 e3 ff ff       	call   100150 <strtok>
  101d7b:	89 c7                	mov    %eax,%edi
  101d7d:	83 c4 10             	add    $0x10,%esp
  101d80:	85 c0                	test   %eax,%eax
  101d82:	0f 85 64 ff ff ff    	jne    101cec <findFile+0x84>
  101d88:	83 7d d8 01          	cmpl   $0x1,-0x28(%ebp)
  101d8c:	74 3e                	je     101dcc <findFile+0x164>
  101d8e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d91:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101d94:	5b                   	pop    %ebx
  101d95:	5e                   	pop    %esi
  101d96:	5f                   	pop    %edi
  101d97:	5d                   	pop    %ebp
  101d98:	c3                   	ret    
  101d99:	8d 76 00             	lea    0x0(%esi),%esi
  101d9c:	8b 07                	mov    (%edi),%eax
  101d9e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  101da1:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
  101da8:	eb c2                	jmp    101d6c <findFile+0x104>
  101daa:	66 90                	xchg   %ax,%ax
  101dac:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  101db3:	eb b7                	jmp    101d6c <findFile+0x104>
  101db5:	83 ec 08             	sub    $0x8,%esp
  101db8:	6a 36                	push   $0x36
  101dba:	68 0d 29 10 00       	push   $0x10290d
  101dbf:	e8 a8 09 00 00       	call   10276c <abort>
  101dc4:	83 c4 10             	add    $0x10,%esp
  101dc7:	e9 b0 fe ff ff       	jmp    101c7c <findFile+0x14>
  101dcc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101dd1:	e9 ca fe ff ff       	jmp    101ca0 <findFile+0x38>
  101dd6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  101ddd:	eb 8d                	jmp    101d6c <findFile+0x104>
  101ddf:	90                   	nop

00101de0 <ls>:
  101de0:	55                   	push   %ebp
  101de1:	89 e5                	mov    %esp,%ebp
  101de3:	57                   	push   %edi
  101de4:	56                   	push   %esi
  101de5:	53                   	push   %ebx
  101de6:	83 ec 28             	sub    $0x28,%esp
  101de9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101dec:	53                   	push   %ebx
  101ded:	e8 b2 ef ff ff       	call   100da4 <printString>
  101df2:	83 c4 10             	add    $0x10,%esp
  101df5:	85 db                	test   %ebx,%ebx
  101df7:	0f 84 09 01 00 00    	je     101f06 <ls+0x126>
  101dfd:	80 3b 00             	cmpb   $0x0,(%ebx)
  101e00:	0f 84 d2 00 00 00    	je     101ed8 <ls+0xf8>
  101e06:	83 ec 0c             	sub    $0xc,%esp
  101e09:	53                   	push   %ebx
  101e0a:	e8 59 fe ff ff       	call   101c68 <findFile>
  101e0f:	89 c6                	mov    %eax,%esi
  101e11:	89 04 24             	mov    %eax,(%esp)
  101e14:	e8 b7 ef ff ff       	call   100dd0 <printDemical>
  101e19:	83 c4 10             	add    $0x10,%esp
  101e1c:	83 fe ff             	cmp    $0xffffffff,%esi
  101e1f:	0f 84 ca 00 00 00    	je     101eef <ls+0x10f>
  101e25:	c1 e6 07             	shl    $0x7,%esi
  101e28:	03 35 24 5d 30 00    	add    0x305d24,%esi
  101e2e:	66 83 3e 01          	cmpw   $0x1,(%esi)
  101e32:	74 12                	je     101e46 <ls+0x66>
  101e34:	83 ec 08             	sub    $0x8,%esp
  101e37:	6a 6d                	push   $0x6d
  101e39:	68 0d 29 10 00       	push   $0x10290d
  101e3e:	e8 29 09 00 00       	call   10276c <abort>
  101e43:	83 c4 10             	add    $0x10,%esp
  101e46:	8b 5e 08             	mov    0x8(%esi),%ebx
  101e49:	8b 56 0c             	mov    0xc(%esi),%edx
  101e4c:	8d 46 10             	lea    0x10(%esi),%eax
  101e4f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101e52:	83 fa ff             	cmp    $0xffffffff,%edx
  101e55:	74 56                	je     101ead <ls+0xcd>
  101e57:	c1 e2 09             	shl    $0x9,%edx
  101e5a:	a1 34 5f 30 00       	mov    0x305f34,%eax
  101e5f:	8d 74 10 04          	lea    0x4(%eax,%edx,1),%esi
  101e63:	8d 7b f8             	lea    -0x8(%ebx),%edi
  101e66:	66 90                	xchg   %ax,%ax
  101e68:	83 ec 0c             	sub    $0xc,%esp
  101e6b:	56                   	push   %esi
  101e6c:	e8 83 e9 ff ff       	call   1007f4 <kernelPrint>
  101e71:	c7 04 24 1b 29 10 00 	movl   $0x10291b,(%esp)
  101e78:	e8 77 e9 ff ff       	call   1007f4 <kernelPrint>
  101e7d:	89 34 24             	mov    %esi,(%esp)
  101e80:	e8 1f ef ff ff       	call   100da4 <printString>
  101e85:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  101e8c:	e8 27 f1 ff ff       	call   100fb8 <putChar>
  101e91:	83 c4 10             	add    $0x10,%esp
  101e94:	4b                   	dec    %ebx
  101e95:	74 21                	je     101eb8 <ls+0xd8>
  101e97:	83 c6 40             	add    $0x40,%esi
  101e9a:	39 fb                	cmp    %edi,%ebx
  101e9c:	75 ca                	jne    101e68 <ls+0x88>
  101e9e:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
  101ea2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101ea5:	8b 50 fc             	mov    -0x4(%eax),%edx
  101ea8:	83 fa ff             	cmp    $0xffffffff,%edx
  101eab:	75 aa                	jne    101e57 <ls+0x77>
  101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101eb0:	5b                   	pop    %ebx
  101eb1:	5e                   	pop    %esi
  101eb2:	5f                   	pop    %edi
  101eb3:	5d                   	pop    %ebp
  101eb4:	c3                   	ret    
  101eb5:	8d 76 00             	lea    0x0(%esi),%esi
  101eb8:	83 ec 0c             	sub    $0xc,%esp
  101ebb:	6a 0a                	push   $0xa
  101ebd:	e8 f6 f0 ff ff       	call   100fb8 <putChar>
  101ec2:	83 c4 10             	add    $0x10,%esp
  101ec5:	c7 45 08 4a 29 10 00 	movl   $0x10294a,0x8(%ebp)
  101ecc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101ecf:	5b                   	pop    %ebx
  101ed0:	5e                   	pop    %esi
  101ed1:	5f                   	pop    %edi
  101ed2:	5d                   	pop    %ebp
  101ed3:	e9 1c e9 ff ff       	jmp    1007f4 <kernelPrint>
  101ed8:	83 ec 08             	sub    $0x8,%esp
  101edb:	6a 66                	push   $0x66
  101edd:	68 0d 29 10 00       	push   $0x10290d
  101ee2:	e8 85 08 00 00       	call   10276c <abort>
  101ee7:	83 c4 10             	add    $0x10,%esp
  101eea:	e9 17 ff ff ff       	jmp    101e06 <ls+0x26>
  101eef:	83 ec 08             	sub    $0x8,%esp
  101ef2:	6a 6a                	push   $0x6a
  101ef4:	68 0d 29 10 00       	push   $0x10290d
  101ef9:	e8 6e 08 00 00       	call   10276c <abort>
  101efe:	83 c4 10             	add    $0x10,%esp
  101f01:	e9 1f ff ff ff       	jmp    101e25 <ls+0x45>
  101f06:	83 ec 08             	sub    $0x8,%esp
  101f09:	6a 65                	push   $0x65
  101f0b:	68 0d 29 10 00       	push   $0x10290d
  101f10:	e8 57 08 00 00       	call   10276c <abort>
  101f15:	83 c4 10             	add    $0x10,%esp
  101f18:	e9 e0 fe ff ff       	jmp    101dfd <ls+0x1d>
  101f1d:	8d 76 00             	lea    0x0(%esi),%esi

00101f20 <applyNewInode>:
  101f20:	8b 15 40 5f 38 00    	mov    0x385f40,%edx
  101f26:	31 c0                	xor    %eax,%eax
  101f28:	eb 0b                	jmp    101f35 <applyNewInode+0x15>
  101f2a:	66 90                	xchg   %ax,%ax
  101f2c:	40                   	inc    %eax
  101f2d:	42                   	inc    %edx
  101f2e:	3d 00 02 00 00       	cmp    $0x200,%eax
  101f33:	74 13                	je     101f48 <applyNewInode+0x28>
  101f35:	80 3a 00             	cmpb   $0x0,(%edx)
  101f38:	75 f2                	jne    101f2c <applyNewInode+0xc>
  101f3a:	8b 0d 28 5d 30 00    	mov    0x305d28,%ecx
  101f40:	ff 49 0c             	decl   0xc(%ecx)
  101f43:	c6 02 01             	movb   $0x1,(%edx)
  101f46:	c3                   	ret    
  101f47:	90                   	nop
  101f48:	55                   	push   %ebp
  101f49:	89 e5                	mov    %esp,%ebp
  101f4b:	83 ec 14             	sub    $0x14,%esp
  101f4e:	68 1e 29 10 00       	push   $0x10291e
  101f53:	e8 4c ee ff ff       	call   100da4 <printString>
  101f58:	58                   	pop    %eax
  101f59:	5a                   	pop    %edx
  101f5a:	68 ac 00 00 00       	push   $0xac
  101f5f:	68 0d 29 10 00       	push   $0x10290d
  101f64:	e8 03 08 00 00       	call   10276c <abort>
  101f69:	83 c4 10             	add    $0x10,%esp
  101f6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101f71:	c9                   	leave  
  101f72:	c3                   	ret    
  101f73:	90                   	nop

00101f74 <mkfile>:
  101f74:	55                   	push   %ebp
  101f75:	89 e5                	mov    %esp,%ebp
  101f77:	57                   	push   %edi
  101f78:	56                   	push   %esi
  101f79:	53                   	push   %ebx
  101f7a:	83 ec 0c             	sub    $0xc,%esp
  101f7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101f80:	80 3b 00             	cmpb   $0x0,(%ebx)
  101f83:	75 15                	jne    101f9a <mkfile+0x26>
  101f85:	83 ec 08             	sub    $0x8,%esp
  101f88:	68 83 00 00 00       	push   $0x83
  101f8d:	68 0d 29 10 00       	push   $0x10290d
  101f92:	e8 d5 07 00 00       	call   10276c <abort>
  101f97:	83 c4 10             	add    $0x10,%esp
  101f9a:	50                   	push   %eax
  101f9b:	68 60 5f 38 00       	push   $0x385f60
  101fa0:	68 80 5d 30 00       	push   $0x305d80
  101fa5:	53                   	push   %ebx
  101fa6:	e8 15 fc ff ff       	call   101bc0 <splitFileName>
  101fab:	c7 04 24 80 5d 30 00 	movl   $0x305d80,(%esp)
  101fb2:	e8 b1 fc ff ff       	call   101c68 <findFile>
  101fb7:	89 c6                	mov    %eax,%esi
  101fb9:	e8 62 ff ff ff       	call   101f20 <applyNewInode>
  101fbe:	89 c7                	mov    %eax,%edi
  101fc0:	a1 28 5d 30 00       	mov    0x305d28,%eax
  101fc5:	ff 48 0c             	decl   0xc(%eax)
  101fc8:	89 fb                	mov    %edi,%ebx
  101fca:	c1 e3 07             	shl    $0x7,%ebx
  101fcd:	03 1d 24 5d 30 00    	add    0x305d24,%ebx
  101fd3:	66 c7 03 02 00       	movw   $0x2,(%ebx)
  101fd8:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  101fdf:	66 c7 43 02 01 00    	movw   $0x1,0x2(%ebx)
  101fe5:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  101fec:	83 c4 0c             	add    $0xc,%esp
  101fef:	6a 64                	push   $0x64
  101ff1:	6a ff                	push   $0xffffffff
  101ff3:	8d 43 0c             	lea    0xc(%ebx),%eax
  101ff6:	50                   	push   %eax
  101ff7:	e8 44 e2 ff ff       	call   100240 <memset>
  101ffc:	c7 43 70 ff ff ff ff 	movl   $0xffffffff,0x70(%ebx)
  102003:	c7 43 74 ff ff ff ff 	movl   $0xffffffff,0x74(%ebx)
  10200a:	c7 43 78 ff ff ff ff 	movl   $0xffffffff,0x78(%ebx)
  102011:	c1 e6 07             	shl    $0x7,%esi
  102014:	03 35 24 5d 30 00    	add    0x305d24,%esi
  10201a:	8b 56 08             	mov    0x8(%esi),%edx
  10201d:	89 d0                	mov    %edx,%eax
  10201f:	c1 e8 03             	shr    $0x3,%eax
  102022:	8b 5c 86 0c          	mov    0xc(%esi,%eax,4),%ebx
  102026:	c1 e3 09             	shl    $0x9,%ebx
  102029:	83 e2 07             	and    $0x7,%edx
  10202c:	c1 e2 06             	shl    $0x6,%edx
  10202f:	01 d3                	add    %edx,%ebx
  102031:	03 1d 34 5f 30 00    	add    0x305f34,%ebx
  102037:	5a                   	pop    %edx
  102038:	59                   	pop    %ecx
  102039:	68 60 5f 38 00       	push   $0x385f60
  10203e:	8d 43 04             	lea    0x4(%ebx),%eax
  102041:	50                   	push   %eax
  102042:	e8 e1 df ff ff       	call   100028 <strcpy>
  102047:	89 3b                	mov    %edi,(%ebx)
  102049:	ff 46 08             	incl   0x8(%esi)
  10204c:	89 f8                	mov    %edi,%eax
  10204e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102051:	5b                   	pop    %ebx
  102052:	5e                   	pop    %esi
  102053:	5f                   	pop    %edi
  102054:	5d                   	pop    %ebp
  102055:	c3                   	ret    
  102056:	66 90                	xchg   %ax,%ax

00102058 <applyNewBlock>:
  102058:	8b 15 20 5d 30 00    	mov    0x305d20,%edx
  10205e:	31 c0                	xor    %eax,%eax
  102060:	eb 0b                	jmp    10206d <applyNewBlock+0x15>
  102062:	66 90                	xchg   %ax,%ax
  102064:	40                   	inc    %eax
  102065:	42                   	inc    %edx
  102066:	3d 00 02 00 00       	cmp    $0x200,%eax
  10206b:	74 13                	je     102080 <applyNewBlock+0x28>
  10206d:	80 3a 00             	cmpb   $0x0,(%edx)
  102070:	75 f2                	jne    102064 <applyNewBlock+0xc>
  102072:	8b 0d 28 5d 30 00    	mov    0x305d28,%ecx
  102078:	ff 49 10             	decl   0x10(%ecx)
  10207b:	c6 02 01             	movb   $0x1,(%edx)
  10207e:	c3                   	ret    
  10207f:	90                   	nop
  102080:	55                   	push   %ebp
  102081:	89 e5                	mov    %esp,%ebp
  102083:	83 ec 14             	sub    $0x14,%esp
  102086:	68 2e 29 10 00       	push   $0x10292e
  10208b:	e8 14 ed ff ff       	call   100da4 <printString>
  102090:	58                   	pop    %eax
  102091:	5a                   	pop    %edx
  102092:	68 b9 00 00 00       	push   $0xb9
  102097:	68 0d 29 10 00       	push   $0x10290d
  10209c:	e8 cb 06 00 00       	call   10276c <abort>
  1020a1:	83 c4 10             	add    $0x10,%esp
  1020a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1020a9:	c9                   	leave  
  1020aa:	c3                   	ret    
  1020ab:	90                   	nop

001020ac <appleNewFCB>:
  1020ac:	ba 40 5e 30 00       	mov    $0x305e40,%edx
  1020b1:	31 c0                	xor    %eax,%eax
  1020b3:	90                   	nop
  1020b4:	83 3a 01             	cmpl   $0x1,(%edx)
  1020b7:	74 37                	je     1020f0 <appleNewFCB+0x44>
  1020b9:	40                   	inc    %eax
  1020ba:	83 c2 0c             	add    $0xc,%edx
  1020bd:	83 f8 10             	cmp    $0x10,%eax
  1020c0:	75 f2                	jne    1020b4 <appleNewFCB+0x8>
  1020c2:	55                   	push   %ebp
  1020c3:	89 e5                	mov    %esp,%ebp
  1020c5:	83 ec 14             	sub    $0x14,%esp
  1020c8:	68 3e 29 10 00       	push   $0x10293e
  1020cd:	e8 d2 ec ff ff       	call   100da4 <printString>
  1020d2:	58                   	pop    %eax
  1020d3:	5a                   	pop    %edx
  1020d4:	68 c5 00 00 00       	push   $0xc5
  1020d9:	68 0d 29 10 00       	push   $0x10290d
  1020de:	e8 89 06 00 00       	call   10276c <abort>
  1020e3:	83 c4 10             	add    $0x10,%esp
  1020e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1020eb:	c9                   	leave  
  1020ec:	c3                   	ret    
  1020ed:	8d 76 00             	lea    0x0(%esi),%esi
  1020f0:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1020f3:	01 c2                	add    %eax,%edx
  1020f5:	c7 04 95 40 5e 30 00 	movl   $0x0,0x305e40(,%edx,4)
  1020fc:	00 00 00 00 
  102100:	c3                   	ret    
  102101:	8d 76 00             	lea    0x0(%esi),%esi

00102104 <initFcbTable>:
  102104:	55                   	push   %ebp
  102105:	89 e5                	mov    %esp,%ebp
  102107:	b8 40 5e 30 00       	mov    $0x305e40,%eax
  10210c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  102112:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
  102119:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  102120:	83 c0 0c             	add    $0xc,%eax
  102123:	3d 00 5f 30 00       	cmp    $0x305f00,%eax
  102128:	75 e2                	jne    10210c <initFcbTable+0x8>
  10212a:	5d                   	pop    %ebp
  10212b:	c3                   	ret    

0010212c <open>:
  10212c:	55                   	push   %ebp
  10212d:	89 e5                	mov    %esp,%ebp
  10212f:	56                   	push   %esi
  102130:	53                   	push   %ebx
  102131:	8b 75 08             	mov    0x8(%ebp),%esi
  102134:	83 ec 0c             	sub    $0xc,%esp
  102137:	56                   	push   %esi
  102138:	e8 2b fb ff ff       	call   101c68 <findFile>
  10213d:	83 c4 10             	add    $0x10,%esp
  102140:	83 f8 ff             	cmp    $0xffffffff,%eax
  102143:	74 7f                	je     1021c4 <open+0x98>
  102145:	89 c3                	mov    %eax,%ebx
  102147:	ba 40 5e 30 00       	mov    $0x305e40,%edx
  10214c:	31 c0                	xor    %eax,%eax
  10214e:	66 90                	xchg   %ax,%ax
  102150:	83 3a 01             	cmpl   $0x1,(%edx)
  102153:	74 5b                	je     1021b0 <open+0x84>
  102155:	40                   	inc    %eax
  102156:	83 c2 0c             	add    $0xc,%edx
  102159:	83 f8 10             	cmp    $0x10,%eax
  10215c:	75 f2                	jne    102150 <open+0x24>
  10215e:	83 ec 0c             	sub    $0xc,%esp
  102161:	68 3e 29 10 00       	push   $0x10293e
  102166:	e8 39 ec ff ff       	call   100da4 <printString>
  10216b:	58                   	pop    %eax
  10216c:	5a                   	pop    %edx
  10216d:	68 c5 00 00 00       	push   $0xc5
  102172:	68 0d 29 10 00       	push   $0x10290d
  102177:	e8 f0 05 00 00       	call   10276c <abort>
  10217c:	83 c4 10             	add    $0x10,%esp
  10217f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102184:	8d 14 00             	lea    (%eax,%eax,1),%edx
  102187:	01 c2                	add    %eax,%edx
  102189:	c1 e2 02             	shl    $0x2,%edx
  10218c:	c7 82 40 5e 30 00 00 	movl   $0x0,0x305e40(%edx)
  102193:	00 00 00 
  102196:	c7 82 44 5e 30 00 00 	movl   $0x0,0x305e44(%edx)
  10219d:	00 00 00 
  1021a0:	89 9a 48 5e 30 00    	mov    %ebx,0x305e48(%edx)
  1021a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1021a9:	5b                   	pop    %ebx
  1021aa:	5e                   	pop    %esi
  1021ab:	5d                   	pop    %ebp
  1021ac:	c3                   	ret    
  1021ad:	8d 76 00             	lea    0x0(%esi),%esi
  1021b0:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1021b3:	01 c2                	add    %eax,%edx
  1021b5:	c7 04 95 40 5e 30 00 	movl   $0x0,0x305e40(,%edx,4)
  1021bc:	00 00 00 00 
  1021c0:	eb c2                	jmp    102184 <open+0x58>
  1021c2:	66 90                	xchg   %ax,%ax
  1021c4:	83 ec 0c             	sub    $0xc,%esp
  1021c7:	56                   	push   %esi
  1021c8:	e8 a7 fd ff ff       	call   101f74 <mkfile>
  1021cd:	89 c3                	mov    %eax,%ebx
  1021cf:	83 c4 10             	add    $0x10,%esp
  1021d2:	e9 70 ff ff ff       	jmp    102147 <open+0x1b>
  1021d7:	90                   	nop

001021d8 <close>:
  1021d8:	55                   	push   %ebp
  1021d9:	89 e5                	mov    %esp,%ebp
  1021db:	8b 45 08             	mov    0x8(%ebp),%eax
  1021de:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1021e1:	01 d0                	add    %edx,%eax
  1021e3:	c1 e0 02             	shl    $0x2,%eax
  1021e6:	c7 80 40 5e 30 00 01 	movl   $0x1,0x305e40(%eax)
  1021ed:	00 00 00 
  1021f0:	c7 80 48 5e 30 00 ff 	movl   $0xffffffff,0x305e48(%eax)
  1021f7:	ff ff ff 
  1021fa:	c7 80 44 5e 30 00 00 	movl   $0x0,0x305e44(%eax)
  102201:	00 00 00 
  102204:	5d                   	pop    %ebp
  102205:	c3                   	ret    
  102206:	66 90                	xchg   %ax,%ax

00102208 <read>:
  102208:	55                   	push   %ebp
  102209:	89 e5                	mov    %esp,%ebp
  10220b:	57                   	push   %edi
  10220c:	56                   	push   %esi
  10220d:	53                   	push   %ebx
  10220e:	83 ec 2c             	sub    $0x2c,%esp
  102211:	8b 45 08             	mov    0x8(%ebp),%eax
  102214:	01 c0                	add    %eax,%eax
  102216:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  102219:	03 45 08             	add    0x8(%ebp),%eax
  10221c:	8d 14 85 40 5e 30 00 	lea    0x305e40(,%eax,4),%edx
  102223:	8b 42 04             	mov    0x4(%edx),%eax
  102226:	8b 72 08             	mov    0x8(%edx),%esi
  102229:	c1 e6 07             	shl    $0x7,%esi
  10222c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  10222f:	8b 15 24 5d 30 00    	mov    0x305d24,%edx
  102235:	01 f2                	add    %esi,%edx
  102237:	8b 5a 08             	mov    0x8(%edx),%ebx
  10223a:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10223d:	01 c1                	add    %eax,%ecx
  10223f:	39 cb                	cmp    %ecx,%ebx
  102241:	7d 09                	jge    10224c <read+0x44>
  102243:	89 d9                	mov    %ebx,%ecx
  102245:	29 c1                	sub    %eax,%ecx
  102247:	89 4d 10             	mov    %ecx,0x10(%ebp)
  10224a:	89 d9                	mov    %ebx,%ecx
  10224c:	89 c3                	mov    %eax,%ebx
  10224e:	85 c0                	test   %eax,%eax
  102250:	0f 88 46 01 00 00    	js     10239c <read+0x194>
  102256:	c1 fb 09             	sar    $0x9,%ebx
  102259:	85 c9                	test   %ecx,%ecx
  10225b:	0f 88 4c 01 00 00    	js     1023ad <read+0x1a5>
  102261:	c1 f9 09             	sar    $0x9,%ecx
  102264:	39 cb                	cmp    %ecx,%ebx
  102266:	0f 84 52 01 00 00    	je     1023be <read+0x1b6>
  10226c:	25 ff 01 00 80       	and    $0x800001ff,%eax
  102271:	0f 88 78 01 00 00    	js     1023ef <read+0x1e7>
  102277:	bf 00 02 00 00       	mov    $0x200,%edi
  10227c:	29 c7                	sub    %eax,%edi
  10227e:	56                   	push   %esi
  10227f:	57                   	push   %edi
  102280:	8b 54 9a 0c          	mov    0xc(%edx,%ebx,4),%edx
  102284:	c1 e2 09             	shl    $0x9,%edx
  102287:	01 d0                	add    %edx,%eax
  102289:	03 05 34 5f 30 00    	add    0x305f34,%eax
  10228f:	50                   	push   %eax
  102290:	ff 75 0c             	pushl  0xc(%ebp)
  102293:	e8 80 df ff ff       	call   100218 <memcpy>
  102298:	8b 45 0c             	mov    0xc(%ebp),%eax
  10229b:	01 f8                	add    %edi,%eax
  10229d:	89 c6                	mov    %eax,%esi
  10229f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1022a2:	8b 45 10             	mov    0x10(%ebp),%eax
  1022a5:	29 f8                	sub    %edi,%eax
  1022a7:	89 c2                	mov    %eax,%edx
  1022a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1022ac:	8d 43 01             	lea    0x1(%ebx),%eax
  1022af:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1022b2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1022b5:	03 45 08             	add    0x8(%ebp),%eax
  1022b8:	8d 0c 85 40 5e 30 00 	lea    0x305e40(,%eax,4),%ecx
  1022bf:	01 79 04             	add    %edi,0x4(%ecx)
  1022c2:	83 c4 10             	add    $0x10,%esp
  1022c5:	89 d0                	mov    %edx,%eax
  1022c7:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  1022cd:	0f 8e 83 00 00 00    	jle    102356 <read+0x14e>
  1022d3:	2d 01 02 00 00       	sub    $0x201,%eax
  1022d8:	c1 e8 09             	shr    $0x9,%eax
  1022db:	89 45 cc             	mov    %eax,-0x34(%ebp)
  1022de:	8d 7c 18 02          	lea    0x2(%eax,%ebx,1),%edi
  1022e2:	89 7d e0             	mov    %edi,-0x20(%ebp)
  1022e5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  1022e8:	89 f7                	mov    %esi,%edi
  1022ea:	89 ce                	mov    %ecx,%esi
  1022ec:	51                   	push   %ecx
  1022ed:	68 00 02 00 00       	push   $0x200
  1022f2:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  1022f9:	03 05 24 5d 30 00    	add    0x305d24,%eax
  1022ff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102302:	8b 44 02 0c          	mov    0xc(%edx,%eax,1),%eax
  102306:	c1 e0 09             	shl    $0x9,%eax
  102309:	03 05 34 5f 30 00    	add    0x305f34,%eax
  10230f:	50                   	push   %eax
  102310:	57                   	push   %edi
  102311:	e8 02 df ff ff       	call   100218 <memcpy>
  102316:	81 c7 00 02 00 00    	add    $0x200,%edi
  10231c:	43                   	inc    %ebx
  10231d:	81 46 04 00 02 00 00 	addl   $0x200,0x4(%esi)
  102324:	83 c4 10             	add    $0x10,%esp
  102327:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  10232a:	75 c0                	jne    1022ec <read+0xe4>
  10232c:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  10232f:	89 c8                	mov    %ecx,%eax
  102331:	40                   	inc    %eax
  102332:	c1 e0 09             	shl    $0x9,%eax
  102335:	01 45 d0             	add    %eax,-0x30(%ebp)
  102338:	89 c8                	mov    %ecx,%eax
  10233a:	f7 d8                	neg    %eax
  10233c:	c1 e0 09             	shl    $0x9,%eax
  10233f:	8b 75 d8             	mov    -0x28(%ebp),%esi
  102342:	8d 84 06 00 fe ff ff 	lea    -0x200(%esi,%eax,1),%eax
  102349:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10234c:	8b 75 dc             	mov    -0x24(%ebp),%esi
  10234f:	8d 44 0e 01          	lea    0x1(%esi,%ecx,1),%eax
  102353:	89 45 dc             	mov    %eax,-0x24(%ebp)
  102356:	50                   	push   %eax
  102357:	8b 75 d8             	mov    -0x28(%ebp),%esi
  10235a:	56                   	push   %esi
  10235b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10235e:	8b 15 24 5d 30 00    	mov    0x305d24,%edx
  102364:	8d 04 82             	lea    (%edx,%eax,4),%eax
  102367:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10236a:	8b 44 01 0c          	mov    0xc(%ecx,%eax,1),%eax
  10236e:	c1 e0 09             	shl    $0x9,%eax
  102371:	03 05 34 5f 30 00    	add    0x305f34,%eax
  102377:	50                   	push   %eax
  102378:	ff 75 d0             	pushl  -0x30(%ebp)
  10237b:	e8 98 de ff ff       	call   100218 <memcpy>
  102380:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  102383:	03 45 08             	add    0x8(%ebp),%eax
  102386:	01 34 85 44 5e 30 00 	add    %esi,0x305e44(,%eax,4)
  10238d:	83 c4 10             	add    $0x10,%esp
  102390:	8b 45 10             	mov    0x10(%ebp),%eax
  102393:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102396:	5b                   	pop    %ebx
  102397:	5e                   	pop    %esi
  102398:	5f                   	pop    %edi
  102399:	5d                   	pop    %ebp
  10239a:	c3                   	ret    
  10239b:	90                   	nop
  10239c:	8d 98 ff 01 00 00    	lea    0x1ff(%eax),%ebx
  1023a2:	c1 fb 09             	sar    $0x9,%ebx
  1023a5:	85 c9                	test   %ecx,%ecx
  1023a7:	0f 89 b4 fe ff ff    	jns    102261 <read+0x59>
  1023ad:	81 c1 ff 01 00 00    	add    $0x1ff,%ecx
  1023b3:	c1 f9 09             	sar    $0x9,%ecx
  1023b6:	39 cb                	cmp    %ecx,%ebx
  1023b8:	0f 85 ae fe ff ff    	jne    10226c <read+0x64>
  1023be:	57                   	push   %edi
  1023bf:	ff 75 10             	pushl  0x10(%ebp)
  1023c2:	8b 54 9a 0c          	mov    0xc(%edx,%ebx,4),%edx
  1023c6:	c1 e2 09             	shl    $0x9,%edx
  1023c9:	25 ff 01 00 80       	and    $0x800001ff,%eax
  1023ce:	78 2b                	js     1023fb <read+0x1f3>
  1023d0:	01 d0                	add    %edx,%eax
  1023d2:	03 05 34 5f 30 00    	add    0x305f34,%eax
  1023d8:	50                   	push   %eax
  1023d9:	ff 75 0c             	pushl  0xc(%ebp)
  1023dc:	e8 37 de ff ff       	call   100218 <memcpy>
  1023e1:	83 c4 10             	add    $0x10,%esp
  1023e4:	8b 45 10             	mov    0x10(%ebp),%eax
  1023e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1023ea:	5b                   	pop    %ebx
  1023eb:	5e                   	pop    %esi
  1023ec:	5f                   	pop    %edi
  1023ed:	5d                   	pop    %ebp
  1023ee:	c3                   	ret    
  1023ef:	48                   	dec    %eax
  1023f0:	0d 00 fe ff ff       	or     $0xfffffe00,%eax
  1023f5:	40                   	inc    %eax
  1023f6:	e9 7c fe ff ff       	jmp    102277 <read+0x6f>
  1023fb:	48                   	dec    %eax
  1023fc:	0d 00 fe ff ff       	or     $0xfffffe00,%eax
  102401:	40                   	inc    %eax
  102402:	eb cc                	jmp    1023d0 <read+0x1c8>

00102404 <write>:
  102404:	55                   	push   %ebp
  102405:	89 e5                	mov    %esp,%ebp
  102407:	57                   	push   %edi
  102408:	56                   	push   %esi
  102409:	53                   	push   %ebx
  10240a:	83 ec 2c             	sub    $0x2c,%esp
  10240d:	8b 45 08             	mov    0x8(%ebp),%eax
  102410:	01 c0                	add    %eax,%eax
  102412:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  102415:	03 45 08             	add    0x8(%ebp),%eax
  102418:	8d 04 85 40 5e 30 00 	lea    0x305e40(,%eax,4),%eax
  10241f:	8b 70 08             	mov    0x8(%eax),%esi
  102422:	8b 50 04             	mov    0x4(%eax),%edx
  102425:	8b 7d 10             	mov    0x10(%ebp),%edi
  102428:	01 d7                	add    %edx,%edi
  10242a:	81 ff 00 32 00 00    	cmp    $0x3200,%edi
  102430:	0f 8e c6 00 00 00    	jle    1024fc <write+0xf8>
  102436:	b8 00 32 00 00       	mov    $0x3200,%eax
  10243b:	29 d0                	sub    %edx,%eax
  10243d:	89 45 10             	mov    %eax,0x10(%ebp)
  102440:	c1 e6 07             	shl    $0x7,%esi
  102443:	89 f0                	mov    %esi,%eax
  102445:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  102448:	03 05 24 5d 30 00    	add    0x305d24,%eax
  10244e:	81 78 08 ff 31 00 00 	cmpl   $0x31ff,0x8(%eax)
  102455:	0f 87 cd 00 00 00    	ja     102528 <write+0x124>
  10245b:	c7 40 08 00 32 00 00 	movl   $0x3200,0x8(%eax)
  102462:	bf 19 00 00 00       	mov    $0x19,%edi
  102467:	31 db                	xor    %ebx,%ebx
  102469:	89 55 e0             	mov    %edx,-0x20(%ebp)
  10246c:	eb 07                	jmp    102475 <write+0x71>
  10246e:	66 90                	xchg   %ax,%ax
  102470:	43                   	inc    %ebx
  102471:	39 fb                	cmp    %edi,%ebx
  102473:	7f 1f                	jg     102494 <write+0x90>
  102475:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  102478:	83 7e 0c ff          	cmpl   $0xffffffff,0xc(%esi)
  10247c:	75 f2                	jne    102470 <write+0x6c>
  10247e:	e8 d5 fb ff ff       	call   102058 <applyNewBlock>
  102483:	89 46 0c             	mov    %eax,0xc(%esi)
  102486:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102489:	03 05 24 5d 30 00    	add    0x305d24,%eax
  10248f:	43                   	inc    %ebx
  102490:	39 fb                	cmp    %edi,%ebx
  102492:	7e e1                	jle    102475 <write+0x71>
  102494:	8b 55 e0             	mov    -0x20(%ebp),%edx
  102497:	89 d3                	mov    %edx,%ebx
  102499:	85 d2                	test   %edx,%edx
  10249b:	0f 89 a1 00 00 00    	jns    102542 <write+0x13e>
  1024a1:	8d 9a ff 01 00 00    	lea    0x1ff(%edx),%ebx
  1024a7:	c1 fb 09             	sar    $0x9,%ebx
  1024aa:	39 fb                	cmp    %edi,%ebx
  1024ac:	0f 85 9b 00 00 00    	jne    10254d <write+0x149>
  1024b2:	51                   	push   %ecx
  1024b3:	ff 75 10             	pushl  0x10(%ebp)
  1024b6:	ff 75 0c             	pushl  0xc(%ebp)
  1024b9:	8b 44 b8 0c          	mov    0xc(%eax,%edi,4),%eax
  1024bd:	c1 e0 09             	shl    $0x9,%eax
  1024c0:	81 e2 ff 01 00 80    	and    $0x800001ff,%edx
  1024c6:	0f 88 d6 01 00 00    	js     1026a2 <write+0x29e>
  1024cc:	01 c2                	add    %eax,%edx
  1024ce:	a1 34 5f 30 00       	mov    0x305f34,%eax
  1024d3:	01 d0                	add    %edx,%eax
  1024d5:	50                   	push   %eax
  1024d6:	e8 3d dd ff ff       	call   100218 <memcpy>
  1024db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1024de:	03 45 08             	add    0x8(%ebp),%eax
  1024e1:	8b 55 10             	mov    0x10(%ebp),%edx
  1024e4:	01 14 85 44 5e 30 00 	add    %edx,0x305e44(,%eax,4)
  1024eb:	83 c4 10             	add    $0x10,%esp
  1024ee:	8b 45 10             	mov    0x10(%ebp),%eax
  1024f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1024f4:	5b                   	pop    %ebx
  1024f5:	5e                   	pop    %esi
  1024f6:	5f                   	pop    %edi
  1024f7:	5d                   	pop    %ebp
  1024f8:	c3                   	ret    
  1024f9:	8d 76 00             	lea    0x0(%esi),%esi
  1024fc:	c1 e6 07             	shl    $0x7,%esi
  1024ff:	89 f0                	mov    %esi,%eax
  102501:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  102504:	03 05 24 5d 30 00    	add    0x305d24,%eax
  10250a:	3b 78 08             	cmp    0x8(%eax),%edi
  10250d:	76 1e                	jbe    10252d <write+0x129>
  10250f:	89 78 08             	mov    %edi,0x8(%eax)
  102512:	85 ff                	test   %edi,%edi
  102514:	0f 88 70 01 00 00    	js     10268a <write+0x286>
  10251a:	c1 ff 09             	sar    $0x9,%edi
  10251d:	0f 89 44 ff ff ff    	jns    102467 <write+0x63>
  102523:	eb 13                	jmp    102538 <write+0x134>
  102525:	8d 76 00             	lea    0x0(%esi),%esi
  102528:	bf 00 32 00 00       	mov    $0x3200,%edi
  10252d:	85 ff                	test   %edi,%edi
  10252f:	0f 88 4a 01 00 00    	js     10267f <write+0x27b>
  102535:	c1 ff 09             	sar    $0x9,%edi
  102538:	89 d3                	mov    %edx,%ebx
  10253a:	85 d2                	test   %edx,%edx
  10253c:	0f 88 5f ff ff ff    	js     1024a1 <write+0x9d>
  102542:	c1 fb 09             	sar    $0x9,%ebx
  102545:	39 fb                	cmp    %edi,%ebx
  102547:	0f 84 65 ff ff ff    	je     1024b2 <write+0xae>
  10254d:	81 e2 ff 01 00 80    	and    $0x800001ff,%edx
  102553:	0f 88 3c 01 00 00    	js     102695 <write+0x291>
  102559:	bf 00 02 00 00       	mov    $0x200,%edi
  10255e:	29 d7                	sub    %edx,%edi
  102560:	56                   	push   %esi
  102561:	57                   	push   %edi
  102562:	ff 75 0c             	pushl  0xc(%ebp)
  102565:	8b 44 98 0c          	mov    0xc(%eax,%ebx,4),%eax
  102569:	c1 e0 09             	shl    $0x9,%eax
  10256c:	01 c2                	add    %eax,%edx
  10256e:	03 15 34 5f 30 00    	add    0x305f34,%edx
  102574:	52                   	push   %edx
  102575:	e8 9e dc ff ff       	call   100218 <memcpy>
  10257a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10257d:	01 f8                	add    %edi,%eax
  10257f:	89 c6                	mov    %eax,%esi
  102581:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102584:	8b 45 10             	mov    0x10(%ebp),%eax
  102587:	29 f8                	sub    %edi,%eax
  102589:	89 c2                	mov    %eax,%edx
  10258b:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10258e:	8d 43 01             	lea    0x1(%ebx),%eax
  102591:	89 45 dc             	mov    %eax,-0x24(%ebp)
  102594:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  102597:	03 45 08             	add    0x8(%ebp),%eax
  10259a:	8d 0c 85 40 5e 30 00 	lea    0x305e40(,%eax,4),%ecx
  1025a1:	01 79 04             	add    %edi,0x4(%ecx)
  1025a4:	83 c4 10             	add    $0x10,%esp
  1025a7:	89 d0                	mov    %edx,%eax
  1025a9:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  1025af:	0f 8e 85 00 00 00    	jle    10263a <write+0x236>
  1025b5:	2d 01 02 00 00       	sub    $0x201,%eax
  1025ba:	c1 e8 09             	shr    $0x9,%eax
  1025bd:	89 45 cc             	mov    %eax,-0x34(%ebp)
  1025c0:	8d 54 18 02          	lea    0x2(%eax,%ebx,1),%edx
  1025c4:	89 55 e0             	mov    %edx,-0x20(%ebp)
  1025c7:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  1025ca:	89 f7                	mov    %esi,%edi
  1025cc:	89 ce                	mov    %ecx,%esi
  1025ce:	66 90                	xchg   %ax,%ax
  1025d0:	51                   	push   %ecx
  1025d1:	68 00 02 00 00       	push   $0x200
  1025d6:	57                   	push   %edi
  1025d7:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  1025de:	03 05 24 5d 30 00    	add    0x305d24,%eax
  1025e4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1025e7:	8b 44 01 0c          	mov    0xc(%ecx,%eax,1),%eax
  1025eb:	c1 e0 09             	shl    $0x9,%eax
  1025ee:	03 05 34 5f 30 00    	add    0x305f34,%eax
  1025f4:	50                   	push   %eax
  1025f5:	e8 1e dc ff ff       	call   100218 <memcpy>
  1025fa:	81 c7 00 02 00 00    	add    $0x200,%edi
  102600:	43                   	inc    %ebx
  102601:	81 46 04 00 02 00 00 	addl   $0x200,0x4(%esi)
  102608:	83 c4 10             	add    $0x10,%esp
  10260b:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  10260e:	75 c0                	jne    1025d0 <write+0x1cc>
  102610:	8b 55 cc             	mov    -0x34(%ebp),%edx
  102613:	89 d0                	mov    %edx,%eax
  102615:	40                   	inc    %eax
  102616:	c1 e0 09             	shl    $0x9,%eax
  102619:	01 45 d0             	add    %eax,-0x30(%ebp)
  10261c:	89 d0                	mov    %edx,%eax
  10261e:	f7 d8                	neg    %eax
  102620:	c1 e0 09             	shl    $0x9,%eax
  102623:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  102626:	8d 84 01 00 fe ff ff 	lea    -0x200(%ecx,%eax,1),%eax
  10262d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  102630:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102633:	8d 44 11 01          	lea    0x1(%ecx,%edx,1),%eax
  102637:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10263a:	50                   	push   %eax
  10263b:	8b 75 d8             	mov    -0x28(%ebp),%esi
  10263e:	56                   	push   %esi
  10263f:	ff 75 d0             	pushl  -0x30(%ebp)
  102642:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102645:	8b 15 24 5d 30 00    	mov    0x305d24,%edx
  10264b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10264e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102651:	8b 44 02 0c          	mov    0xc(%edx,%eax,1),%eax
  102655:	c1 e0 09             	shl    $0x9,%eax
  102658:	03 05 34 5f 30 00    	add    0x305f34,%eax
  10265e:	50                   	push   %eax
  10265f:	e8 b4 db ff ff       	call   100218 <memcpy>
  102664:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  102667:	03 45 08             	add    0x8(%ebp),%eax
  10266a:	01 34 85 44 5e 30 00 	add    %esi,0x305e44(,%eax,4)
  102671:	83 c4 10             	add    $0x10,%esp
  102674:	8b 45 10             	mov    0x10(%ebp),%eax
  102677:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10267a:	5b                   	pop    %ebx
  10267b:	5e                   	pop    %esi
  10267c:	5f                   	pop    %edi
  10267d:	5d                   	pop    %ebp
  10267e:	c3                   	ret    
  10267f:	81 c7 ff 01 00 00    	add    $0x1ff,%edi
  102685:	e9 ab fe ff ff       	jmp    102535 <write+0x131>
  10268a:	81 c7 ff 01 00 00    	add    $0x1ff,%edi
  102690:	e9 85 fe ff ff       	jmp    10251a <write+0x116>
  102695:	4a                   	dec    %edx
  102696:	81 ca 00 fe ff ff    	or     $0xfffffe00,%edx
  10269c:	42                   	inc    %edx
  10269d:	e9 b7 fe ff ff       	jmp    102559 <write+0x155>
  1026a2:	4a                   	dec    %edx
  1026a3:	81 ca 00 fe ff ff    	or     $0xfffffe00,%edx
  1026a9:	42                   	inc    %edx
  1026aa:	e9 1d fe ff ff       	jmp    1024cc <write+0xc8>
  1026af:	90                   	nop

001026b0 <cat>:
  1026b0:	55                   	push   %ebp
  1026b1:	89 e5                	mov    %esp,%ebp
  1026b3:	57                   	push   %edi
  1026b4:	56                   	push   %esi
  1026b5:	53                   	push   %ebx
  1026b6:	83 ec 28             	sub    $0x28,%esp
  1026b9:	ff 75 08             	pushl  0x8(%ebp)
  1026bc:	e8 a7 f5 ff ff       	call   101c68 <findFile>
  1026c1:	8b 0d 24 5d 30 00    	mov    0x305d24,%ecx
  1026c7:	c1 e0 07             	shl    $0x7,%eax
  1026ca:	89 c3                	mov    %eax,%ebx
  1026cc:	01 c8                	add    %ecx,%eax
  1026ce:	8b 50 08             	mov    0x8(%eax),%edx
  1026d1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1026d4:	83 c4 10             	add    $0x10,%esp
  1026d7:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  1026dd:	0f 8e 83 00 00 00    	jle    102766 <cat+0xb6>
  1026e3:	8d 82 ff fd ff ff    	lea    -0x201(%edx),%eax
  1026e9:	c1 e8 09             	shr    $0x9,%eax
  1026ec:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1026ef:	8d 70 01             	lea    0x1(%eax),%esi
  1026f2:	31 ff                	xor    %edi,%edi
  1026f4:	eb 08                	jmp    1026fe <cat+0x4e>
  1026f6:	66 90                	xchg   %ax,%ax
  1026f8:	8b 0d 24 5d 30 00    	mov    0x305d24,%ecx
  1026fe:	83 ec 08             	sub    $0x8,%esp
  102701:	68 00 02 00 00       	push   $0x200
  102706:	8d 04 b9             	lea    (%ecx,%edi,4),%eax
  102709:	8b 44 03 0c          	mov    0xc(%ebx,%eax,1),%eax
  10270d:	c1 e0 09             	shl    $0x9,%eax
  102710:	03 05 34 5f 30 00    	add    0x305f34,%eax
  102716:	50                   	push   %eax
  102717:	e8 04 e1 ff ff       	call   100820 <kernelPrintN>
  10271c:	47                   	inc    %edi
  10271d:	83 c4 10             	add    $0x10,%esp
  102720:	39 f7                	cmp    %esi,%edi
  102722:	75 d4                	jne    1026f8 <cat+0x48>
  102724:	89 fa                	mov    %edi,%edx
  102726:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102729:	f7 d8                	neg    %eax
  10272b:	c1 e0 09             	shl    $0x9,%eax
  10272e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  102731:	8d 84 06 00 fe ff ff 	lea    -0x200(%esi,%eax,1),%eax
  102738:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10273b:	a1 24 5d 30 00       	mov    0x305d24,%eax
  102740:	01 d8                	add    %ebx,%eax
  102742:	83 ec 08             	sub    $0x8,%esp
  102745:	ff 75 e4             	pushl  -0x1c(%ebp)
  102748:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  10274c:	c1 e0 09             	shl    $0x9,%eax
  10274f:	03 05 34 5f 30 00    	add    0x305f34,%eax
  102755:	50                   	push   %eax
  102756:	e8 c5 e0 ff ff       	call   100820 <kernelPrintN>
  10275b:	83 c4 10             	add    $0x10,%esp
  10275e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102761:	5b                   	pop    %ebx
  102762:	5e                   	pop    %esi
  102763:	5f                   	pop    %edi
  102764:	5d                   	pop    %ebp
  102765:	c3                   	ret    
  102766:	31 d2                	xor    %edx,%edx
  102768:	eb d8                	jmp    102742 <cat+0x92>
  10276a:	66 90                	xchg   %ax,%ax

0010276c <abort>:
  10276c:	55                   	push   %ebp
  10276d:	89 e5                	mov    %esp,%ebp
  10276f:	57                   	push   %edi
  102770:	56                   	push   %esi
  102771:	53                   	push   %ebx
  102772:	83 ec 1c             	sub    $0x1c,%esp
  102775:	8b 55 08             	mov    0x8(%ebp),%edx
  102778:	fa                   	cli    
  102779:	8a 02                	mov    (%edx),%al
  10277b:	b9 72 45 10 00       	mov    $0x104572,%ecx
  102780:	84 c0                	test   %al,%al
  102782:	74 0b                	je     10278f <abort+0x23>
  102784:	41                   	inc    %ecx
  102785:	42                   	inc    %edx
  102786:	88 41 ff             	mov    %al,-0x1(%ecx)
  102789:	8a 02                	mov    (%edx),%al
  10278b:	84 c0                	test   %al,%al
  10278d:	75 f5                	jne    102784 <abort+0x18>
  10278f:	c6 01 3a             	movb   $0x3a,(%ecx)
  102792:	bb a9 46 10 00       	mov    $0x1046a9,%ebx
  102797:	be 0a 00 00 00       	mov    $0xa,%esi
  10279c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1027a1:	4b                   	dec    %ebx
  1027a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027a5:	99                   	cltd   
  1027a6:	f7 fe                	idiv   %esi
  1027a8:	8d 42 30             	lea    0x30(%edx),%eax
  1027ab:	88 45 e7             	mov    %al,-0x19(%ebp)
  1027ae:	88 03                	mov    %al,(%ebx)
  1027b0:	89 f8                	mov    %edi,%eax
  1027b2:	f7 6d 0c             	imull  0xc(%ebp)
  1027b5:	c1 fa 02             	sar    $0x2,%edx
  1027b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027bb:	c1 f8 1f             	sar    $0x1f,%eax
  1027be:	29 c2                	sub    %eax,%edx
  1027c0:	89 55 0c             	mov    %edx,0xc(%ebp)
  1027c3:	75 dc                	jne    1027a1 <abort+0x35>
  1027c5:	41                   	inc    %ecx
  1027c6:	41                   	inc    %ecx
  1027c7:	43                   	inc    %ebx
  1027c8:	8a 45 e7             	mov    -0x19(%ebp),%al
  1027cb:	88 41 ff             	mov    %al,-0x1(%ecx)
  1027ce:	8a 03                	mov    (%ebx),%al
  1027d0:	88 45 e7             	mov    %al,-0x19(%ebp)
  1027d3:	84 c0                	test   %al,%al
  1027d5:	75 ef                	jne    1027c6 <abort+0x5a>
  1027d7:	c6 01 0a             	movb   $0xa,(%ecx)
  1027da:	0f be 05 60 45 10 00 	movsbl 0x104560,%eax
  1027e1:	84 c0                	test   %al,%al
  1027e3:	74 1b                	je     102800 <abort+0x94>
  1027e5:	bb 60 45 10 00       	mov    $0x104560,%ebx
  1027ea:	83 ec 0c             	sub    $0xc,%esp
  1027ed:	50                   	push   %eax
  1027ee:	e8 c5 e7 ff ff       	call   100fb8 <putChar>
  1027f3:	43                   	inc    %ebx
  1027f4:	0f be 03             	movsbl (%ebx),%eax
  1027f7:	83 c4 10             	add    $0x10,%esp
  1027fa:	84 c0                	test   %al,%al
  1027fc:	75 ec                	jne    1027ea <abort+0x7e>
  1027fe:	66 90                	xchg   %ax,%ax
  102800:	f4                   	hlt    
  102801:	eb fd                	jmp    102800 <abort+0x94>

00102803 <irqEmpty>:
  102803:	6a 00                	push   $0x0
  102805:	6a ff                	push   $0xffffffff
  102807:	eb 13                	jmp    10281c <asmDoIrq>

00102809 <irqGProtectFault>:
  102809:	6a 0d                	push   $0xd
  10280b:	eb 0f                	jmp    10281c <asmDoIrq>

0010280d <irqSyscall>:
  10280d:	6a 00                	push   $0x0
  10280f:	68 80 00 00 00       	push   $0x80
  102814:	eb 06                	jmp    10281c <asmDoIrq>

00102816 <irqTimer>:
  102816:	6a 00                	push   $0x0
  102818:	6a 20                	push   $0x20
  10281a:	eb 00                	jmp    10281c <asmDoIrq>

0010281c <asmDoIrq>:
  10281c:	60                   	pusha  
  10281d:	1e                   	push   %ds
  10281e:	06                   	push   %es
  10281f:	0f a0                	push   %fs
  102821:	0f a8                	push   %gs
  102823:	54                   	push   %esp
  102824:	e8 33 e2 ff ff       	call   100a5c <irqHandle>
  102829:	83 c4 04             	add    $0x4,%esp
  10282c:	0f a9                	pop    %gs
  10282e:	0f a1                	pop    %fs
  102830:	07                   	pop    %es
  102831:	1f                   	pop    %ds
  102832:	61                   	popa   
  102833:	83 c4 04             	add    $0x4,%esp
  102836:	83 c4 04             	add    $0x4,%esp
  102839:	cf                   	iret   

Disassembly of section .rodata:

0010283c <.rodata>:
  10283c:	47                   	inc    %edi
  10283d:	50                   	push   %eax
  10283e:	72 6f                	jb     1028af <asmDoIrq+0x93>
  102840:	74 65                	je     1028a7 <asmDoIrq+0x8b>
  102842:	78 74                	js     1028b8 <asmDoIrq+0x9c>
  102844:	46                   	inc    %esi
  102845:	61                   	popa   
  102846:	75 6c                	jne    1028b4 <asmDoIrq+0x98>
  102848:	74 48                	je     102892 <asmDoIrq+0x76>
  10284a:	61                   	popa   
  10284b:	6e                   	outsb  %ds:(%esi),(%dx)
  10284c:	64 6c                	fs insb (%dx),%es:(%edi)
  10284e:	65 0a 00             	or     %gs:(%eax),%al
  102851:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  102855:	65 6c                	gs insb (%dx),%es:(%edi)
  102857:	2f                   	das    
  102858:	69 72 71 48 61 6e 64 	imul   $0x646e6148,0x71(%edx),%esi
  10285f:	6c                   	insb   (%dx),%es:(%edi)
  102860:	65 2e 63 00          	gs arpl %ax,%cs:(%eax)
  102864:	66 6f                	outsw  %ds:(%esi),(%dx)
  102866:	72 6b                	jb     1028d3 <asmDoIrq+0xb7>
  102868:	20 00                	and    %al,(%eax)
  10286a:	73 6c                	jae    1028d8 <asmDoIrq+0xbc>
  10286c:	65 65 70 20          	gs gs jo 102890 <asmDoIrq+0x74>
  102870:	00 65 72             	add    %ah,0x72(%ebp)
  102873:	72 6f                	jb     1028e4 <asmDoIrq+0xc8>
  102875:	72 20                	jb     102897 <asmDoIrq+0x7b>
  102877:	69 72 71 0a 00 44 0a 	imul   $0xa44000a,0x71(%edx),%esi
  10287e:	10 00                	adc    %al,(%eax)
  102880:	20 09                	and    %cl,(%ecx)
  102882:	10 00                	adc    %al,(%eax)
  102884:	2c 09                	sub    $0x9,%al
  102886:	10 00                	adc    %al,(%eax)
  102888:	38 09                	cmp    %cl,(%ecx)
  10288a:	10 00                	adc    %al,(%eax)
  10288c:	58                   	pop    %eax
  10288d:	09 10                	or     %edx,(%eax)
  10288f:	00 64 09 10          	add    %ah,0x10(%ecx,%ecx,1)
  102893:	00 70 09             	add    %dh,0x9(%eax)
  102896:	10 00                	adc    %al,(%eax)
  102898:	7c 09                	jl     1028a3 <asmDoIrq+0x87>
  10289a:	10 00                	adc    %al,(%eax)
  10289c:	88 09                	mov    %cl,(%ecx)
  10289e:	10 00                	adc    %al,(%eax)
  1028a0:	94                   	xchg   %eax,%esp
  1028a1:	09 10                	or     %edx,(%eax)
  1028a3:	00 e0                	add    %ah,%al
  1028a5:	09 10                	or     %edx,(%eax)
  1028a7:	00 ec                	add    %ch,%ah
  1028a9:	09 10                	or     %edx,(%eax)
  1028ab:	00 f8                	add    %bh,%al
  1028ad:	09 10                	or     %edx,(%eax)
  1028af:	00 10                	add    %dl,(%eax)
  1028b1:	09 10                	or     %edx,(%eax)
  1028b3:	00 53 65             	add    %dl,0x65(%ebx)
  1028b6:	6d                   	insl   (%dx),%es:(%edi)
  1028b7:	61                   	popa   
  1028b8:	20 62 6c             	and    %ah,0x6c(%edx)
  1028bb:	6f                   	outsl  %ds:(%esi),(%dx)
  1028bc:	63 6b 65             	arpl   %bp,0x65(%ebx)
  1028bf:	64 20 00             	and    %al,%fs:(%eax)
  1028c2:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  1028c6:	65 6c                	gs insb (%dx),%es:(%edi)
  1028c8:	2f                   	das    
  1028c9:	73 65                	jae    102930 <asmDoIrq+0x114>
  1028cb:	6d                   	insl   (%dx),%es:(%edi)
  1028cc:	61                   	popa   
  1028cd:	2e 63 00             	arpl   %ax,%cs:(%eax)
  1028d0:	53                   	push   %ebx
  1028d1:	65 6d                	gs insl (%dx),%es:(%edi)
  1028d3:	61                   	popa   
  1028d4:	20 72 65             	and    %dh,0x65(%edx)
  1028d7:	61                   	popa   
  1028d8:	6c                   	insb   (%dx),%es:(%edi)
  1028d9:	61                   	popa   
  1028da:	73 65                	jae    102941 <asmDoIrq+0x125>
  1028dc:	64 20 00             	and    %al,%fs:(%eax)
  1028df:	2d 32 31 34 37       	sub    $0x37343132,%eax
  1028e4:	34 38                	xor    $0x38,%al
  1028e6:	33 37                	xor    (%edi),%esi
  1028e8:	34 38                	xor    $0x38,%al
  1028ea:	00 2f                	add    %ch,(%edi)
  1028ec:	73 62                	jae    102950 <asmDoIrq+0x134>
  1028ee:	69 6e 2f 69 6e 69 74 	imul   $0x74696e69,0x2f(%esi),%ebp
  1028f5:	00 77 61             	add    %dh,0x61(%edi)
  1028f8:	6b 65 20 00          	imul   $0x0,0x20(%ebp),%esp
  1028fc:	73 77                	jae    102975 <asmDoIrq+0x159>
  1028fe:	69 74 63 68 20 00 69 	imul   $0x73690020,0x68(%ebx,%eiz,2),%esi
  102905:	73 
  102906:	20 4e 55             	and    %cl,0x55(%esi)
  102909:	4c                   	dec    %esp
  10290a:	4c                   	dec    %esp
  10290b:	0a 00                	or     (%eax),%al
  10290d:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  102911:	65 6c                	gs insb (%dx),%es:(%edi)
  102913:	2f                   	das    
  102914:	66 73 2e             	data16 jae 102945 <asmDoIrq+0x129>
  102917:	63 00                	arpl   %ax,(%eax)
  102919:	2f                   	das    
  10291a:	00 20                	add    %ah,(%eax)
  10291c:	20 00                	and    %al,(%eax)
  10291e:	6e                   	outsb  %ds:(%esi),(%dx)
  10291f:	6f                   	outsl  %ds:(%esi),(%dx)
  102920:	20 65 6d             	and    %ah,0x6d(%ebp)
  102923:	70 74                	jo     102999 <asmDoIrq+0x17d>
  102925:	79 20                	jns    102947 <asmDoIrq+0x12b>
  102927:	69 6e 6f 64 65 0a 00 	imul   $0xa6564,0x6f(%esi),%ebp
  10292e:	6e                   	outsb  %ds:(%esi),(%dx)
  10292f:	6f                   	outsl  %ds:(%esi),(%dx)
  102930:	20 65 6d             	and    %ah,0x6d(%ebp)
  102933:	70 74                	jo     1029a9 <asmDoIrq+0x18d>
  102935:	79 20                	jns    102957 <asmDoIrq+0x13b>
  102937:	62 6c 6f 63          	bound  %ebp,0x63(%edi,%ebp,2)
  10293b:	6b 0a 00             	imul   $0x0,(%edx),%ecx
  10293e:	6e                   	outsb  %ds:(%esi),(%dx)
  10293f:	6f                   	outsl  %ds:(%esi),(%dx)
  102940:	20 65 6d             	and    %ah,0x6d(%ebp)
  102943:	70 74                	jo     1029b9 <asmDoIrq+0x19d>
  102945:	79 20                	jns    102967 <asmDoIrq+0x14b>
  102947:	46                   	inc    %esi
  102948:	43                   	inc    %ebx
  102949:	42                   	inc    %edx
  10294a:	0a 00                	or     (%eax),%al

Disassembly of section .eh_frame:

0010294c <.eh_frame>:
  10294c:	14 00                	adc    $0x0,%al
  10294e:	00 00                	add    %al,(%eax)
  102950:	00 00                	add    %al,(%eax)
  102952:	00 00                	add    %al,(%eax)
  102954:	01 7a 52             	add    %edi,0x52(%edx)
  102957:	00 01                	add    %al,(%ecx)
  102959:	7c 08                	jl     102963 <asmDoIrq+0x147>
  10295b:	01 1b                	add    %ebx,(%ebx)
  10295d:	0c 04                	or     $0x4,%al
  10295f:	04 88                	add    $0x88,%al
  102961:	01 00                	add    %eax,(%eax)
  102963:	00 18                	add    %bl,(%eax)
  102965:	00 00                	add    %al,(%eax)
  102967:	00 1c 00             	add    %bl,(%eax,%eax,1)
  10296a:	00 00                	add    %al,(%eax)
  10296c:	94                   	xchg   %eax,%esp
  10296d:	d6                   	(bad)  
  10296e:	ff                   	(bad)  
  10296f:	ff 26                	jmp    *(%esi)
  102971:	00 00                	add    %al,(%eax)
  102973:	00 00                	add    %al,(%eax)
  102975:	41                   	inc    %ecx
  102976:	0e                   	push   %cs
  102977:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10297d:	00 00                	add    %al,(%eax)
  10297f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  102982:	00 00                	add    %al,(%eax)
  102984:	38 00                	cmp    %al,(%eax)
  102986:	00 00                	add    %al,(%eax)
  102988:	a0 d6 ff ff 1f       	mov    0x1fffffd6,%al
  10298d:	00 00                	add    %al,(%eax)
  10298f:	00 00                	add    %al,(%eax)
  102991:	41                   	inc    %ecx
  102992:	0e                   	push   %cs
  102993:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102999:	5b                   	pop    %ebx
  10299a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10299d:	04 00                	add    $0x0,%al
  10299f:	00 24 00             	add    %ah,(%eax,%eax,1)
  1029a2:	00 00                	add    %al,(%eax)
  1029a4:	58                   	pop    %eax
  1029a5:	00 00                	add    %al,(%eax)
  1029a7:	00 a0 d6 ff ff 31    	add    %ah,0x31ffffd6(%eax)
  1029ad:	00 00                	add    %al,(%eax)
  1029af:	00 00                	add    %al,(%eax)
  1029b1:	41                   	inc    %ecx
  1029b2:	0e                   	push   %cs
  1029b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1029b9:	64 0a c5             	fs or  %ch,%al
  1029bc:	0c 04                	or     $0x4,%al
  1029be:	04 41                	add    $0x41,%al
  1029c0:	0b 48 c5             	or     -0x3b(%eax),%ecx
  1029c3:	0c 04                	or     $0x4,%al
  1029c5:	04 00                	add    $0x0,%al
  1029c7:	00 2c 00             	add    %ch,(%eax,%eax,1)
  1029ca:	00 00                	add    %al,(%eax)
  1029cc:	80 00 00             	addb   $0x0,(%eax)
  1029cf:	00 ac d6 ff ff 3c 00 	add    %ch,0x3cffff(%esi,%edx,8)
  1029d6:	00 00                	add    %al,(%eax)
  1029d8:	00 41 0e             	add    %al,0xe(%ecx)
  1029db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1029e1:	41                   	inc    %ecx
  1029e2:	83 03 6a             	addl   $0x6a,(%ebx)
  1029e5:	0a c3                	or     %bl,%al
  1029e7:	41                   	inc    %ecx
  1029e8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1029eb:	04 41                	add    $0x41,%al
  1029ed:	0b 4a c3             	or     -0x3d(%edx),%ecx
  1029f0:	41                   	inc    %ecx
  1029f1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1029f4:	04 00                	add    $0x0,%al
  1029f6:	00 00                	add    %al,(%eax)
  1029f8:	2c 00                	sub    $0x0,%al
  1029fa:	00 00                	add    %al,(%eax)
  1029fc:	b0 00                	mov    $0x0,%al
  1029fe:	00 00                	add    %al,(%eax)
  102a00:	b8 d6 ff ff 46       	mov    $0x46ffffd6,%eax
  102a05:	00 00                	add    %al,(%eax)
  102a07:	00 00                	add    %al,(%eax)
  102a09:	41                   	inc    %ecx
  102a0a:	0e                   	push   %cs
  102a0b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102a11:	43                   	inc    %ebx
  102a12:	87 03                	xchg   %eax,(%ebx)
  102a14:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102a17:	05 78 0a c3 41       	add    $0x41c30a78,%eax
  102a1c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102a20:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102a23:	04 41                	add    $0x41,%al
  102a25:	0b 00                	or     (%eax),%eax
  102a27:	00 38                	add    %bh,(%eax)
  102a29:	00 00                	add    %al,(%eax)
  102a2b:	00 e0                	add    %ah,%al
  102a2d:	00 00                	add    %al,(%eax)
  102a2f:	00 d0                	add    %dl,%al
  102a31:	d6                   	(bad)  
  102a32:	ff                   	(bad)  
  102a33:	ff 4f 00             	decl   0x0(%edi)
  102a36:	00 00                	add    %al,(%eax)
  102a38:	00 41 0e             	add    %al,0xe(%ecx)
  102a3b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102a41:	43                   	inc    %ebx
  102a42:	87 03                	xchg   %eax,(%ebx)
  102a44:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102a47:	05 70 0a c3 41       	add    $0x41c30a70,%eax
  102a4c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102a50:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102a53:	04 43                	add    $0x43,%al
  102a55:	0b 4b 0a             	or     0xa(%ebx),%ecx
  102a58:	c3                   	ret    
  102a59:	41                   	inc    %ecx
  102a5a:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102a5e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102a61:	04 41                	add    $0x41,%al
  102a63:	0b 2c 00             	or     (%eax,%eax,1),%ebp
  102a66:	00 00                	add    %al,(%eax)
  102a68:	1c 01                	sbb    $0x1,%al
  102a6a:	00 00                	add    %al,(%eax)
  102a6c:	e4 d6                	in     $0xd6,%al
  102a6e:	ff                   	(bad)  
  102a6f:	ff c6                	inc    %esi
  102a71:	00 00                	add    %al,(%eax)
  102a73:	00 00                	add    %al,(%eax)
  102a75:	41                   	inc    %ecx
  102a76:	0e                   	push   %cs
  102a77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102a7d:	43                   	inc    %ebx
  102a7e:	87 03                	xchg   %eax,(%ebx)
  102a80:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102a83:	05 02 8e 0a c3       	add    $0xc30a8e02,%eax
  102a88:	41                   	inc    %ecx
  102a89:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102a8d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102a90:	04 41                	add    $0x41,%al
  102a92:	0b 00                	or     (%eax),%eax
  102a94:	24 00                	and    $0x0,%al
  102a96:	00 00                	add    %al,(%eax)
  102a98:	4c                   	dec    %esp
  102a99:	01 00                	add    %eax,(%eax)
  102a9b:	00 7c d7 ff          	add    %bh,-0x1(%edi,%edx,8)
  102a9f:	ff 25 00 00 00 00    	jmp    *0x0
  102aa5:	41                   	inc    %ecx
  102aa6:	0e                   	push   %cs
  102aa7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102aad:	42                   	inc    %edx
  102aae:	86 03                	xchg   %al,(%ebx)
  102ab0:	83 04 5d c3 41 c6 41 	addl   $0xffffffc5,0x41c641c3(,%ebx,2)
  102ab7:	c5 
  102ab8:	0c 04                	or     $0x4,%al
  102aba:	04 00                	add    $0x0,%al
  102abc:	24 00                	and    $0x0,%al
  102abe:	00 00                	add    %al,(%eax)
  102ac0:	74 01                	je     102ac3 <asmDoIrq+0x2a7>
  102ac2:	00 00                	add    %al,(%eax)
  102ac4:	7c d7                	jl     102a9d <asmDoIrq+0x281>
  102ac6:	ff                   	(bad)  
  102ac7:	ff 21                	jmp    *(%ecx)
  102ac9:	00 00                	add    %al,(%eax)
  102acb:	00 00                	add    %al,(%eax)
  102acd:	41                   	inc    %ecx
  102ace:	0e                   	push   %cs
  102acf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102ad5:	59                   	pop    %ecx
  102ad6:	0a c5                	or     %ch,%al
  102ad8:	0c 04                	or     $0x4,%al
  102ada:	04 41                	add    $0x41,%al
  102adc:	0b 43 c5             	or     -0x3b(%ebx),%eax
  102adf:	0c 04                	or     $0x4,%al
  102ae1:	04 00                	add    $0x0,%al
  102ae3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  102ae6:	00 00                	add    %al,(%eax)
  102ae8:	9c                   	pushf  
  102ae9:	01 00                	add    %eax,(%eax)
  102aeb:	00 78 d7             	add    %bh,-0x29(%eax)
  102aee:	ff                   	(bad)  
  102aef:	ff 23                	jmp    *(%ebx)
  102af1:	00 00                	add    %al,(%eax)
  102af3:	00 00                	add    %al,(%eax)
  102af5:	41                   	inc    %ecx
  102af6:	0e                   	push   %cs
  102af7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102afd:	5f                   	pop    %edi
  102afe:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102b01:	04 00                	add    $0x0,%al
  102b03:	00 38                	add    %bh,(%eax)
  102b05:	00 00                	add    %al,(%eax)
  102b07:	00 bc 01 00 00 7c d7 	add    %bh,-0x28840000(%ecx,%eax,1)
  102b0e:	ff                   	(bad)  
  102b0f:	ff 94 00 00 00 00 41 	call   *0x41000000(%eax,%eax,1)
  102b16:	0e                   	push   %cs
  102b17:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102b1d:	46                   	inc    %esi
  102b1e:	87 03                	xchg   %eax,(%ebx)
  102b20:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102b23:	05 02 6b 0a c3       	add    $0xc30a6b02,%eax
  102b28:	41                   	inc    %ecx
  102b29:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102b2d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102b30:	04 41                	add    $0x41,%al
  102b32:	0b 58 c3             	or     -0x3d(%eax),%ebx
  102b35:	41                   	inc    %ecx
  102b36:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102b3a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102b3d:	04 00                	add    $0x0,%al
  102b3f:	00 20                	add    %ah,(%eax)
  102b41:	00 00                	add    %al,(%eax)
  102b43:	00 f8                	add    %bh,%al
  102b45:	01 00                	add    %eax,(%eax)
  102b47:	00 d4                	add    %dl,%ah
  102b49:	d7                   	xlat   %ds:(%ebx)
  102b4a:	ff                   	(bad)  
  102b4b:	ff 5d 00             	lcall  *0x0(%ebp)
  102b4e:	00 00                	add    %al,(%eax)
  102b50:	00 41 0e             	add    %al,0xe(%ecx)
  102b53:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102b59:	44                   	inc    %esp
  102b5a:	83 03 02             	addl   $0x2,(%ebx)
  102b5d:	55                   	push   %ebp
  102b5e:	c5 c3 0c             	(bad)  
  102b61:	04 04                	add    $0x4,%al
  102b63:	00 1c 00             	add    %bl,(%eax,%eax,1)
  102b66:	00 00                	add    %al,(%eax)
  102b68:	1c 02                	sbb    $0x2,%al
  102b6a:	00 00                	add    %al,(%eax)
  102b6c:	10 d8                	adc    %bl,%al
  102b6e:	ff                   	(bad)  
  102b6f:	ff 21                	jmp    *(%ecx)
  102b71:	00 00                	add    %al,(%eax)
  102b73:	00 00                	add    %al,(%eax)
  102b75:	41                   	inc    %ecx
  102b76:	0e                   	push   %cs
  102b77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102b7d:	5d                   	pop    %ebp
  102b7e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102b81:	04 00                	add    $0x0,%al
  102b83:	00 24 00             	add    %ah,(%eax,%eax,1)
  102b86:	00 00                	add    %al,(%eax)
  102b88:	3c 02                	cmp    $0x2,%al
  102b8a:	00 00                	add    %al,(%eax)
  102b8c:	14 d8                	adc    $0xd8,%al
  102b8e:	ff                   	(bad)  
  102b8f:	ff 36                	pushl  (%esi)
  102b91:	00 00                	add    %al,(%eax)
  102b93:	00 00                	add    %al,(%eax)
  102b95:	41                   	inc    %ecx
  102b96:	0e                   	push   %cs
  102b97:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102b9d:	6b 0a c5             	imul   $0xffffffc5,(%edx),%ecx
  102ba0:	0c 04                	or     $0x4,%al
  102ba2:	04 46                	add    $0x46,%al
  102ba4:	0b 41 c5             	or     -0x3b(%ecx),%eax
  102ba7:	0c 04                	or     $0x4,%al
  102ba9:	04 00                	add    $0x0,%al
  102bab:	00 28                	add    %ch,(%eax)
  102bad:	00 00                	add    %al,(%eax)
  102baf:	00 64 02 00          	add    %ah,0x0(%edx,%eax,1)
  102bb3:	00 24 d8             	add    %ah,(%eax,%ebx,8)
  102bb6:	ff                   	(bad)  
  102bb7:	ff f4                	push   %esp
  102bb9:	00 00                	add    %al,(%eax)
  102bbb:	00 00                	add    %al,(%eax)
  102bbd:	41                   	inc    %ecx
  102bbe:	0e                   	push   %cs
  102bbf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102bc5:	46                   	inc    %esi
  102bc6:	87 03                	xchg   %eax,(%ebx)
  102bc8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102bcb:	05 02 e3 c3 41       	add    $0x41c3e302,%eax
  102bd0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102bd4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102bd7:	04 28                	add    $0x28,%al
  102bd9:	00 00                	add    %al,(%eax)
  102bdb:	00 90 02 00 00 ec    	add    %dl,-0x13fffffe(%eax)
  102be1:	d8 ff                	fdivr  %st(7),%st
  102be3:	ff 6b 00             	ljmp   *0x0(%ebx)
  102be6:	00 00                	add    %al,(%eax)
  102be8:	00 41 0e             	add    %al,0xe(%ecx)
  102beb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102bf1:	46                   	inc    %esi
  102bf2:	87 03                	xchg   %eax,(%ebx)
  102bf4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102bf7:	05 02 5a c3 41       	add    $0x41c35a02,%eax
  102bfc:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102c00:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102c03:	04 1c                	add    $0x1c,%al
  102c05:	00 00                	add    %al,(%eax)
  102c07:	00 bc 02 00 00 2c d9 	add    %bh,-0x26d40000(%edx,%eax,1)
  102c0e:	ff                   	(bad)  
  102c0f:	ff 20                	jmp    *(%eax)
  102c11:	00 00                	add    %al,(%eax)
  102c13:	00 00                	add    %al,(%eax)
  102c15:	41                   	inc    %ecx
  102c16:	0e                   	push   %cs
  102c17:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102c1d:	58                   	pop    %eax
  102c1e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102c21:	04 00                	add    $0x0,%al
  102c23:	00 24 00             	add    %ah,(%eax,%eax,1)
  102c26:	00 00                	add    %al,(%eax)
  102c28:	dc 02                	faddl  (%edx)
  102c2a:	00 00                	add    %al,(%eax)
  102c2c:	2c d9                	sub    $0xd9,%al
  102c2e:	ff                   	(bad)  
  102c2f:	ff 62 00             	jmp    *0x0(%edx)
  102c32:	00 00                	add    %al,(%eax)
  102c34:	00 41 0e             	add    %al,0xe(%ecx)
  102c37:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102c3d:	42                   	inc    %edx
  102c3e:	86 03                	xchg   %al,(%ebx)
  102c40:	83 04 02 5a          	addl   $0x5a,(%edx,%eax,1)
  102c44:	c3                   	ret    
  102c45:	41                   	inc    %ecx
  102c46:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  102c4a:	04 04                	add    $0x4,%al
  102c4c:	28 00                	sub    %al,(%eax)
  102c4e:	00 00                	add    %al,(%eax)
  102c50:	04 03                	add    $0x3,%al
  102c52:	00 00                	add    %al,(%eax)
  102c54:	68 d9 ff ff 9c       	push   $0x9cffffd9
  102c59:	00 00                	add    %al,(%eax)
  102c5b:	00 00                	add    %al,(%eax)
  102c5d:	41                   	inc    %ecx
  102c5e:	0e                   	push   %cs
  102c5f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102c65:	42                   	inc    %edx
  102c66:	83 03 02             	addl   $0x2,(%ebx)
  102c69:	77 0a                	ja     102c75 <asmDoIrq+0x459>
  102c6b:	c5 c3 0c             	(bad)  
  102c6e:	04 04                	add    $0x4,%al
  102c70:	44                   	inc    %esp
  102c71:	0b 5b c3             	or     -0x3d(%ebx),%ebx
  102c74:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102c77:	04 38                	add    $0x38,%al
  102c79:	00 00                	add    %al,(%eax)
  102c7b:	00 30                	add    %dh,(%eax)
  102c7d:	03 00                	add    (%eax),%eax
  102c7f:	00 d8                	add    %bl,%al
  102c81:	d9 ff                	fcos   
  102c83:	ff b7 00 00 00 00    	pushl  0x0(%edi)
  102c89:	41                   	inc    %ecx
  102c8a:	0e                   	push   %cs
  102c8b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102c91:	46                   	inc    %esi
  102c92:	87 03                	xchg   %eax,(%ebx)
  102c94:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102c97:	05 02 7b 0a c3       	add    $0xc30a7b02,%eax
  102c9c:	41                   	inc    %ecx
  102c9d:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102ca1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102ca4:	04 41                	add    $0x41,%al
  102ca6:	0b 6b c3             	or     -0x3d(%ebx),%ebp
  102ca9:	41                   	inc    %ecx
  102caa:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102cae:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102cb1:	04 00                	add    $0x0,%al
  102cb3:	00 28                	add    %ch,(%eax)
  102cb5:	00 00                	add    %al,(%eax)
  102cb7:	00 6c 03 00          	add    %ch,0x0(%ebx,%eax,1)
  102cbb:	00 54 da ff          	add    %dl,-0x1(%edx,%ebx,8)
  102cbf:	ff 96 00 00 00 00    	call   *0x0(%esi)
  102cc5:	41                   	inc    %ecx
  102cc6:	0e                   	push   %cs
  102cc7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102ccd:	42                   	inc    %edx
  102cce:	83 03 02             	addl   $0x2,(%ebx)
  102cd1:	77 0a                	ja     102cdd <asmDoIrq+0x4c1>
  102cd3:	c5 c3 0c             	(bad)  
  102cd6:	04 04                	add    $0x4,%al
  102cd8:	44                   	inc    %esp
  102cd9:	0b 55 c3             	or     -0x3d(%ebp),%edx
  102cdc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102cdf:	04 1c                	add    $0x1c,%al
  102ce1:	00 00                	add    %al,(%eax)
  102ce3:	00 98 03 00 00 c0    	add    %bl,-0x3ffffffd(%eax)
  102ce9:	da ff                	(bad)  
  102ceb:	ff 4b 00             	decl   0x0(%ebx)
  102cee:	00 00                	add    %al,(%eax)
  102cf0:	00 41 0e             	add    %al,0xe(%ecx)
  102cf3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102cf9:	02 43 c5             	add    -0x3b(%ebx),%al
  102cfc:	0c 04                	or     $0x4,%al
  102cfe:	04 00                	add    $0x0,%al
  102d00:	20 00                	and    %al,(%eax)
  102d02:	00 00                	add    %al,(%eax)
  102d04:	b8 03 00 00 ec       	mov    $0xec000003,%eax
  102d09:	da ff                	(bad)  
  102d0b:	ff 2c 00             	ljmp   *(%eax,%eax,1)
  102d0e:	00 00                	add    %al,(%eax)
  102d10:	00 41 0e             	add    %al,0xe(%ecx)
  102d13:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102d19:	64 0a c5             	fs or  %ch,%al
  102d1c:	0c 04                	or     $0x4,%al
  102d1e:	04 41                	add    $0x41,%al
  102d20:	0b 00                	or     (%eax),%eax
  102d22:	00 00                	add    %al,(%eax)
  102d24:	1c 00                	sbb    $0x0,%al
  102d26:	00 00                	add    %al,(%eax)
  102d28:	dc 03                	faddl  (%ebx)
  102d2a:	00 00                	add    %al,(%eax)
  102d2c:	f4                   	hlt    
  102d2d:	da ff                	(bad)  
  102d2f:	ff 18                	lcall  *(%eax)
  102d31:	00 00                	add    %al,(%eax)
  102d33:	00 00                	add    %al,(%eax)
  102d35:	41                   	inc    %ecx
  102d36:	0e                   	push   %cs
  102d37:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102d3d:	54                   	push   %esp
  102d3e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102d41:	04 00                	add    $0x0,%al
  102d43:	00 20                	add    %ah,(%eax)
  102d45:	00 00                	add    %al,(%eax)
  102d47:	00 fc                	add    %bh,%ah
  102d49:	03 00                	add    (%eax),%eax
  102d4b:	00 ec                	add    %ch,%ah
  102d4d:	da ff                	(bad)  
  102d4f:	ff 5a 00             	lcall  *0x0(%edx)
  102d52:	00 00                	add    %al,(%eax)
  102d54:	00 41 0e             	add    %al,0xe(%ecx)
  102d57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102d5d:	44                   	inc    %esp
  102d5e:	83 03 02             	addl   $0x2,(%ebx)
  102d61:	52                   	push   %edx
  102d62:	c5 c3 0c             	(bad)  
  102d65:	04 04                	add    $0x4,%al
  102d67:	00 20                	add    %ah,(%eax)
  102d69:	00 00                	add    %al,(%eax)
  102d6b:	00 20                	add    %ah,(%eax)
  102d6d:	04 00                	add    $0x0,%al
  102d6f:	00 24 db             	add    %ah,(%ebx,%ebx,8)
  102d72:	ff                   	(bad)  
  102d73:	ff 5d 00             	lcall  *0x0(%ebp)
  102d76:	00 00                	add    %al,(%eax)
  102d78:	00 41 0e             	add    %al,0xe(%ecx)
  102d7b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102d81:	44                   	inc    %esp
  102d82:	83 03 02             	addl   $0x2,(%ebx)
  102d85:	55                   	push   %ebp
  102d86:	c5 c3 0c             	(bad)  
  102d89:	04 04                	add    $0x4,%al
  102d8b:	00 98 00 00 00 44    	add    %bl,0x44000000(%eax)
  102d91:	04 00                	add    $0x0,%al
  102d93:	00 60 db             	add    %ah,-0x25(%eax)
  102d96:	ff                   	(bad)  
  102d97:	ff 67 01             	jmp    *0x1(%edi)
  102d9a:	00 00                	add    %al,(%eax)
  102d9c:	00 41 0e             	add    %al,0xe(%ecx)
  102d9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102da5:	42                   	inc    %edx
  102da6:	83 03 61             	addl   $0x61,(%ebx)
  102da9:	0a c5                	or     %ch,%al
  102dab:	c3                   	ret    
  102dac:	0c 04                	or     $0x4,%al
  102dae:	04 46                	add    $0x46,%al
  102db0:	0b 47 0a             	or     0xa(%edi),%eax
  102db3:	c5 c3 0c             	(bad)  
  102db6:	04 04                	add    $0x4,%al
  102db8:	45                   	inc    %ebp
  102db9:	0b 47 0a             	or     0xa(%edi),%eax
  102dbc:	c5 c3 0c             	(bad)  
  102dbf:	04 04                	add    $0x4,%al
  102dc1:	45                   	inc    %ebp
  102dc2:	0b 58 0a             	or     0xa(%eax),%ebx
  102dc5:	c5 c3 0c             	(bad)  
  102dc8:	04 04                	add    $0x4,%al
  102dca:	48                   	dec    %eax
  102dcb:	0b 47 0a             	or     0xa(%edi),%eax
  102dce:	c5 c3 0c             	(bad)  
  102dd1:	04 04                	add    $0x4,%al
  102dd3:	45                   	inc    %ebp
  102dd4:	0b 47 0a             	or     0xa(%edi),%eax
  102dd7:	c5 c3 0c             	(bad)  
  102dda:	04 04                	add    $0x4,%al
  102ddc:	45                   	inc    %ebp
  102ddd:	0b 47 0a             	or     0xa(%edi),%eax
  102de0:	c5 c3 0c             	(bad)  
  102de3:	04 04                	add    $0x4,%al
  102de5:	45                   	inc    %ebp
  102de6:	0b 47 0a             	or     0xa(%edi),%eax
  102de9:	c5 c3 0c             	(bad)  
  102dec:	04 04                	add    $0x4,%al
  102dee:	45                   	inc    %ebp
  102def:	0b 47 0a             	or     0xa(%edi),%eax
  102df2:	c5 c3 0c             	(bad)  
  102df5:	04 04                	add    $0x4,%al
  102df7:	45                   	inc    %ebp
  102df8:	0b 02                	or     (%edx),%eax
  102dfa:	45                   	inc    %ebp
  102dfb:	0a c5                	or     %ch,%al
  102dfd:	c3                   	ret    
  102dfe:	0c 04                	or     $0x4,%al
  102e00:	04 47                	add    $0x47,%al
  102e02:	0b 47 0a             	or     0xa(%edi),%eax
  102e05:	c5 c3 0c             	(bad)  
  102e08:	04 04                	add    $0x4,%al
  102e0a:	45                   	inc    %ebp
  102e0b:	0b 47 0a             	or     0xa(%edi),%eax
  102e0e:	c5 c3 0c             	(bad)  
  102e11:	04 04                	add    $0x4,%al
  102e13:	45                   	inc    %ebp
  102e14:	0b 02                	or     (%edx),%eax
  102e16:	45                   	inc    %ebp
  102e17:	0a c5                	or     %ch,%al
  102e19:	c3                   	ret    
  102e1a:	0c 04                	or     $0x4,%al
  102e1c:	04 47                	add    $0x47,%al
  102e1e:	0b 56 c5             	or     -0x3b(%esi),%edx
  102e21:	c3                   	ret    
  102e22:	0c 04                	or     $0x4,%al
  102e24:	04 00                	add    $0x0,%al
  102e26:	00 00                	add    %al,(%eax)
  102e28:	20 00                	and    %al,(%eax)
  102e2a:	00 00                	add    %al,(%eax)
  102e2c:	e0 04                	loopne 102e32 <asmDoIrq+0x616>
  102e2e:	00 00                	add    %al,(%eax)
  102e30:	2c dc                	sub    $0xdc,%al
  102e32:	ff                   	(bad)  
  102e33:	ff 98 00 00 00 00    	lcall  *0x0(%eax)
  102e39:	41                   	inc    %ecx
  102e3a:	0e                   	push   %cs
  102e3b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102e41:	7e 0a                	jle    102e4d <asmDoIrq+0x631>
  102e43:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102e46:	04 43                	add    $0x43,%al
  102e48:	0b 00                	or     (%eax),%eax
  102e4a:	00 00                	add    %al,(%eax)
  102e4c:	1c 00                	sbb    $0x0,%al
  102e4e:	00 00                	add    %al,(%eax)
  102e50:	04 05                	add    $0x5,%al
  102e52:	00 00                	add    %al,(%eax)
  102e54:	a0 dc ff ff 4b       	mov    0x4bffffdc,%al
  102e59:	00 00                	add    %al,(%eax)
  102e5b:	00 00                	add    %al,(%eax)
  102e5d:	41                   	inc    %ecx
  102e5e:	0e                   	push   %cs
  102e5f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102e65:	02 43 c5             	add    -0x3b(%ebx),%al
  102e68:	0c 04                	or     $0x4,%al
  102e6a:	04 00                	add    $0x0,%al
  102e6c:	1c 00                	sbb    $0x0,%al
  102e6e:	00 00                	add    %al,(%eax)
  102e70:	24 05                	and    $0x5,%al
  102e72:	00 00                	add    %al,(%eax)
  102e74:	cc                   	int3   
  102e75:	dc ff                	fdivr  %st,%st(7)
  102e77:	ff 12                	call   *(%edx)
  102e79:	00 00                	add    %al,(%eax)
  102e7b:	00 00                	add    %al,(%eax)
  102e7d:	41                   	inc    %ecx
  102e7e:	0e                   	push   %cs
  102e7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102e85:	4a                   	dec    %edx
  102e86:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102e89:	04 00                	add    $0x0,%al
  102e8b:	00 28                	add    %ch,(%eax)
  102e8d:	00 00                	add    %al,(%eax)
  102e8f:	00 44 05 00          	add    %al,0x0(%ebp,%eax,1)
  102e93:	00 c0                	add    %al,%al
  102e95:	dc ff                	fdivr  %st,%st(7)
  102e97:	ff 84 00 00 00 00 41 	incl   0x41000000(%eax,%eax,1)
  102e9e:	0e                   	push   %cs
  102e9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102ea5:	42                   	inc    %edx
  102ea6:	86 03                	xchg   %al,(%ebx)
  102ea8:	83 04 02 5c          	addl   $0x5c,(%edx,%eax,1)
  102eac:	0a c3                	or     %bl,%al
  102eae:	41                   	inc    %ecx
  102eaf:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  102eb3:	04 04                	add    $0x4,%al
  102eb5:	41                   	inc    %ecx
  102eb6:	0b 00                	or     (%eax),%eax
  102eb8:	2c 00                	sub    $0x0,%al
  102eba:	00 00                	add    %al,(%eax)
  102ebc:	70 05                	jo     102ec3 <asmDoIrq+0x6a7>
  102ebe:	00 00                	add    %al,(%eax)
  102ec0:	18 dd                	sbb    %bl,%ch
  102ec2:	ff                   	(bad)  
  102ec3:	ff                   	(bad)  
  102ec4:	7b 00                	jnp    102ec6 <asmDoIrq+0x6aa>
  102ec6:	00 00                	add    %al,(%eax)
  102ec8:	00 41 0e             	add    %al,0xe(%ecx)
  102ecb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102ed1:	42                   	inc    %edx
  102ed2:	83 03 4c             	addl   $0x4c,(%ebx)
  102ed5:	0a c5                	or     %ch,%al
  102ed7:	c3                   	ret    
  102ed8:	0c 04                	or     $0x4,%al
  102eda:	04 43                	add    $0x43,%al
  102edc:	0b 02                	or     (%edx),%eax
  102ede:	51                   	push   %ecx
  102edf:	0a c5                	or     %ch,%al
  102ee1:	c3                   	ret    
  102ee2:	0c 04                	or     $0x4,%al
  102ee4:	04 47                	add    $0x47,%al
  102ee6:	0b 00                	or     (%eax),%eax
  102ee8:	2c 00                	sub    $0x0,%al
  102eea:	00 00                	add    %al,(%eax)
  102eec:	a0 05 00 00 64       	mov    0x64000005,%al
  102ef1:	dd ff                	(bad)  
  102ef3:	ff 6f 00             	ljmp   *0x0(%edi)
  102ef6:	00 00                	add    %al,(%eax)
  102ef8:	00 41 0e             	add    %al,0xe(%ecx)
  102efb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102f01:	42                   	inc    %edx
  102f02:	83 03 52             	addl   $0x52,(%ebx)
  102f05:	0a c5                	or     %ch,%al
  102f07:	c3                   	ret    
  102f08:	0c 04                	or     $0x4,%al
  102f0a:	04 41                	add    $0x41,%al
  102f0c:	0b 7b 0a             	or     0xa(%ebx),%edi
  102f0f:	c5 c3 0c             	(bad)  
  102f12:	04 04                	add    $0x4,%al
  102f14:	45                   	inc    %ebp
  102f15:	0b 00                	or     (%eax),%eax
  102f17:	00 20                	add    %ah,(%eax)
  102f19:	00 00                	add    %al,(%eax)
  102f1b:	00 d0                	add    %dl,%al
  102f1d:	05 00 00 a4 dd       	add    $0xdda40000,%eax
  102f22:	ff                   	(bad)  
  102f23:	ff                   	(bad)  
  102f24:	dd 00                	fldl   (%eax)
  102f26:	00 00                	add    %al,(%eax)
  102f28:	00 41 0e             	add    %al,0xe(%ecx)
  102f2b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102f31:	41                   	inc    %ecx
  102f32:	83 03 02             	addl   $0x2,(%ebx)
  102f35:	d7                   	xlat   %ds:(%ebx)
  102f36:	c3                   	ret    
  102f37:	41                   	inc    %ecx
  102f38:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102f3b:	04 20                	add    $0x20,%al
  102f3d:	00 00                	add    %al,(%eax)
  102f3f:	00 f4                	add    %dh,%ah
  102f41:	05 00 00 60 de       	add    $0xde600000,%eax
  102f46:	ff                   	(bad)  
  102f47:	ff 2a                	ljmp   *(%edx)
  102f49:	00 00                	add    %al,(%eax)
  102f4b:	00 00                	add    %al,(%eax)
  102f4d:	41                   	inc    %ecx
  102f4e:	0e                   	push   %cs
  102f4f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102f55:	42                   	inc    %edx
  102f56:	83 03 64             	addl   $0x64,(%ebx)
  102f59:	c5 c3 0c             	(bad)  
  102f5c:	04 04                	add    $0x4,%al
  102f5e:	00 00                	add    %al,(%eax)
  102f60:	48                   	dec    %eax
  102f61:	00 00                	add    %al,(%eax)
  102f63:	00 18                	add    %bl,(%eax)
  102f65:	06                   	push   %es
  102f66:	00 00                	add    %al,(%eax)
  102f68:	68 de ff ff d0       	push   $0xd0ffffde
  102f6d:	00 00                	add    %al,(%eax)
  102f6f:	00 00                	add    %al,(%eax)
  102f71:	41                   	inc    %ecx
  102f72:	0e                   	push   %cs
  102f73:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102f79:	46                   	inc    %esi
  102f7a:	87 03                	xchg   %eax,(%ebx)
  102f7c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  102f7f:	05 02 71 0a c3       	add    $0xc30a7102,%eax
  102f84:	41                   	inc    %ecx
  102f85:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102f89:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102f8c:	04 43                	add    $0x43,%al
  102f8e:	0b 64 0a c3          	or     -0x3d(%edx,%ecx,1),%esp
  102f92:	41                   	inc    %ecx
  102f93:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102f97:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102f9a:	04 41                	add    $0x41,%al
  102f9c:	0b 4b 0a             	or     0xa(%ebx),%ecx
  102f9f:	c3                   	ret    
  102fa0:	41                   	inc    %ecx
  102fa1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  102fa5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  102fa8:	04 46                	add    $0x46,%al
  102faa:	0b 00                	or     (%eax),%eax
  102fac:	30 00                	xor    %al,(%eax)
  102fae:	00 00                	add    %al,(%eax)
  102fb0:	64 06                	fs push %es
  102fb2:	00 00                	add    %al,(%eax)
  102fb4:	ec                   	in     (%dx),%al
  102fb5:	de ff                	fdivrp %st,%st(7)
  102fb7:	ff                   	(bad)  
  102fb8:	7e 00                	jle    102fba <asmDoIrq+0x79e>
  102fba:	00 00                	add    %al,(%eax)
  102fbc:	00 41 0e             	add    %al,0xe(%ecx)
  102fbf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102fc5:	45                   	inc    %ebp
  102fc6:	86 03                	xchg   %al,(%ebx)
  102fc8:	83 04 02 5e          	addl   $0x5e,(%edx,%eax,1)
  102fcc:	0a c3                	or     %bl,%al
  102fce:	41                   	inc    %ecx
  102fcf:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  102fd3:	04 04                	add    $0x4,%al
  102fd5:	44                   	inc    %esp
  102fd6:	0b 4b c3             	or     -0x3d(%ebx),%ecx
  102fd9:	41                   	inc    %ecx
  102fda:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  102fde:	04 04                	add    $0x4,%al
  102fe0:	1c 00                	sbb    $0x0,%al
  102fe2:	00 00                	add    %al,(%eax)
  102fe4:	98                   	cwtl   
  102fe5:	06                   	push   %es
  102fe6:	00 00                	add    %al,(%eax)
  102fe8:	38 df                	cmp    %bl,%bh
  102fea:	ff                   	(bad)  
  102feb:	ff 55 00             	call   *0x0(%ebp)
  102fee:	00 00                	add    %al,(%eax)
  102ff0:	00 41 0e             	add    %al,0xe(%ecx)
  102ff3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  102ff9:	02 51 c5             	add    -0x3b(%ecx),%dl
  102ffc:	0c 04                	or     $0x4,%al
  102ffe:	04 00                	add    $0x0,%al
  103000:	1c 00                	sbb    $0x0,%al
  103002:	00 00                	add    %al,(%eax)
  103004:	b8 06 00 00 70       	mov    $0x70000006,%eax
  103009:	df ff                	(bad)  
  10300b:	ff                   	(bad)  
  10300c:	3d 00 00 00 00       	cmp    $0x0,%eax
  103011:	41                   	inc    %ecx
  103012:	0e                   	push   %cs
  103013:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103019:	79 c5                	jns    102fe0 <asmDoIrq+0x7c4>
  10301b:	0c 04                	or     $0x4,%al
  10301d:	04 00                	add    $0x0,%al
  10301f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  103022:	00 00                	add    %al,(%eax)
  103024:	d8 06                	fadds  (%esi)
  103026:	00 00                	add    %al,(%eax)
  103028:	90                   	nop
  103029:	df ff                	(bad)  
  10302b:	ff 1b                	lcall  *(%ebx)
  10302d:	00 00                	add    %al,(%eax)
  10302f:	00 00                	add    %al,(%eax)
  103031:	41                   	inc    %ecx
  103032:	0e                   	push   %cs
  103033:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103039:	57                   	push   %edi
  10303a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10303d:	04 00                	add    $0x0,%al
  10303f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  103042:	00 00                	add    %al,(%eax)
  103044:	f8                   	clc    
  103045:	06                   	push   %es
  103046:	00 00                	add    %al,(%eax)
  103048:	8c df                	mov    %ds,%edi
  10304a:	ff                   	(bad)  
  10304b:	ff 18                	lcall  *(%eax)
  10304d:	00 00                	add    %al,(%eax)
  10304f:	00 00                	add    %al,(%eax)
  103051:	41                   	inc    %ecx
  103052:	0e                   	push   %cs
  103053:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103059:	54                   	push   %esp
  10305a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10305d:	04 00                	add    $0x0,%al
  10305f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  103062:	00 00                	add    %al,(%eax)
  103064:	18 07                	sbb    %al,(%edi)
  103066:	00 00                	add    %al,(%eax)
  103068:	84 df                	test   %bl,%bh
  10306a:	ff                   	(bad)  
  10306b:	ff 12                	call   *(%edx)
  10306d:	00 00                	add    %al,(%eax)
  10306f:	00 00                	add    %al,(%eax)
  103071:	41                   	inc    %ecx
  103072:	0e                   	push   %cs
  103073:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103079:	4e                   	dec    %esi
  10307a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10307d:	04 00                	add    $0x0,%al
  10307f:	00 20                	add    %ah,(%eax)
  103081:	00 00                	add    %al,(%eax)
  103083:	00 38                	add    %bh,(%eax)
  103085:	07                   	pop    %es
  103086:	00 00                	add    %al,(%eax)
  103088:	78 df                	js     103069 <asmDoIrq+0x84d>
  10308a:	ff                   	(bad)  
  10308b:	ff 75 00             	pushl  0x0(%ebp)
  10308e:	00 00                	add    %al,(%eax)
  103090:	00 41 0e             	add    %al,0xe(%ecx)
  103093:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103099:	41                   	inc    %ecx
  10309a:	83 03 02             	addl   $0x2,(%ebx)
  10309d:	6f                   	outsl  %ds:(%esi),(%dx)
  10309e:	c3                   	ret    
  10309f:	41                   	inc    %ecx
  1030a0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1030a3:	04 20                	add    $0x20,%al
  1030a5:	00 00                	add    %al,(%eax)
  1030a7:	00 5c 07 00          	add    %bl,0x0(%edi,%eax,1)
  1030ab:	00 cc                	add    %cl,%ah
  1030ad:	df ff                	(bad)  
  1030af:	ff 75 00             	pushl  0x0(%ebp)
  1030b2:	00 00                	add    %al,(%eax)
  1030b4:	00 41 0e             	add    %al,0xe(%ecx)
  1030b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1030bd:	41                   	inc    %ecx
  1030be:	83 03 02             	addl   $0x2,(%ebx)
  1030c1:	6f                   	outsl  %ds:(%esi),(%dx)
  1030c2:	c3                   	ret    
  1030c3:	41                   	inc    %ecx
  1030c4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1030c7:	04 1c                	add    $0x1c,%al
  1030c9:	00 00                	add    %al,(%eax)
  1030cb:	00 80 07 00 00 20    	add    %al,0x20000007(%eax)
  1030d1:	e0 ff                	loopne 1030d2 <asmDoIrq+0x8b6>
  1030d3:	ff                   	(bad)  
  1030d4:	79 01                	jns    1030d7 <asmDoIrq+0x8bb>
  1030d6:	00 00                	add    %al,(%eax)
  1030d8:	00 41 0e             	add    %al,0xe(%ecx)
  1030db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1030e1:	03 75 01             	add    0x1(%ebp),%esi
  1030e4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1030e7:	04 1c                	add    $0x1c,%al
  1030e9:	00 00                	add    %al,(%eax)
  1030eb:	00 a0 07 00 00 7c    	add    %ah,0x7c000007(%eax)
  1030f1:	e1 ff                	loope  1030f2 <asmDoIrq+0x8d6>
  1030f3:	ff 27                	jmp    *(%edi)
  1030f5:	00 00                	add    %al,(%eax)
  1030f7:	00 00                	add    %al,(%eax)
  1030f9:	41                   	inc    %ecx
  1030fa:	0e                   	push   %cs
  1030fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103101:	63 c5                	arpl   %ax,%bp
  103103:	0c 04                	or     $0x4,%al
  103105:	04 00                	add    $0x0,%al
  103107:	00 28                	add    %ch,(%eax)
  103109:	00 00                	add    %al,(%eax)
  10310b:	00 c0                	add    %al,%al
  10310d:	07                   	pop    %es
  10310e:	00 00                	add    %al,(%eax)
  103110:	84 e1                	test   %ah,%cl
  103112:	ff                   	(bad)  
  103113:	ff                   	(bad)  
  103114:	dd 00                	fldl   (%eax)
  103116:	00 00                	add    %al,(%eax)
  103118:	00 41 0e             	add    %al,0xe(%ecx)
  10311b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103121:	46                   	inc    %esi
  103122:	87 03                	xchg   %eax,(%ebx)
  103124:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  103127:	05 02 d0 c3 41       	add    $0x41c3d002,%eax
  10312c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  103130:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  103133:	04 28                	add    $0x28,%al
  103135:	00 00                	add    %al,(%eax)
  103137:	00 ec                	add    %ch,%ah
  103139:	07                   	pop    %es
  10313a:	00 00                	add    %al,(%eax)
  10313c:	38 e2                	cmp    %ah,%dl
  10313e:	ff                   	(bad)  
  10313f:	ff 46 01             	incl   0x1(%esi)
  103142:	00 00                	add    %al,(%eax)
  103144:	00 41 0e             	add    %al,0xe(%ecx)
  103147:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10314d:	42                   	inc    %edx
  10314e:	86 03                	xchg   %al,(%ebx)
  103150:	83 04 03 01          	addl   $0x1,(%ebx,%eax,1)
  103154:	01 0a                	add    %ecx,(%edx)
  103156:	c3                   	ret    
  103157:	41                   	inc    %ecx
  103158:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  10315c:	04 04                	add    $0x4,%al
  10315e:	44                   	inc    %esp
  10315f:	0b 18                	or     (%eax),%ebx
  103161:	00 00                	add    %al,(%eax)
  103163:	00 18                	add    %bl,(%eax)
  103165:	08 00                	or     %al,(%eax)
  103167:	00 54 e3 ff          	add    %dl,-0x1(%ebx,%eiz,8)
  10316b:	ff 07                	incl   (%edi)
  10316d:	00 00                	add    %al,(%eax)
  10316f:	00 00                	add    %al,(%eax)
  103171:	41                   	inc    %ecx
  103172:	0e                   	push   %cs
  103173:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103179:	00 00                	add    %al,(%eax)
  10317b:	00 20                	add    %ah,(%eax)
  10317d:	00 00                	add    %al,(%eax)
  10317f:	00 34 08             	add    %dh,(%eax,%ecx,1)
  103182:	00 00                	add    %al,(%eax)
  103184:	40                   	inc    %eax
  103185:	e3 ff                	jecxz  103186 <asmDoIrq+0x96a>
  103187:	ff 6b 01             	ljmp   *0x1(%ebx)
  10318a:	00 00                	add    %al,(%eax)
  10318c:	00 41 0e             	add    %al,0xe(%ecx)
  10318f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103195:	44                   	inc    %esp
  103196:	83 03 03             	addl   $0x3,(%ebx)
  103199:	63 01                	arpl   %ax,(%ecx)
  10319b:	c5 c3 0c             	(bad)  
  10319e:	04 04                	add    $0x4,%al
  1031a0:	24 00                	and    $0x0,%al
  1031a2:	00 00                	add    %al,(%eax)
  1031a4:	58                   	pop    %eax
  1031a5:	08 00                	or     %al,(%eax)
  1031a7:	00 88 e4 ff ff 30    	add    %cl,0x30ffffe4(%eax)
  1031ad:	00 00                	add    %al,(%eax)
  1031af:	00 00                	add    %al,(%eax)
  1031b1:	41                   	inc    %ecx
  1031b2:	0e                   	push   %cs
  1031b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1031b9:	5f                   	pop    %edi
  1031ba:	0a c5                	or     %ch,%al
  1031bc:	0c 04                	or     $0x4,%al
  1031be:	04 42                	add    $0x42,%al
  1031c0:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  1031c3:	0c 04                	or     $0x4,%al
  1031c5:	04 00                	add    $0x0,%al
  1031c7:	00 24 00             	add    %ah,(%eax,%eax,1)
  1031ca:	00 00                	add    %al,(%eax)
  1031cc:	80 08 00             	orb    $0x0,(%eax)
  1031cf:	00 90 e4 ff ff 30    	add    %dl,0x30ffffe4(%eax)
  1031d5:	00 00                	add    %al,(%eax)
  1031d7:	00 00                	add    %al,(%eax)
  1031d9:	41                   	inc    %ecx
  1031da:	0e                   	push   %cs
  1031db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1031e1:	5f                   	pop    %edi
  1031e2:	0a c5                	or     %ch,%al
  1031e4:	0c 04                	or     $0x4,%al
  1031e6:	04 42                	add    $0x42,%al
  1031e8:	0b 4b c5             	or     -0x3b(%ebx),%ecx
  1031eb:	0c 04                	or     $0x4,%al
  1031ed:	04 00                	add    $0x0,%al
  1031ef:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1031f2:	00 00                	add    %al,(%eax)
  1031f4:	a8 08                	test   $0x8,%al
  1031f6:	00 00                	add    %al,(%eax)
  1031f8:	98                   	cwtl   
  1031f9:	e4 ff                	in     $0xff,%al
  1031fb:	ff 5d 00             	lcall  *0x0(%ebp)
  1031fe:	00 00                	add    %al,(%eax)
  103200:	00 41 0e             	add    %al,0xe(%ecx)
  103203:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103209:	02 59 c5             	add    -0x3b(%ecx),%bl
  10320c:	0c 04                	or     $0x4,%al
  10320e:	04 00                	add    $0x0,%al
  103210:	2c 00                	sub    $0x0,%al
  103212:	00 00                	add    %al,(%eax)
  103214:	c8 08 00 00          	enter  $0x8,$0x0
  103218:	d8 e4                	fsub   %st(4),%st
  10321a:	ff                   	(bad)  
  10321b:	ff 8e 01 00 00 00    	decl   0x1(%esi)
  103221:	41                   	inc    %ecx
  103222:	0e                   	push   %cs
  103223:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103229:	44                   	inc    %esp
  10322a:	87 03                	xchg   %eax,(%ebx)
  10322c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10322f:	05 02 f4 0a c3       	add    $0xc30af402,%eax
  103234:	41                   	inc    %ecx
  103235:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  103239:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10323c:	04 42                	add    $0x42,%al
  10323e:	0b 00                	or     (%eax),%eax
  103240:	28 00                	sub    %al,(%eax)
  103242:	00 00                	add    %al,(%eax)
  103244:	f8                   	clc    
  103245:	08 00                	or     %al,(%eax)
  103247:	00 38                	add    %bh,(%eax)
  103249:	e6 ff                	out    %al,$0xff
  10324b:	ff 18                	lcall  *(%eax)
  10324d:	01 00                	add    %eax,(%eax)
  10324f:	00 00                	add    %al,(%eax)
  103251:	41                   	inc    %ecx
  103252:	0e                   	push   %cs
  103253:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103259:	42                   	inc    %edx
  10325a:	86 03                	xchg   %al,(%ebx)
  10325c:	83 04 02 a7          	addl   $0xffffffa7,(%edx,%eax,1)
  103260:	0a c3                	or     %bl,%al
  103262:	41                   	inc    %ecx
  103263:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  103267:	04 04                	add    $0x4,%al
  103269:	42                   	inc    %edx
  10326a:	0b 00                	or     (%eax),%eax
  10326c:	18 00                	sbb    %al,(%eax)
  10326e:	00 00                	add    %al,(%eax)
  103270:	24 09                	and    $0x9,%al
  103272:	00 00                	add    %al,(%eax)
  103274:	24 e7                	and    $0xe7,%al
  103276:	ff                   	(bad)  
  103277:	ff 5b 00             	lcall  *0x0(%ebx)
  10327a:	00 00                	add    %al,(%eax)
  10327c:	00 02                	add    %al,(%edx)
  10327e:	54                   	push   %esp
  10327f:	0e                   	push   %cs
  103280:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103286:	00 00                	add    %al,(%eax)
  103288:	20 00                	and    %al,(%eax)
  10328a:	00 00                	add    %al,(%eax)
  10328c:	40                   	inc    %eax
  10328d:	09 00                	or     %eax,(%eax)
  10328f:	00 64 e7 ff          	add    %ah,-0x1(%edi,%eiz,8)
  103293:	ff 41 01             	incl   0x1(%ecx)
  103296:	00 00                	add    %al,(%eax)
  103298:	00 41 0e             	add    %al,0xe(%ecx)
  10329b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1032a1:	44                   	inc    %esp
  1032a2:	83 03 03             	addl   $0x3,(%ebx)
  1032a5:	39 01                	cmp    %eax,(%ecx)
  1032a7:	c5 c3 0c             	(bad)  
  1032aa:	04 04                	add    $0x4,%al
  1032ac:	24 00                	and    $0x0,%al
  1032ae:	00 00                	add    %al,(%eax)
  1032b0:	64 09 00             	or     %eax,%fs:(%eax)
  1032b3:	00 84 e8 ff ff 85 00 	add    %al,0x85ffff(%eax,%ebp,8)
  1032ba:	00 00                	add    %al,(%eax)
  1032bc:	00 41 0e             	add    %al,0xe(%ecx)
  1032bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1032c5:	42                   	inc    %edx
  1032c6:	86 03                	xchg   %al,(%ebx)
  1032c8:	83 04 02 7d          	addl   $0x7d,(%edx,%eax,1)
  1032cc:	c3                   	ret    
  1032cd:	41                   	inc    %ecx
  1032ce:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  1032d2:	04 04                	add    $0x4,%al
  1032d4:	2c 00                	sub    $0x0,%al
  1032d6:	00 00                	add    %al,(%eax)
  1032d8:	8c 09                	mov    %cs,(%ecx)
  1032da:	00 00                	add    %al,(%eax)
  1032dc:	e4 e8                	in     $0xe8,%al
  1032de:	ff                   	(bad)  
  1032df:	ff a6 00 00 00 00    	jmp    *0x0(%esi)
  1032e5:	41                   	inc    %ecx
  1032e6:	0e                   	push   %cs
  1032e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1032ed:	46                   	inc    %esi
  1032ee:	87 03                	xchg   %eax,(%ebx)
  1032f0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1032f3:	05 02 6e 0a c3       	add    $0xc30a6e02,%eax
  1032f8:	41                   	inc    %ecx
  1032f9:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1032fd:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  103300:	04 45                	add    $0x45,%al
  103302:	0b 00                	or     (%eax),%eax
  103304:	3c 00                	cmp    $0x0,%al
  103306:	00 00                	add    %al,(%eax)
  103308:	bc 09 00 00 5c       	mov    $0x5c000009,%esp
  10330d:	e9 ff ff 77 01       	jmp    1883311 <_end+0x14fd37d>
  103312:	00 00                	add    %al,(%eax)
  103314:	00 41 0e             	add    %al,0xe(%ecx)
  103317:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10331d:	46                   	inc    %esi
  10331e:	87 03                	xchg   %eax,(%ebx)
  103320:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  103323:	05 73 0a c3 41       	add    $0x41c30a73,%eax
  103328:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  10332c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10332f:	04 41                	add    $0x41,%al
  103331:	0b 02                	or     (%edx),%eax
  103333:	ed                   	in     (%dx),%eax
  103334:	0a c3                	or     %bl,%al
  103336:	41                   	inc    %ecx
  103337:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  10333b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10333e:	04 44                	add    $0x44,%al
  103340:	0b 00                	or     (%eax),%eax
  103342:	00 00                	add    %al,(%eax)
  103344:	3c 00                	cmp    $0x0,%al
  103346:	00 00                	add    %al,(%eax)
  103348:	fc                   	cld    
  103349:	09 00                	or     %eax,(%eax)
  10334b:	00 94 ea ff ff 3d 01 	add    %dl,0x13dffff(%edx,%ebp,8)
  103352:	00 00                	add    %al,(%eax)
  103354:	00 41 0e             	add    %al,0xe(%ecx)
  103357:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10335d:	46                   	inc    %esi
  10335e:	87 03                	xchg   %eax,(%ebx)
  103360:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  103363:	05 02 c8 0a c3       	add    $0xc30ac802,%eax
  103368:	41                   	inc    %ecx
  103369:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  10336d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  103370:	04 44                	add    $0x44,%al
  103372:	0b 58 0a             	or     0xa(%eax),%ebx
  103375:	c3                   	ret    
  103376:	41                   	inc    %ecx
  103377:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  10337b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  10337e:	04 45                	add    $0x45,%al
  103380:	0b 00                	or     (%eax),%eax
  103382:	00 00                	add    %al,(%eax)
  103384:	1c 00                	sbb    $0x0,%al
  103386:	00 00                	add    %al,(%eax)
  103388:	3c 0a                	cmp    $0xa,%al
  10338a:	00 00                	add    %al,(%eax)
  10338c:	94                   	xchg   %eax,%esp
  10338d:	eb ff                	jmp    10338e <asmDoIrq+0xb72>
  10338f:	ff 53 00             	call   *0x0(%ebx)
  103392:	00 00                	add    %al,(%eax)
  103394:	00 69 0e             	add    %ch,0xe(%ecx)
  103397:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  10339d:	67 c5 0c             	lds    (%si),%ecx
  1033a0:	04 04                	add    $0x4,%al
  1033a2:	00 00                	add    %al,(%eax)
  1033a4:	28 00                	sub    %al,(%eax)
  1033a6:	00 00                	add    %al,(%eax)
  1033a8:	5c                   	pop    %esp
  1033a9:	0a 00                	or     (%eax),%al
  1033ab:	00 c8                	add    %cl,%al
  1033ad:	eb ff                	jmp    1033ae <asmDoIrq+0xb92>
  1033af:	ff e2                	jmp    *%edx
  1033b1:	00 00                	add    %al,(%eax)
  1033b3:	00 00                	add    %al,(%eax)
  1033b5:	41                   	inc    %ecx
  1033b6:	0e                   	push   %cs
  1033b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1033bd:	46                   	inc    %esi
  1033be:	87 03                	xchg   %eax,(%ebx)
  1033c0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1033c3:	05 02 d5 c3 41       	add    $0x41c3d502,%eax
  1033c8:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1033cc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1033cf:	04 1c                	add    $0x1c,%al
  1033d1:	00 00                	add    %al,(%eax)
  1033d3:	00 88 0a 00 00 80    	add    %cl,-0x7ffffff6(%eax)
  1033d9:	ec                   	in     (%dx),%al
  1033da:	ff                   	(bad)  
  1033db:	ff 53 00             	call   *0x0(%ebx)
  1033de:	00 00                	add    %al,(%eax)
  1033e0:	00 69 0e             	add    %ch,0xe(%ecx)
  1033e3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1033e9:	67 c5 0c             	lds    (%si),%ecx
  1033ec:	04 04                	add    $0x4,%al
  1033ee:	00 00                	add    %al,(%eax)
  1033f0:	1c 00                	sbb    $0x0,%al
  1033f2:	00 00                	add    %al,(%eax)
  1033f4:	a8 0a                	test   $0xa,%al
  1033f6:	00 00                	add    %al,(%eax)
  1033f8:	b4 ec                	mov    $0xec,%ah
  1033fa:	ff                   	(bad)  
  1033fb:	ff 55 00             	call   *0x0(%ebp)
  1033fe:	00 00                	add    %al,(%eax)
  103400:	00 57 0e             	add    %dl,0xe(%edi)
  103403:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103409:	67 c5 0c             	lds    (%si),%ecx
  10340c:	04 04                	add    $0x4,%al
  10340e:	00 00                	add    %al,(%eax)
  103410:	1c 00                	sbb    $0x0,%al
  103412:	00 00                	add    %al,(%eax)
  103414:	c8 0a 00 00          	enter  $0xa,$0x0
  103418:	ec                   	in     (%dx),%al
  103419:	ec                   	in     (%dx),%al
  10341a:	ff                   	(bad)  
  10341b:	ff 28                	ljmp   *(%eax)
  10341d:	00 00                	add    %al,(%eax)
  10341f:	00 00                	add    %al,(%eax)
  103421:	41                   	inc    %ecx
  103422:	0e                   	push   %cs
  103423:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103429:	64 c5 0c 04          	lds    %fs:(%esp,%eax,1),%ecx
  10342d:	04 00                	add    $0x0,%al
  10342f:	00 28                	add    %ch,(%eax)
  103431:	00 00                	add    %al,(%eax)
  103433:	00 e8                	add    %ch,%al
  103435:	0a 00                	or     (%eax),%al
  103437:	00 f4                	add    %dh,%ah
  103439:	ec                   	in     (%dx),%al
  10343a:	ff                   	(bad)  
  10343b:	ff ab 00 00 00 00    	ljmp   *0x0(%ebx)
  103441:	41                   	inc    %ecx
  103442:	0e                   	push   %cs
  103443:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103449:	42                   	inc    %edx
  10344a:	86 03                	xchg   %al,(%ebx)
  10344c:	83 04 02 79          	addl   $0x79,(%edx,%eax,1)
  103450:	0a c3                	or     %bl,%al
  103452:	41                   	inc    %ecx
  103453:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  103457:	04 04                	add    $0x4,%al
  103459:	44                   	inc    %esp
  10345a:	0b 00                	or     (%eax),%eax
  10345c:	1c 00                	sbb    $0x0,%al
  10345e:	00 00                	add    %al,(%eax)
  103460:	14 0b                	adc    $0xb,%al
  103462:	00 00                	add    %al,(%eax)
  103464:	74 ed                	je     103453 <asmDoIrq+0xc37>
  103466:	ff                   	(bad)  
  103467:	ff 2e                	ljmp   *(%esi)
  103469:	00 00                	add    %al,(%eax)
  10346b:	00 00                	add    %al,(%eax)
  10346d:	41                   	inc    %ecx
  10346e:	0e                   	push   %cs
  10346f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103475:	6a c5                	push   $0xffffffc5
  103477:	0c 04                	or     $0x4,%al
  103479:	04 00                	add    $0x0,%al
  10347b:	00 3c 00             	add    %bh,(%eax,%eax,1)
  10347e:	00 00                	add    %al,(%eax)
  103480:	34 0b                	xor    $0xb,%al
  103482:	00 00                	add    %al,(%eax)
  103484:	84 ed                	test   %ch,%ch
  103486:	ff                   	(bad)  
  103487:	ff                   	(bad)  
  103488:	fc                   	cld    
  103489:	01 00                	add    %eax,(%eax)
  10348b:	00 00                	add    %al,(%eax)
  10348d:	41                   	inc    %ecx
  10348e:	0e                   	push   %cs
  10348f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103495:	46                   	inc    %esi
  103496:	87 03                	xchg   %eax,(%ebx)
  103498:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10349b:	05 03 86 01 0a       	add    $0xa018603,%eax
  1034a0:	c3                   	ret    
  1034a1:	41                   	inc    %ecx
  1034a2:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1034a6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1034a9:	04 42                	add    $0x42,%al
  1034ab:	0b 02                	or     (%edx),%eax
  1034ad:	4f                   	dec    %edi
  1034ae:	0a c3                	or     %bl,%al
  1034b0:	41                   	inc    %ecx
  1034b1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1034b5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1034b8:	04 41                	add    $0x41,%al
  1034ba:	0b 00                	or     (%eax),%eax
  1034bc:	3c 00                	cmp    $0x0,%al
  1034be:	00 00                	add    %al,(%eax)
  1034c0:	74 0b                	je     1034cd <asmDoIrq+0xcb1>
  1034c2:	00 00                	add    %al,(%eax)
  1034c4:	40                   	inc    %eax
  1034c5:	ef                   	out    %eax,(%dx)
  1034c6:	ff                   	(bad)  
  1034c7:	ff ab 02 00 00 00    	ljmp   *0x2(%ebx)
  1034cd:	41                   	inc    %ecx
  1034ce:	0e                   	push   %cs
  1034cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  1034d5:	46                   	inc    %esi
  1034d6:	87 03                	xchg   %eax,(%ebx)
  1034d8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  1034db:	05 02 e8 0a c3       	add    $0xc30ae802,%eax
  1034e0:	41                   	inc    %ecx
  1034e1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1034e5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1034e8:	04 44                	add    $0x44,%al
  1034ea:	0b 03                	or     (%ebx),%eax
  1034ec:	7f 01                	jg     1034ef <asmDoIrq+0xcd3>
  1034ee:	0a c3                	or     %bl,%al
  1034f0:	41                   	inc    %ecx
  1034f1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  1034f5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  1034f8:	04 41                	add    $0x41,%al
  1034fa:	0b 00                	or     (%eax),%eax
  1034fc:	2c 00                	sub    $0x0,%al
  1034fe:	00 00                	add    %al,(%eax)
  103500:	b4 0b                	mov    $0xb,%ah
  103502:	00 00                	add    %al,(%eax)
  103504:	ac                   	lods   %ds:(%esi),%al
  103505:	f1                   	icebp  
  103506:	ff                   	(bad)  
  103507:	ff                   	(bad)  
  103508:	ba 00 00 00 00       	mov    $0x0,%edx
  10350d:	41                   	inc    %ecx
  10350e:	0e                   	push   %cs
  10350f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103515:	46                   	inc    %esi
  103516:	87 03                	xchg   %eax,(%ebx)
  103518:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10351b:	05 02 a9 0a c3       	add    $0xc30aa902,%eax
  103520:	41                   	inc    %ecx
  103521:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  103525:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  103528:	04 41                	add    $0x41,%al
  10352a:	0b 00                	or     (%eax),%eax
  10352c:	1c 00                	sbb    $0x0,%al
  10352e:	00 00                	add    %al,(%eax)
  103530:	e4 0b                	in     $0xb,%al
  103532:	00 00                	add    %al,(%eax)
  103534:	38 f2                	cmp    %dh,%dl
  103536:	ff                   	(bad)  
  103537:	ff 97 00 00 00 00    	call   *0x0(%edi)
  10353d:	41                   	inc    %ecx
  10353e:	0e                   	push   %cs
  10353f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  103545:	46                   	inc    %esi
  103546:	87 03                	xchg   %eax,(%ebx)
  103548:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  10354b:	05                   	.byte 0x5

Disassembly of section .data:

00104560 <buf.1375>:
  104560:	41                   	inc    %ecx
  104561:	73 73                	jae    1045d6 <buf.1375+0x76>
  104563:	65 72 74             	gs jb  1045da <buf.1375+0x7a>
  104566:	69 6f 6e 20 66 61 69 	imul   $0x69616620,0x6e(%edi),%ebp
  10456d:	6c                   	insb   (%dx),%es:(%edi)
  10456e:	65 64 3a 20          	gs cmp %fs:(%eax),%ah
	...

Disassembly of section .bss:

00104660 <__bss_start>:
  104660:	00 00                	add    %al,(%eax)
	...

00104664 <col>:
  104664:	00 00                	add    %al,(%eax)
	...

00104668 <row>:
  104668:	00 00                	add    %al,(%eax)
	...

0010466c <endOfSem>:
  10466c:	00 00                	add    %al,(%eax)
	...

00104670 <data.1016>:
	...

00104678 <data.1103>:
	...

00104680 <endOfPCB>:
  104680:	00 00                	add    %al,(%eax)
	...

00104684 <data.1103>:
	...

0010468c <buf.1360>:
	...

001046c0 <semaphoreTable>:
	...

00104740 <idt>:
	...

00104f40 <gdt>:
	...

00104f80 <tss>:
	...

00105000 <processTable>:
	...

00305d00 <blocked>:
  305d00:	00 00                	add    %al,(%eax)
	...

00305d04 <current>:
  305d04:	00 00                	add    %al,(%eax)
	...

00305d08 <runnable>:
  305d08:	00 00                	add    %al,(%eax)
	...

00305d0c <erunnable>:
  305d0c:	00 00                	add    %al,(%eax)
	...

00305d10 <eblocked>:
	...

00305d20 <blockBitmap>:
  305d20:	00 00                	add    %al,(%eax)
	...

00305d24 <inodeTable>:
  305d24:	00 00                	add    %al,(%eax)
	...

00305d28 <super>:
	...

00305d40 <pathBuf>:
	...

00305d80 <pathBuf2>:
	...

00305dc0 <buf1>:
	...

00305e00 <buf2>:
	...

00305e40 <fcbTable>:
	...

00305f00 <fileNameBuf>:
	...

00305f34 <data>:
	...

00305f40 <disk>:
	...

00385f40 <inodeBitmap>:
	...

00385f60 <fileBuf>:
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

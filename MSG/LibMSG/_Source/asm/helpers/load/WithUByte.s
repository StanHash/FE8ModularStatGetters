.thumb

@ Template paramters: r2 = output register

.equ ByteOffset, EALiterals+0x00
.equ Continue,   EALiterals+0x04

UByte:
	ldr  r3, ByteOffset
	ldrb r2, [r1, r3]
	
	b Continue
	
.ltorg
.align

EALiterals:
	@ WORD offset

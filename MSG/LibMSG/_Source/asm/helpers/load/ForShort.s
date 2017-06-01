.thumb

@ Template paramters: r1 = output register

.equ ShortOffset, EALiterals+0x00
.equ Continue,    EALiterals+0x04

UShort:
	ldr  r3, ShortOffset
	ldrh r1, [r1, r3]
	
	b Continue
	
.ltorg
.align

EALiterals:
	@ WORD offset

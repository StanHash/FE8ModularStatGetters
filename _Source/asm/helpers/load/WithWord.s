.thumb

@ Template paramters: r2 = output register

.equ WordOffset, EALiterals+0x00
.equ Continue,   EALiterals+0x04

Word:
	ldr r3, WordOffset
	ldr r2, [r1, r3]
	
	b Continue
	
.ltorg
.align

EALiterals:
	@ WORD offset

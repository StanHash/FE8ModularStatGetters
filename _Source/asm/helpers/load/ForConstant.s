.thumb

@ Template paramters: r1 = output register

.equ ConstantValue, EALiterals+0x00
.equ Continue,      EALiterals+0x04

Constant:
	ldr r1, ConstantValue
	b Continue
	
.ltorg
.align

EALiterals:
	@ WORD Constant

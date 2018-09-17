.thumb

lpTarget = EALiterals + 0x00

@ 2 word r3-cloberring jump

R3Jump:
	ldr r3, lpTarget
	bx  r3

.ltorg
.align

EALiterals:
	@ POIN Target

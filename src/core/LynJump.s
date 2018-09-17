.thumb

lpTarget = EALiterals + 0x00

@ 4 word non-cloberring jump

LynJump:
	.thumb
	bx pc

	.align

	.arm
	ldr ip, lpTarget
	bx  ip

.ltorg
.align

EALiterals:
	@ POIN Target

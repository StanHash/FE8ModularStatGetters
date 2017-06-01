.thumb

CheckUnitGuardAI:
	mov  r3, #0x41 @ AI4
	ldrb r0, [r1, r3]
	
	mov r3, #0x20 @ Guard I guess
	and r0, r3
	
	bx lr

.ltorg
.align

EALiterals:
	@ none

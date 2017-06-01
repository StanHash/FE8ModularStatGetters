.thumb

CheckUnitState:
	ldr r0, [r1, #0xC]
	and r0, r2
	bx lr

.ltorg
.align

EALiterals:
	@ none

.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ FE8U_CheckUnitAllied, 0x08024D8C

CheckUnitsAllied:
	push {lr}
	
	@ Loading Subject & Argument Allegiences
	ldrb r0, [r1, #0x0B]
	ldrb r1, [r2, #0x0B]
	
	@ Calling Vanilla Routine (for compat with other hacks, like Tera's allegience rework)
	_blh FE8U_CheckUnitAllied
	
	@ End
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ notin

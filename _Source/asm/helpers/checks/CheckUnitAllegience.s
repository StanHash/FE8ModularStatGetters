.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ FE8U_CheckUnitSameAllegience, 0x08024DA4

CheckUnitsAllegience:
	push {lr}
	
	@ Loading Subject Allegience & Argument
	ldrb r0, [r1, #0x0B]
	mov  r1, r2
	
	@ Calling Vanilla Routine (for compat with other hacks, like Tera's allegience rework)
	_blh FE8U_CheckUnitSameAllegience
	
	@ End
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ notin

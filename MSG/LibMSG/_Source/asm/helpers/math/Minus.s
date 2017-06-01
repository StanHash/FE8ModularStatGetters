.thumb

.equ Continue, EALiterals+0x00

Minus:
	push {lr}
	
	@ Calling Next
	bl Continue
	
	neg r0, r0
	
	@ End
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

.thumb

.equ Continue, EALiterals+0x00

Sub:
	push {r4, lr}
	
	@ Storing current stat
	mov r4, r0
	
	@ Calling Next
	bl Continue
	
	@ Operation
	sub r0, r4, r0
	
	@ End
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

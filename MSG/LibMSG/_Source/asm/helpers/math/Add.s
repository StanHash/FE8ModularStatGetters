.thumb

.equ Continue, EALiterals+0x00

Add:
	push {r4, lr}
	
	@ Storing current stat
	mov r4, r0
	
	@ Calling Next
	bl Continue
	
	@ Operation
	add r0, r4, r0
	
	@ End
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

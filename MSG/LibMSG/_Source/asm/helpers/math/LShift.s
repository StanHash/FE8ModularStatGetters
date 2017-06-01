.thumb

.equ Continue, EALiterals+0x00

LShift:
	push {r4, lr}
	
	@ Storing current stat
	mov r4, r0
	
	@ Calling Next
	bl Continue
	
	@ Operation
	lsl r4, r0
	mov r0, r4
	
	@ End
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

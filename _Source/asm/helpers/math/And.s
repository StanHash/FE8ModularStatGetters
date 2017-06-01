.thumb

.equ Continue, EALiterals+0x00

And:
	push {r4, lr}
	
	@ Storing current stat
	mov r4, r0
	
	@ Calling Next
	bl Continue
	
	@ Operation
	and r0, r4
	
	@ End
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

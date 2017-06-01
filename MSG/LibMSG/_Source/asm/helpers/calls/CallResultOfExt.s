.thumb

.equ Continue, EALiterals+0x00

CallResultOf:
	push {r4-r5, lr}
	
	@ Storing Parameters
	mov r4, r1
	mov r5, r2
	
	@ Storing Result (Routine Pointer) to r2
	bl Continue
	mov r2, r0
	
	@ Loading Parameters
	mov r0, r4
	mov r1, r5
	
	mov r3, #1
	
	@ lr = (address of label:End, thumb bit set)
	mov lr, r3
	add lr, pc
	
	@ Calling routine
	bx r2
	
End:
	pop {r4-r5}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

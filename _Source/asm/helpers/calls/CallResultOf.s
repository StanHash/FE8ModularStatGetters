.thumb

.equ Continue, EALiterals+0x00

CallResultOf:
	push {r4-r7, lr}
	
	@ Storing Parameters
	mov r5, r0
	mov r6, r1
	mov r7, r2
	
	@ Storing Result (Routine Pointer) to r4
	bl Continue
	mov r4, r0
	
	@ Loading Parameters
	mov r0, r5
	mov r1, r6
	mov r2, r7
	
	mov r3, #1
	
	@ lr = (address of label:End, thumb bit set)
	mov lr, r3
	add lr, pc
	
	@ Calling routine
	bx r4
	
End:
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Continue

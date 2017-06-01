.thumb

.equ RoutinePtr, EALiterals+0x00

CallOther:
	push {r4-r5, lr}
	
	mov r5, #1
	
	@ Storing Routine Pointer to r4
	ldr r4, RoutinePtr
	eor r4, r5 @ default to thumb
	
	@ lr = (address of label:End, thumb bit set)
	mov lr, r5
	add lr, pc
	
	@ Calling routine
	bx r4
	
End:
	pop {r4-r5}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN Routine Ptr

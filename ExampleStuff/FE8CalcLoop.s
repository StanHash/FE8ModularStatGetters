.thumb

@ Size: 18 opcodes
FE8CalcLoop:
	push {r4-r7, lr}

	@ Saving Paramters
	mov r4, r0
	mov r5, r1
	
	@ Loading pointer to start of array
	adr r6, RoutinePointerArray
	
	@ Moving (StartLoop+1) to r7
	mov r7, pc
	add r7, #1
	
StartLoop:
	ldmia r6!, {r3}
	
	@ goto End if end of routine array
	cmp r3, #0
	beq End
	
	@ reverse thumb bit
	mov r0, #1
	eor r3, r0 @ default to thumb
	
	@ Loading parameters
	mov r0, r4
	mov r1, r5
	
	@ Calling Routine
	mov lr, r7
	bx r3
	
End:
	pop {r4-r7}
	
	pop {r0}
	bx r0

.ltorg
.align

RoutinePointerArray:
	@ POIN [routines...]; WORD 0

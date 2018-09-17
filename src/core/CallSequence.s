.thumb

CallSequence:
	push {r4-r7, lr}

	@ Saving parameters
	mov r4, r1
	mov r5, r2

	@ Moving start of routine array
	mov r6, r3

	@ Save Loop to r7 (cf reading pc returns pc+2op)
	adr r7, Loop
	add r7, #1 @ thumb bit

	@ value is r0

Loop:
	ldmia r6!, {r3}

	cmp r3, #0
	beq End

	@ r0 is already current stat value

	@ Loading parameters
	mov r1, r4
	mov r2, r5

	@ call modifier routine, and make it branch back to the start of the loop (cf lr = Loop)
	mov lr, r7
	bx r3

End:
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ nothing

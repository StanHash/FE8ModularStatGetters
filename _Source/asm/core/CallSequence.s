.thumb

SequenceCall:
	push {r4-r7, lr}
	
	@ Saving parameters
	mov r4, r1
	mov r5, r2
	
	@ Moving start of routine array
	mov r6, r3
	
	@ Save StartLoop to r7 (cf reading pc returns pc+2op)
	mov r7, pc
	add r7, #1 @ thumb bit
	
	@ value is r0
	
StartLoop:
	ldmia r6!, {r3}
	
	cmp r3, #0
	beq End
	
	@ Reverse the last bit in routine pointer, so that it defaults to thumb mode
	mov r1, #1
	eor r3, r1
	
	@ r0 is already current stat value
	
	@ Loading parameters
	mov r1, r4
	mov r2, r5
	
	@ call modifier routine, and make it branch back to the start of the loop (cf lr = StartLoop)
	mov lr, r7
	bx r3

End:
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ notin

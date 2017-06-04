.thumb

.equ ConditionRoutine, EALiterals+0x00
.equ Continue,         EALiterals+0x04

ContinueIf:
	push {r4-r6, lr}
	
	@ Preparing thumb bit in lr
	mov r4, #1
	mov lr, r4
	
	@ Loading condition
	ldr r3, ConditionRoutine
	eor r3, r4 @ Default to thumb
	
	@ Storing parameters
	mov r4, r0
	mov r5, r1
	mov r6, r2
	
	@ lr = pc + 2op + 1
	add lr, pc
	
	@ Calling Condition
	bx r3
	
	@ swap r4, r0
	eor r4, r0
	eor r0, r4
	eor r4, r0
	
	@ Z flag set by "eor r4, r0", so equivalents to implicit cmp r4, #0
	beq End
	
	mov r1, r5
	mov r2, r6
	bl Continue
	
End:
	pop {r4-r6}
	
	pop {r3}
	bx r3
	
.ltorg
.align

EALiterals:
	@ POIN Condition Routine
	@ Continue

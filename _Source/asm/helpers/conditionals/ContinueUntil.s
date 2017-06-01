.thumb

.equ ConditionRoutine, EALiterals+0x00
.equ Continue,         EALiterals+0x04

ContinueUntil:
	push {r4-r7, lr}
	
	@ Storing Parameters
	mov r4, r0
	mov r5, r1
	
	mov r7, #1
	
	@ Loading Condition in r6
	ldr r6, ConditionRoutine
	eor r6, r7 @ Default to thumb
	
	@ r7 = pc + 2op + 1 = address of label:Loop
	add r7, pc
	
	b Start
	
Loop:
	@ swap r4, r0
	eor r4, r0
	eor r0, r4
	eor r4, r0
	
	@ Z flag set by "eor r4, r0", so equivalents to implicit cmp r4, #0
	bne End
	
	mov r1, r5
	
	bl Continue
	mov r4, r0
	
Start:
	@ Calling Condition
	mov lr, r7
	bx r6
	
End:
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN Condition Routine
	@ Continue

.thumb

@ Template paramters: r2 = output register

.equ RoutinePtr, EALiterals+0x00
.equ Continue,   EALiterals+0x04

GetResultOfExt:
	push {r4-r6, lr}
	
	@ Loading Routine Pointer
	ldr r3, RoutinePtr
	
	@ Default to thumb
	mov r4, #1
	eor r3, r4
	
	@ Preparing thumb bit in lr
	mov lr, r4
	
	@ Storing Parameters
	mov r4, r0
	mov r5, r1
	mov r6, r2
	
	@ Shifting parameters because External
	mov r0, r1
	mov r1, r2
	
	@ lr = pc + 2op + 1
	add lr, pc
	
	@ Calling routine
	bx r3
	
	@ Storing result in r3
	mov r3, r0
	
	@ Loading Parameters back
	mov r0, r4
	mov r1, r5
	mov r2, r6
	
	@ Storing result in template output register
	mov r2, r3
	
	@ End
	pop {r4-r6}
	
	pop {r3}
	mov lr, r3
	
	b Continue
	
.ltorg
.align

EALiterals:
	@ WORD offset

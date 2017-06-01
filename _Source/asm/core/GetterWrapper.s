.thumb

.equ CallSequencePtr, EALiterals+0x00
.equ RoutineArrayPtr, EALiterals+0x04

GetterWrapper:
	push {lr}
	
	@ Loading Sequence Caller Routine Pointer
	ldr r3, CallSequencePtr
	mov lr, r3
	
	@ Loading Routine Array Pointer
	ldr r3, RoutineArrayPtr
	
	@ Moving Parameters
	mov r2, r1
	mov r1, r0
	
	@ Stat starts at 0
	mov r0, #0
	
	@ I T  B E G I N S
	.short 0xF800
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN Call Sequence Ptr
	@ POIN Routine Array Ptr

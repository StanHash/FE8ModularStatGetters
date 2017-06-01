.thumb

.equ CallSequencePtr, EAliterals+0x00
.equ RoutineArray,    EAliterals+0x04

CallSequenceCall:
	push {lr}
	
	@ Loading Address of Routine in lr
	ldr r3, CallSequencePtr
	mov lr, r3
	
	adr r3, RoutineArray
	
	.short 0xF800
	
	pop {r1}
	bx r1
	
.ltorg
.align

EAliterals:
	@ POIN Call Sequence Ptr
	@ POIN Routine Array

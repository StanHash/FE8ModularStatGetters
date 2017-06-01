.thumb

.equ RoutinePtr, EALiterals+0x00

CallExternal:
	@ Shifting parameters (Subject is r0, Argument is r1)
	mov r0, r1
	mov r1, r2
	
	ldr r3, RoutinePtr
	
	@ Default to thumb
	mov r2, #1
	eor r3, r2
	
	bx r3

.ltorg
.align

EALiterals:
	@ POIN Routine Ptr

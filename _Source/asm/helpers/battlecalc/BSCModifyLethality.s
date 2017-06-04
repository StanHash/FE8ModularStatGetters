.thumb

@ Template Parameter: Stat Offset To Modify: 0x0E 

.equ Continue, EALiterals+0x00

BSCModifyStat:
	push {r4, lr}
	
	@ Moving Value (BSC) for later use
	mov r4, r0
	
	@ Loading Current Stat Value
	mov r0, #0x0E
	ldrh r0, [r4, r0]
	
	@ Subject & Argument are unchanged
	
	bl Continue
	
	@ Storing modified stat back
	mov r1, #0x0E
	strh r0, [r4, r1]
	
	mov r0, r4
	
	@ End
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Next

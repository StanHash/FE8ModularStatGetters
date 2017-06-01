.thumb

@ Template Parameter: Stat Offset To Modify: 0x5E 

.equ Continue, EALiterals+0x00

ModifyBattleCalcStat:
	push {r4, lr}
	
	@ Moving Subject for later use
	mov r4, r0
	
	@ Loading Current Stat
	mov r0, #0x5E
	ldrh r0, [r4, r0]
	
	mov r2, r1 @ Argument is Other Unit
	mov r1, r4 @ Subject is Current Unit
	
	bl Continue
	
	@ Storing modified stat back
	mov r1, #0x5E
	strh r0, [r4, r1]
	
	@ End
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Next

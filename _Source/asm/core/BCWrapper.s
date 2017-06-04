.thumb

.equ Continue, EALiterals+0x00

WrapForBattleCalc:
	push {r4, lr}
	add sp, #-0x0C
	
	mov r4, r0 @ Soring Subject For later use
	
	mov r2, r1 @ Other Unit is Argument
	mov r1, r0 @ Current Unit is Subject
	
	mov r3, #0
	
	str r3, [sp, #0x00]
	str r3, [sp, #0x04]
	str r3, [sp, #0x08]
	
	mov r0, sp @ BattleStat Compound Ptr is Value
	
	@ Loading Attack
		mov r3, #0x5A
		ldrh r3, [r4, r3]
		strh r3, [r0, #0]
	
	@ Loading Defense
		mov r3, #0x5C
		ldrh r3, [r4, r3]
		strh r3, [r0, #0x2]
	
	@ Loading Hit
		mov r3, #0x60
		ldrh r3, [r4, r3]
		strh r3, [r0, #0x4]
	
	@ Loading Avoid
		mov r3, #0x62
		ldrh r3, [r4, r3]
		strh r3, [r0, #0x6]
	
	@ Loading Crit
		mov r3, #0x66
		ldrh r3, [r4, r3]
		strh r3, [r0, #0x8]
	
	@ Loading Dodge
		mov r3, #0x68
		ldrh r3, [r4, r3]
		strh r3, [r0, #0xA]
	
	bl Continue
	
	mov r0, sp
	
	@ Storing Attack
		mov r3, #0x5A
		ldrh r1, [r0, #0]
		strh r1, [r4, r3]
	
	@ Storing Defense
		mov r3, #0x5C
		ldrh r1, [r0, #0x2]
		strh r1, [r4, r3]
	
	@ Storing Hit
		mov r3, #0x60
		ldrh r1, [r0, #0x4]
		strh r1, [r4, r3]
	
	@ Storing Avoid
		mov r3, #0x62
		ldrh r1, [r0, #0x6]
		strh r1, [r4, r3]
	
	@ Storing Crit
		mov r3, #0x66
		ldrh r1, [r0, #0x8]
		strh r1, [r4, r3]
	
	@ Storing Dodge
		mov r3, #0x68
		ldrh r1, [r0, #0xA]
		strh r1, [r4, r3]
	
	@ End
	add sp, #+0x0C
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Next

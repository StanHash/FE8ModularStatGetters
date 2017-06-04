.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ SupportBonusLevel, EALiterals+0x00

.equ FE8U_AddAffinityBonuses, 0x08028550

@ Arguments: r0 = BSC (BattleStatCompound), r1 = Unit (Subject), r2 = Unit (Argument)
AddBSCSupportBonuses:
	push {r4-r5, lr}
	add sp, #-0x08
	
	mov r3, #0
	
	str r3, [sp, #0x00]
	str r3, [sp, #0x04]
	
	@ Storing BSC and Unit 2 Ptr
	mov r4, r0
	mov r5, r2
	
	ldr  r1, [r1, #0x00] @ Unit 1 ROM Struct
	ldrb r1, [r1, #0x09] @ Unit 1 Affinity
	
	cmp r1, #0
	beq SkipUnit1Bonuses
	
	mov r0, sp @ 8 byte buffer
	ldr r2, SupportBonusLevel @ Support Level
	
	_blh FE8U_AddAffinityBonuses
	
SkipUnit1Bonuses:
	ldr  r1, [r5, #0x00] @ Unit 2 ROM Struct
	ldrb r1, [r1, #0x09] @ Unit 2 Affinity
	
	cmp r1, #0
	beq SkipUnit2Bonuses
	
	mov r0, sp @ 8 byte buffer
	ldr r2, SupportBonusLevel @ Support Level
	
	_blh FE8U_AddAffinityBonuses
	
SkipUnit2Bonuses:
	@ r5 not used for second unit anymore
	mov r5, sp
	
	@ Attack
		@ Getting Bonus
		ldrb r1, [r5, #1]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, #0]
		add  r0, r1
		strh r0, [r4, #0]
	
	@ Defense
		@ Getting Bonus
		ldrb r1, [r5, #2]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, #2]
		add  r0, r1
		strh r0, [r4, #2]
	
	@ Hit
		@ Getting Bonus
		ldrb r1, [r5, #3]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, #4]
		add  r0, r1
		strh r0, [r4, #4]
	
	@ Avoid
		@ Getting Bonus
		ldrb r1, [r5, #4]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, #6]
		add  r0, r1
		strh r0, [r4, #6]
	
	@ Crit
		@ Getting Bonus
		ldrb r1, [r5, #5]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, #8]
		add  r0, r1
		strh r0, [r4, #8]
	
	@ Dodge
		@ Getting Bonus
		ldrb r1, [r5, #6]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, #10]
		add  r0, r1
		strh r0, [r4, #10]
	
	add sp, #0x08
	pop {r4-r5}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ WORD SupportBonusLevel

.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ SupportBonusLevel, EALiterals+0x00

.equ FE8U_AddAffinityBonuses, 0x08028550

@ Arguments: r0 = whatever, r1 = Unit (Subject), r2 = Unit (Argument)
BC_AddUnitsSupportBonuses:
	push {r4-r5, lr}
	add sp, #-0x08
	
	mov r0, #0
	
	str r0, [sp, #0x00]
	str r0, [sp, #0x04]
	
	@ Storing Unit Pointers
	mov r5, r1
	mov r4, r2
	
	ldr  r1, [r4, #0x00] @ Unit 1 ROM Struct
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
		mov r3, #0x5A
		
		@ Getting Bonus
		ldrb r1, [r5, #1]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, r3]
		add  r0, r1
		strh r0, [r4, r3]
	
	@ Defense
		mov r3, #0x5C
		
		@ Getting Bonus
		ldrb r1, [r5, #2]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, r3]
		add  r0, r1
		strh r0, [r4, r3]
	
	@ Hit
		mov r3, #0x60
		
		@ Getting Bonus
		ldrb r1, [r5, #3]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, r3]
		add  r0, r1
		strh r0, [r4, r3]
	
	@ Avoid
		mov r3, #0x62
		
		@ Getting Bonus
		ldrb r1, [r5, #4]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, r3]
		add  r0, r1
		strh r0, [r4, r3]
	
	@ Crit
		mov r3, #0x66
		
		@ Getting Bonus
		ldrb r1, [r5, #5]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, r3]
		add  r0, r1
		strh r0, [r4, r3]
	
	@ Dodge
		mov r3, #0x68
		
		@ Getting Bonus
		ldrb r1, [r5, #6]
		asr  r1, #1 @ divide by 2
		
		@ Add & Store Bonus
		ldrh r0, [r4, r3]
		add  r0, r1
		strh r0, [r4, r3]
	
	add sp, #0x08
	pop {r4-r5}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ WORD SupportBonusLevel

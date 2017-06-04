.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ ClearRange,            EALiterals+0x00
.equ AddRangeFromTemplate,  EALiterals+0x04
.equ Continue,              EALiterals+0x08

.equ FE8U_GetUnitStructPtr, 0x08019430

.equ FE8U_MapSizeStruct,    0x0202E4D4
.equ FE8U_RangeMapRows,     0x0202E4E4
.equ FE8U_UnitMapRows,      0x0202E4D8

ForEachUnitInRange:
	push {r4-r7, lr}
	
	@ pushing 0 (to mark the end of the stack allocation)
	add sp, #-0x04
	
	mov r4, #0
	str r4, [sp]
	
	mov r6, r0 @ r6 is current stat
	mov r7, r1 @ r7 is unit ptr
	mov r5, r2 @ r5 is range template ptr
	
	ldr r3, ClearRange
	mov lr, r3
	.short 0xF800
	
	@ r0 = unit x
	mov r0, #0x10
	ldsb r0, [r7, r0]
	
	@ r1 = unit y
	mov r1, #0x11
	ldsb r1, [r7, r1]
	
	@ r2 = range template pointer
	mov r2, r5
	
	ldr r3, AddRangeFromTemplate
	mov lr, r3
	.short 0xF800
	
	ldr r0, =FE8U_MapSizeStruct
	
	@ r5 = yIt
	mov r5, #2
	ldsh r5, [r0, r5]
	
StartYLoop:
	sub r5, #1
	
	cmp r5, #0
	blt EndYLoop @ end y loop
	
	ldr r0, =FE8U_MapSizeStruct
	
	@ r4 = xIt
	mov r4, #0
	ldsh r4, [r0, r4]
	
StartXLoop:
	sub r4, #1
	blt StartYLoop @ end x loop
	
	lsl r1, r5, #2 @ r1 = r5*sizeof(ptr)
	
	ldr r0, =FE8U_RangeMapRows
	ldr r0, [r0] @ pointer to range map rows
	
	add r0, r1
	ldr r0, [r0] @ pointer to current range row
	
	add r0, r4
	ldrb r0, [r0] @ current range byte (0 or 1)
	
	cmp r0, #0
	beq StartXLoop @ not in range
	
	ldr r0, =FE8U_UnitMapRows
	ldr r0, [r0] @ pointer to unit map rows
	
	add r0, r1
	ldr r0, [r0] @ pointer to current unit row
	
	add r0, r4
	ldrb r0, [r0] @ current unit byte (Allegience | unitIndex)
	
	cmp r0, #0
	beq StartXLoop
	
	_blh FE8U_GetUnitStructPtr @ get unit struct ptr
	
	cmp r0, #0
	beq StartXLoop
	
	@ Pushing Unit Struct Pointer
	add sp, #-0x04
	str r0, [sp]

	b StartXLoop
	
EndYLoop:
	@ r0 is current stat
	mov r0, r6
	
LoopUnits:
	ldr r1, [sp]
	add sp, #0x04
	
	cmp r1, #0
	beq End
	
	@ Current Subject is Callee Argument
	mov r2, r7
	
	@ r0 is current stat
	
	bl Continue
	b LoopUnits
	
End:
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN ClearRange
	@ POIN FillRangeFromTemplate
	@ Next

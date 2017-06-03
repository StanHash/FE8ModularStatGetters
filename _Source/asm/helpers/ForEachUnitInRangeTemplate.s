.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ RangeMapFillerRoutine, EALiterals+0x00
.equ RangeTemplateMap,      EALiterals+0x04
.equ Continue,              EALiterals+0x08

.equ FE8U_ClearMap,         0x080197E4
.equ FE8U_GetUnitStructPtr, 0x08019430

.equ FE8U_MapSizeStruct,    0x0202E4D4
.equ FE8U_RangeMapRows,     0x0202E4E4
.equ FE8U_UnitMapRows,      0x0202E4D8

ForEachUnitInRange:
	push {r4-r7, lr}
	
	mov r6, r0 @ r6 is current stat
	mov r7, r1 @ r7 is unit ptr
	
	bl ClearRangeMap
	
	@ r0 = unit x
	mov r0, #0x10
	ldsb r0, [r7, r0]
	
	@ r1 = unit y
	mov r1, #0x11
	ldsb r1, [r7, r1]
	
	ldr r2, RangeTemplateMap
	
	ldr r3, RangeMapFillerRoutine
	mov lr, r3
	.short 0xF800
	
	ldr r0, =FE8U_MapSizeStruct
	
	@ r5 = yIt
	mov r5, #2
	ldsh r5, [r0, r5]
	
StartYLoop:
	sub r5, #1
	
	cmp r5, #0
	blt End @ end y loop
	
	ldr r0, =FE8U_MapSizeStruct
	
	@ r4 = xIt
	mov r4, #0
	ldsh r4, [r0, r4]
	
StartXLoop:
	sub r4, #1
	
	cmp r4, #0
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
	
	mov r1, r0 @ subject = other unit
	mov r2, r7 @ argument = original unit
	mov r0, r6 @ current stat
	
	bl Continue
	
	mov r6, r0 @ store modified stat
	
	b StartXLoop
	
End:
	mov r0, r6
	
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg

ClearRangeMap:
	push {lr}
	
	ldr r0, =FE8U_RangeMapRows @ pointer to range map rows
	ldr r0, [r0]
	
	mov r1, #0 @ Clear with 0
	
	_blh FE8U_ClearMap
	
	pop {pc}

.ltorg
.align

EALiterals:
	@ POIN RangeMapFillerRoutine
	@ POIN RangeTemplateMap
	@ Next

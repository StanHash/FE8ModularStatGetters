.thumb

.equ FE8U_Memcopy,       0x080D1C0C

.equ FE8U_MapSizeStruct, 0x0202E4D4
.equ FE8U_RangeMapRows,  0x0202E4E4

@ Arguments: r0 = x, r1 = y, r2 = min, r3 = max
AddRangeFromPlusRange:
	push {lr}
	
	@ LOL TODO
	
	pop {r1}
	bx r1

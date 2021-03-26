TreeMons:
	dw TreeMons1 ;0
	dw TreeMons1 ;1
	dw TreeMons2 ;2
	dw TreeMons3 ;3
	dw TreeMons4 ;4
	dw TreeMons5 ;5
	dw TreeMons6 ;6
	dw TreeMons7 ;7
	dw TreeMons8 ;8
	dw TreeMons9 ;9
	dw TreeMons10 ;10
	dw TreeMons11 ;11
	dw TreeMons12 ;12
	dw TreeMons13 ;13
	dw TreeMons14 ;14 
	dw TreeMons15 ;15
	dw RockMons ;16
	dw TreeMons1

; Two tables each (normal, rare).
; Structure:
;	db  %, species, level

TreeMons1:
	db 50, PIDGEY,     10
	db 15, PIDGEY,     10
	db 15, PIDGEY,     10
	db 10, PINECO,     10
	db  5, MEOWTH,     10
	db  5, AIPOM,      10
	db -1
	; rare
	db 50, PIDGEY,     10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, PINECO,     10
	db  5, MEOWTH,     10
	db  5, AIPOM,      10
	db -1

TreeMons2:
	db 50, PIDGEY,     10
	db 15, EKANS,      10
	db 15, EKANS,      10
	db 10, PINECO,     10
	db  5, MEOWTH,     10
	db  5, AIPOM,      10
	db -1
	; rare
	db 50, PIDGEY,     10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, PINECO,     10
	db  5, MEOWTH,     10
	db  5, AIPOM,      10
	db -1

TreeMons3:
	db 50, HOOTHOOT,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, EXEGGCUTE,  10
	db  5, PINECO,     10
	db  5, EXEGGCUTE,  10
	db -1
	; rare
	db 40, MURKROW,    10
	db 20, PINECO,     10
	db 20, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, PINECO,     10
	db  5, EXEGGCUTE,  10
	db -1

TreeMons4:
	db 50, HOOTHOOT,   10
	db 15, EKANS,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, PINECO,     10
	db  5, EXEGGCUTE,  10
	db -1
	; rare
	db 40, MURKROW,    10
	db 20, PINECO,     10
	db 20, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, PINECO,     10
	db  5, AIPOM,      10
	db -1

TreeMons5:
	db 50, HOOTHOOT,   10
	db 15, VENONAT,    10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, PINECO,     10
	db  5, EXEGGCUTE,  10
	db -1
	; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, PINECO,     10
	db  5, AIPOM,      10
	db -1

TreeMons6:
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, HOOTHOOT,   10
	db  5, METAPOD,    10
	db  5, KAKUNA,     10
	db -1
	; rare
	db 50, HOOTHOOT,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, HOOTHOOT,   10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1

TreeMons7:
	db 50, PIDGEOTTO,  32
	db 15, PIDGEY,     32
	db 15, MURKROW,    32
	db 10, PINECO,     32
	db  5, MEOWTH,     32
	db  5, AIPOM,      32
	db -1
	; rare
	db 50, PIDGEY,     32
	db 15, HERACROSS,  32
	db 15, HERACROSS,  32
	db 10, AIPOM,      32
	db  5, PERSIAN,    32
	db  5, FORRETRESS, 32
	db -1

TreeMons8:
	db 50, HOOTHOOT,   23
	db 15, VENONAT,    23
	db 15, HOOTHOOT,   23
	db 10, EXEGGCUTE,  23
	db  5, PINECO,     23
	db  5, EXEGGCUTE,  23
	db -1
	; rare
	db 50, NOCTOWL,    23
	db 15, PINECO,     23
	db 15, PINECO,     23
	db 10, HERACROSS,  23
	db  5, AIPOM,      23
	db  5, AIPOM,      23
	db -1

TreeMons9:
	db 50, PIDGEY,     16
	db 15, EKANS,      16
	db 15, EKANS,      16
	db 10, PINECO,     16
	db  5, MEOWTH,     16
	db  5, AIPOM,      16
	db -1
	; rare
	db 50, PIDGEOTTO,  16
	db 15, HERACROSS,  16
	db 15, HERACROSS,  16
	db 10, PINECO,     16
	db  5, MEOWTH,     16
	db  5, AIPOM,      16
	db -1

TreeMons10:
	db 50, HOOTHOOT,   16
	db 15, SPINARAK,   16
	db 15, LEDYBA,     16
	db 10, EXEGGCUTE,  16
	db  5, PINECO,     16
	db  5, EXEGGCUTE,  16
	db -1
	; rare
	db 40, MURKROW,    16
	db 20, PINECO,     16
	db 20, PINECO,     16
	db 10, EXEGGCUTE,  16
	db  5, ARIADOS,    16
	db  5, LEDIAN,     16
	db -1

TreeMons11:
	db 50, HOOTHOOT,   38
	db 15, EKANS,      38
	db 15, NOCTOWL,    38
	db 10, EXEGGCUTE,  38
	db  5, PINECO,     38
	db  5, EXEGGCUTE,  38
	db -1
	; rare
	db 40, MURKROW,    38
	db 20, PINECO,     38
	db 20, NOCTOWL,    38
	db 10, AIPOM,      38
	db  5, FORRETRESS, 38
	db  5, ARBOK,      38
	db -1

TreeMons12:
	db 50, PIDGEOTTO,  69
	db 15, MEOWTH,     69
	db 15, AIPOM,      69
	db 10, PINECO,     69
	db  5, PERSIAN,    69
	db  5, PIDGEOT,    69
	db -1
	; rare
	db 50, NOCTOWL,    69
	db 15, HERACROSS,  69
	db 15, HERACROSS,  69
	db 10, AIPOM,      69
	db  5, PERSIAN,    69
	db  5, FORRETRESS, 69
	db -1

TreeMons13:
	db 50, PIDGEY,     23
	db 15, PIDGEOTTO,  23
	db 15, PIDGEOTTO,  23
	db 10, PINECO,     23
	db  5, MEOWTH,     23
	db  5, AIPOM,      23
	db -1
	; rare
	db 50, PIDGEOTTO,  23
	db 15, HERACROSS,  23
	db 15, HERACROSS,  23
	db 10, AIPOM,      23
	db  5, MEOWTH,     23
	db  5, PINECO,     23
	db -1
	
TreeMons14:
	db 50, NOCTOWL,    23
	db 15, PINECO,     23
	db 15, PINECO,     23
	db 10, HOOTHOOT,   23
	db  5, BUTTERFREE, 23
	db  5, BEEDRILL,   23
	db -1
	; rare
	db 50, HOOTHOOT,   23
	db 15, METAPOD,    23
	db 15, KAKUNA,     23
	db 10, NOCTOWL,    23
	db  5, BUTTERFREE, 23
	db  5, BEEDRILL,   23
	db -1	
	
TreeMons15:	
	db 50, HOOTHOOT,   20
	db 15, SPINARAK,   20
	db 15, LEDYBA,     20
	db 10, NOCTOWL,    20
	db  5, PINECO,     20
	db  5, EXEGGCUTE,  20
	db -1
	; rare
	db 40, MURKROW,    20
	db 20, PINECO,     20
	db 20, PINECO,     20
	db 10, EXEGGCUTE,  20
	db  5, ARIADOS,    20
	db  5, LEDIAN,     20
	db -1

RockMons:
	db 65, KRABBY,     15
	db 25, GEODUDE,    15
	db 10, SHUCKLE,	   15
	db -1

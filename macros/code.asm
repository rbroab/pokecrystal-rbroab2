; Syntactic sugar macros

lb: MACRO ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 | ((\3) & $ff)
ENDM

ln: MACRO ; r, hi, lo
	ld \1, ((\2) & $f) << 4 | ((\3) & $f)
ENDM


maskbits: MACRO
; masks just enough bits to cover the first argument
; the second argument is an optional shift amount
; e.g. "maskbits 26" becomes "and %00011111" (since 26 - 1 = %00011001)
; and "maskbits 3, 2" becomes "and %00001100" (since "maskbits 3" becomes %00000011)
; example usage in rejection sampling:
; .loop
; 	call Random
; 	maskbits 26
; 	cp 26
; 	jr nc, .loop
x = 1
rept 8
if x + 1 < (\1)
x = x << 1 | 1
endc
endr
if _NARG == 2
	and x << (\2)
else
	and x
endc
ENDM



ldpixel: MACRO
if _NARG >= 5
	lb \1, \2 * 8 + \4, \3 * 8 + \5
else
	lb \1, \2 * 8, \3 * 8
endc
ENDM

depixel EQUS "ldpixel de,"
bcpixel EQUS "ldpixel bc,"


; Design patterns

jumptable: MACRO
	ld a, [\2]
	ld e, a
	ld d, 0
	ld hl, \1
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
ENDM

eventflagset   EQUS "flagset EventFlags,"
eventflagreset EQUS "flagreset EventFlags,"
eventflagcheck EQUS "flagcheck EventFlags,"

flagset: MACRO
	ld hl, \1 + (\2 >> 3)
	set (\2 & $7), [hl]
ENDM

flagreset: MACRO
	ld hl, \1 + (\2 >> 3)
	res (\2 & $7), [hl]
ENDM

flagcheck: MACRO
	ld hl, \1 + (\2 >> 3)
	bit (\2 & $7), [hl]
ENDM

changebridgeblock: macro
	; lb de, \1 + 4, \2 + 4
	; call GetBlockLocation
	ld hl, OverworldMap + (\2 / 2 + 3) * (\4_WIDTH + 6) + \1 / 2 + 3
	; hard-coding the above calculation for efficiency
	ld [hl], \3
ENDM

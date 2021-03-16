ClearSprites::
; Erase OAM data
	ld hl, Sprites;ld hl, wVirtualOAM
	ld b, SpritesEnd - Sprites;ld b, wVirtualOAMEnd - wVirtualOAM
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

HideSprites::
; Set all OAM y-positions to 160 to hide them offscreen
	ld hl, Sprites;ld hl, wVirtualOAM
	ld de, 4 ; length of an OAM struct
	ld b, (SpritesEnd - Sprites) / 4 ; number of OAM structs;ld b, (wVirtualOAMEnd - wVirtualOAM) / 4 ; number of OAM structs
	ld a, 160 ; y
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret

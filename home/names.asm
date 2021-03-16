NamesPointers::
	dba PokemonNames
	dba MoveNames
	dba ApricornNames
	dba ItemNames
	dbw 0, PartyMonOT
	dbw 0, OTPartyMonOT
	dba TrainerClassNames


GetName::
; Return name wCurSpecies from name list wNamedObjectTypeBuffer in wStringBuffer1.
	ldh a, [hROMBank]
	push hl
	push de
	push bc
	push af

	ld a, [wNamedObjectTypeBuffer]
	cp PKMN_NAME
	jr nz, .NotPokeName

	ld a, [CurSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, PKMN_NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .done

.NotPokeName:
	dec a
	ld e, a
	ld d, 0
	ld hl, NamesPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [CurSpecies]
	dec a
	call GetNthString
	ld de, StringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes

.done
	pop af
	pop bc
	pop de
	pop hl
	rst Bankswitch
	ret

GetNthString::
; Return the address of the
; ath string starting from hl.
	and a
	ret z

	push bc
	ld b, a
.readChar
	ld a, [hli]
	cp "@"
	jr nz, .readChar
	dec b
	jr nz, .readChar
	pop bc
	ret

GetBasePokemonName::
; Discards gender (Nidoran).
	push hl
	call GetPokemonName

	ld hl, StringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .quit
	cp "♂"
	jr z, .end
	cp "♀"
	jr z, .end
	inc hl
	jr .loop
.end
	ld [hl], "@"
.quit
	pop hl
	ret

GetPokemonName::
	ld de, StringBuffer1
_GetPokemonName::
; Get Pokemon name wNamedObjectIndexBuffer.
	ldh a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	push de
	rst Bankswitch

; Each name is ten characters
	ld a, [wNamedObjectIndexBuffer]
	dec a
	ld d, 0
	ld e, a
	ld h, 0
	ld l, a
	add hl, hl ; hl = hl * 4
	add hl, hl ; hl = hl * 4
	add hl, de ; hl = (hl*4) + de
	add hl, hl ; hl = (5*hl) + (5*hl)
	ld de, PokemonNames
	add hl, de

; Terminator
	pop de
	push de
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld h, d
	ld l, e
	ld [hl], "@"
	pop de

	pop hl
	pop af
	rst Bankswitch
	ret

GetCurItemName::
; Get item name from item in CurItem
	ld a, [CurItem]
	ld [wNamedObjectIndexBuffer], a
GetItemName::
; Get item name wNamedObjectIndexBuffer.
	push hl
	push bc
	ld a, [wNamedObjectIndexBuffer]
	ld [CurSpecies], a
	ld a, ITEM_NAME
	jr PutNameInBufferAndGetName

GetCurKeyItemName::
; Get item name from item in CurItem
	ld a, [CurItem]
	inc a
	ld [wNamedObjectIndexBuffer], a
GetKeyItemName::
; Get key item item name wNamedObjectIndexBuffer.
	push hl
	push bc
	ld a, [wNamedObjectIndexBuffer]
	ld [CurSpecies], a
	ld a, KEY_ITEM_NAME
	jr PutNameInBufferAndGetName

GetApricornName::
; Get apricorn name wNamedObjectIndexBuffer.
	push hl
	push bc
	ld a, [wNamedObjectIndexBuffer]
	ld [CurSpecies], a
	ld a, APRICORN_NAME
PutNameInBufferAndGetName::
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	pop bc
	pop hl
	ret

GetTMHMName::
	homecall _GetTMHMName
	ret

GetMoveName::
	push hl

	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a

	ld a, [wNamedObjectIndexBuffer] ; move id
	ld [CurSpecies], a

	call GetName
	ld de, StringBuffer1

	pop hl
	ret

IsHMMove:: ; 34e7
	ld hl, .HMMoves
	ld de, 1
	jp IsInArray

.HMMoves:
;	db CUT
;	db FLY
	db SURF
;	db STRENGTH
	db WATERFALL
;	db WHIRLPOOL
	db -1
; 34f8

ItemIsMail:: ; b9e76
	ld a, d
	cp FLOWER_MAIL
	ccf
	ret
; b9e80
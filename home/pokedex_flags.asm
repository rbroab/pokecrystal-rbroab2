;CountSetBits::
;; Count the number of set bits in b bytes starting from hl.
;; Return in a, c and [wd265].
;
;	ld c, 0
;.next
;	ld a, [hli]
;	ld e, a
;	ld d, 8
;
;.count
;	srl e
;	ld a, c
;	adc 0
;	ld c, a
;	dec d
;	jr nz, .count
;
;	dec b
;	jr nz, .next
;
;	ld a, c
;	ld [wd265], a
;	ret
;
;GetWeekday::
;	ld a, [CurDay]
;.mod
;	sub 7
;	jr nc, .mod
;	add 7
;	ret

SetSeenAndCaughtMon::
	push af
	ld c, a
	ld hl, PokedexCaught
	ld b, SET_FLAG
	call PokedexFlagAction
	pop af
	; fallthrough

SetSeenMon::
	ld c, a
	ld hl, PokedexSeen
	ld b, SET_FLAG
	jr PokedexFlagAction

CheckCaughtMon::
	ld c, a
	ld hl, PokedexCaught
	ld b, CHECK_FLAG
	jr PokedexFlagAction

CheckSeenMon::
	ld c, a
	ld hl, PokedexSeen
	ld b, CHECK_FLAG
	; fallthrough

PokedexFlagAction::
	ld d, 0
	predef FlagPredef
	ld a, c
	and a
	ret

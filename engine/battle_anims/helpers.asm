ReinitBattleAnimFrameset: ; ce7bf (33:67bf)
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], -1
	ret

GetBattleAnimFrame: ; ce7d1
.loop
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_frame
	dec [hl]
	call .GetPointer
	ld a, [hli]
	push af
	jr .okay

.next_frame
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	inc [hl]
	call .GetPointer
	ld a, [hli]
	cp -2
	jr z, .restart
	cp -1
	jr z, .repeat_last
	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	pop hl

.okay
	ld a, [hl]
	and $c0
	srl a
	ld [wBattleAnimTemp7], a
	pop af
	ret

.repeat_last
	xor a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	dec [hl]
	dec [hl]
	jr .loop

.restart
	xor a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	dec a
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], a
	jr .loop

; ce823

.GetPointer: ; ce823
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, BattleAnimFrameData
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ret

; ce83c

GetBattleAnimOAMPointer: ; ce83c
	ld l, a
	ld h, 0
	ld de, BattleAnimOAMData
	add hl, hl
	add hl, hl
	add hl, de
	ret

; ce846

LoadBattleAnimObj: ; ce846 (33:6846)
    push hl
    cp ANIM_GFX_POKE_BALL
    call z, .LoadBallPalette
    ld l, a
    ld h, 0
    add hl, hl
    add hl, hl
    ld de, AnimObjGFX
    add hl, de
    ld c, [hl]
    inc hl
.got_ball
    ld b, [hl]
    ld a, b
    and a ; bank 0 means it's a poke ball
    jr z, .ball
    inc hl
    ld a, [hli]
    ld h, [hl]
    ld l, a
    pop de
    push bc
    call DecompressRequest2bpp
    pop bc
    ret

.ball
	ldh a, [rSVBK]
	push af

	; which ball?
	ld a, BANK(CurItem)
	ldh [rSVBK], a
	ld a, [CurItem]
	ld e, a
	ld d, 0
	; get the palette
	push bc
	push de
	ld a, BANK(UnknOBPals)
	ldh [rSVBK], a
	ld hl, CaughtBallPals
rept 4
	add hl, de
endr
	ld de, UnknOBPals palette PAL_BATTLE_OB_RED + 2 ; see GetBallAnimPal
	ld bc, 4
	ld a, BANK(CaughtBallPals)
	call FarCopyBytes
	ld b, 2
	call SafeCopyTilemapAtOnce
	pop de
	pop bc
	pop af
	ldh [rSVBK], a
	; get the gfx pointer
	ld hl, .ball_gfx
	add hl, de
	add hl, de
	add hl, de
	jr .got_ball

.ball_gfx:
	dba AnimObjParkBallGFX
	dba AnimObjPokeBallGFX
	dba AnimObjGreatBallGFX
	dba AnimObjUltraBallGFX
	dba AnimObjMasterBallGFX
	dba AnimObjSafariBallGFX
	dba AnimObjLevelBallGFX
	dba AnimObjLureBallGFX
	dba AnimObjMoonBallGFX
	dba AnimObjFriendBallGFX
	dba AnimObjFastBallGFX
	dba AnimObjHeavyBallGFX
	dba AnimObjLoveBallGFX
	dba AnimObjParkBallGFX
	dba AnimObjRepeatBallGFX
	dba AnimObjTimerBallGFX
	dba AnimObjNestBallGFX
	dba AnimObjNetBallGFX
	dba AnimObjDiveBallGFX
	dba AnimObjLuxuryBallGFX
	dba AnimObjHealBallGFX
	dba AnimObjQuickBallGFX
	dba AnimObjDuskBallGFX
	dba AnimObjPremierBallGFX
	dba AnimObjCherishBallGFX



.LoadBallPalette:
    ; save the current WRAM bank
    ld a, [rSVBK]
    push af
    ; switch to the WRAM bank of wCurItem so we can read it
    ld a, BANK(CurItem)
    ld [rSVBK], a
    ; store the current item in b
    ld a, [CurItem]
    ld b, a
    ; seek for the BallColors entry matching the current item
    ld hl, BallColors
.loop
    ld a, [hli]
    cp b ; did we find the current ball?
    jr z, .done
    cp -1 ; did we reach the end of the list?
    jr z, .done
rept PAL_COLOR_SIZE * 2
    inc hl ; skip over the two RGB colors to the next entry
endr
    jr .loop
.done
    ; switch to the WRAM bank of OBPals so we can write to it
    ld a, BANK(OBPals)
    ld [rSVBK], a
    ; load the RGB colors into the middle two colors of PAL_BATTLE_OB_RED
    ld de, OBPals palette PAL_BATTLE_OB_RED color 1
rept PAL_COLOR_SIZE * 2 - 1
    ld a, [hli]
    ld [de], a
    inc de
endr
    ld a, [hl]
    ld [de], a
    ; apply the updated colors to the palette RAM
    ld a, $1
    ldh [hCGBPalUpdate], a
    ; restore the previous WRAM bank
    pop af
    ld [rSVBK], a
    ; restore the graphics index to be loaded
    ld a, ANIM_GFX_POKE_BALL
    ret

BallColors:
	db POKE_BALL
		RGB 31, 31, 31
		;RGB 30, 10, 06
		RGB 30, 10, 06
	db GREAT_BALL
		RGB 00, 17, 25
		RGB 30, 10, 06
	db ULTRA_BALL
		RGB 07, 07, 08
		RGB 31, 26, 07
	db MASTER_BALL
		RGB 12, 08, 18
		RGB 28, 02, 16
	db SAFARI_BALL
		RGB 06, 15, 10
		RGB 21, 21, 09
	db LEVEL_BALL
		RGB 31, 27, 04
		RGB 30, 10, 06
	db LURE_BALL
		RGB 00, 19, 21
		RGB 30, 10, 06
	db MOON_BALL
		RGB 00, 21, 23
		RGB 30, 24, 08
	db FRIEND_BALL
		RGB 07, 20, 00
		RGB 30, 10, 06
	db FAST_BALL
		RGB 31, 15, 00
		RGB 31, 25, 08
	db HEAVY_BALL
		RGB 07, 07, 08
		RGB 00, 15, 21
	db LOVE_BALL
		RGB 31, 16, 19
		RGB 31, 25, 26
	db PARK_BALL
		RGB 00, 10, 10
		RGB 14, 20, 05
	db REPEAT_BALL
		RGB 30, 10, 06
		RGB 31, 30, 08
	db TIMER_BALL
		RGB 07, 07, 08
		RGB 30, 10, 06
	db NEST_BALL
		RGB 00, 19, 07
		RGB 30, 26, 12
	db NET_BALL
		RGB 00, 22, 25
		RGB 07, 07, 08
	db DIVE_BALL
		RGB 16, 25, 30
		RGB 06, 13, 22
	db LUXURY_BALL
		RGB 31, 28, 03
		RGB 31, 08, 00
	db HEAL_BALL
		RGB 29, 10, 19
		RGB 10, 17, 24
	db QUICK_BALL
		RGB 00, 16, 24
		RGB 30, 29, 07
	db DUSK_BALL
		RGB 00, 20, 09
		RGB 25, 00, 01
	db PREMIER_BALL
		RGB 31, 31, 31
		;RGB 30, 10, 06
		RGB 19, 09, 07
	db CHERISH_BALL
		RGB 31, 06, 04
		RGB 20, 07, 05
	db -1 ; end	
; ce85e (33:685e)

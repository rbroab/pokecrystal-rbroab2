DisableSpriteUpdates::
	xor a
	ldh [hMapAnims], a
	ld [wSpriteUpdatesEnabled], a
	ld a, [VramState]
	res 0, a
	ld [VramState], a
	ret

EnableSpriteUpdates::
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ldh [hMapAnims], a
	ld a, [VramState]
	set 0, a
	ld [VramState], a
	ret

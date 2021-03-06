INCLUDE "data/maps/spawn_points.asm"

LoadSpawnPoint: ; 1531f
	push hl
	push de
	ld a, [DefaultSpawnpoint]
	cp SPAWN_N_A
	jr z, .done;  .spawn_n_a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, SpawnPoints
	add hl, de
	ld a, [hli]
	ld [MapGroup], a
	ld a, [hli]
	ld [MapNumber], a
	ld a, [hli]
	ld [XCoord], a
	ld a, [hli]
	ld [YCoord], a
;.spawn_n_a
	ld a, [DefaultSpawnpoint]
	; don't spawn on top of Archer
	cp SPAWN_YELLOW_FOREST
	jr nz, .not_yellow_forest
	eventflagcheck EVENT_CLEARED_YELLOW_FOREST
	jr nz, .done
	ld a, 12
	ld [XCoord], a
	jr .done
.not_yellow_forest
	; don't spawn within the area of Misty's date
	cp SPAWN_CERULEAN_CAPE
	jr nz, .done
	eventflagcheck EVENT_CERULEAN_CAPE_BOYFRIEND
	jr nz, .done
	ld a, 14
	ld [YCoord], a
.done
	pop de
	pop hl
	ret
; 15344


IsSpawnPoint: ; 15344
; Checks if the map loaded in de is a spawn point.  Returns carry if it's a spawn point.
	ld hl, SpawnPoints
	ld c, 0
.loop
	ld a, [hl]
	cp SPAWN_N_A
	jr z, .nope
	cp d
	jr nz, .next
	inc hl
	ld a, [hld]
	cp e
	jr z, .yes

.next
	push bc
	ld bc, 4 ; length of a spawn table entry
	add hl, bc
	pop bc
	inc c
	jr .loop

.nope
	and a
	ret

.yes
	scf
	ret
; 15363

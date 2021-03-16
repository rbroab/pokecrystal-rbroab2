LoadSpecialMapOBPalette:
	call GetOvercastIndex
	and a
	jr z, .not_overcast
	ld hl, OvercastOBPalette
	ld a, [TimeOfDayPal]
	and 3
	ld bc, 8 palettes
	call AddNTimes
	ld a, $5
	ld de, UnknOBPals
	ld bc, 8 palettes
	jp FarCopyWRAM

.not_overcast
	ld a, [wTileset]
	cp TILESET_SHAMOUTI_ISLAND
	jr z, .load_bg_tree_palette
	cp TILESET_SAFARI_ZONE
	jr nz, .not_shamouti_or_safari
.load_bg_tree_palette
	ld hl, UnknBGPals palette PAL_BG_GREEN
.load_tree_palette:
	ld de, UnknOBPals palette PAL_OW_TREE
.load_single_palette:
	ld bc, 1 palettes
.load_ob_palettes:
	ld a, $5
	jp FarCopyWRAM

.not_shamouti_or_safari:
	cp TILESET_FARAWAY_ISLAND
	jr nz, .not_faraway
	ld hl, UnknBGPals palette 1 ; grass
	jr .load_tree_palette

.not_faraway:
	ld a, [MapGroup]
	cp GROUP_MURKY_SWAMP
	jr nz, .not_murky_swamp
	ld a, [MapNumber]
	cp MAP_MURKY_SWAMP
	jr z, .load_bg_tree_palette

.not_murky_swamp:
	ld a, [MapGroup]
	cp GROUP_VERMILION_GYM
	jr nz, .not_vermilion_gym
	ld a, [MapNumber]
	cp MAP_VERMILION_GYM
	jr nz, .not_vermilion_gym
	ld hl, VermilionGymOBPalette_Tree
	jr .load_tree_palette

.not_vermilion_gym:
	ld a, [MapGroup]
	cp GROUP_LIGHTNING_ISLAND
	jr nz, .not_lightning_island
	ld a, [MapNumber]
	cp MAP_LIGHTNING_ISLAND
	jr nz, .not_lightning_island
	ld hl, LightningIslandOBPalette_Tree
	jr .load_tree_palette

.not_lightning_island:
	ld a, [MapGroup]
	cp GROUP_ROCK_TUNNEL_2F
	jr nz, .not_rock_tunnel_2f
	ld a, [MapNumber]
	cp MAP_ROCK_TUNNEL_2F
	jr nz, .not_rock_tunnel_2f
	ld hl, RockTunnelOBPalette_Tree
	jr .load_tree_palette

.not_rock_tunnel_2f:
	ld a, [MapGroup]
	cp GROUP_LYRAS_HOUSE_2F
	jr nz, .not_lyras_house_2f
	ld a, [MapNumber]
	cp MAP_LYRAS_HOUSE_2F
	jr nz, .not_lyras_house_2f
	ld hl, LyrasHouse2FOBPalette_Rock
	jr .load_rock_palette

.not_lyras_house_2f:
	ld a, [MapGroup]
	cp GROUP_GOLDENROD_POKECOM_CENTER_1F ; GROUP_GOLDENROD_POKECOM_CENTER_OFFICE, GROUP_GOLDENROD_MUSEUM_1F, GROUP_GOLDENROD_MUSEUM_2F
	jr nz, .not_goldenrod
	ld a, [MapNumber]
	cp MAP_GOLDENROD_POKECOM_CENTER_1F
	jr nz, .not_pokecom_center_1f
	ld hl, PokecomCenter1FOBPalette_Rock
	jr .load_rock_palette
.not_pokecom_center_1f
	cp MAP_GOLDENROD_POKECOM_CENTER_OFFICE
	jr nz, .not_pokecom_center_office
	ld hl, PokecomCenterOfficeOBPalette_Purple
	ld de, UnknOBPals palette PAL_OW_PURPLE
	jp .load_single_palette
.not_pokecom_center_office
	ld a, [wTileset]
	cp TILESET_MUSEUM
	jr nz, .not_goldenrod
	ld hl, GoldenrodMuseumOBPalettes_TreeRock
	ld de, UnknOBPals palette PAL_OW_TREE
	ld bc, 2 palettes
	jp .load_ob_palettes

.not_goldenrod
	ld a, [MapGroup]
	cp GROUP_MOUNT_MOON_SQUARE
	jr nz, .not_mount_moon_square
	ld a, [MapNumber]
	cp MAP_MOUNT_MOON_SQUARE
	jr nz, .not_mount_moon_square
	ld hl, UnknBGPals palette PAL_BG_GRAY
	jr .load_rock_palette

.not_mount_moon_square:
	ld a, [MapGroup]
	cp GROUP_MAGNET_TUNNEL_INSIDE
	jr nz, .not_magnet_tunnel
	ld a, [MapNumber]
	cp MAP_MAGNET_TUNNEL_INSIDE
	jr nz, .not_magnet_tunnel
	ld hl, UnknBGPals palette PAL_BG_GRAY
	jr .load_rock_palette

.not_magnet_tunnel
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp CINNABAR_VOLCANO
	jr z, .load_bg_rock_palette
	cp DIM_CAVE
	jr z, .load_bg_rock_palette
	cp ICE_PATH
	jr z, .load_bg_rock_palette
	cp SEAFOAM_ISLANDS
	jr z, .load_bg_rock_palette
	cp WHIRL_ISLANDS
	ret z
.load_bg_rock_palette
	ld hl, UnknBGPals palette PAL_BG_BROWN
.load_rock_palette
	ld de, UnknOBPals palette PAL_OW_ROCK
	jp .load_single_palette
	
;.darkness
;	call LoadDarknessPalette
;	scf
;	ret	
	
;LoadDarknessPalette:
;	ld a, BANK(BGPals)
;	ld de, BGPals
;	ld hl, DarknessPalette
;	ld bc, 8 palettes
;	call FarCopyWRAM
;	ret
;
;DarknessPalette:
;INCLUDE "gfx/tilesets/darkness.pal"	

VermilionGymOBPalette_Tree:
if !DEF(MONOCHROME)
	RGB 27, 31, 27
	RGB 31, 31, 30
	RGB 19, 24, 31
	RGB 05, 10, 27
else
	MONOCHROME_RGB_FOUR_OW
endc

GoldenrodMuseumOBPalettes_TreeRock:
if !DEF(MONOCHROME)
	RGB 30, 28, 26
	RGB 30, 28, 26
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 28, 28
	RGB 22, 27, 26
	RGB 09, 10, 10
else
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_DARK
endc

LightningIslandOBPalette_Tree:
if !DEF(MONOCHROME)
	RGB 19, 15, 10
	RGB 31, 31, 31
	RGB 31, 27, 01
	RGB 31, 16, 01
else
	MONOCHROME_RGB_FOUR_OW
endc

RockTunnelOBPalette_Tree:
if !DEF(MONOCHROME)
	RGB 15, 14, 24
	RGB 31, 30, 31
	RGB 24, 18, 31
	RGB 12, 08, 18
else
	MONOCHROME_RGB_FOUR_OW
endc

LyrasHouse2FOBPalette_Rock:
if !DEF(MONOCHROME)
	RGB 30, 28, 26
	RGB 30, 28, 02
	RGB 08, 14, 24
	RGB 07, 07, 07
else
	MONOCHROME_RGB_FOUR
endc

PokecomCenter1FOBPalette_Rock:
if !DEF(MONOCHROME)
	RGB 30, 28, 26
	RGB 30, 28, 26
	RGB 11, 13, 31
	RGB 07, 07, 07
else
	MONOCHROME_RGB_FOUR
endc

PokecomCenterOfficeOBPalette_Purple:
if !DEF(MONOCHROME)
	RGB 28, 31, 16
	RGB 31, 22, 10
	RGB 07, 17, 21
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR_OW
endc



;LoadSpecialNPCPalette:
;	call GetMapHeaderTimeOfDayNybble
;	bit IN_DARKNESS_F, a
;	jr z, .not_dark
;	ld a, [StatusFlags]
;	bit 2, a
;	jr z, .darkness
;
;.not_dark
;	jr .do_nothing
;
;.darkness
;	call LoadNPCDarknessPalette
;	scf
;	ret
;
;.do_nothing
;	and a
;	ret
;
;LoadNPCDarknessPalette:
;	ld a, BANK(UnknBGPals)
;	ld de, UnknBGPals
;	ld hl, NPCDarknessPalette
;	ld bc, 8 palettes
;	call FarCopyWRAM
;	ret
;;endc


;	dec a ; PAL_FOR_MAP?
;	jr nz, .not_map
;	ld a, [hli]
;	cp b ; [wMapGroup]
;	ld a, [hli]
;	ret nz
;	cp c ; [wMapNumber]
;	ret
;.not_map
;	dec a ; PAL_FOR_LANDMARK?
;	jr nz, .not_landmark
;	ld a, [hli]
;	cp d ; landmark
;	ret
;.not_landmark
;	dec a ; PAL_FOR_TILESET?
;	jr nz, .not_tileset
;	ld a, [hli]
;	cp e ; [wTileset]
;	ret
;.not_tileset
;	dec a ; PAL_FOR_OVERCAST?
;	jr nz, .not_overcast
;	push hl
;	call GetOvercastIndex
;	pop hl
;	; invert z
;	sub 1 ; no-optimize a++|a-- (dec a can't set carry)
;	sbc a ; sets a to 0 if carry was not set, i.e. a != 0
;	ret
;.not_overcast
;	; PAL_FOR_DARKNESS
;	push hl
;	push de
;	call GetMapHeaderTimeOfDayNybble
;	pop de
;	pop hl
;	and IN_DARKNESS_F
;	cp IN_DARKNESS_F
;	ret nz
;	ld a, [StatusFlags]
;	bit 2, a ; Flash
;	ret
;
;
;
;
;NPCDarknessPalette:
;INCLUDE "gfx/overworld/npc_sprites_darkness.pal"


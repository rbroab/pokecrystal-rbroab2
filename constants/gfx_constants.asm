LEN_2BPP_TILE EQU 16
LEN_1BPP_TILE EQU 8
TILES_PER_FRAME EQU 6
TILESIZE EQU $10
TILE_WIDTH EQU 8


NUM_PAL_COLORS EQU 4
PAL_COLOR_SIZE EQU 2
PALETTE_SIZE EQU NUM_PAL_COLORS * PAL_COLOR_SIZE

PALRGB_WHITE EQUS "palred 31 + palgreen 31 + palblue 31" ; $7fff


SCREEN_WIDTH EQU 20
SCREEN_HEIGHT EQU 18
SCREEN_WIDTH_PX EQU SCREEN_WIDTH * 8
SCREEN_HEIGHT_PX EQU SCREEN_HEIGHT * 8

BG_MAP_WIDTH  EQU 32
BG_MAP_HEIGHT EQU 32
WMISC_WIDTH   EQU 6 * 4
WMISC_HEIGHT  EQU 5 * 4

HP_BAR_LENGTH EQU 6
HP_BAR_LENGTH_PX EQU HP_BAR_LENGTH * 8
EXP_BAR_LENGTH EQU 8
EXP_BAR_LENGTH_PX EQU EXP_BAR_LENGTH * 8

; hp palette
HP_GREEN  EQU 0
HP_YELLOW EQU 1
HP_RED    EQU 2

	const_def
	const ANIM_MON_SLOW    ; 0
	const ANIM_MON_NORMAL  ; 1
	const ANIM_MON_MENU    ; 2
	const ANIM_MON_TRADE   ; 3
	const ANIM_MON_EVOLVE  ; 4
	const ANIM_MON_HATCH   ; 5
	const ANIM_MON_UNUSED  ; 6
	const ANIM_MON_EGG1    ; 7
	const ANIM_MON_EGG2    ; 8

	db  70,  90,  70,  110,  90,  70
	;   hp  atk  def  spd  sat  sdf

	db ICE, GHOST
	db 75 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn ALL_FEMALE, 2 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SNOW_CLOAK ; ability 1
if DEF(FAITHFUL)
	db INNER_FOCUS ; ability 2
else
	db CURSED_BODY ; ability 2
endc
	db SNOW_WARNING ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SHADOW_BALL, ROOST, DOUBLE_TEAM, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, LEECH_LIFE, ENDURE, ACROBATICS, POISON_JAB, U_TURN, FLY, DOUBLE_EDGE, SLEEP_TALK, SWAGGER, ZEN_HEADBUTT
	; end

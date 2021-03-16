	db  35,  35,  40,  50,  35,  55
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 255 ; catch rate
	db 74 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CHLOROPHYLL ; ability 1
if DEF(FAITHFUL)
	db INNER_FOCUS ; ability 2
else
	db LEAF_GUARD ; ability 2
endc
	db INFILTRATOR ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn FAERY, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, SOLAR_BEAM, RETURN, DOUBLE_TEAM, REFLECT, SWIFT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, ENERGY_BALL, ENDURE, ACROBATICS, FLASH, CUT, DEFENSE_CURL, HEADBUTT, ICY_WIND, ROLLOUT, SLEEP_TALK
	; end

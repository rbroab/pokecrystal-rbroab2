	db  75,  80,  75,  110,  85,  95
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 45 ; catch rate
	db 176 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
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
	ev_yield   0,   0,   0,   3,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, SOLAR_BEAM, RETURN, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, DAZZLINGLEAM, ENERGY_BALL, ENDURE, ACROBATICS, GIGA_IMPACT, FLASH, CUT, FLY, BODY_SLAM, DEFENSE_CURL, DOUBLE_EDGE, EARTH_POWER, HEADBUTT, ICY_WIND, ROLLOUT, SEED_BOMB, SLEEP_TALK
	; end

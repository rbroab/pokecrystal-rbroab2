	db  40,  90,  70,  85,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 94 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db RUN_AWAY ; ability 1
if DEF(FAITHFUL)
	db INNER_FOCUS ; ability 2
else
	db PICKUP ; ability 2
endc
	db SKILL_LINK ; hidden ability
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, IRON_TAIL, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, REFLECT, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, WILD_CHARGE, REST, ATTRACT, THIEF, ROCK_SMASH, FALSE_SWIPE, ENDURE, DRAIN_PUNCH, ACROBATICS, GIGA_IMPACT, CUT, STRENGTH, BODY_SLAM, DOUBLE_EDGE, FIRE_PUNCH, HEADBUTT, HYPER_VOICE, KNOCK_OFF, SEISMIC_TOSS, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH
	; end

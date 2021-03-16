	db  73,  95,  62,  85,  95,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC
	db 45 ; catch rate
	db 165 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INTIMIDATE ; ability 1
if DEF(FAITHFUL)
	db INNER_FOCUS ; ability 2
else
	db FRISK ; ability 2
endc
	db SAP_SIPPER ; hidden ability
	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, WILD_CHARGE, REST, ATTRACT, THIEF, ROCK_SLIDE, ROCK_SMASH, FOCUS_BLAST, DARK_PULSE, ENDURE, AVALANCHE, GIGA_IMPACT, FLASH, STONE_EDGE, CUT, STRENGTH, BODY_SLAM, DOUBLE_EDGE, DREAM_EATER, EARTH_POWER, HEADBUTT, KNOCK_OFF, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, ZEN_HEADBUTT
	; end

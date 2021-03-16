	db  97,  170,  60,  83,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, DRAGON
	db 45 ; catch rate
	db 199 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 2 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db MOLD_BREAKER ; ability 1
if DEF(FAITHFUL)
	db INNER_FOCUS ; ability 2
else
	db SHEER_FORCE ; ability 2
endc
	db ROCK_HEAD ; hidden ability
	db FAST ; growth rate
	dn MONSTER, MONSTER ; egg groups


	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SHADOW_BALL, ROOST, DOUBLE_TEAM, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, LEECH_LIFE, ENDURE, ACROBATICS, POISON_JAB, U_TURN, FLY, DOUBLE_EDGE, SLEEP_TALK, SWAGGER, ZEN_HEADBUTT
	; end

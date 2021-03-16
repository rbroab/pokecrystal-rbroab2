	db  50,  99,  108,  35,  100,  108
	;   hp  atk  def  spd  sat  sdf

	db GHOST, DARK
	db 100 ; catch rate
	db 168 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDERLESS, 2 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INFILTRATOR ; ability 1
if DEF(FAITHFUL)
	db CURSED_BODY ; ability 2
else
	db SHADOW_TAG ; ability 2
endc
	db INSOMNIA ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SHADOW_BALL, ROOST, DOUBLE_TEAM, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, LEECH_LIFE, ENDURE, ACROBATICS, POISON_JAB, U_TURN, FLY, DOUBLE_EDGE, SLEEP_TALK, SWAGGER, ZEN_HEADBUTT
	; end

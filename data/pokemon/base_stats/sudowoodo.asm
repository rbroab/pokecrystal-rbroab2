if DEF(FAITHFUL)
	db  70, 100, 115,  30,  30,  65
	;   hp  atk  def  spd  sat  sdf
else
	db  75, 110, 120,  30,  30,  95
	;   hp  atk  def  spd  sat  sdf
endc

	db ROCK, GRASS
	db 65 ; catch rate
	db 135 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db STURDY ; ability 1
	db WATER_ABSORB ; ability 2
	db ROCK_HEAD ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SANDSTORM, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, ROCK_SMASH, ENDURE, DRAIN_PUNCH, EXPLOSION, POISON_JAB, AVALANCHE, GIGA_IMPACT, STONE_EDGE, CUT, STRENGTH, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, EARTH_POWER, HEADBUTT, ICE_PUNCH, IRON_HEAD, KNOCK_OFF, ROLLOUT, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH
	; end

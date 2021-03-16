	db  70,  85,  65,  85,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING
	db 45 ; catch rate
	db 183 ; base exp
	db NO_ITEM ; item 1
	db AMULET_COIN ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db PICKUP ; ability 1
if DEF(FAITHFUL)
	db INNER_FOCUS ; ability 2
else
	db HUSTLE ; ability 2
endc
	db INSOMNIA ; hidden ability
	db FAST ; growth rate
	dn AVIAN, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, HONE_CLAWS, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, SAFEGUARD, EARTHQUAKE, RETURN, ROOST, REFLECT, SWIFT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, FALSE_SWIPE, ACROBATICS, AVALANCHE, FLY, SURF, BODY_SLAM, DEFENSE_CURL, DOUBLE_EDGE, HEADBUTT, ICE_PUNCH, ICY_WIND, KNOCK_OFF, PAY_DAY, ROLLOUT, SKILL_SWAP, SLEEP_TALK, SWAGGER
	; end

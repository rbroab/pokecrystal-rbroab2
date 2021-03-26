	db  90,  85,  75, 115, 115, 100
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 3 ; catch rate
	db 216 ; base exp
	db MAGNET ; NO_ITEM ; item 1
	db MAGNET ; NO_ITEM ; item 2
	dn GENDERLESS, 15 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db VOLT_ABSORB ; ability 1
if DEF(FAITHFUL)
	db PRESSURE ; ability 2
	db INNER_FOCUS ; hidden ability
else
	db INNER_FOCUS ; ability 2
	db VOLT_ABSORB ; hidden ability
endc
	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLASH_CANNON, SANDSTORM, SWIFT, SUBSTITUTE, FACADE, WILD_CHARGE, REST, ROCK_SMASH, FOCUS_BLAST, ENERGY_BALL, FALSE_SWIPE, DARK_PULSE, ENDURE, GIGA_IMPACT, FLASH, VOLT_SWITCH, THUNDER_WAVE, GYRO_BALL, CUT, STRENGTH, BODY_SLAM, DOUBLE_EDGE, EARTH_POWER, HEADBUTT, IRON_HEAD, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end

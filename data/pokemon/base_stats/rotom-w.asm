	db  50,  65,  107,  91,  115,  107
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, WATER
	db 45 ; catch rate
	db 154 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDERLESS, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db VOLT_ABSORB ; ability 1
	db STATIC ; ability 2
	db INSOMNIA ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   3,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PROTECT, SAFEGUARD, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLASH_CANNON, SWIFT, WILD_CHARGE, REST, THIEF, DAZZLINGLEAM, FOCUS_BLAST, ENERGY_BALL, DARK_PULSE, ENDURE, WILL_O_WISP, EXPLOSION, U_TURN, FLASH, VOLT_SWITCH, THUNDER_WAVE, HYPER_VOICE, ICY_WIND, KNOCK_OFF, SLEEP_TALK, SUCKER_PUNCH, ZAP_CANNON, ZEN_HEADBUTT
	; end

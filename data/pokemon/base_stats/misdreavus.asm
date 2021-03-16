	db  60,  60,  60, 100, 105, 100
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FAIRY
	db 45 ; catch rate
	db 147 ; base exp
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	dn ALL_FEMALE, 4 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db CURSED_BODY ; ability 1
	db INSOMNIA ; ability 2
	db SHADOW_TAG ; hidden ability
	db FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, DAZZLINGLEAM, ENERGY_BALL, DARK_PULSE, ENDURE, WILL_O_WISP, FLASH, THUNDER_WAVE, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, HEADBUTT, HYPER_VOICE, ICY_WIND, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, TRICK, ZAP_CANNON
	; end

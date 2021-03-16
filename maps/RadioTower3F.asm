RadioTower3F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, CardKeyShutterCallback
	callback MAPCALLBACK_NEWMAP, RadioTowerJessieJamesCallback

	db 3 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	db 1 ; coord events
	coord_event 17, 1, 1, RadioTowerJessieJamesScript

	db 3 ; bg events
	bg_event  3,  0, SIGNPOST_JUMPTEXT, UnknownText_0x5ead6
	bg_event  9,  0, SIGNPOST_JUMPTEXT, UnknownText_0x5eae4
	bg_event 14,  2, SIGNPOST_UP, MapRadioTower3FSignpost2Script

	db 9 ; object events
	object_event 16,  6, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_JESSIE
	object_event 17,  6, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_JAMES	
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x5e621, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x5e556, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x5e56a, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, GenericTrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, GenericTrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, GenericTrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_GENERICTRAINER, 5, GenericTrainerRocketScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

	const_def 1
	const RADIOTOWER_JESSIE
	const RADIOTOWER_JAMES

CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	return

.Change:
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	return

RadioTowerJessieJamesCallback:
	disappear RADIOTOWER_JESSIE
	disappear RADIOTOWER_JAMES
	return

RadioTowerJessieJamesScript:
	showemote EMOTE_SHOCK, PLAYER, 20
	special Special_FadeOutMusic
	turnobject PLAYER, DOWN
	appear RADIOTOWER_JESSIE
	appear RADIOTOWER_JAMES
	pause 20
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	applymovement RADIOTOWER_JESSIE, RadioTowerJessieEnterMovementData
	applymovement RADIOTOWER_JAMES, RadioTowerJamesEnterMovementData
	showtext RadioTowerJessieJamesSeenText
	setscene $0
	setevent EVENT_BEAT_JESSIE_AND_JAMES_TOWER
	winlosstext RadioTowerJessieJamesBeatenText, 0
	setlasttalked RADIOTOWER_JESSIE
	loadtrainer JESSIE_JAMES, JESSIE_JAMES3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	showtext RadioTowerJessieJamesAfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear RADIOTOWER_JESSIE
	disappear RADIOTOWER_JAMES
	pause 25
	special Special_FadeInQuickly
;	applymovement RADIOTOWER_JESSIE, RadioTowerJessieLeaveMovementData
;	applymovement RADIOTOWER_JAMES, RadioTowerJamesLeaveMovementData
	playmapmusic	
RadioTowerJessieJamesScript_End:
	end		

RadioTowerJessieEnterMovementData:
	step_up
;	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

RadioTowerJamesEnterMovementData:
	step_up
	step_up
;	step_up
	step_up
	step_up
	step_end

;RadioTowerJessieLeaveMovementData:
;	big_step_down
;	big_step_down
;;	big_step_down
;	big_step_down
;	big_step_down
;	big_step_down
;	step_end

;RadioTowerJamesLeaveMovementData:
;	big_step_down
;	big_step_down
;;	big_step_down
;	big_step_down
;	big_step_down
;	step_end

GymGuyScript_0x5e556:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer UnknownText_0x5e6eb
	jumptextfaceplayer UnknownText_0x5e682

CooltrainerFScript_0x5e56a:
	checkevent EVENT_GOT_HEAT_ROCK_FROM_RADIO_TOWER
	iftrue_jumptextfaceplayer UnknownText_0x5e85c
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5e58a
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue_jumptextfaceplayer UnknownText_0x5e7cb
	thistextfaceplayer

	text "The Team Rocket"
	line "boss has locked"
	cont "himself in."

	para "But the Director"
	line "can open it."

	para "He's up on the"
	line "fifth floor."

	para "Please save him!"
	done

UnknownScript_0x5e58a:
	faceplayer
	opentext
	writetext UnknownText_0x5e7e2
	buttonsound
	verbosegiveitem HEAT_ROCK
	iffalse_endtext
	writetext UnknownText_0x5e821
	waitbutton
	closetext
	setevent EVENT_GOT_HEAT_ROCK_FROM_RADIO_TOWER
	end

RadioTowerJessieJamesSeenText:
	text "Stop right there"
	line "you little brat!"
	
	para "We're finally go-"
	line "ing to end this."
	
	para "You should have"
	line "surrendered when"
	
	para "you had the"
	line "chance!"
	
	para "Prepare to be"
	line "thrashed!"
	done

RadioTowerJessieJamesBeatenText:
	text "Uh oh…"
	
	para "I don't like what"
	line "comes next…"
	done

RadioTowerJessieJamesAfterText:
	text "Looks like Team"
	line "Rocket's blasting"
	cont "off for good!"
	done

GenericTrainerGruntM7:
	generictrainer GRUNTM, 7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText

	text "I failed in my"
	line "duties…"

	para "I'll be docked pay"
	line "for this…"
	done

GenericTrainerGruntM8:
	generictrainer GRUNTM, 8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText

	text "I feel lousy over"
	line "losing!"

	para "Darn it! I hate"
	line "useless #mon!"
	done

GenericTrainerGruntM9:
	generictrainer GRUNTM, 9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText

	text "First the Slowpoke"
	line "Well…"
	
	para "Then our base in"
	line "Mahogany…"
	
	para "And now this?!"
	
	para "You keep making me"
	line "look bad!"
;	text "What?! You made it"
;	line "past our men in"
;	cont "the Underground?"

;	para "How could you?"
;	done

GenericTrainerRocketScientistMarc:
	generictrainer ROCKET_SCIENTIST, MARC, EVENT_BEAT_ROCKET_SCIENTIST_MARC, RocketScientistMarcSeenText, RocketScientistMarcBeatenText

	text "Bwahahaha…"

	para "I can transmit as"
	line "strong a signal as"
	cont "I need from here."
	done

MapRadioTower3FSignpost2Script::
	opentext
	writetext UnknownText_0x5eaa4
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue UnknownScript_0x5e603
	checkitem CARD_KEY
	iftrue UnknownScript_0x5e605
UnknownScript_0x5e603:
	endtext

UnknownScript_0x5e605:
	writetext UnknownText_0x5eabc
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	reloadmappart
	closetext
	waitsfx
	end

UnknownText_0x5e621:
	text "We have recordings"
	line "of the cries of"

	para "all #mon that"
	line "have been found."

	para "We must have about"
	line "200 kinds."
	done

UnknownText_0x5e682:
	text "To trainers, #-"
	line "mon are their"
	cont "beloved partners."

	para "It's terrible how"
	line "Team Rocket is"

	para "trying to control"
	line "#mon."
	done

UnknownText_0x5e6eb:
	text "We run 24 hours a"
	line "day to broadcast"

	para "entertaining pro-"
	line "grams."

	para "I'll do my best to"
	line "run around the"
	cont "clock too!"
	done

UnknownText_0x5e7cb:
	text "Is the Director"
	line "safe?"
	done

UnknownText_0x5e7e2:
	text "Thank you!"
	line "You're my hero!"

	para "This is a token of"
	line "my appreciation."
	done

UnknownText_0x5e821:
	text "It's a Heat Rock."
	line "It makes the move"
	cont "Sunny Day last"
	cont "longer."
	done

UnknownText_0x5e85c:
	text "You were simply"
	line "marvelous!"
	done

GruntM7SeenText:
	text "I've been given"
	line "strict orders."

	para "I'm to crush any-"
	line "one who challenges"
	cont "Team Rocket!"
	done

GruntM7BeatenText:
	text "What?!"
	done

GruntM8SeenText:
	text "It feels great"
	line "ordering #mon"
	cont "to commit crimes."
	done

GruntM8BeatenText:
	text "You're kidding!"
	done

GruntM9SeenText:
	text "It's my job to"
	line "make sure no one"
	
	para "opens up this"
	line "shutter!"
	done
;	text "Why did the shut-"
;	line "ter open? Did you"
;
;	para "have something to"
;	line "do with this?"
;	done

GruntM9BeatenText:
	text "I'm done for!"
	done

RocketScientistMarcSeenText:
	text "An unknown child"
	line "wandering here?"

	para "Who are you?"
	done

RocketScientistMarcBeatenText:
	text "Tch! I took you"
	line "too lightly!"
	done

UnknownText_0x5eaa4:
	text "It's the Card Key"
	line "slot."
	done

UnknownText_0x5eabc:
	text "<PLAYER> inserted"
	line "the Card Key."
	done

UnknownText_0x5ead6:
	text "3F Personnel"
	done

UnknownText_0x5eae4:
	text "#mon Music with"
	line "Host DJ Ben"
	done

Route33_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks
	;callback MAPCALLBACK_TILES, Route33RainScript

	db 1 ; warp events
	warp_event 11,  9, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 11, SIGNPOST_JUMPTEXT, Route33SignText
	bg_event 17, 14, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_ROUTE_33_HIDDEN_BOTTLE_CAP

	db 5 ; object events
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 12, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_GENERICTRAINER, 3, GenericTrainerSchoolgirlImogen, -1
	fruittree_event 14, 16, FRUITTREE_ROUTE_33_1, PECHA_BERRY
	fruittree_event 13, 11, FRUITTREE_ROUTE_33_2, CHESTO_BERRY
	itemball_event  18, 16, SUPER_POTION, 1, EVENT_ROUTE_33_SUPER_POTION

Route33RainScript:
	special Special_GetOvercastIndex
	ifequal AZALEA_OVERCAST, .rain
	changemap Route33_BlockData
	return

.rain
	changemap Route33Raining_BlockData
	return

TrainerHikerAnthony:
	trainer HIKER, ANTHONY1, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony1SeenText, HikerAnthony1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_HIKER_ANTHONY
	opentext
	checkflag ENGINE_ANTHONY
	iftrue .Rematch
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue_jumpopenedtext HikerAnthonyDunsparceText
	checkcellnum PHONE_HIKER_ANTHONY
	iftrue .NumberAccepted
	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext HikerAnthony1AfterText
	buttonsound
	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	jump .AskForPhoneNumber

.AskAgain:
	callstd asknumber2m
.AskForPhoneNumber:
	askforphonenumber PHONE_HIKER_ANTHONY
	ifequal $1, .PhoneFull
	ifequal $2, .NumberDeclined
	trainertotext HIKER, ANTHONY1, $0
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext HikerAnthony1BeatenText, 0
;	copybytetovar wAnthonyFightCount
;	ifequal 4, .Fight4
;	ifequal 3, .Fight3
;	ifequal 2, .Fight2
;	ifequal 1, .Fight1
;	ifequal 0, .LoadFight0
;.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
;.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
;.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
;.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
;.LoadFight0:
	loadtrainer HIKER, ANTHONY1
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 1
	clearflag ENGINE_ANTHONY
	end

.LoadFight1:
	loadtrainer HIKER, ANTHONY2
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 2
	clearflag ENGINE_ANTHONY
	end

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 3
	clearflag ENGINE_ANTHONY
	end

.LoadFight3:
	loadtrainer HIKER, ANTHONY4
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 4
	clearflag ENGINE_ANTHONY
	end

.LoadFight4:
	loadtrainer HIKER, ANTHONY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerSchoolgirlImogen:
	generictrainer SCHOOLGIRL, IMOGEN, EVENT_BEAT_SCHOOLGIRL_IMOGEN, SchoolgirlImogenSeenText, SchoolgirlImogenBeatenText

	text "I'm trying hard so"
	line "I can be the star"
	cont "in my class."
	done

HikerAnthony1SeenText:
	text "I came through the"
	line "tunnel, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthony1BeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

HikerAnthony1AfterText:
	text "We Hikers are at"
	line "our best in the"
	cont "mountains."
	done

HikerAnthonyDunsparceText:
	text "Hey, did you get a"
	line "Dunsparce?"

	para "I caught one too."

	para "Take a look at it"
	line "in the light. It's"
	cont "got a funny face!"
	done

SchoolgirlImogenSeenText:
	text "I'm the best in my"
	line "class at #mon."
	done

SchoolgirlImogenBeatenText:
	text "So there are bet-"
	line "ter trainers???"
	done

Route33SignText:
	text "Route 33"
	done

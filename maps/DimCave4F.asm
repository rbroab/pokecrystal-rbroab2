DimCave4F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, DimCave4FBouldersLand
	callback MAPCALLBACK_CMDQUEUE, DimCave4FSetUpStoneTable

	db 6 ; warp events
	warp_event  2, 16, DIM_CAVE_5F, 2
	warp_event 27, 29, DIM_CAVE_5F, 3
	warp_event 27, 24, DIM_CAVE_5F, 4 ; hole
	warp_event  5,  5, DIM_CAVE_3F, 1
	warp_event 28, 22, DIM_CAVE_3F, 2
	warp_event 14,  7, DIM_CAVE_3F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 25, 23, SIGNPOST_ITEM + CALCIUM, EVENT_DIM_CAVE_4F_HIDDEN_CALCIUM
	bg_event 27, 27, SIGNPOST_ITEM + X_ATTACK, EVENT_DIM_CAVE_4F_HIDDEN_X_ATTACK

	db 8 ; object events
	strengthboulder_event 14, 15, EVENT_BOULDER_IN_DIM_CAVE_4F
	object_event 27, 25, SPRITE_BOULDER_ROCK_FOSSIL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptext, DimCaveFallenBoulderText, EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	object_event  5, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_GENERICTRAINER, 0, GenericTrainerScientistJoseph, -1
	object_event 12,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_GENERICTRAINER, 4, GenericTrainerScientistNigel, -1
	object_event 22, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, PAL_NPC_BROWN, PERSONTYPE_COMMAND, jumptextfaceplayer, DimCave4FSuper_nerdText, -1
	itemball_event 17,  2, MAX_ETHER, 1, EVENT_DIM_CAVE_4F_MAX_ETHER
	itemball_event 27,  8, NUGGET, 1, EVENT_DIM_CAVE_4F_NUGGET
	itemball_event  6, 23, FULL_RESTORE, 1, EVENT_DIM_CAVE_4F_FULL_RESTORE

	const_def 1 ; object constants
	const DIMCAVE4F_BOULDER

DimCave4FBouldersLand:
	checkevent EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	iftrue .skip
	changeblock 26, 24, $c9
	changeblock 4, 24, $b9
.skip
	return

DimCave4FSetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	dbw CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.StoneTable:
	stonetable 6, DIMCAVE4F_BOULDER, .Boulder
	db -1 ; end

.Boulder:
	disappear DIMCAVE4F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_3F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	thistext

	text "The boulder fell"
	line "through."
	done

GenericTrainerScientistJoseph:
	generictrainer SCIENTIST, JOSEPH, EVENT_BEAT_SCIENTIST_JOSEPH, .SeenText, .BeatenText

	text "Water underground"
	line "leaves behind"
	cont "mineral deposits."

	para "Humans mine for"
	line "them, and microbes"
	cont "feed on them."
	done

.SeenText:
	text "I'm studying the"
	line "ancient microbes"

	para "preserved in these"
	line "rocks."
	done

.BeatenText:
	text "It feels good to"
	line "get out of the lab"
	cont "and do some field"
	cont "work."
	done

GenericTrainerScientistNigel:
	generictrainer SCIENTIST, NIGEL, EVENT_BEAT_SCIENTIST_NIGEL, .SeenText, .BeatenText

	text "The flowing water"
	line "pushes through a"
	cont "water wheel to"

	para "energize a series"
	line "of generators,"

	para "turning kinetic"
	line "energy into elec-"
	cont "trical energy."

	para "Fascinating,"
	line "right?"
	done

.SeenText:
	text "How do we get pow-"
	line "er out of water?"

	para "I'll tell you if"
	line "you can beat me."
	done

.BeatenText:
	text "Yikes! OK, I'll"
	line "tell you."
	done

DimCave4FSuper_nerdText:
	text "I'm walking along"
	line "the tracks, just"

	para "like in that"
	line "movie!"

	para "???Except I'm in a"
	line "cave??? all alone???"

	para "???This isn't fun"
	line "anymore."
	done

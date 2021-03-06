UnionCaveB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, UnionCaveB2FLapras

	db 1 ; warp events
	warp_event  5,  3, UNION_CAVE_B1F_SOUTH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 11, 31, SPRITE_LAPRAS, SPRITEMOVEDATA_SWIM_AROUND, 1, 1, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
	object_event 15, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfEmma, -1
	itemball_event 16,  2, ELIXER, 1, EVENT_UNION_CAVE_B2F_ELIXER
	itemball_event 12, 19, HYPER_POTION, 1, EVENT_UNION_CAVE_B2F_HYPER_POTION

	const_def 1 ; object constants
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2FLapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	return

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	return

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

GenericTrainerCooltrainermNick:
	generictrainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText

	text "Your #mon style"
	line "is stunning and"
	cont "colorful, I admit."

	para "You'll just keep"
	line "getting better!"
	done

GenericTrainerCooltrainerfGwen:
	generictrainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText

	text "I'm going to train"
	line "by myself until I"
	cont "improve."
	done

GenericTrainerCooltrainerfEmma:
	generictrainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText

	text "Just once a week,"
	line "a #mon comes to"
	cont "the water's edge."

	para "I wanted to see"
	line "that #mon???"
	done

CooltrainermNickSeenText:
	text "There are two"
	line "kinds of people."

	para "Those who have"
	line "style, and those"
	cont "who don't."

	para "What kind of"
	line "person are you?"
	done

CooltrainermNickBeatenText:
	text "You've got"
	line "dazzling style!"
	done

CooltrainerfGwenSeenText:
	text "I'm in training."
	line "Care for a round?"
	done

CooltrainerfGwenBeatenText:
	text "Aww, no! You're"
	line "too good for me."
	done

CooltrainerfEmmaSeenText:
	text "If the #mon I"
	line "liked were there,"
	cont "I'd go anywhere."

	para "That's what a real"
	line "trainer does."
	done

CooltrainerfEmmaBeatenText:
	text "I'd rather pet my"
	line "babies than this!"
	done


BlackthornDragonSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 2
	warp_event  3,  7, BLACKTHORN_CITY, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  1, SIGNPOST_JUMPSTD, difficultbookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonSpeechHouseGrannyText, -1
	object_event  5,  5, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_POKEMON, DRATINI, BlackthornDragonSpeechHouseDratiniText, -1
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x7f4842, -1
	
FishingGuruScript_0x7f4842:
	checkevent EVENT_GOT_SUPER_ROD
	iftrue_jumptextfaceplayer UnknownText_0x7f57c2
	faceplayer
	opentext
	writetext UnknownText_0x7f4af2
	yesorno
	iffalse UnknownScript_0x7f4a62
	writetext UnknownText_0x7f52f2
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse UnknownScript_0x7f4aa2
	setevent EVENT_GOT_SUPER_ROD
	thisopenedtext

UnknownText_0x7f57c2:
	text "Try your hand at"
	line "fishing wherever"
	cont "there is water."

	para "Remember--you can"
	line "catch different"

	para "#mon using"
	line "different Rods."
	done

UnknownScript_0x7f4a62:
	writetext UnknownText_0x7f5ec2
	waitbutton
UnknownScript_0x7f4aa2:
	endtext

UnknownText_0x7f4af2:
	text "I'm the Fishing"
	line "Guru's younger"
	cont "brother."

	para "I can see that you"
	line "like fishing."

	para "There's no doubt"
	line "in my mind at all!"

	para "So? I know I'm"
	line "right."
	done

UnknownText_0x7f52f2:
	text "Yes, yes. Just as"
	line "I thought!"

	para "Here, fishing fan!"
	line "Take this--it's a"
	cont "Super Rod."
	done

UnknownText_0x7f5ec2:
	text "Huh? My own eyes"
	line "deceived me?"
	done

BlackthornDragonSpeechHouseGrannyText:
	text "A clan of trainers"
	line "who can freely"

	para "command dragons"
	line "live right here in"
	cont "Blackthorn."

	para "As a result, there"
	line "are many legends"

	para "about dragons in"
	line "this town."
	done

BlackthornDragonSpeechHouseDratiniText:
	text "Dratini: Draa!"
	done

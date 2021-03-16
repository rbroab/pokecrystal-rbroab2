EcruteakLugiaSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, SIGNPOST_JUMPSTD, radio2

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LugiaOldMan, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x993ec, -1

LugiaOldMan:
	checkevent EVENT_SHOWED_OLD_MAN
	iftrue_jumptextfaceplayer .showedlugiatext
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .caughtlugia
	checkevent EVENT_GOT_SILVER_WING
	iftrue_jumptextfaceplayer .gotsilverwing
	faceplayer
	opentext
	writetext .givesilverwing
	buttonsound
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	jumpopenedtext .feathertext

.caughtlugia:
	setevent EVENT_SHOWED_OLD_MAN
	faceplayer
	opentext
	writetext .caughtlugiatext
	endtext
	
.givesilverwing:
	text "This happened when"
	line "I was young."

	para "The sky suddenly"
	line "turned black. A"

	para "giant flying #-"
	line "mon was blocking"
	cont "out the sun."

	para "I wonder what that"
	line "#mon was?"

	para "It was like a bird"
	line "and a dragon."
	
	para "Whatever it was,"
	line "this fell to the"
	
	para "earth after it"
	line "flew overhead."
	done

.feathertext:
	text "I held on to that"
	line "feather for many,"
	cont "many years--even"
	
	para "when people would"
	line "call me crazy."
	
	para "Take it with you."
	line "Let it remind you"
	
	para "that you should"
	line "never lose your"
	cont "sense of wonder…"
	
	para "Even if people"
	line "call you crazy."
	cont "Hohohoho!"
	done
	
.gotsilverwing:	
	text "Maybe someday the"
	line "giant flying #-"
	cont "mon will return…"

	para "Ah, that's some-"
	line "thing I'd truly"
	cont "like to see."
	done
	
.caughtlugiatext:
	text "………"
	
	para "What's this?…"
	
	para "Aha! Yes! This"
	line "is the #mon I"
	cont "saw in my youth!"
	
	para "After all these"
	line "years… Thank you"
	
	para "for proving an"
	line "old coot right."
	done

.showedlugiatext:
	text "I knew I wasn't"
	line "crazy. I wonder"
	
	para "how many other"
	line "mysterious #-"
	cont "mon are out there…"
	done
	
UnknownText_0x993ec:
	text "Is there really a"
	line "#mon that big?"

	para "If it exists, it"
	line "must be powerful."
	done

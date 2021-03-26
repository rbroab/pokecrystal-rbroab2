GoldenrodMuseum1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  6,  7, GOLDENROD_CITY, 18
	warp_event  7,  7, GOLDENROD_CITY, 18
	warp_event 13,  7, GOLDENROD_MUSEUM_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  1,  2, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_ARCH_TREE_DOWN, 0, 0, -1, -1, PAL_NPC_TREE, PERSONTYPE_COMMAND, end, NULL, -1
	object_event  2,  2, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_ARCH_TREE_UP, 0, 0, -1, -1, PAL_NPC_TREE, PERSONTYPE_COMMAND, end, NULL, -1
	object_event  7,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, WelcomeToMuseumText, -1
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptext, MuseumYoungsterScript, -1
	object_event  3,  4, SPRITE_CHILD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, MuseumChildScript, -1
	object_event 11,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, MuseumFisherScript, -1
	
WelcomeToMuseumText:
	text "Welcome to the"
	line "Goldenrod Museum."
	done
	
MuseumYoungsterScript:
	text "Whoa…"
	
	para "So this is what"
	line "they used to dig"
	
	para "the tunnel for the"
	line "Magnet Train?"
	
	para "Cool!"
	done
	
MuseumChildScript:
	text "C'mon, c'mon!"
	
	para "I want to go up-"
	line "stairs and see"
	cont "the #mon stuff!"
	done

MuseumFisherScript:
	showtextfaceplayer MuseumFisherText
	turnobject LAST_TALKED, UP
	end	
	
MuseumFisherText:
	text "Wow…"
	
	para "This is really"
	line "something."
	
	para "…"
	
	para "Honestly, I have"
	line "no idea what I'm"
	cont "looking at…"
	
	para "Sure is impressive"
	line "though!"
	done
	
	
	
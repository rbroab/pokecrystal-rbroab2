
CeladonHomeDecorStore4F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_3F, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  8,  0, SIGNPOST_JUMPTEXT, CeladonHomeDecorStore4FDirectoryText
	bg_event  2,  5, SIGNPOST_READ, BigOnixDollScript
	bg_event  3,  5, SIGNPOST_READ, BigOnixDollScript
	bg_event  2,  6, SIGNPOST_READ, BigOnixDollScript
	bg_event  3,  6, SIGNPOST_READ, BigOnixDollScript

	db 9 ; object events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, BigDollClerkText, -1
	object_event  1,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  2,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_DOWN_FLIP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  1,  4, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  2,  4, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_UP_FLIP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  4,  4, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigLaprasDollScript, -1
	object_event  5,  4, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_DOWN_FLIP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigLaprasDollScript, -1
	object_event  4,  5, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigLaprasDollScript, -1
	object_event  5,  5, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_UP_FLIP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BigLaprasDollScript, -1

BigDollClerkNoMoneyScript:
	jumpopenedtext BigDollClerkNoMoneyText

BigLaprasDollScript:
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue_jumptext BigLaprasDollText
	opentext
	writetext BigDollClerkSellLaprasText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext BigDollClerkNoSaleText
	checkmoney $0, 200000
	ifequal $2, BigDollClerkNoMoneyScript
	takemoney $0, 200000
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	writetext BoughtBigLaprasDollText
	playsound SFX_TRANSACTION
	waitbutton
	jumpopenedtext BigLaprasDollSentText

BigSnorlaxDollScript:
	checkevent EVENT_DECO_BIG_SNORLAX_DOLL
	iftrue_jumptext BigSnorlaxDollText
	opentext
	writetext BigDollClerkSellSnorlaxText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext BigDollClerkNoSaleText
	checkmoney $0, 100000
	ifequal $2, BigDollClerkNoMoneyScript
	takemoney $0, 100000
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	writetext BoughtBigSnorlaxDollText
	playsound SFX_TRANSACTION
	waitbutton
	jumpopenedtext BigSnorlaxDollSentText

BigOnixDollScript:
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue_jumptext BigOnixDollText
	opentext
	writetext BigDollClerkSellOnixText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext BigDollClerkNoSaleText
	checkmoney $0, 50000
	ifequal $2, BigDollClerkNoMoneyScript
	takemoney $0, 50000
	setevent EVENT_DECO_BIG_ONIX_DOLL
	writetext BoughtBigOnixDollText
	playsound SFX_TRANSACTION
	waitbutton
	jumpopenedtext BigOnixDollSentText

BigDollClerkText:
	text "Aren't our jumbo"
	line "dolls impressive?"

	para "They're so big,"
	line "we can barely fit"
	cont "them in the room."
	done

BigDollClerkNoSaleText:
	text "Clerk: Well, if"
	line "you say so."
	done

BigDollClerkNoMoneyText:
	text "Clerk: You can't"
	line "afford it!"
	done

BigDollClerkSellLaprasText:
	text "Clerk: You like"
	line "the Lapras doll?"

	para "It'll cost you"
	line "??200,000."
	done

BigDollClerkSellSnorlaxText:
	text "Clerk: You like"
	line "the Snorlax doll?"

	para "It'll cost you"
	line "??100,000."
	done

BigDollClerkSellOnixText:
	text "Clerk: You like"
	line "the Onix doll?"

	para "It'll cost you"
	line "??50,000."
	done

BoughtBigLaprasDollText:
	text "<PLAYER> bought"
	line "Big Lapras Doll."
	done

BigLaprasDollSentText:
	text "Big Lapras Doll"
	line "was sent home."
	done

BoughtBigSnorlaxDollText:
	text "<PLAYER> bought"
	line "Big Snorlax Doll."
	done

BigSnorlaxDollSentText:
	text "Big Snorlax Doll"
	line "was sent home."
	done

BoughtBigOnixDollText:
	text "<PLAYER> bought"
	line "Big Onix Doll."
	done

BigOnixDollSentText:
	text "Big Onix Doll"
	line "was sent home."
	done

BigLaprasDollText:
	text "It's a jumbo-size"
	line "Lapras Doll!"
	done

BigSnorlaxDollText:
	text "It's a jumbo-size"
	line "Snorlax Doll!"
	done

BigOnixDollText:
	text "It's a jumbo-size"
	line "Onix Doll!"
	done

CeladonHomeDecorStore4FDirectoryText:
	text "A Stuffed"
	line "Companion!"

	para "4F: Jumbo Dolls"
	done

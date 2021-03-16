LakeofRageOreManiacHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 4
	warp_event  3,  7, LAKE_OF_RAGE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  1, SIGNPOST_JUMPSTD, difficultbookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, OreManiacScript, -1

OreManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	buttonsound
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetOreManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	copybytetovar CurItem
	takeitem ITEM_FROM_MEM
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	thisopenedtext

	text "The deal is done!"
	line "I've scored an ore"
	cont "I can adore!"
	done

.GreetingText:
	;text "I'm actually"
	;line "interested in"
	;cont "a different kind"
	;cont "of rock…"
	
	text "Ore, ore, ore…"
	line "Ores that I adore,"

	para "I'll pay you well"
	line "for more rare ore!"

	;para "Don't you have an"
	;line "adorable ore that"
	;cont "shakes my core?"
	done

.OfferText:
	text "That ore, it's"
	line "shaking me!"

	para "Will you sell it"
	line "for ¥@"
	deciram hMoneyTemp, 3, 7
	text "?"
	done

.WrongItemText:
	text "Huh? What on earth"
	line "is this?"

	para "You can't shake my"
	line "core with an ore"
	cont "so poor!"
	done

.NoItemText:
	text "Hmmm. My core won't"
	line "change."

	para "I hope you sell"
	line "one to me someday."
	done		

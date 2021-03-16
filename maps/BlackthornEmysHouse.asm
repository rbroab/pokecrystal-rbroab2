BlackthornEmysHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 3
	warp_event  3,  7, BLACKTHORN_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_COMMAND, trade, TRADE_WITH_EMY_FOR_MR__MIME, -1
	object_event  5,  4, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, DragonTamerEggScript, -1
	;object_event  5,  6, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, TamersCharizard, -1
	

;TamersCharizard:	
;	faceplayer
;	showcrytext .Text, CHARMANDER
;	end

;.Text:
;	text "Charmander: Err-"
;	line "charr!"
;	done	
	
DragonTamerEggScript:
	checkevent EVENT_BEAT_CLAIR
	iffalse .dragontalk
	checkevent EVENT_GOT_DRAGON_EGG
	iffalse .givedragonegg
	faceplayer
	opentext
	writetext gotdragoneggtext
	waitbutton
	closetext
	end
	
.dragontalk:
	faceplayer
	opentext
	writetext dragontalktext
	waitbutton
	closetext
	end
	
.givedragonegg:
	faceplayer
	opentext
	writetext givedragoneggtext
	yesorno
	iffalse .dragonstoostrong
	checkcode VAR_PARTYCOUNT
	ifequal 6, .PartyNoRoomForEggText
	giveegg CHARMANDER, EGG_LEVEL
	writetext receivedragoneggtext	
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	setevent EVENT_GOT_DRAGON_EGG
	writetext DescribeDragonEggText
	waitbutton
	closetext	
	;setevent EVENT_GOT_DRAGON_EGG
	end
	
.dragonstoostrong:
	jumpopenedtext toostrongtext
	end
	
.PartyNoRoomForEggText
	jumpopenedtext noroomfordragoneggtext
	end
	
dragontalktext:
	text "Dragon #mon"
	line "aren't easy to"
	cont "raise."
	
	para "Not for a run-of-"
	line "the-mill trainer"
	cont "anyway…"
	
	para "It takes both in-"
	line "ner and outer"
	
	para "strength to prop-"
	line "erly tame dragons."
	done
	
givedragoneggtext:	
	text "Dragon #mon"
	line "aren't easy to"
	cont "raise."
	
	para "Not for a run-of-"
	line "the-mill trainer"
	cont "anyway…"
	
	para "It takes both in-"
	line "ner and outer"
	
	para "strength to prop-"
	line "erly tame dragons."
	
	para "………"
	
	para "What's this? You"
	line "beat Clair?"
	
	para "Maybe you aren't"
	line "a normal trainer…"
	
	para "Still… dragons"
	line "can be ruthless."
	
	para "You might be bet-"
	line "ter off starting"
	cont "small."
	
	para "Would you like to"
	line "have this dragon"
	cont "egg?"
	
	para "Consider it a"
	line "starting point."
	done	
	
toostrongtext:
	text "Suit yourself. It"
	line "would probably be"
	
	para "too strong for"
	line "you anyway."
	done
	
noroomfordragoneggtext:
	text "Hang on, you"
	line "don't even have"
	cont "room for this."
	done
	
receivedragoneggtext:	
	text "<PLAYER> received"
	line "the Dragon Egg!"
	done	
	
DescribeDragonEggText:
	text "It's not the most"
	line "powerful dragon,"
	
	para "but with proper"
	line "training it won't"
	cont "let you down."
	done

gotdragoneggtext:
	text "The power of a"
	line "dragon is truly"
	cont "unrivaled."
	done
	
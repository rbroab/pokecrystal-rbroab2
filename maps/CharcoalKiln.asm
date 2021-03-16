CharcoalKiln_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 2
	warp_event  4,  7, AZALEA_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  1,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  4,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  8,  6, SPRITE_FARFETCH_D, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharcoalKilnFarfetchdScript, EVENT_CHARCOAL_KILN_FARFETCH_D
	object_event  3,  4, SPRITE_TOTODILE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, TotodileAppear, EVENT_KILN_TOTODILE
	object_event  3,  4, SPRITE_CHIKORITA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, ChikoritaAppear, EVENT_KILN_CHIKORITA
	
	const_def 1 ; object constants
	const KILN_BLACKBELT
	const KILN_YOUNGSTER
	const KILN_FARFETCHD
	const KILN_TOTODILE
	const KILN_CHIKORITA
	
TotodileAppear:
	faceplayer
	showcrytext .Text, TOTODILE
	end

.Text:
	text "Totodile: Bwaa!"
	done

ChikoritaAppear:
	faceplayer
	showcrytext .Text, CHIKORITA
	end
	
.Text:
	text "Chikorita: Chico"
	line "chic!"
	done
	
CharcoalKilnBoss:
	;setevent EVENT_KILN_TOTODILE
	checkevent EVENT_GAVECUTPOKEMON
	iftrue_jumptextfaceplayer .howspokemon
	;checkevent EVENT_GOT_HM01_CUT
	checkevent EVENT_GOT_TM69_U_TURN
	iftrue .givecutpokemon
	;iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	thistextfaceplayer

	text "All the Slowpoke"
	line "have disappeared"
	cont "from the town."

	para "The forest's pro-"
	line "tector may be"
	cont "angry with us…"

	para "It may be a bad"
	line "omen. We should"
	cont "stay in."
	done

.Text2:
	text "The Slowpoke have"
	line "returned…"

	para "But my Apprentice"
	line "hasn't come back"
	cont "from Ilex Forest."

	para "Where in the world"
	line "is that lazy guy?"
	done

.Text3:
	text "You chased off"
	line "Team Rocket and"

	para "went to Ilex"
	line "Forest alone?"

	para "That takes guts!"
	line "I like that. Come"
	cont "train with us."
	done

.howspokemon:
	text "How's the #mon"
	line "I gave you?"
	
	para "You two certainly"
	line "made the cut…"
	
	para "Aha!"
	done
	
.givecutpokemon
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .givechikorita
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .givechikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .givetotodile1

.givechikorita
	faceplayer
	opentext
	writetext CutMonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal 6, .PartyFullText
	disappear KILN_CHIKORITA
	writetext PlayReceivedTextC
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHIKORITA, 10, SITRUS_BERRY
	writebyte FRIEND_BALL
	special SetLastPartyMonBall
	setevent EVENT_GAVECUTPOKEMON
	;setevent EVENT_GOT_CHIKORITA_FROM_KILN
	setevent EVENT_KILN_CHIKORITA
	jumpopenedtext GoodCareText


.givetotodile1
	faceplayer
	opentext
	writetext CutMonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal 6, .PartyFullText
	disappear KILN_TOTODILE
	writetext PlayReceivedTextT
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOTODILE, 10, SITRUS_BERRY
	writebyte LURE_BALL
	special SetLastPartyMonBall
	setevent EVENT_GAVECUTPOKEMON
	;setevent EVENT_GOT_TOTODILE_1_FROM_KILN
	setevent EVENT_KILN_TOTODILE
	jumpopenedtext GoodCareText

.PartyFullText:
	jumpopenedtext PartyisFull		


PartyisFull:
	text "Huh? Your party"
	line "is full."
	done	
	
PlayReceivedTextC:	
	text "<PLAYER> received"
	line "Chikorita!"
	done	
	
PlayReceivedTextT:	
	text "<PLAYER> received"
	line "Totodile!"
	done	

CutMonText:
	text "Ah! I'm glad you"
	line "came back!"
	
	para "I forgot to ask"
	line "if you have a"
	
	para "#mon that can"
	line "learn cut……"
	
	para "Not to worry! You"
	line "can have one of"
	cont "my old partners!"
	
	para "You took care of"
	line "Team Rocket at"
	cont "the Slowpoke Well,"
	
	para "and you found"
	line "my Farfetch'd…"
	
	para "I know my #mon"
	line "will be in good"
	cont "hands!"
	done
	
GoodCareText:
	text "You two are wel-"
	line "come back anytime!"
	done
	
CharcoalKilnApprentice:
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue_jumptextfaceplayer .Text3
	;checkevent EVENT_GOT_HM01_CUT
	checkevent EVENT_GOT_TM69_U_TURN
	iffalse_jumptextfaceplayer .Text1
	faceplayer
	opentext
	writetext .Text2
	buttonsound
	verbosegiveitem CHARCOAL
	;verbosegiveitem SILVER_WING
	iffalse_endtext
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	endtext

	
.Text1:
	text "Where have all the"
	line "Slowpoke gone?"

	para "Are they out play-"
	line "ing somewhere?"
	done

.Text2:
	;text "I'm sorry--I for-"
	;line "got to thank you."

	text "I'm sorry--I for-"
	line "got to thank you."

	para "This is charcoal"
	line "that I made."

	para "Fire-type #MON"
	line "would be happy to"
	cont "hold that."
	done
	
	;para "I found this in"
	;line "Ilex Forest."
	
	;para "It fell from"
	;line "above while I was"
	
	;para "looking for"
	;line "Farfetch'd."
	
	;para "I don't know what"
	;line "it is…"
	
	;para "but it sure is"
	;line "pretty looking!"
	;done

.Text3:
	text "The Slowpoke came"
	line "back, and you even"
	cont "found Farfetch'd"

	para "You're the cool-"
	line "est!"
	done
	
CharcoalKilnFarfetchdScript:
	faceplayer
	showcrytext .Text, FARFETCH_D
	end

.Text:
	text "Farfetch'd: Kwaa!"
	done

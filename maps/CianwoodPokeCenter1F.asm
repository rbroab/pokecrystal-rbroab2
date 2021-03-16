CianwoodPokeCenter1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  5,  7, CIANWOOD_CITY, 3
	warp_event  6,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  1, SIGNPOST_READ, PokemonJournalChuckScript

	db 5 ; object events
	pc_nurse_event  5, 1
	object_event  6,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CianwoodPokeCenter1FLassText, -1
	object_event  9,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FSuperNerdText, -1
	object_event 11,  5, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FRichBoyText, -1

PokemonJournalChuckScript:
	setflag ENGINE_READ_CHUCK_JOURNAL
	thistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Chuck!"

	para "Chuck is said to"
	line "really like sweet"
	cont "desserts."

	para "However, he has"
	line "also been seen"

	para "training under a"
	line "heavy waterfall"
	cont "to work them off."
	done

CianwoodGymGuyScript:
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer .WinText
	thistextfaceplayer	
	;checkevent EVENT_GOT_HM04_STRENGTH
	;iftrue_jumptextfaceplayer .Text
	;faceplayer
	;opentext
	;writetext .Text
	;waitbutton
	;writetext .StrengthText1
	;buttonsound
	;verbosegivetmhm HM_STRENGTH
	;setevent EVENT_GOT_HM04_STRENGTH	
	;writetext .StrengthText2
	;waitendtext

;.Text:
	text "The #mon Gym"
	line "trainers here are"
	cont "macho bullies."

	para "If I stick around,"
	line "they might come"
	cont "after me."

	para "Here's some ad-"
	line "vice: the Gym"

	para "Leader uses the"
	line "Fighting-type."

	para "So you should"
	line "confound him with"
	cont "Psychic #mon."

	para "Wipe out his #-"
	line "mon before they"

	para "can use their"
	line "physical strength."

	;para "And those boulders"
	;line "in the middle of"
	;cont "the Gym?"

	;para "If you don't move"
	;line "them correctly,"

	;para "you won't reach"
	;line "the Gym Leader."

	;para "If you get stuck,"
	;line "go outside."
	para "Good luck!"
	done

;.StrengthText1:
;	text "You can't move the"
;	line "boulders aside?"

;	para "Here, use this"
;	line "and teach your"
;	cont "#mon Strength!"
;	done

;.StrengthText2:
;	text "Good luck!"
;	done

.WinText:
	text "<PLAYER>! You won!"
	line "I could tell by"
	cont "looking at you!"
	done

CianwoodPokeCenter1FLassText:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue_jumptextfaceplayer maniactext
	faceplayer
	opentext
	writetext attracttext
	buttonsound
	verbosegivetmhm TM_ATTRACT
	setevent EVENT_GOT_TM45_ATTRACT
	jumpopenedtext gotattracttext
	
attracttext:
	text "Well isn't that"
	line "just the cutest"
	cont "#mon!"
	
	para "A move like this"
	line "would be perfect"
	cont "for such a cutie!"
	done
	
maniactext:	
	text "Did you meet the"
	line "#Maniac?"

	para "He's always brag-"
	line "ging about his"
	cont "rare #mon."
	
	para "I don't care what"
	line "what he says."
	
	para "My #mon are"
	line "much more at-"
	cont "tractive! ♥"
	done

gotattracttext:
	text "It's Attract!"
	line "It makes full use"

	para "of a #mon's"
	line "charm."

	para "Isn't it just per-"
	line "fect for a cutie"
	cont "like me? ♥"
	done
	
CianwoodPokeCenter1FSuperNerdText:
	text "I love showing off"
	line "the #mon that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #mon!"
	done

CianwoodPokeCenter1FRichBoyText:
	text "There's no #"
	line "Mart in this town,"

	para "so we have to im-"
	line "port products from"
	cont "across the sea."
	done

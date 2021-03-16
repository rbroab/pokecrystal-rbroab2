RotomSpookyHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, VIOLET_OUTSKIRTS, 1
	warp_event  4,  7, VIOLET_OUTSKIRTS, 1

	db 0 ; coord events

	db 0 ; bg events
	;bg_event  7,  1, SIGNPOST_JUMPSTD, radio2
	;bg_event  6,  1, SIGNPOST_JUMPSTD, difficultbookshelf
	;bg_event  7,  1, SIGNPOST_JUMPSTD, difficultbookshelf
	;bg_event  5,  1, SIGNPOST_READ, RotomTVEvent
	
	db 1 ; object events
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, RotomTVEvent, EVENT_FOUGHT_ROTOM
	
	const_def 1 ; object constants
	const ROTOM_POKEDEX	
	
	
	
RotomTVEvent:
	checkevent EVENT_BEAT_MORTY
	iffalse .DontAppear
	;checkevent EVENT_FOUGHT_ROTOM
	;iftrue .DontAppear
	checktime 1 << NITE
	iffalse .NotDarkScript
	opentext
	writetext Text_InTV
	buttonsound
	closetext
	pause 15
	cry ROTOM
	pause 5
	opentext
	writetext Text_Pokemon
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 25
	opentext
	writetext Text_In_The_Dex
	yesorno
	iffalse .no
	setevent EVENT_FOUGHT_ROTOM
	writetext Text_ThumpTV
	buttonsound
	closetext
	cry ROTOM
	opentext
	writetext Text_Popped_Out
	buttonsound
	closetext
;	pause 15
	loadwildmon ROTOM, 25
	startbattle	
	reloadmapafterbattle
;	writebyte ROTOM
;	special SpecialMonCheck
;	iffalse .startover;RotomTVEvent
;	setevent EVENT_FOUGHT_ROTOM
	pause 45
	disappear ROTOM_POKEDEX	
	pause 25
	showemote EMOTE_SHOCK, PLAYER, 25	
	opentext
	writetext Text_NormalTV
	buttonsound
	closetext
	end
	
.NotDarkScript
	opentext
	writetext Text_Static
	buttonsound
	closetext
	end	
	
.DontAppear
	opentext
	writetext Text_Static;Text_RegularTV
	buttonsound
	closetext
	end

.startover
	reloadmapafterbattle
	end
	
.no
	closetext
	end
	
;DontKillRotom:
	
	;returnafterbattle
	;special RestartMapMusic
;	end	



Text_InTV: ; 0x7aad0
;	text "The TV has an odd,"
;	line "malevolent feel…"

;	para "It's as if it is"
;	line "staring at you…"
;	done
	text "There's a #dex"
	line "here."
	
	para "Something seems"
	line "off about it…"
	done
	
Text_Pokemon	
;	text "There's a #mon"
;	line "in the TV!"
;	
;	para "Give the TV a"
;	line "thump?"
;	done
	text "What was that?"
	done

Text_In_The_Dex	
	text "Is there a #mon"
	line "in the #dex?"
	
	para "Give it a shake?"
	done
; 0x7ab31

Text_ThumpTV:
;	text "<PLAYER> thumped"
;	line "the TV!"
;	done
	text "<PLAYER> shook the"
	line "#dex."
	done
	
Text_Popped_Out
	text "A #mon popped"
	line "out and attacked!"
	done
	
	
	
Text_NormalTV:
	;text "The TV returned"
	;line "to normal!"
	;done
	text "Whoa!"
	
	para "The #dex van-"
	line "ished!"
	done
	
Text_Static
	;text "Hmmm… Nothing"
	;line "but static…"
	;done
	text "That's weird."
	
	para "There's a #dex"
	line "here…"
	
	para "It doesn't seem to"
	line "work, though."
	
	para "Better leave it"
	line "alone!"
	done
	
;Text_RegularTV:
;	text "There's nothing"
;	line "but static…"
;	done

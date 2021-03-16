Route7_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, Route7RebattleBreeder

	db 2 ; warp events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 13, SIGNPOST_JUMPTEXT, Route7UndergroundPathSignText
	bg_event  6, 11, SIGNPOST_JUMPTEXT, Route7LockedDoorText

	db 3 ; object events
;	object_event  1,  0, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route7Snorlax, EVENT_ROUTE_8_SNORLAX
	object_event  1,  0, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonSnorlax, EVENT_CELADON_SNORLAX
	object_event 15, 11, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_GENERICTRAINER, 5, GenericTrainerBreederCarlene, -1
	itemball_event 16,  1, MENTAL_HERB, 1, EVENT_ROUTE_7_MENTAL_HERB

	const_def 1 ; object constants
	const ROUTE7_BIG_SNORLAX

Route7RebattleBreeder:
	clearevent EVENT_BEAT_BREEDER_CARLENE
	return

GenericTrainerBreederCarlene:
	generictrainer BREEDER, CARLENE, EVENT_BEAT_BREEDER_CARLENE, .SeenText, .BeatenText

	text "I make my Smeargle"
	line "Sketch a move,"

	para "then breed it"
	line "to pass the move"
	cont "down!"

	para "Isn't that smart?"
	done

.SeenText:
	text "My team is bred"
	line "to handle any"
	cont "situation!"
	done

.BeatenText:
	text "We couldn't"
	line "handle you!"
	done

;Route7Snorlax:
;	opentext
;	special SpecialSnorlaxAwake
;	iftrue .Awake
;	jumpopenedtext .AsleepText
;
;.Awake:
;	writetext .AwakeText
;	pause 15
;	cry SNORLAX
;	closetext
;	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
;	loadwildmon SNORLAX, 60
;	startbattle
;	disappear ROUTE7_BIG_SNORLAX
;	setevent EVENT_FOUGHT_SNORLAX
;	reloadmapafterbattle
;	end
;
;.AsleepText:
;	text "Snorlax is snoring"
;	line "peacefully…"
;	done
;
;.AwakeText:
;	text "The #gear was"
;	line "placed near the"
;	cont "sleeping Snorlax…"
;
;	para "…"
;
;	para "Snorlax woke up!"
;	done




CeladonSnorlax::
    checkitem POKE_FLUTE
    iffalse celadonnoflute
    opentext
    writetext CeladonSnorlaxTextHaveFlute
    yesorno
    iffalse celadondontuseflute
CeladonPlayedFluteForSnorlax:
    writetext CeladonSnorlaxTextUseFlute
    playsound SFX_POKEFLUTE
    waitsfx
    writetext CeladonSnorlaxTextWakeUp
    buttonsound
	cry SNORLAX
	closetext
;	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
;	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
    startbattle
 ;   if_equal $2, DidntBeatSnorlaxCeladon
    disappear ROUTE7_BIG_SNORLAX;CELADON_BIG_SNORLAX
    reloadmapafterbattle
    opentext
    writetext CeladonSnorlaxTextSnorlaxGone
    buttonsound
    closetext
    setevent EVENT_CELADON_SNORLAX
    end
    
celadondontuseflute:
    closetext
    end
    
celadonnoflute:
    opentext
    writetext CeladonSnorlaxIsSleepingText
    buttonsound
    closetext
    end
    
;DidntBeatSnorlaxCeladon:
;    reloadmapafterbattle
;    opentext
;    writetext CeladonSnorlaxTextRanAway
;    waitbutton
;    closetext
;    end


CeladonSnorlaxIsSleepingText:
	text "Snorlax is snoring"
	line "peacefully…"
	done

CeladonSnorlaxTextHaveFlute:
	text "Snorlax is snoring"
	line "peacefully…"
	
	para "Want to use the"
	line "# FLUTE?"
	done
	
CeladonSnorlaxTextUseFlute:
	text "<PLAYER> used the"
	line "# FLUTE!"
	done

CeladonSnorlaxTextWakeUp:
	text "…"

;	para "SNORLAX scratches"
;	line "its behind…"

	para "Snorlax woke up"
	line "and attacked in a"
	cont "grumpy rage!"
	done
	
CeladonSnorlaxTextSnorlaxGone:
	text "The path is now"
	line "open!"
	done

CeladonSnorlaxTextRanAway:
	text "Snorlax returned"
	line "to the mountains."
	done
	




Route7UndergroundPathSignText:
	text "What's this flyer?"

	para "“Uncouth trainers"
	line "have been holding"

	para "battles in the"
	line "Underground Path."

	para "Because of rising"
	line "complaints by lo-"
	cont "cal residents, the"
	cont "Underground Path"
	cont "has been sealed"
	cont "indefinitely.”"

	para "-- Celadon Police"
	done

Route7LockedDoorText:
	text "It's locked…"
	done

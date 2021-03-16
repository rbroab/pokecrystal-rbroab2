Route26DayofWeekSiblingsHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BookScript_0x7b1e4, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, girlgivessquirtle, -1
	object_event  2,  4, SPRITE_SQUIRTLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, SquirtleScript, EVENT_LOST_SQUIRTLE
	
	const_def 1 ; object constants
	const SPRITEBOOK
	const SPRITELITTLEGIRL
	const LOSTSQUIRTLE

	

SquirtleScript:	
	faceplayer
	showcrytext .Text, SQUIRTLE
	end

.Text:
	text "Squirtle: Squirt"
	line "squirtle!"
	done	
	
BookScript_0x7b1e4:
	opentext
	writetext UnknownText_0x7b1f9
	yesorno
	iffalse UnknownText_0x7b1f7
	writetext UnknownText_0x7b222
	yesorno
	iffalse UnknownText_0x7b1f7
	writetext UnknownText_0x7b2b9
	waitbutton
UnknownText_0x7b1f7:
	endtext

UnknownText_0x7b1f9:
	text "There's something"
	line "written here."

	para "Read it?"
	done

UnknownText_0x7b222:
	text "To my brothers and"
	line "sisters:"

	para "We take pride in"
	line "serving #mon"
	cont "trainers."

	para "When trainers talk"
	line "to you, give them"
	cont "something useful."

	para "Love,"
	line "Monica"

	para "Keep reading?"
	done

UnknownText_0x7b2b9:
	text "Monday, Monica"
	line "Route 40"

	para "Tuesday, Tuscany"
	line "Route 29"

	para "Wednesday, Wesley"
	line "Lake of Rage"

	para "Thursday, Arthur"
	line "Route 36"

	para "Friday, Frieda"
	line "Route 32"

	para "Saturday, Santos"
	line "Blackthorn City"

	para "Sunday, Sunny"
	line "Route 37"
	done

	
girlgivessquirtle:
	checkevent EVENT_GOT_GIRL_SQUIRTLE
	iftrue .HowsSquirtle
	faceplayer
	opentext
	writetext wantasquirtletext
	yesorno
	iffalse .ohtoobad
	checkcode VAR_PARTYCOUNT
	ifequal 6, .NoRoomForSquirtle	
	disappear LOSTSQUIRTLE
	writetext PlayReceivedSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writebyte POKE_BALL
	special SetLastPartyMonBall
	setevent EVENT_GOT_GIRL_SQUIRTLE
	setevent EVENT_LOST_SQUIRTLE
	writetext TakeCareSquirtleText
	waitbutton
	closetext
	end

.HowsSquirtle:
	faceplayer
	opentext
	writetext HowsSquirtleText
	waitbutton
	closetext
	end

.ohtoobad:
	jumpopenedtext ohtoobadtext
	end
	
.NoRoomForSquirtle:
	jumpopenedtext noroomforsquirtletext
	end


wantasquirtletext:
	text "My brothers and"
	line "sisters told me"
	
	para "to stay and look"
	line "after the house."
	
	para "But a Squirtle"
	line "wandered over!"
	
	para "I don't think it"
	line "has an owner,"
	
	para "but I have to"
	line "stay here!"
	
	para "We've just been"
	line "having a tea par-"
	cont "ty, but it needs"
	
	para "someone to train"
	line "and look after it."
	
	para "It can't be fun"
	line "being cooped up"
	cont "all day long!"
	
	para "Would you be able"
	line "to take it?"	
	done
	
PlayReceivedSquirtleText:
	text "<PLAYER> received"
	line "a Squirtle!"
	done
	
TakeCareSquirtleText:
	text "Take care of lit-"
	line "tle Squirtle."
	
	para "Make it grow up"
	line "big and strong!"
	done

HowsSquirtleText:
	text "How's the little"
	line "Squirtle? I hope"
	cont "it remembers me!"
	done

ohtoobadtext:
	text "But what will I"
	line "do? I can't leave"
	cont "the house…"
	
	para "And it shouldn't"
	line "be kept inside"
	cont "forever."
	done

noroomforsquirtletext:
	text "Hmmm… Looks like"
	line "you're already"
	cont "traveling with a"
	cont "lot of #mon."
	
	para "But you should"
	line "come back when"
	cont "you're able to"
	cont "take it with you."
	done	
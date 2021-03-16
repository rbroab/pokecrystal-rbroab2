Route27RestHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  1, SIGNPOST_JUMPSTD, difficultbookshelf

	db 2 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route27RestHouseGranny, -1
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route27GiveBulbasaur, -1
	
	
Route27RestHouseGranny:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	iftrue .HeardIntro
	writetext .IntroText
	setevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	jump .Continue
.HeardIntro
	writetext .HeardIntroText
.Continue
	buttonsound
	special GetFirstPokemonHappiness
	ifgreater $95, .Loyal
	thisopenedtext

	text "If it doesn't come"
	line "to trust you some"

	para "more, it could be"
	line "tough going."

	para "Trust is the tie"
	line "that binds #mon"
	cont "and trainers."
	done

.Loyal:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	yesorno
	iffalse .TutorRefused
	writebyte SKILL_SWAP
	writetext .ClearText
	special Special_MoveTutor
	ifequal $0, .TeachMove
.TutorRefused
	jumpopenedtext .RefusedText

.NoSilverLeaf
	waitbutton
	thisopenedtext

	text "You've not found"
	line "any Silver Leaves…"
	done

.TeachMove
	takeitem SILVER_LEAF
	thisopenedtext

	text "Skill Swap is a"
	line "move that swaps"

	para "your ability with"
	line "that of your"
	cont "opponent."

	para "It's for advanced"
	line "trainers only."

	para "Use it if you"
	line "dare. Good luck!"
	done

.IntroText:
	text "Where are you off"
	line "to with #mon?"

	para "The #mon"
	line "League?"

	para "Are your #mon"
	line "loyal enough for"
	cont "you to win?"

	para "Let me see…"
	done

.HeardIntroText:
	text "Let me see your"
	line "#mon…"
	done

.QuestionText:
	text "Ah! Your #mon"
	line "trusts you very"
	cont "much."

	para "It's nice to see a"
	line "good trainer."

	para "I can teach it my"
	line "secret technique,"

	para "Skill Swap, if"
	line "you'd like."
	done

.RefusedText:
	text "Good luck on your"
	line "journey."
	done

.ClearText:
	text ""
	done



Route27GiveBulbasaur:
	checkevent EVENT_OLD_MAN_BULBASAUR
	iftrue .HowsBulbasaur
	faceplayer
	opentext
	writetext wantabulbasaurtext
	yesorno
	iffalse .toobad
	checkcode VAR_PARTYCOUNT
	ifequal 6, .NoRoomForBulbasaur	
	writetext PlayReceivedBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	writebyte POKE_BALL
	special SetLastPartyMonBall
	setevent EVENT_OLD_MAN_BULBASAUR
	writetext TakeCareBulbasaurText
	waitbutton
	closetext
	end

.HowsBulbasaur:
	faceplayer
	opentext
	writetext HowsBulbasaurText
	waitbutton
	closetext
	end

.toobad:
	jumpopenedtext toobadtext
	end
	
.NoRoomForBulbasaur:
	jumpopenedtext noroomforbulbasaurtext
	end

wantabulbasaurtext:
	text "Our granddaughter"
	line "trains just out-"
	cont "side with her"
	cont "team of Bulbasaur."
	
	para "Well, they aren't"
	line "all Bulbasaur."
	
	para "Over the years,"
	line "some evolved…"
	
	para "Ivysaur, then"
	line "Venusaur."
	
	para "She kept one of"
	line "each, but we have"
	cont "another Bulbasaur."

	para "My wife and I no"
	line "longer raise any"
	cont "#mon."
	
	para "It still needs a"
	line "trainer, though."
	
	para "Would you like to"
	line "take it with you?"
	done
	
PlayReceivedBulbasaurText:
	text "<PLAYER> received"
	line "a Bulbasaur!"
	done
	
TakeCareBulbasaurText:
	text "Take good care of"
	line "Bulbasaur."
	
	para "And please come"
	line "back to visit"
	cont "some time."
	done

HowsBulbasaurText:
	text "How is Bulbasaur"
	line "doing?"
	
	para "I hope you're"
	line "both doing well."
	done

toobadtext:
	text "Oh, I see…"
	
	para "Well, please come"
	line "back if you ever"
	cont "have a change of"
	cont "heart."
	
	para "Every #mon"
	line "deserves a home."
	done

noroomforbulbasaurtext:
	text "Ah, it seems you"
	line "don't have room"
	cont "for this #mon."
	done
	
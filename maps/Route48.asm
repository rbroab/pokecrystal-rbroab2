Route48_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, Route48JessieJamesCallback

	db 2 ; warp events
	warp_event 11,  5, YELLOW_FOREST_GATE, 3
	warp_event  8,  4, HIDDEN_TREE_GROTTO, 1

	db 2 ; coord events
	coord_event 20, 12, 0, Route48JessieJamesScript1
	coord_event 20, 13, 0, Route48JessieJamesScript2

	db 3 ; bg events
	bg_event 27, 11, SIGNPOST_JUMPTEXT, Route48YellowForestSignText
	bg_event  8,  3, SIGNPOST_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_48
	bg_event  9,  3, SIGNPOST_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_48

	db 8 ; object events
	object_event 11,  6, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_TRAINER, 1, TrainerArcher2, EVENT_CLEARED_YELLOW_FOREST
	object_event 15, 12, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_JESSIE
	object_event 26, 12, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_JAMES
	itemball_event  4, 13, NUGGET, 1, EVENT_ROUTE_48_NUGGET
	cuttree_event 16, 5, -1
	fruittree_event 25, 4, FRUITTREE_ROUTE_48_1, RED_APRICORN
	fruittree_event 27, 4, FRUITTREE_ROUTE_48_2, WHT_APRICORN
	fruittree_event 29, 4, FRUITTREE_ROUTE_48_3, BLU_APRICORN

	const_def 1 ; object constants
	const ROUTE48_ARCHER
	const ROUTE48_JESSIE
	const ROUTE48_JAMES

Route48JessieJamesCallback:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	return

Route48JessieJamesScript2:
	moveobject ROUTE48_JESSIE, 15, 13
	moveobject ROUTE48_JAMES, 26, 13
Route48JessieJamesScript1:
	appear ROUTE48_JESSIE
	appear ROUTE48_JAMES
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	applymovement ROUTE48_JESSIE, JessieEnterMovementData
	applymovement ROUTE48_JAMES, JamesEnterMovementData
	showtext Route48JessieJamesSeenText
	setscene $1
	setevent EVENT_BEAT_JESSIE_AND_JAMES_48
	winlosstext Route48JessieJamesBeatenText, 0
	setlasttalked ROUTE48_JESSIE
	loadtrainer JESSIE_JAMES, JESSIE_JAMES2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	showtext Route48JessieJamesAfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes		
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	pause 25
	special Special_FadeInQuickly
;	applymovement ROUTE48_JESSIE, JessieLeaveMovementData
;	applymovement ROUTE48_JAMES, JamesLeaveMovementData	
	playmapmusic
Route48JessieJamesScript_End:
	end

JessieEnterMovementData:
	step_right
	step_right
	step_right
	step_right
	step_end

JamesEnterMovementData:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

;JessieLeaveMovementData:
;	big_step_left
;	big_step_left
;	big_step_left
;	big_step_left
;	step_end

;JamesLeaveMovementData:
;	big_step_right
;	big_step_right
;	big_step_right
;	big_step_right
;	big_step_right
;	step_end

TrainerArcher2:
	trainer ARCHER, ARCHER2, EVENT_BEAT_ARCHER_2, Archer2SeenText, Archer2BeatenText, 0, Archer2Script

Archer2Script:
	showtext Archer2AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE48_ARCHER
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_CLEARED_YELLOW_FOREST
	clearevent EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	clearevent EVENT_OAKS_AIDE_3
	end

Route48JessieJamesSeenText:
	text "Stop right there,"
	line "twerp!"

	para "You know what"
	line "#mon lives in"
	cont "that forest?"
	cont "Pikachu!"

	para "The boss will be"
	line "pleased if we"

	para "capture a power-"
	line "ful one!"

	para "Surrender now, or"
	line "prepare to fight!"
	done

Route48JessieJamesBeatenText:
	text "Beaten by a brat?"
	done

Route48JessieJamesAfterText:
	text "Looks like Team"
	line "Rocket's blasting"
	cont "off again!"
	done

Archer2SeenText:
	text "So you want to"
	line "interfere with"

	para "Team Rocket's"
	line "plans again."

	para "Always sticking"
	line "your nose where it"
	cont "doesn't belong."

	para "We're selling"
	line "those #mon,"

	para "and there's nothing"
	line "you can do about"
	cont "it!"
	done

Archer2BeatenText:
	text "This is so"
	line "frustrating…"
	done

Archer2AfterText:
	text "…Have it your"
	line "way."

	para "Team Rocket will"
	line "withdraw for now."

	para "Our other plan is"
	line "going smoothly"
	cont "anyway…"
	done

Route48YellowForestSignText:
	text "Route 48"

	para "North to"
	line "Yellow Forest"
	done

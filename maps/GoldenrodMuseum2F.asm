GoldenrodMuseum2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 13,  7, GOLDENROD_MUSEUM_1F, 3

	db 0 ; coord events

	db 17 ; bg events
	bg_event  1,  0, SIGNPOST_READ, LugiaPaintingScript
	bg_event  2,  0, SIGNPOST_READ, LugiaPaintingScript
	bg_event 10,  0, SIGNPOST_READ, BellTowerPaintingScript
	bg_event 11,  0, SIGNPOST_READ, BellTowerPaintingScript
	bg_event  7,  0, SIGNPOST_READ, HoOhPaintingScript
	bg_event  8,  0, SIGNPOST_READ, HoOhPaintingScript
	bg_event  0,  4, SIGNPOST_READ, KabutoPuzzleScript
	bg_event  0,  5, SIGNPOST_READ, KabutoPuzzleScript
	bg_event  3,  4, SIGNPOST_READ, OmanytePuzzleScript
	bg_event  3,  5, SIGNPOST_READ, OmanytePuzzleScript
	bg_event  0,  6, SIGNPOST_READ, AerodactylPuzzleScript
	bg_event  0,  7, SIGNPOST_READ, AerodactylPuzzleScript
	bg_event  3,  6, SIGNPOST_READ, HoOhPuzzleScript
	bg_event  3,  7, SIGNPOST_READ, HoOhPuzzleScript
	bg_event  8,  3, SIGNPOST_READ, FossilsScript
	bg_event  4,  1, SIGNPOST_READ, ItsNothingScript
	bg_event  5,  1, SIGNPOST_READ, ItsNothingScript

	db 7 ; object events
	object_event 12,  3, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ROCK, PERSONTYPE_COMMAND, jumptext, GoldenrodMuseum2FBigPearlText, -1
	object_event 13,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, MuseumGentlemanScript, -1
	object_event  2,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, MuseumTeacherScript, -1
	object_event  6,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, MuseumNerdScript, -1
	object_event  6,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, MuseumCoolTrainerScript, -1
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, MuseumPokefanFScript, -1
	object_event  6,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, MuseumPokefanM1Script, -1

LugiaPaintingScript:
	refreshscreen
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	thistext

	text "  The Leviathan"
	line "     Awakens"
	done

HoOhPaintingScript:
	refreshscreen
	paintingpic HO_OH_PAINTING
	waitbutton
	closepokepic
	thistext

	text "   The Phoenix"
	line "    Ascending"
	done

BellTowerPaintingScript:
	refreshscreen
	paintingpic BELL_TOWER_PAINTING
	waitbutton
	closepokepic
	thistext

	text "    Friendship"
	line "     and Hope"
	done

KabutoPuzzleScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic KABUTO_PUZZLE
	waitbutton
	closepokepic
	thistext

	text "It's the completed"
	line "Kabuto panel!"
	done

OmanytePuzzleScript:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic OMANYTE_PUZZLE
	waitbutton
	closepokepic
	thistext

	text "It's the completed"
	line "Omanyte panel!"
	done

AerodactylPuzzleScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic AERODACTYL_PUZZLE
	waitbutton
	closepokepic
	thistext

	text "It's the completed"
	line "Aerodactyl panel!"
	done

HoOhPuzzleScript:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic HO_OH_PUZZLE
	waitbutton
	closepokepic
	thistext

	text "It's the completed"
	line "Ho-Oh panel!"
	done

UnsolvedPuzzleText:
	text "The display is"
	line "still empty…"
	done

GoldenrodMuseum2FBigPearlText:
	text "It's a huge pearl"
	line "fished up from"
	cont "Goldenrod Harbor."
	done

FossilsScript:
	thistext
	
	text "These fossils were"
	line "excavated in"
	cont "Kanto."
	
	para "It is believed"
	line "that many more"
	
	para "fossils have yet"
	line "to be discovered"
	cont "in other regions."
	done

ItsNothingScript:
	thistext
	
	text "There's nothing"
	line "here. The display"
	cont "case is empty."
	done

MuseumGentlemanScript:
	showtextfaceplayer MuseumGentlemanText
	turnobject LAST_TALKED, LEFT
	end	
	
MuseumGentlemanText:
	text "Have you ever seen"
	line "such a remarkable"
	cont "pearl?"
	
	para "It's a shame that"
	line "I wasn't the one"
	cont "to fish this up."
	
	para "Hohoho!"
	done

MuseumTeacherScript:
	showtextfaceplayer MuseumTeacherText
	turnobject LAST_TALKED, UP
	end	
	
MuseumTeacherText:
	text "Does such a large"
	line "#mon really"
	cont "exist?"
	
	para "If it does, it"
	line "must be powerful."
	done
	
MuseumNerdScript:
	showtextfaceplayer MuseumNerdText
	turnobject LAST_TALKED, RIGHT
	end

MuseumNerdText:
	text "Leave us alone."

	para "We're watching a"
	line "simulation about"
	
	para "#mon through"
	line "the passing of"
	cont "time."
	done

MuseumCoolTrainerScript:
	showtextfaceplayer MuseumCoolTrainerText
	turnobject LAST_TALKED, LEFT
	end
	
MuseumCoolTrainerText:
	text "Incredible…"

	para "Take a look at"
	line "this!"
	
	para "It's literally"
	line "nothing…"
	
	para "Why is this dis-"
	line "play empty?"
	done

MuseumPokefanFScript:
	showtextfaceplayer MuseumPokefanFText
	turnobject LAST_TALKED, LEFT
	end

MuseumPokefanFText:
	text "Have you been to"
	line "the Ruins of Alph?"

	para "This panel matches"
	line "the stone puzzle."
	
	para "But I've only ever"
	line "seen this one."
	
	para "Are there more?"
	done

MuseumPokefanM1Script:
	showtextfaceplayer MuseumPokefanM1Text
	turnobject LAST_TALKED, RIGHT
	end
	
MuseumPokefanM1Text:
	text "My friend is super"
	line "into this stuff."
	
	para "Me?"
	
	para "I got roped into"
	line "this, and now I'm"
	
	para "waiting until it's"
	line "over."
	done
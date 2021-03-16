FishGroups: ; 92488
	dbbwww 65 percent + 1, 85 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super,				.Shore_Master
	dbbwww 75 percent + 1, 85 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super,				.Ocean_Master
	dbbwww 70 percent + 1, 85 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super,				.Lake_Master
	dbbwww 55 percent + 1, 65 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super,				.Pond_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super,			.Dratini_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super,	.Qwilfish_Swarm_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super,	.Remoraid_Swarm_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super,			.Gyarados_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super,			.Dratini_2_Master
	dbbwww 60 percent + 1, 70 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super,		.WhirlIslands_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super,			.Qwilfish_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super,			.Remoraid_Master
	dbbwww 60 percent + 1, 70 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super,	.Qwilfish_NoSwarm_Master

.Shore_Old: ; 924e3
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.Shore_Good: ; 924ec
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     0, 0
.Shore_Super: ; 924f8
	db  40 percent,     KRABBY,     35
	db  70 percent,     0, 1
	db  90 percent + 1, KRABBY,     35
	db 100 percent,     KINGLER,    35
.Shore_Master:
	db  35 percent,		0, 22
	db  70 percent,     LANTURN,  50
	db  90 percent + 1, OCTILLERY,    50
	db 100 percent,     KINGDRA,    50	

.Ocean_Old:
	db   5 percent, 	CHINCHOU,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Ocean_Good: ; 9250d
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     0, 2
.Ocean_Super: ; 92519
	db  40 percent,     CHINCHOU,   35
	db  70 percent,     0, 3
	db  90 percent + 1, TENTACRUEL, 35
	db 100 percent,     LANTURN,    35
.Ocean_Master:
	db  25 percent,     OMASTAR,    50
	db  50 percent,     KABUTOPS,   50
	db  90 percent + 1, 0, 23
	db 100 percent,     KINGDRA,    50	

.Lake_Old: ; 92525
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Lake_Good: ; 9252e
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     0, 4
.Lake_Super: ; 9253a
	db  40 percent,     POLIWAG,    35
	db  70 percent,     0, 5
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     POLIWHIRL,  35
.Lake_Master:
;	db  20 percent,     MAGIKARP,   45
	db  40 percent,     REMORAID,   50
	db  70 percent,     GOLDUCK,    50
	db  90 percent + 1, QWILFISH,   50
	db 100 percent,     GYARADOS,   50

.Pond_Old: ; 92546
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Pond_Good: ; 9254f
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     0, 6
.Pond_Super: ; 9255b
	db  40 percent,     POLIWAG,    35
	db  70 percent,     0, 7
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     POLIWHIRL,  35
.Pond_Master:
;	db  20 percent,     MAGIKARP,   45
	db  40 percent,     REMORAID,   50
	db  70 percent,     QWILFISH,   50
	db  90 percent + 1, POLIWRATH,  50
	db 100 percent,     POLITOED,   50
	
.Dratini_Old: ; 92567
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_Good: ; 92570
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     0, 8
.Dratini_Super: ; 9257c
	db  40 percent,     MAGIKARP,   35
	db  70 percent,     0, 9
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     DRAGONAIR,  30

.Qwilfish_Swarm_Old: ; 92588
	db  70 percent + 1, MAGIKARP,   5
	db  85 percent + 1, MAGIKARP,   5
	db 100 percent,     QWILFISH,   5
.Qwilfish_Swarm_Good: ; 92591
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     QWILFISH,   20
	db  90 percent + 1, QWILFISH,   20
	db 100 percent,     0, 10
.Qwilfish_Swarm_Super: ; 9259d
	db  40 percent,     QWILFISH,   35
	db  70 percent,     0, 11
	db  90 percent + 1, QWILFISH,   35
	db 100 percent,     QWILFISH,   35

.Remoraid_Swarm_Old: ; 925a9
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     REMORAID,   10
.Remoraid_Swarm_Good: ; 925b2
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     REMORAID,   20
	db  90 percent + 1, REMORAID,   20
	db 100 percent,     0, 12
.Remoraid_Swarm_Super: ; 925be
	db  40 percent,     REMORAID,   35
	db  70 percent,     0, 13
	db  90 percent + 1, REMORAID,   35
	db 100 percent,     REMORAID,   35

.Gyarados_Old: ; 925ca
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good: ; 925d3
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     0, 14
.Gyarados_Super: ; 925df
	db  40 percent,     MAGIKARP,   35
	db  70 percent,     0, 15
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     MAGIKARP,   35
.Gyarados_Master:
	db  30 percent,     MAGIKARP,   50
	db  70 percent,     GYARADOS,   50
	db  90 percent + 1, GYARADOS,   50
	db 100 percent,     GYARADOS,   60

.Dratini_2_Old: ; 925eb
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good: ; 925f4
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     0, 16
.Dratini_2_Super: ; 92600
	db  40 percent,     MAGIKARP,   30
	db  70 percent,     0, 17
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     DRAGONAIR,  35
.Dratini_Master:
.Dratini_2_Master:
	db  40 percent,     GYARADOS,   50
	db  70 percent,     KINGDRA,    50
	db  90 percent + 1, DRAGONAIR,  50
	db 100 percent,     DRAGONAIR,  54
	
.WhirlIslands_Old: ; 9260c
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.WhirlIslands_Good: ; 92615
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     0, 18
.WhirlIslands_Super: ; 92621
	db  40 percent,     KRABBY,     35
	db  70 percent,     0, 19
	db  90 percent + 1, KINGLER,    35
	db 100 percent,     SEADRA,     35
.WhirlIslands_Master:
	db  25 percent,     OMASTAR,    50
	db  50 percent,     KABUTOPS,   50
	db  90 percent + 1, 0, 24
	db 100 percent,     KINGDRA,    50	

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old: ; 9262d
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good: ; 92636
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, TENTACOOL,  20
	db 100 percent,     0, 20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super: ; 92642
	db  40 percent,     TENTACOOL,  35
	db  70 percent,     0, 21
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     QWILFISH,   35
.Qwilfish_Master:
.Qwilfish_Swarm_Master:
.Qwilfish_NoSwarm_Master:
	db  40 percent,     TENTACRUEL, 50
	db  70 percent,     QWILFISH,   50
	db  90 percent + 1, QWILFISH,   50
	db 100 percent,     QWILFISH,   60
	
.Remoraid_Old: ; 9264e
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Remoraid_Good: ; 92657
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     0, 6
.Remoraid_Super: ; 92663
	db  40 percent,     POLIWHIRL,    35
	db  70 percent,     0, 7
	db  90 percent + 1, MAGIKARP,   35
	db 100 percent,     REMORAID,   35
.Remoraid_Master:
.Remoraid_Swarm_Master:
	db  40 percent,     TENTACRUEL, 60
	db  70 percent,     REMORAID,   50
	db  90 percent + 1, REMORAID,   50
	db 100 percent,     OCTILLERY,  50	
; 9266f

TimeFishGroups: ; 9266f
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ;0
	db CORSOLA,    35,  STARYU,     35 ;1
	db SHELLDER,   20,  SHELLDER,   20 ;2
	db SHELLDER,   35,  SHELLDER,   35 ;3
	db PSYDUCK,    20,  PSYDUCK,    20 ;4
	db PSYDUCK,    35,  PSYDUCK,    35 ;5
	db POLIWAG,    20,  POLIWAG,    20 ;6
	db POLIWHIRL,  35,  POLIWHIRL,  35 ;7
	db DRATINI,    20,  DRATINI,    20 ;8
	db DRATINI,    35,  DRATINI,    35 ;9
	db QWILFISH,   20,  QWILFISH,   20 ;10
	db QWILFISH,   35,  QWILFISH,   35 ;11
	db REMORAID,   20,  REMORAID,   20 ;12
	db REMORAID,   35,  REMORAID,   35 ;13
	db GYARADOS,   20,  GYARADOS,   20 ;14
	db GYARADOS,   35,  GYARADOS,   35 ;15
	db DRATINI,    20,  DRATINI,    20 ;16
	db DRATINI,    30,  DRATINI,    30 ;17
	db HORSEA,     20,  HORSEA,     20 ;18
	db HORSEA,     35,  HORSEA,     35 ;19
	db TENTACOOL,  20,  TENTACOOL,  20 ;20
	db TENTACRUEL, 35,  TENTACRUEL, 35 ;21
	db CORSOLA,	   50,  STARMIE, 	50 ;22
	db CLOYSTER,   50,  STARMIE,	50 ;23
	db SEADRA,	   50,  SEADRA,		50 ;24
	
; 926c7


FishItems:
	db PEARL
	db BIG_PEARL
	db BOTTLE_CAP
	db PEARL_STRING

	const_def
	const BATTLETOWER_NO_CHALLENGE
	const BATTLETOWER_SAVED_AND_LEFT
	const BATTLETOWER_CHALLENGE_IN_PROGESS
	const BATTLETOWER_WON_CHALLENGE
	const BATTLETOWER_RECEIVED_REWARD

BATTLETOWER_NUM_TRAINERS EQU 120

BATTLETOWER_NUM_SETS EQU 10
BATTLETOWER_NROFPKMNS EQU 3
BATTLETOWER_NROFTRAINERS EQU 7
BATTLETOWER_NRMONSPERLEVELBRACKET EQU BATTLETOWER_NROFPKMNS * BATTLETOWER_NROFTRAINERS
BATTLETOWER_PADDING_SIZE EQU $24
BATTLE_TOWER_STRUCT_LENGTH EQU $e0 ; NAME_LENGTH + 3 * (PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH) + BATTLETOWER_PADDING_SIZE

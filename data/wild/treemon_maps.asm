treemon_map: macro
	map_id \1
	db  \2 ; treemon set
endm

TreeMonMaps:
	treemon_map ROUTE_26, 11 ; 4 ; 11 ;  all badges
	treemon_map ROUTE_27, 11 ; 4 ; 11 ; all badges
	treemon_map ROUTE_28, 12 ; 1 ; 12 ; all badges
	treemon_map ROUTE_29, 3 ; new bark town
	treemon_map ROUTE_30, 3 ; 2 badges cherrygrove
	treemon_map ROUTE_31, 3 ; 2 badges cherrygrove/violet
	treemon_map ROUTE_32, 4 ; 2 badgesviolet
	treemon_map ROUTE_33, 2 ; 2 badgesunion cave/azalea
	treemon_map ROUTE_34, 3 ; 2 badges illex forest/ goldenrod
	treemon_map ROUTE_35, 3 ; 2 badges goldenrod
	treemon_map ROUTE_36, 3 ; 2 badges violet 
	treemon_map ROUTE_37, 10 ; 3 ; 3 badges ecruteak
	treemon_map ROUTE_38, 10 ; 3 ; 10 ; 3 badges ecruteak/olivine
	treemon_map ROUTE_39, 10 ; 3 ; 10 ; 3 badges  ecruteak/olivine
	treemon_map ROUTE_40, 0 ; sea
	treemon_map ROUTE_41, 0 ; sea
	treemon_map ROUTE_42, 9 ; 2 ; 9 ; ecruteak/mohagony
	treemon_map ROUTE_43, 8 ; 5 ; 8 ; mohagony/lake of rage
	treemon_map ROUTE_44, 7 ; 1 ; 7 ; mohagony/ice path
	treemon_map ROUTE_45, 7 ; 1 ; 7 ; blackthorn
	treemon_map ROUTE_46, 1 ; violet/dark cave
	treemon_map ROUTE_47, 13 ; 1 ; 13 ; cianwood
	treemon_map ROUTE_48, 13 ; 1 ; cianwood
	treemon_map NEW_BARK_TOWN, 3 ; 2 badge
	treemon_map CHERRYGROVE_CITY, 4 ; 2 badge
	treemon_map VIOLET_CITY, 4 ; 2 badge
	treemon_map AZALEA_TOWN, 2 ; 2 badge
	treemon_map CIANWOOD_CITY, 0 ;5  badge
	treemon_map GOLDENROD_CITY, 0 ; 3 badge
	treemon_map OLIVINE_CITY, 0 ; 4 badge
	treemon_map ECRUTEAK_CITY, 10 ; 4 badge
	treemon_map MAHOGANY_TOWN, 13 ; 6 badge
	treemon_map LAKE_OF_RAGE, 8 ; 5 ; 6 badge
	treemon_map BLACKTHORN_CITY, 0 ; 7/8 badge
	treemon_map SILVER_CAVE_OUTSIDE, 12 ; 1 ; 16 badge
	treemon_map ILEX_FOREST, 6 ; 2 badge
	treemon_map MURKY_SWAMP, 14 ; 6 ; 4 badge
	treemon_map YELLOW_FOREST, 14 ; 6 ; 5 badge
	treemon_map ROUTE_32_COAST, 4 ; 2 badge
	treemon_map ROUTE_34_COAST, 3 ; 2 badge
	treemon_map ROUTE_35_COAST, 15 ; 3 ; 2 badge
	treemon_map NOISY_FOREST, 3 ; 8 badges
	treemon_map VIOLET_OUTSKIRTS, 15 ; 3 ; 4 badge
	db -1

RockMonMaps:
	treemon_map ROUTE_19, 16
	treemon_map ROUTE_40, 16
	treemon_map OLIVINE_CITY, 16	
	treemon_map CIANWOOD_CITY, 16
	treemon_map VERMILION_CITY, 16
	treemon_map RUINS_OF_ALPH_OUTSIDE, 16
	treemon_map STORMY_BEACH, 16
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, 16
	treemon_map UNION_CAVE_B1F_SOUTH, 16
	treemon_map SLOWPOKE_WELL_B1F, 16
	treemon_map BURNED_TOWER_B1F, 16
	treemon_map GIOVANNIS_CAVE, 16
	db -1

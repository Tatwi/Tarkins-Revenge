-- GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

object_building_player_player_npc_theater_tatooine = object_building_player_shared_player_npc_theater_tatooine:new {
	lotSize = 10,
	baseMaintenanceRate = 94,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	childObjects = {
		{templateFile = "object/tangible/sign/all_sign_street_s01.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -15.167, z = 2.128, y = 76.71, ox = 0, oy = 1, oz = 0, ow = 0, cellid = 8, containmentType = -1},
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/all_sign_street_s01.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign4"},
		{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s02.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s02"},
		{templateFile = "object/tangible/tcg/series5/house_sign_tcg_standing.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_standing"},
		{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_standing"},
		{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_standing_sign"},
		{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_standing.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_standing_sign"},
		{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_standing.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_standing_sign"},
		{templateFile = "object/tangible/tarkin_custom/decorative/tatooine_marker_sign.iff", x = 23.9719, z = 0.6, y = -31.0844, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:col_tatooine_vistas_marker_01"},
	},
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_medium_style_01.iff",
	structureFootprintFileName = "footprint/building/player/shared_player_house_generic_medium_style_01.sfp",
	length = 3,
	width = 4
}

ObjectTemplates:addTemplate(object_building_player_player_npc_theater_tatooine, "object/building/player/player_npc_theater_tatooine.iff")

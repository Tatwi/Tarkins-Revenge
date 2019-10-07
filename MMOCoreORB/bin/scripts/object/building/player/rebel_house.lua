object_building_player_rebel_house = object_building_player_shared_rebel_house:new {
	lotSize = 2,
	baseMaintenanceRate = 34,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_large_style_01.iff",
	length = 1,
	width = 1,
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 15},
		{"private_safe_logout", 1}
	},
	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 0.0187063, z = 25.4031, y = -2.17012, ow = -4.37114e-08, ox = 0, oz = 0, oy = 1, cellid = 2, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_up.iff", x = 0.00665405, z = 0.936668, y = -1.07417, ow = 1, ox = 0, oz = 0, oy = 0, cellid = 1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_down.iff", x = 0.00665405, z = 25.1731, y = -1.07417, ow = 1, ox = 0, oz = 0, oy = 0, cellid = 1, containmentType = -1},
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1}
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 1.53, z = 0.66, y = 8.14, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 1.53, z = 0.66, y = 8.14, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 1.53, z = 0.66, y = 8.14, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 1.53, z = 0.66, y = 8.14, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign4"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cantina.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_cantina"},		
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_capitol.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_capitol"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cloning.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_cloning"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_combat.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_combat"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_commerce.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_commerce"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_hospital.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_hospital"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_hotel.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_hotel"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_parking.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_parking"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_shuttle.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_shuttle"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_starport.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_starport"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_theater.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_theater"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_university.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_university"},
	{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s01.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s01"},
	{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s02.iff", x = 1.53, z = 0.66, y = 8.14, ox = 0, oy = 0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s02"},
	{templateFile = "object/tangible/tcg/series5/house_sign_tcg_hanging.iff", x = 0, z = 6.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_hanging"},
	{templateFile = "object/tangible/tcg/series5/house_sign_tcg_standing.iff", x = 1.53, z = 0.66, y = 8.14, ox = 0, oy = 0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_standing"},
	{templateFile = "object/tangible/sign/player/efol_hanging_sign_01.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_hanging"},
	{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 1.53, z = 0.66, y = 8.14, ox = 0, oy = 0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_standing"},
	{templateFile = "object/tangible/sign/player/house_address_halloween_sign.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_hanging_sign"},
	{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 1.53, z = 0.66, y = 8.14, ox = 0, oy = 0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_standing_sign"},
	{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_hanging.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_hanging_sign"},
	{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_standing.iff", x = 1.53, z = 0.66, y = 8.14, ox = 0, oy = 0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_standing_sign"},
	{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_hanging.iff", x = 0, z = 5.9, y = 5.870141, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_hanging_sign"},
	{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_standing.iff", x = 1.53, z = 0.66, y = 8.14, ox = 0, oy = 0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_standing_sign"},
	{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_01.iff", x = 0, z = 6.2, y = 5.30014, ox = 0, oy = -0.642788, oz = 0, ow =  0.766045, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_01"},
	{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_02.iff", x = 0, z = 6.2, y = 5.30014, ox = 0, oy = -0.642788, oz = 0, ow =  0.766045, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_02"},
	{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_03.iff", x = 0, z = 6.2, y = 5.30014, ox = 0, oy = -0.642788, oz = 0, ow =  0.766045, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_03"},	
	}

}

ObjectTemplates:addTemplate(object_building_player_rebel_house, "object/building/player/rebel_house.iff")

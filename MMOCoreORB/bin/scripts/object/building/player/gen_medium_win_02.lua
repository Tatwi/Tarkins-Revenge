object_building_player_generic_medium_window_s02 = object_building_player_shared_generic_medium_window_s02:new {
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
			{templateFile = "object/tangible/sign/player/house_address.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 4.91345, z = 0.875001, y = 5.69312, ow = -1.78814e-07, ox = 0, oz = 0, oy = -1, cellid = 1, containmentType = -1}
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign4"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cantina.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_cantina"},		
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_capitol.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_capitol"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cloning.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_cloning"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_combat.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_combat"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_commerce.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_commerce"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_hospital.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_hospital"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_hotel.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_hotel"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_parking.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_parking"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_shuttle.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_shuttle"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_starport.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_starport"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_theater.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_theater"},
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_university.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_university"},
		{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s01.iff", x = 4.94404, z = 2.75, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s01"},
		{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s02.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s02"},
		{templateFile = "object/tangible/tcg/series5/house_sign_tcg_hanging.iff", x = 4.94404, z = 3.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_hanging"},
		{templateFile = "object/tangible/tcg/series5/house_sign_tcg_standing.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = -0.707107, oz = 0, ow =  -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_standing"},
		{templateFile = "object/tangible/sign/player/efol_hanging_sign_01.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_hanging"},
		{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_standing"},
		{templateFile = "object/tangible/sign/player/house_address_halloween_sign.iff", x = 4.94404, z = 2.75, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_hanging_sign"},
		{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = -0.707107, oz = 0, ow =  -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_standing_sign"},
		{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_hanging.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_hanging_sign"},
		{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_standing.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_standing_sign"},
		{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_hanging.iff", x = 4.94404, z = 2.25, y = 7.65987, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_hanging_sign"},
		{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_standing.iff", x = 11.79, z = 0.5, y = 11.64, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_standing_sign"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_01.iff", x = 5.12014, z = 0.4, y = 7.24484, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_01"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_02.iff", x = 5.12014, z = 0.4, y = 7.24484, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_02"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_03.iff", x = 5.12014, z = 0.4, y = 7.24484, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_03"},
	}

}

ObjectTemplates:addTemplate(object_building_player_generic_medium_window_s02, "object/building/player/generic_medium_window_s02.iff")

object_building_player_commando_house = object_building_player_shared_commando_house:new {
	lotSize = 2,
	baseMaintenanceRate = 16,
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
                        {templateFile = "object/tangible/sign/player/house_address.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0 , cellid = -1, containmentType = -1}, --Default House Sign
                        {templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 0.00543379, z = 0.5, y = -6.25, ox = 0, oy = 0, oz = 0, ow = 1, cellid = 1, containmentType = -1}, --House control terminal
	},
        shopSigns = {
        {templateFile = "object/tangible/sign/player/house_address.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
        {templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 5.25, z = 0.25, y = 8.75, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign1"},
        {templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 5.25, z = 0.25, y = 9.0, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign2"},
        {templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 5.25, z = 0.25, y = 8.75, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign3"},
        {templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 5.25, z = 0.25, y = 9.0, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign4"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cantina.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_cantina"},		
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_capitol.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_capitol"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cloning.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_cloning"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_combat.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_combat"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_commerce.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_commerce"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_hospital.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_hospital"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_hotel.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_hotel"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_parking.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_parking"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_shuttle.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_shuttle"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_starport.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_starport"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_theater.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_theater"},
	{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_university.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:municipal_sign_hanging_university"},
	{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s01.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s01"},
	{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s02.iff", x = 5.25, z = 0.25, y = 9.0, ox = -0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_s02"},
	{templateFile = "object/tangible/tcg/series5/house_sign_tcg_hanging.iff", x = 3.325, z = 4, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_hanging"},
	{templateFile = "object/tangible/tcg/series5/house_sign_tcg_standing.iff", x = 5.25, z = 0.25, y = 9.0, ox = -0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_sign_tcg_standing"},
	{templateFile = "object/tangible/sign/player/efol_hanging_sign_01.iff", x = 3.325, z = 2.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_hanging"},
	{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 5.25, z = 0.25, y = 9.0, ox = 0, oy = 0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_standing"},
	{templateFile = "object/tangible/sign/player/house_address_halloween_sign.iff", x = 3.325, z = 3.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_hanging_sign"},
	{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 5.25, z = 0.25, y = 9.0, ox = 0, oy = -0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_standing_sign"},
	{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_hanging.iff", x = 3.325, z = 3.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_hanging_sign"},
	{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_standing.iff", x = 5.25, z = 0.25, y = 9.0, ox = 0, oy = -0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_imp_standing_sign"},
	{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_hanging.iff", x = 3.325, z = 3.5, y = 6.125, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_hanging_sign"},
	{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_standing.iff", x = 5.25, z = 0.25, y = 9.0, ox = 0, oy = -0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:empire_day_reb_standing_sign"},
	{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_01.iff", x = -3.44648, z = 0.8, y = 6.48483, ox = -0.0737723, oy = -0.702166, oz = 0.0494658, ow = 0.706452, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_01"},
	{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_02.iff", x = -3.44648, z = 0.8, y = 6.48483, ox = -0.0737723, oy = -0.702166, oz = 0.0494658, ow = 0.706452, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_02"},
	{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_03.iff", x = -3.44648, z = 0.8, y = 6.48483, ox = -0.0737723, oy = -0.702166, oz = 0.0494658, ow = 0.706452, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_banner_03"},
        }
}

ObjectTemplates:addTemplate(object_building_player_commando_house, "object/building/player/commando_house.iff")

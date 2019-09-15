object_building_player_yoda_house = object_building_player_shared_yoda_house:new {
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
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 3.95, z = 2.7, y =7.62, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -1.86753, z = 1.11599, y = -5.27244, ow = -0.707107, ox = 0, oz = 0, oy = -0.707107, cellid = 1, containmentType = -1},
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 3.95, z = 2.7, y = 7.62, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 3.95, z = 1.19, y = 8.22, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 3.95, z = 1.19, y = 8.22, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 3.95, z = 1.19, y = 8.22, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 3.95, z = 1.19, y = 8.22, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign4"},
		{templateFile = "object/tangible/tarkin_custom/decorative/mun_kash_signpost_primitive_pointer_small_s01.iff", x = 3.95585, z = 1.2, y = 7.23207, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:mun_kash_signpost_primitive_pointer_small_s01"},
		{templateFile = "object/tangible/tarkin_custom/decorative/mun_kash_signpost_refined_pointer_small_s01.iff", x = 3.95585, z = 1.2, y = 7.23207, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:mun_kash_signpost_refined_pointer_small_s01"},
		{templateFile = "object/tangible/sign/player/wod_sm_hanging_sign_01.iff", x = 3.97693, z = 3.4, y = 7.09135, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_hanging"},
		{templateFile = "object/tangible/sign/player/wod_sm_standing_sign_01.iff", x = 3.93396, z = 1.19, y = 6.89119, ox = 0, oy = -1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_standing"},
		{templateFile = "object/tangible/sign/player/efol_hanging_sign_01.iff", x = 3.836, z = 2.5, y = 7.33124, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_hanging"},
		{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 3.95, z = 1.19, y = 8.22, ox = 0, oy = -0.707107, oz = 0, ow =  0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_standing"},
		{templateFile = "object/tangible/sign/player/house_address_halloween_sign.iff", x = 3.90405, z = 2.91, y = 7.73863, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_hanging_sign"},
		{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 4.27234, z = 1.19, y = 9.33782, ox = 0, oy = -0.707107, oz = 0, ow =  -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_standing_sign"},
	}
}

ObjectTemplates:addTemplate(object_building_player_yoda_house, "object/building/player/yoda_house.iff")

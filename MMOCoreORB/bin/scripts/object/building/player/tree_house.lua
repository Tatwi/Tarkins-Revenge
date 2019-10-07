object_building_player_tree_house = object_building_player_shared_tree_house:new {
	lotSize = 2,
	baseMaintenanceRate = 34,
	allowedZones = {"corellia", "dantooine", "naboo", "rori", "talus"},
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
			{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -21.677, z = 0.972775, y = 7.74971, ow = 1, ox = 0, oz = 0, oy = 0, cellid = 1, containmentType = -1},
			{templateFile = "object/tangible/sign/player/house_address.iff", x = -2, z = 6, y = 12.53, ow = 0, ox = 0, oz = 0, oy = 1, cellid = -1, containmentType = -1},
	},
	shopSigns = {
			{templateFile = "object/tangible/sign/player/house_address.iff", x = -2, z = 6, y = 12.53, ow = 0, ox = 0, oz = 0, oy = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
			{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = -0.383887, z = 0.972775, y = 12.098, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign1"},
			{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = -0.383887, z = 0.972775, y = 12.098, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign2"},
			{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = -0.383887, z = 0.972775, y = 12.098, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign3"},
			{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = -0.383887, z = 0.972775, y = 12.098, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:shop_sign4"},
		{templateFile = "object/tangible/tarkin_custom/decorative/mun_kash_signpost_primitive_pointer_small_s01.iff", x = -6.33791, z = 3, y = 11.8732, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:mun_kash_signpost_primitive_pointer_small_s01"},
		{templateFile = "object/tangible/tarkin_custom/decorative/mun_kash_signpost_refined_pointer_small_s01.iff", x = -6.33791, z = 3, y = 11.8732, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:mun_kash_signpost_refined_pointer_small_s01"},
		{templateFile = "object/tangible/sign/player/wod_sm_hanging_sign_01.iff", x = -1.35847, z = 6.01, y = 12.1889, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_hanging"},
		{templateFile = "object/tangible/sign/player/wod_sm_standing_sign_01.iff", x = 5.50355, z = 0.79, y = 12.5882, ox = 0, oy = 0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:wod_sign_standing"},
		{templateFile = "object/tangible/sign/player/efol_hanging_sign_01.iff", x = -6.35938, z = 4.39, y = 12.5366, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_hanging"},
		{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 5.50355, z = 0.79, y = 12.5882, ox = 0, oy = -0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:efol_sign_standing"},
		{templateFile = "object/tangible/sign/player/house_address_halloween_sign.iff", x = -1.36181, z = 6.01, y = 12.3889, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_hanging_sign"},
		{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 5.50355, z = 0.79, y = 12.5882, ox = 0, oy = 0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@static_item_n:item_special_sign_halloween_standing_sign"},	
	}
}

ObjectTemplates:addTemplate(object_building_player_tree_house, "object/building/player/tree_house.iff")

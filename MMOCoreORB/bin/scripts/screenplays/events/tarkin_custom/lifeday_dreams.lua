--/////////////////////////////////////////////////////////
--//   		   	Life Day Dreams	 		 //
--//     	a Tarkin's Revenge Screenplay	         //
--//    	         November 2019			 //
--/////////////////////////////////////////////////////////
--// Players awaken to find themselves somewhere in a    //
--// dream land, where they discover that they are a     //
--// young Wookiee, about to complete a timeless  	 //
--// coming-of-age ritual.  Also, there are presents.  	 //
--/////////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")
includeFile("../custom_scripts/screenplays/tools/tarkin_lib.lua")

LifeDayDreamsScreenplay = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "LifeDayDreamsScreenplay"
}

--Config Values
local eventStartTime = os.time{ year=2019, month=12, day=14, hour=0, min=0 } --Go live: 12/14/2019, midnight
local eventCleanupTime = os.time{ year=2020, month=1, day=1, hour=23, min=59 }  --End: 1/1/2020, 11:59 PM

local dreamPoint = { planet = "dreamland", x = 0 , y = 0 }
local defaultBindPoint = { planet = "naboo", x = -4861, y = 4164, cellID = 0 }
local kashyyykPoint = { planet = "kashyyyk_main", x = 221.815, y = -140.184, cellID = 0 }
local shorbaccaPoint = { planet = "kashyyyk_main", x = 273.893, y = -190.955, cellID = 0 }

local nabooLifeDayTree = { planet = "naboo", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_tree_dressed_usable.iff", x = -4870.83, z = 6, y = 4152.01, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 }

local nabooLifeDayTreePresents = {
	{ planet = "naboo", itemPath = "object/tangible/storyteller/prop/pr_lifeday_presents.iff", x = -4870.8, z = 6, y = 4153.24, ow = -0.608761, ox = 0, oy = -0.793353, oz = 0, cellID = 0 },
	{ planet = "naboo", itemPath = "object/tangible/storyteller/prop/pr_lifeday_presents.iff", x = -4872.52, z = 6, y = 4152.21, ow = -1, ox = 0, oy = 8.74228e-08, oz = 0, cellID = 0 },
	{ planet = "naboo", itemPath = "object/tangible/storyteller/prop/pr_lifeday_presents.iff", x = -4871.64, z = 6, y = 4151.24, ow = 0.707106, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{ planet = "naboo", itemPath = "object/tangible/storyteller/prop/pr_lifeday_presents.iff", x = -4869.79, z = 6, y = 4151.79, ow = 0.34202, ox = 0, oy = -0.939693, oz = 0, cellID = 0 },
}

local wookieeMobiles = {
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_greeter", x = 227.575, z = 31.9876, y = -141.633, facing = -79, cellID = 0, moodstring = ""},
	{ planet = "kashyyyk_main", mobile = "lifeday_chief_attilochit", x = 249.767, z = 32, y = -179.438, facing = -1, cellID = 0, moodstring = "" },
	{ planet = "kashyyyk_main", mobile = "lifeday_guard_01", x = 252.234, z = 32, y = -181.257, facing = -24, cellID = 0, moodstring = "" },
	{ planet = "kashyyyk_main", mobile = "lifeday_guard_02", x = 247.082, z = 32, y = -181.24, facing = 24, cellID = 0, moodstring = "" },
	{ planet = "kashyyyk_main", mobile = "lifeday_storyteller", x = 315.474, z = 32, y = -198.709, facing = 8, cellID = 0, moodstring = "npc_sitting_chair" },
	{ planet = "kashyyyk_main", mobile = "lifeday_questgiver", x = 274.56, z = 32, y = -191.768, facing = -34, cellID = 0, moodstring = "" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_01", x = 287.064, z = 32, y = -190.199, facing = -12, cellID = 0, moodstring = "conversation" },	
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_02", x = 287.829, z = 32, y = -188.761, facing = -117, cellID = 0, moodstring = "conversation" },	
	{ planet = "kashyyyk_main", mobile = "lifeday_guard_03", x = 226.214, z = 32.3632, y = -157.649, facing = 54, cellID = 0, moodstring = "" },	
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_03", x = 282.389, z = 32, y = -148.654, facing = -148, cellID = 0, moodstring = "conversation" },	
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_04", x = 281.338, z = 32, y = -150.611, facing = 3, cellID = 0, moodstring = "conversation" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_05", x = 280.13, z = 32, y = -149.292, facing = 95, cellID = 0, moodstring = "conversation" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_child", x = -596.026, z = 18.8235, y = -145.897, facing = 90, cellID = 0, moodstring = "sad" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_child_02", x = -593.52, z = 18.8235, y = -145.795, facing = -81, cellID = 0, moodstring = "sad" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_father", x = -595.082, z = 18.8235, y = -144.376, facing = 159, cellID = 0, moodstring = "sad" },	
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_04", x = -588.304, z = 18.4583, y = -103.769, facing = -51, cellID = 0, moodstring = "conversation" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_05", x = -591.798, z = 18.6951, y = -100.244, facing = 135, cellID = 0, moodstring = "conversation" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_01", x = -555.943, z = 18.7043, y = -71.7428, facing = 86, cellID = 0, moodstring = "conversation" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_03", x = -551.4, z = 18.8234, y = -71.2573, facing = -94, cellID = 0, moodstring = "conversation" },
	{ planet = "kashyyyk_main", mobile = "lifeday_wookiee_civilian_02", x = -548.65, z = 18.9875, y = -132.43, facing = -59, cellID = 0, moodstring = "npc_sitting_chair" },
}

local kashSceneObjects = { 

	-- Reyyrua's Hut
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 315.474, z = 33, y = -198.709, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/storyteller/prop/pr_lifeday_fireplace_01.iff", x = 318.194, z = 33, y = -199.366, ow = 0.981627, ox = 0, oy = -0.190809, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_table.iff", x = 313.63, z = 33, y = -198.819, ow = 0.976296, ox = 0, oy = 0.21644, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/frn_kash_wookiee_loom.iff", x = 320.759, z = 33, y = -197.547, ow = 0.92388, ox = 0, oy = -0.382683, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/webweaver_blanket.iff", x = 317.33, z = 33, y = -197.311, ow = 0.979925, ox = 0, oy = -0.199368, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wookiee_totem_runner.iff", x = 317.258, z = 35.35, y = -199.87, ow = 0.976296, ox = 0, oy = -0.21644, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wookiee_totem_crafter.iff", x = 319.26, z = 35.35, y = -199.075, ow = 0.976296, ox = 0, oy = -0.21644, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_center_piece.iff", x = 316.918, z = 33.61, y = -200.033, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_prayer_mobile.iff", x = 315.332, z = 34.8, y = -188.403, ow = 0.976296, ox = 0, oy = -0.21644, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/lifeday/lifeday_incense_burner.iff", x = 311.823, z = 33, y = -197.314, ow = 0.382683, ox = 0, oy = -0.92388, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/lifeday/lifeday_painting_s02.iff", x = 310.551, z = 33, y = -193.762, ow = 0.615661, ox = 0, oy = 0.788011, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/decorative/event_lifeday07_plant.iff", x = 322.064, z = 34, y = -192.688, ow = 0.5373, ox = 0, oy = -0.843391, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/holiday/life_day/rewards_09/lifeday_decor_varactyl_nog.iff", x = 314.1, z = 33.77, y = -198.868, ow = -0.422618, ox = 0, oy = -0.906308, oz = 0, cellID = 0 },

	-- Chief Attilochit's Hut
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/scaly_divider.iff", x = 249.573, z = 33.2, y = -186.11, ow = 0.999962, ox = 0, oy = 0.0087265, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/decorative/event_wookiee_shield.iff", x = 251.157, z = 34.9, y = -186.131, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tcg/series5/consumable_klorri_clan_shield.iff", x = 248.216, z = 34.55, y = -186.058, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/weapon/melee/2h_sword/2h_sword_kashyyk.iff", x = 250.697, z = 35, y = -186.092, ow = 0.696364, ox = 0.122788, oy = -0.696364, oz = 0.122788, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/weapon/melee/sword/sword_blade_ryyk.iff", x = 249.525, z = 34.75, y = -186.087, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/weapon/melee/sword/ep3/sword_wookiee.iff", x = 248.691, z = 35.2, y = -186.06, ow = 0.696364, ox = 0.122788, oy = 0.696364, oz = -0.122788, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/weapon/melee/special/ep3/wookiee_knuckler.iff", x = 249.596, z = 36, y = -186.062, ow = 0.5, ox = 0.5, oy = -0.5, oz = 0.5, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/holiday/life_day/rewards_09/lifeday_lamp_01.iff", x = 249.896, z = 36.5, y = -180.231, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 249.723, z = 33.25, y = -185.309, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 256.238, z = 33.25, y = -180.236, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 255.801, z = 33.25, y = -178.294, ow = -0.573576, ox = 0, oy = 0.819152, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 255.816, z = 33.25, y = -182.409, ow = 0.819152, ox = 0, oy = -0.573576, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 243.233, z = 33.25, y = -180.099, ow = -0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 243.572, z = 33.25, y = -178.031, ow = -0.573577, ox = 0, oy = -0.819152, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/wke_ceremonial_chair.iff", x = 243.373, z = 33.25, y = -182.024, ow = -0.819152, ox = 0, oy = -0.573576, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/tatooine/uber_kash_bar_table.iff", x = 254.351, z = 33.25, y = -184.868, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/tatooine/uber_kash_bar_table.iff", x = 245.239, z = 33.25, y = -184.86, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_sordaan_hunting_trophy.iff", x = 249.803, z = 36.83, y = -186.116, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	
	--Shorbacca's Hut
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/tatooine/uber_kash_bar.iff", x = 270.305, z = 32.95, y = -192.683, ow = 0.350207, ox = 0, oy = -0.936672, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/frn_kash_hospital_bed.iff", x = 278.163, z = 32.95, y = -189.929, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/frn_kash_table_operating.iff", x = 276.045, z = 32.95, y = -185.605, ow = -0.173648, ox = 0, oy = -0.984808, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/tatooine/uber_kash_bar_shelf.iff", x = 275.773, z = 32.95, y = -194.015, ow = 0.953717, ox = 0, oy = -0.300706, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/item/kashyyyk/eqp_kash_mystic_tree_cure.iff", x = 269.223, z = 34.08, y = -193.907, ow = 0.906308, ox = 0, oy = -0.422618, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/black_potion.iff", x = 268.999, z = 34.08, y = -193.722, ow = 0.939693, ox = 0, oy = -0.34202, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/orange_potion.iff", x = 269.545, z = 34.08, y = -194.139, ow = 0.866025, ox = 0, oy = -0.5, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/purple_potion.iff", x = 269.795, z = 34.08, y = -194.24, ow = 0.819152, ox = 0, oy = -0.573576, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/red_potion.iff", x = 268.882, z = 34.08, y = -193.565, ow = 0.976296, ox = 0, oy = -0.21644, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/white_potion.iff", x = 269.635, z = 34.08, y = -194.105, ow = 0.965926, ox = 0, oy = -0.258819, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/cave_light.iff", x = 272.746, z = 35.95, y = -188.386, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/mystical_tome.iff", x = 274.816, z = 34.42, y = -194.424, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/item/kashyyyk/eqp_wookiee_tome_s01.iff", x = 275.227, z = 34.42, y = -193.999, ow = 0.906308, ox = 0, oy = -0.422618, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/mystical_tome_02.iff", x = 276.226, z = 34.42, y = -193.33, ow = 0.793353, ox = 0, oy = -0.608761, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/mystical_tome_03.iff", x = 275.666, z = 34.42, y = -193.653, ow = 0.382683, ox = 0, oy = -0.92388, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/loot/creature_loot/kashyyyk_loot/mystical_scroll.iff", x = 275.437, z = 34.81, y = -194.038, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/item/kashyyyk/eqp_wookiee_scroll_s01.iff", x = 275.894, z = 34.81, y = -193.668, ow = 0.642788, ox = 0, oy = -0.766044, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/tangible/quest/naboo_theed_xharnoh_plant.iff", x = 267.41, z = 33, y = -188.088, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },

	-- Kerritamba Village
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/tatooine/frn_tato_tbl_cafe_table_style_01.iff", x = -594.764, z = 18.8235, y = -145.714, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/furniture/all/frn_all_light_lamp_candlestick_tbl_s01.iff", x = -594.764, z = 19.5735, y = -145.714, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_roast_shatual.iff", x = -594.995, z = 19.5735, y = -145.457, ow = 0.976296, ox = 0, oy = -0.21644, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_jerba_cheese.iff", x = -594.387, z = 19.5735, y = -145.848, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_blumfruit.iff", x = -595.035, z = 19.5735, y = -145.957, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },


	--Lairs
	--Hracca
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_mouf.iff", x = 718, z = 24, y = -246, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_mouf.iff", x = 826, z = 23, y = -512, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_mouf.iff", x = 637, z = 35, y = -468, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_mouf.iff", x = 768, z = 23, y = -531, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },

	--Shadowlands
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_webweaver.iff", x = 216, z = 20.0306, y = 543, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_webweaver.iff", x = 150, z = 43.551, y = 670, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_webweaver.iff", x = -38.4391, z = 20.4152, y = 476.3, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_walluga.iff", x = 21, z = 66.6667, y = 522, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_walluga.iff", x = 319, z = 17.8762, y = 451, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_walluga.iff", x = 147, z = 6.80205, y = 769.877, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },

	--Etyyy
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_uller.iff", x = -544, z = 63.5294, y = 646, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_uller.iff", x = -856, z = 18.74, y = 487, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/item/lair_uller.iff", x = -707, z = 56.6755, y = 395, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
}

local boundaryObjects = {
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 1020, z = 45, y = 0, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 1020, z = 45, y = 380, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 1020, z = 45, y = 760, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 1020, z = 45, y = 833, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 1020, z = 45, y = -380, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 1020, z = 45, y = -632, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },

	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -1020, z = 45, y = 0, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -1020, z = 45, y = 380, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -1020, z = 45, y = 760, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -1020, z = 45, y = 833, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -1020, z = 45, y = -380, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -1020, z = 45, y = -632, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },

	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 0, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 380, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 760, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 832, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -380, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -760, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -832, z = 45, y = 1020, ow = -0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },	

	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 0, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 380, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 760, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = 832, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -380, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -760, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/static/structure/tatooine/wall_tatooine_large_style_8000.iff", x = -832, z = 45, y = -820, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },

	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 0, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 148, ow = 0.707107, ox = 0, oy = 0.707107, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 296, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 444, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 592, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 740, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 882, ow = 0.707107, ox = 0, oy = 0.707107, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = 1020, ow = 0.707107, ox = 0, oy = 0.707107, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -148, ow = 0.707107, ox = 0, oy = 0.707107, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -296, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -444, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -592, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -740, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -882, ow = 0.707107, ox = 0, oy = 0.707107, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1005, z = 45, y = -1020, ow = 0.707107, ox = 0, oy = 0.707107, cellID = 0 },

	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 0, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 148, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 296, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 444, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 592, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 740, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = 882, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 35, y = 1020, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 40, y = -148, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 39, y = -296, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = -444, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = -592, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1005, z = 45, y = -740, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0, cellID = 0 },

	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 0, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 148, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 296, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 444, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 592, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 740, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 882, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1020, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -148, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -296, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -444, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -592, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -740, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -882, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1020, z = 45, y = -805, ow = 0, ox = 0, oy = -1, oz = 0, cellID = 0 },

	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 0, z = 39, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 148, z = 39, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 296, z = 37, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 444, z = 37, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 592, z = 37, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 740, z = 37, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 882, z = 37, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = 1020, z = 37, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -148, z = 39, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -296, z = 38, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -444, z = 36, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -592, z = 35, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },	
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -740, z = 35, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -882, z = 35, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/poi_kash_all_treewall_lg_s01.iff", x = -1020, z = 35, y = 1005, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },

	--Starport Building
	{planet = "kashyyyk_main", itemPath = "object/building/kashyyyk/mun_kachirho_starport.iff", x = -669.6, z = 18.3235, y = -148.8, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },

	--Cloner Buildings
	{planet = "kashyyyk_main", itemPath = "object/building/military/outpost_cloning_facility.iff", x = 130.047, z = 19.5051, y = 131.398, ow = 0.999455, ox = 0, oy = -0.329994, oz = 0, cellID = 0 },
	{planet = "dreamland", itemPath = "object/building/military/outpost_cloning_facility.iff", x = 7599, z = 2.03338, y = 7599, ow = 0.715085, ox = 0, oy = -0.699038, oz = 0, cellID = 0 },

	--Portals
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_portal.iff", x = 186.122, z = 19.1712, y = -431.209, ow = 0.622515, ox = 0, oy = -0.782608, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_portal.iff", x = 415.018, z = 19.1526, y = 976.359, ow = 0.999657, ox = 0, oy = 0.0261769, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_portal.iff", x = -58.8527, z = 20.4, y = 843.86, ow = 0.986286, ox = 0, oy = 0.165048, oz = 0, cellID = 0 },
	{planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_portal.iff", x = -743.692, z = 17.4284, y = 258.11, ow = 0.927184, ox = 0, oy = 0.374607, oz = 0, cellID = 0 },
	{planet = "dreamland", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_portal.iff", x = 7592.45, z = 1.22753, y = 7599.14, ow = 0.702942, ox = 0, oy = 0.711247, oz = 0, cellID = 0 },
}	
	
local kashCreatures = {

	--Hracca
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 720.657, z = 23.9216, y = -240.455, facing = -131, cellID = 0, timer = 120},
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 713.327, z = 22.4959, y = -237.462, facing = -80, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 713.135, z = 23.7531, y = -252.136, facing = 13, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 724.957, z = 24.7059, y = -255.244, facing = 42, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 731.937, z = 24.3137, y = -231.064, facing = -14, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 830.825, z = 23.9216, y = -511.946, facing = 0, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 827.112, z = 23.9216, y = -501.144, facing = -66, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 819.582, z = 23.9216, y = -509.463, facing = -67, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 826.354, z = 23.9216, y = -525.435, facing = -141, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 832.854, z = 23.9216, y = -507.059, facing = 86, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 632.862, z = 21.7518, y = -417.647, facing = -136, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 645.773, z = 39.6868, y = -476.05, facing = 116, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 642.502, z = 35.2927, y = -461.605, facing = -5, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 631.272, z = 32.3959, y = -461.951, facing = 92, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 650.489, z = 40.988, y = -477.882, facing = -164, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 757.621, z = 23.9216, y = -515.138, facing = -24, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 775.071, z = 23.9216, y = -532.959, facing = -79, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 774.07, z = 23.9216, y = -545.805, facing = -112, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 747.516, z = 23.9216, y = -524.582, facing = -50, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_mouf", x = 759.114, z = 23.9216, y = -504.73, facing = -78, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 768.664, z = 23.9216, y = -355.242, facing = 76, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 770.634, z = 23.9216, y = -336.296, facing = 12, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 739.199, z = 23.9216, y = -341.399, facing = -99, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 777.75, z = 23.9216, y = -366.971, facing = 54, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 853.44, z = 56.6142, y = -270.666, facing = 141, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 865.99, z = 56.0784, y = -300.136, facing = -156, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 833.713, z = 55.6005, y = -318.74, facing = -115, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 814.132, z = 63.5294, y = -256.533, facing = -38, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 592.141, z = 69.3719, y = -305.73, facing = 70, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 583.532, z = 68.1312, y = -280.906, facing = -28, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 555.608, z = 70.9935, y = -298.819, facing = -121, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = 590.772, z = 68.5331, y = -338.357, facing = 179, cellID = 0, timer = 120 },

	--Shadowlands
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 142.114, z = 7.21567, y = 775.14, facing = -49, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 137.548, z = 7.07455, y = 752.151, facing = -164, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 145.003, z = 6.49447, y = 756.968, facing = 73, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 147.176, z = 7.76324, y = 798.473, facing = -46, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 307.316, z = 18.8021, y = 453.291, facing = -80, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 323.27, z = 18.6432, y = 434.18, facing = 138, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 333.71, z = 18.244, y = 441.748, facing = 32, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 315.307, z = 19.2152, y = 470.25, facing = -23, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 27.1198, z = 66.6667, y = 522.787, facing = 72, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 23.0991, z = 66.6667, y = 511.081, facing = -160, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 6.59775, z = 66.6667, y = 515.514, facing = -74, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_walluga", x = 12.2674, z = 66.5939, y = 532.239, facing = 38, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 215.882, z = 20.4526, y = 551.813, facing = -90, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 227.104, z = 21.1888, y = 545.078, facing = 117, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 217.727, z = 20.1172, y = 531.259, facing = -146, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 199.344, z = 19.6078, y = 532.69, facing = -67, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 187.258, z = 19.6078, y = 546.883, facing = 12, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 149.915, z = 42.8209, y = 675.082, facing = -47, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 133.857, z = 46.795, y = 672.976, facing = -97, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 129.679, z = 48.2558, y = 658.965, facing = -165, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 140.316, z = 42.8059, y = 686.886, facing = 74, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = 171.958, z = 49.9215, y = 689.895, facing = -168, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = -37.1694, z = 20.9586, y = 469.045, facing = -176, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = -49.7359, z = 21.1268, y = 457.473, facing = -148, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = -28.079, z = 20.8832, y = 487.498, facing = -4, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = -35.0735, z = 20.7474, y = 493.522, facing = -48, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_webweaver", x = -19.3416, z = 21.3031, y = 500.039, facing = 132, cellID = 0, timer = 120 },

	--Etyyy
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -542.92, z = 63.5417, y = 637.721, facing = 57, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -528.898, z = 64.6601, y = 646.424, facing = -70, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -536.713, z = 64.0094, y = 662.119, facing = 146, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -556.511, z = 63.5294, y = 663.925, facing = -142, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -564.027, z = 63.42, y = 641.738, facing = 51, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -856, z = 18.8235, y = 480, facing = 0, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -869.001, z = 18.4314, y = 494.594, facing = -30, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -858.44, z = 18.7775, y = 498.215, facing = 85, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -842.811, z = 18.7837, y = 494.649, facing = -119, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -868.834, z = 18.8235, y = 469.935, facing = -136, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -708.656, z = 56.7043, y = 386.407, facing = 130, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -699.142, z = 56.8741, y = 395.996, facing = -15, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -709.555, z = 56.6602, y = 404.645, facing = -43, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -725.857, z = 55.3153, y = 402.693, facing = 121, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_uller", x = -699.401, z = 55.6161, y = 374.049, facing = 65, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -668.712, z = 36.3079, y = 728.286, facing = -73, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -680.953, z = 36.3621, y = 706.377, facing = -82, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -710.65, z = 36.0855, y = 718.729, facing = 38, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -710.711, z = 36.2142, y = 746.08, facing = 112, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -688.004, z = 36.4677, y = 741.159, facing = 20, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -844.991, z = 36.2174, y = 616.582, facing = -83, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -867.755, z = 36.1434, y = 611.442, facing = -80, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -866.708, z = 36.1778, y = 642.888, facing = -22, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -895.653, z = 36.4388, y = 610.814, facing = -64, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -845.093, z = 36.4706, y = 643.432, facing = -119, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -862.392, z = 18.8235, y = 928.411, facing = -105, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -876.296, z = 18.8235, y = 905.282, facing = -149, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -862.713, z = 18.7102, y = 889.283, facing = -55, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -843.489, z = 18.8235, y = 910.715, facing = -107, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_bolotaur", x = -882.339, z = 18.781, y = 948.355, facing = 68, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -657.12, z = 18.8235, y = 614.568, facing = -139, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -643.893, z = 18.8235, y = 638.307, facing = 28, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -672.164, z = 18.8235, y = 634.275, facing = -77, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -640.479, z = 18.8235, y = 652.45, facing = 37, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -930.659, z = 36.3799, y = 782.804, facing = 52, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -926.18, z = 36.0784, y = 765.513, facing = -110, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -908.617, z = 36.4706, y = 783.098, facing = 97, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -926.871, z = 36.1995, y = 798.236, facing = -13, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -540.244, z = 35.3705, y = 805.162, facing = 21, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -546.146, z = 35.4121, y = 776.406, facing = -162, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -566.822, z = 35.4056, y = 809.533, facing = -26, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kkorrwrot", x = -542.063, z = 36.2041, y = 830.714, facing = 90, cellID = 0, timer = 120 },

	--Rryatt
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 803, z = 18.8235, y = 720, facing = 0, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 812.033, z = 18.8235, y = 714.904, facing = -123, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 811.18, z = 18.8235, y = 728.49, facing = 3, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 798.288, z = 18.8235, y = 711.47, facing = 97, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 807.503, z = 18.8235, y = 701.197, facing = 50, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 701.022, z = 48.2353, y = 588.051, facing = 24, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 701.097, z = 48.2353, y = 594.645, facing = 0, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 704.058, z = 48.2353, y = 582.329, facing = 171, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 693.14, z = 53.233, y = 571.221, facing = 63, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 715.359, z = 48.2353, y = 569.291, facing = -42, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 939.877, z = 52.9835, y = 564.274, facing = 72, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 929.174, z = 52.9957, y = 572.618, facing = -91, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 945.921, z = 52.978, y = 562.742, facing = 117, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 956.925, z = 53.2499, y = 591.849, facing = 0, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_minstyngar", x = 924.921, z = 53.0936, y = 593.189, facing = 144, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 741.319, z = 45.0098, y = 899.884, facing = 79, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 742.534, z = 43.433, y = 907.883, facing = -90, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 732.228, z = 44.4223, y = 912.244, facing = 99, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 749.614, z = 41.7374, y = 914.481, facing = 21, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 720.256, z = 49.1511, y = 898.548, facing = -174, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 676.478, z = 18.8235, y = 702.846, facing = -164, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 664.633, z = 18.8235, y = 702.182, facing = -66, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 668.701, z = 18.8235, y = 715.562, facing = 18, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 674.872, z = 19.5061, y = 683.365, facing = -112, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 675.857, z = 18.8235, y = 721.813, facing = 41, cellID = 0, timer = 120 },

	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 934.693, z = 38.1754, y = 902.806, facing = -56, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 922.799, z = 38.4059, y = 896.9, facing = -116, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 928.696, z = 38.2675, y = 879.793, facing = 158, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 901.529, z = 38.3586, y = 882.369, facing = -83, cellID = 0, timer = 120 },
	{ planet = "kashyyyk_main", mobile = "lifeday_kash_bantha", x = 890.914, z = 38.4314, y = 910.806, facing = 168, cellID = 0, timer = 120 },

	--Slavers
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -393.498, z = 18.8779, y = 660.284, facing = 161, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -399.917, z = 20.1226, y = 655.208, facing = 118, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -387.834, z = 18.8235, y = 647.824, facing = -45, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -379.246, z = 19.2157, y = 740.533, facing = 107, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -380.577, z = 19.2157, y = 731.728, facing = 52, cellID = 0, timer = 300 },

	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -108.22, z = 17.8327, y = 106.635, facing = 115, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -81.6952, z = 18.8155, y = 105.969, facing = 80, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -75.0761, z = 19.0576, y = 89.2047, facing = 2, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = -97.7053, z = 17.9228, y = 88.0465, facing = 156, cellID = 0, timer = 300 },

	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 575.91, z = 24.7059, y = 742.917, facing = 53, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 585.992, z = 24.7059, y = 726.167, facing = 66, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 601.897, z = 24.7059, y = 750.61, facing = 24, cellID = 0, timer = 300 },

	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 534.671, z = 30.9804, y = 464.319, facing = 150, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 523.968, z = 30.9804, y = 476.519, facing = -100, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 530.543, z = 30.5953, y = 459.373, facing = 122, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 547.9, z = 30.9804, y = 487.143, facing = -158, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 569.599, z = 30.5555, y = 465.009, facing = 147, cellID = 0, timer = 300 },
	{ planet = "kashyyyk_main", mobile = "lifeday_trando_slaver", x = 580.617, z = 30.9804, y = 444.909, facing = 143, cellID = 0, timer = 300 },
}

local questItems = {
	{ item = "mouf_paw", itemPath = "object/tangible/tarkin_custom/decorative/quest/mouf_paw.iff", quantity = 3 },
	{ item = "webweaver_eye", itemPath = "object/tangible/tarkin_custom/decorative/quest/webweaver_eye.iff", quantity = 3 },
	{ item = "walluga_ear", itemPath = "object/tangible/tarkin_custom/decorative/quest/walluga_ear.iff", quantity = 4 },
	{ item = "uller_horn", itemPath = "object/tangible/tarkin_custom/decorative/quest/uller_horn.iff", quantity = 4 },
	{ item = "minstyngar_horn", itemPath = "object/tangible/tarkin_custom/decorative/quest/minstyngar_horn.iff", quantity = 4 },
	{ item = "kkorrwrot_leg", itemPath = "object/tangible/tarkin_custom/decorative/quest/kkowrrot_leg.iff", quantity = 5 },
	{ item = "kashyyyk_bantha_pelt", itemPath = "object/tangible/tarkin_custom/decorative/quest/kashyyyk_bantha_pelt.iff", quantity = 5 },
	{ item = "bolotaur_fang", itemPath = "object/tangible/tarkin_custom/decorative/quest/bolotaur_fang.iff", quantity = 5 },
}

local questHeads = {
	{ item = "mouf_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/mouf_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_mouf.iff" },
	{ item = "webweaver_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/webweaver_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_webweaver.iff" },
	{ item = "walluga_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/walluga_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_walluga.iff" },
	{ item = "uller_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/uller_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_uller.iff" },
	{ item = "minstyngar_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/minstyngar_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_minstyngar.iff" },
	{ item = "kkorrwrot_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/kkowrrot_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_kkorrwrot.iff" },
	{ item = "kashyyyk_bantha_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/kashyyyk_bantha_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_bantha_kash.iff" },
	{ item = "bolotaur_head", itemPath = "object/tangible/tarkin_custom/decorative/quest/bolotaur_head.iff", rewardPath = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_trophy_bolotaur.iff" },
}

local mounts = {
	{ mountName = "bantha", mountPath = "object/tangible/loot/loot_schematic/be_kashyyyk_bantha_schematic.iff" },
	{ mountName = "bolotaur", mountPath = "object/tangible/loot/loot_schematic/be_bolotaur_schematic.iff" },
	{ mountName = "mouf", mountPath = "object/tangible/loot/loot_schematic/be_mouf_schematic.iff" },
}

local nest = { planet = "kashyyyk_main", itemPath = "object/tangible/tarkin_custom/decorative/holiday/life_day_nest.iff", x = -352.038, z = 8.20258, y = 751.216, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 }

local lifeDayGiftOptions = {
	{ path = "object/tangible/tarkin_custom/statted/lifeday_reward_home_for_the_holidays.iff" }, 
	{ path = "object/tangible/tarkin_custom/statted/lifeday_reward_sea_recycler.iff" },
	{ path = "object/tangible/loot/loot_schematic/chest_of_holding_schematic.iff" },
	{ path = "object/tangible/tarkin_custom/decorative/holiday/life_day_tarkin_custom_painting_01.iff" },
	{ path = "object/tangible/tarkin_custom/decorative/holiday/life_day_tarkin_custom_painting_02.iff" },
	{ path = "object/tangible/tarkin_custom/decorative/holiday/tarkin_custom_lifeday_ornament_2019.iff" },
	{ path = "object/tangible/holiday/life_day/life_day_tree.iff" },
}

local paintingRewards = {
	{ path = "object/tangible/tarkin_custom/decorative/holiday/tarkin_custom_lifeday_painting_01.iff" },
 	{ path = "object/tangible/tarkin_custom/decorative/holiday/tarkin_custom_lifeday_painting_02.iff" },
	{ path = "object/tangible/tarkin_custom/decorative/holiday/tarkin_custom_lifeday_painting_03.iff" },
	{ path = "object/tangible/tarkin_custom/decorative/holiday/tarkin_custom_lifeday_painting_04.iff" },
	{ path = "object/tangible/tarkin_custom/decorative/holiday/tarkin_custom_lifeday_painting_05.iff" },
}

local ashes = "object/tangible/tarkin_custom/decorative/holiday/life_day_ashes.iff"
local emptyAshes = "object/tangible/tarkin_custom/decorative/holiday/life_day_ashes_empty.iff"
local feather = "object/tangible/tarkin_custom/decorative/holiday/life_day_feather.iff"
local egg = "object/tangible/tarkin_custom/decorative/holiday/life_day_egg.iff"
local crackedEgg = "object/tangible/tarkin_custom/decorative/holiday/life_day_egg_cracked.iff"
local pipe = "object/tangible/tarkin_custom/decorative/holiday/life_day_wookiee_pipe.iff"
local rewardTrophy = "object/tangible/furniture/ep3_rewards/ep3_kash_reward_sordaan_hunting_trophy.iff"
local rewardPoem = "object/tangible/tarkin_custom/decorative/holiday/life_day_poem.iff"
local rewardEggnog = "object/tangible/holiday/life_day/rewards_09/lifeday_decor_varactyl_nog.iff"
local rewardShield = "object/tangible/tarkin_custom/decorative/holiday/life_day_rorryyhn_shield.iff"
local lifeDayOrb = "object/tangible/tarkin_custom/decorative/holiday/mystical_lifeday_orb.iff"
local lifeDayGift = "object/tangible/tarkin_custom/decorative/holiday/life_day_2019_gift.iff"
local lifeDayBadge = "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_lifeday_2019.iff"

registerScreenPlay("LifeDayDreamsScreenplay", true)

function LifeDayDreamsScreenplay:start()
	--Spawn the Boundary Objects
	for i = 1, #boundaryObjects, 1 do
		local pObject = spawnSceneObject(boundaryObjects[i].planet, boundaryObjects[i].itemPath, boundaryObjects[i].x, boundaryObjects[i].z, boundaryObjects[i].y, boundaryObjects[i].cellID, boundaryObjects[i].ow, boundaryObjects[i].ox, boundaryObjects[i].oy, boundaryObjects[i].oz)
	end

	--Schedule Event Start
	if (os.difftime(eventStartTime, os.time()) >= 0) then
		if (not hasServerEvent("LifeDayDreamsScreenplayStart")) then
			local startEventID = createServerEvent(os.difftime(eventStartTime, os.time())*1000, "LifeDayDreamsScreenplay", "startLifeDayEvent", "LifeDayDreamsScreenplayStart")
		else
			rescheduleServerEvent("LifeDayDreamsScreenplayStart", os.difftime(eventStartTime, os.time())*1000)
		end
	elseif (self:isLifeDayDreamsEventEnabled()== true) then
		self:startLifeDayEvent()
	end

	--Schedule Event Cleanup
	if (os.difftime(eventCleanupTime, os.time()) >= 0) then
		if (not hasServerEvent("LifeDayDreamsScreenplayCleanup")) then
			local cleanupEventID = createServerEvent(os.difftime(eventCleanupTime, os.time())*1000, "LifeDayDreamsScreenplay", "cleanupLifeDayEvent", "LifeDayDreamsScreenplayCleanup")
		else
			rescheduleServerEvent("LifeDayDreamsScreenplayCleanup", os.difftime(eventCleanupTime, os.time())*1000)
		end
	end	
end

function LifeDayDreamsScreenplay:startLifeDayEvent()
	if (isZoneEnabled("naboo")) then
		self:spawnNabooTree()
	end

	if (isZoneEnabled("kashyyyk_main")) then	
		self:spawnMobiles()
		self:spawnKashSceneObjects()
		self:spawnNestArea()
	end
end

function LifeDayDreamsScreenplay:cleanupLifeDayEvent()
	-- Despawn the objects
	self:despawnNabooTree()
	self:despawnKashSceneObjects()
	self:despawnNestArea()
	
	-- Despawn the mobiles
	self:despawnMobiles()
	
	-- Remove all quest statuses
	local participantList = getQuestStatus("lifeday_dreams:participantList")
	local list = ""
	
	if (participantList ~= nil and participantList ~= "") then
		list = TarkinLib:splitString(participantList, ",")
		for i = 1, #list, 1 do

			local playerID = tostring(list[i])
			local pPlayer = getSceneObject(playerID)

			removeQuestStatus("lifeday_dreams:removalList:" .. playerID)
			removeQuestStatus("lifeday_dreams:numGifts:" .. playerID)

			if (pPlayer ~= nil) then
				self:clearBindPointData(pPlayer)
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayDreamsStatus")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayClaimedGift")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitQuest")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "inNestArea")
				deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "birdID")

				for i=1, #questItems, 1 do
					local item = questItems[i].item
					deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. item)
				end
				
				for i=1, #questHeads, 1 do
					local head = questHeads[i].item					
					deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredHead:" .. head)
				end	
			end
		end
	end

	removeQuestStatus("lifeday_dreams:participantList")
end

function LifeDayDreamsScreenplay:spawnNabooTree()
	--Spawn the tree
	local pTree = spawnSceneObject(nabooLifeDayTree.planet, nabooLifeDayTree.itemPath, nabooLifeDayTree.x, nabooLifeDayTree.z, nabooLifeDayTree.y, nabooLifeDayTree.cellID, nabooLifeDayTree.ow, nabooLifeDayTree.ox, nabooLifeDayTree.oy, nabooLifeDayTree.oz)
    writeData("LifeDayDreamsScreenplay:nabooLifeDayTree", SceneObject(pTree):getObjectID())
	
	--Spawn the presents
	for i = 1, #nabooLifeDayTreePresents, 1 do
		local pObject = spawnSceneObject(nabooLifeDayTreePresents[i].planet, nabooLifeDayTreePresents[i].itemPath, nabooLifeDayTreePresents[i].x, nabooLifeDayTreePresents[i].z, nabooLifeDayTreePresents[i].y, nabooLifeDayTreePresents[i].cellID, nabooLifeDayTreePresents[i].ow, nabooLifeDayTreePresents[i].ox, nabooLifeDayTreePresents[i].oy, nabooLifeDayTreePresents[i].oz)
        writeData("LifeDayDreamsScreenplay:present:" .. i, SceneObject(pObject):getObjectID())
	end	
end

function LifeDayDreamsScreenplay:spawnKashSceneObjects()
	--Spawn the decorative objects
	for i = 1, #kashSceneObjects, 1 do
		local pObject = spawnSceneObject(kashSceneObjects[i].planet, kashSceneObjects[i].itemPath, kashSceneObjects[i].x, kashSceneObjects[i].z, kashSceneObjects[i].y, kashSceneObjects[i].cellID, kashSceneObjects[i].ow, kashSceneObjects[i].ox, kashSceneObjects[i].oy, kashSceneObjects[i].oz)
        writeData("LifeDayDreamsScreenplay:kashSceneObject:" .. i, SceneObject(pObject):getObjectID())
	end
end

function LifeDayDreamsScreenplay:spawnMobiles()
	-- Spawn Kashyyyk Wookiees
	for i=1, #wookieeMobiles, 1 do
		local pMobile = spawnMobile(wookieeMobiles[i].planet, wookieeMobiles[i].mobile, wookieeMobiles[i].timer, wookieeMobiles[i].x, wookieeMobiles[i].z, wookieeMobiles[i].y, wookieeMobiles[i].facing, wookieeMobiles[i].cellID)
		if (pMobile ~= nil) then
			writeData("LifeDayDreamsScreenplay:mobile:"..tostring(i),SceneObject(pMobile):getObjectID())
			if (wookieeMobiles[i].moodstring ~= "") then
				self:setMoodString(pMobile, wookieeMobiles[i].moodstring)	
			end
		
			-- Set up one Wookiee to bark a message upon the player's first entry to Kashyyyk
			if (wookieeMobiles[i].mobile == "lifeday_wookiee_greeter") then
				local pActiveArea = spawnActiveArea(SceneObject(pMobile):getZoneName(), "object/active_area.iff", SceneObject(pMobile):getWorldPositionX(), SceneObject(pMobile):getWorldPositionZ(), SceneObject(pMobile):getWorldPositionY(), 50, wookieeMobiles[i].cellID)
				if pActiveArea ~= nil then
					createObserver(ENTEREDAREA, "LifeDayDreamsScreenplay", "notifyEnteredKashyyyk", pActiveArea)
				end
			end
		end			
	end
	
	--Spawn Kashyyyk Creatures
	for i=1, #kashCreatures, 1 do
		local pSpawner = spawnMobile(kashCreatures[i].planet, kashCreatures[i].mobile, kashCreatures[i].timer, kashCreatures[i].x, kashCreatures[i].z, kashCreatures[i].y, kashCreatures[i].facing, kashCreatures[i].cellID)

		local zPos = getTerrainHeight(pSpawner, kashCreatures[i].x, kashCreatures[i].y)
		local pCreature = spawnMobile(kashCreatures[i].planet, kashCreatures[i].mobile, kashCreatures[i].timer, kashCreatures[i].x, zPos, kashCreatures[i].y, kashCreatures[i].facing, kashCreatures[i].cellID)
		SceneObject(pSpawner):destroyObjectFromWorld()	
		if (pCreature ~= nil) then
			writeData("LifeDayDreamsScreenplay:creature:"..tostring(i),SceneObject(pCreature):getObjectID())
			AiAgent(pCreature):setAiTemplate("")
		end
	end
end

function LifeDayDreamsScreenplay:spawnNestArea()
	if (isZoneEnabled(nest.planet)) then
		local pNestArea = spawnActiveArea(nest.planet, "object/active_area.iff", nest.x, nest.z, nest.y, 100, nest.cellID)
		if pNestArea ~= nil then
			createObserver(ENTEREDAREA, "LifeDayDreamsScreenplay", "notifyEnteredNestArea", pNestArea)
			createObserver(EXITEDAREA, "LifeDayDreamsScreenplay", "notifyExitedNestArea", pNestArea)
 			writeData("LifeDayDreamsScreenplay:LifeDayNestArea", SceneObject(pNestArea):getObjectID())		
		end
	end
end

function LifeDayDreamsScreenplay:despawnNabooTree()
	-- Tree itself
	local treeID = readData("LifeDayDreamsScreenplay:nabooLifeDayTree")
	if ((treeID ~= nil) and (getSceneObject(treeID) ~= nil)) then
		local pTree = getSceneObject(treeID)
    		deleteData("LifeDayDreamsScreenplay:nabooLifeDayTree")
       		SceneObject(pTree):destroyObjectFromWorld()
		SceneObject(pTree):destroyObjectFromDatabase()
	end
	
	-- Presents
	for i = 1, #nabooLifeDayTreePresents, 1 do
		local presentID = readData("LifeDayDreamsScreenplay:present:"..tostring(i))
       	if ((presentID ~= nil) and (getSceneObject(presentID) ~= nil)) then
        	local pPresent = getSceneObject(presentID)
    		deleteData("LifeDayDreamsScreenplay:present:"..tostring(i))
       	 	SceneObject(pPresent):destroyObjectFromWorld()
		SceneObject(pPresent):destroyObjectFromDatabase()
		end
	end		
end

function LifeDayDreamsScreenplay:despawnKashSceneObjects()
	for i = 1, #kashSceneObjects, 1 do
		local objectID = readData("LifeDayDreamsScreenplay:kashSceneObject:"..tostring(i))
       	if ((objectID ~= nil) and (getSceneObject(objectID) ~= nil)) then
        	local pObject = getSceneObject(objectID)
    		deleteData("LifeDayDreamsScreenplay:kashSceneObject:"..tostring(i))
       	 	SceneObject(pObject):destroyObjectFromWorld()
		SceneObject(pObject):destroyObjectFromDatabase()
		end
	end
end

function LifeDayDreamsScreenplay:despawnMobiles()
	-- Despawn Kashyyyk Wookiees
	for i = 1, #wookieeMobiles, 1 do
		local mobileID = readData("LifeDayDreamsScreenplay:mobile:"..tostring(i))
       		if ((mobileID ~= nil) and (getSceneObject(mobileID) ~= nil)) then
        		local pMobile = getSceneObject(mobileID)
    			deleteData("LifeDayDreamsScreenplay:mobile:"..tostring(i))
       	 		SceneObject(pMobile):destroyObjectFromWorld()
		end
	end
	
	-- Despawn Kashyyyk Creatures
	for i = 1, #kashCreatures, 1 do
		local creatureID = readData("LifeDayDreamsScreenplay:creature:"..tostring(i))
       		if ((creatureID ~= nil) and (getSceneObject(creatureID) ~= nil)) then
        		local pCreature = getSceneObject(creatureID)
    			deleteData("LifeDayDreamsScreenplay:creature:"..tostring(i))
       	 		SceneObject(pCreature):destroyObjectFromWorld()
		end
	end	
end

function LifeDayDreamsScreenplay:despawnNestArea()
	local nestAreaID = readData("LifeDayDreamsScreenplay:LifeDayNestArea")
	if ((nestAreaID ~= nil) and (getSceneObject(nestAreaID) ~= nil)) then
		local pNestArea = getSceneObject(nestAreaID)
    		deleteData("LifeDayDreamsScreenplay:LifeDayNestArea")
       		SceneObject(pNestArea):destroyObjectFromWorld()
		SceneObject(pNestArea):destroyObjectFromDatabase()
	end
end

function LifeDayDreamsScreenplay:writeToParticipantList(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local playerID = SceneObject(pPlayer):getObjectID()
	local list = getQuestStatus("lifeday_dreams:participantList")

	if (list == nil or list == "") then
		list = playerID
	else
		list = list .. "," .. playerID
	end

	setQuestStatus("lifeday_dreams:participantList", list)	
end

function LifeDayDreamsScreenplay:writeToRemovalList(pPlayer, pItem)
	if (pPlayer == nil or pItem == nil) then
		return
	end
	
	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local objectID = SceneObject(pItem):getObjectID()
	local list = getQuestStatus("lifeday_dreams:removalList:" .. playerID)

	if (list == nil or list == "") then
		list = objectID
	else
		list = list .. "," .. objectID
	end

	setQuestStatus("lifeday_dreams:removalList:" .. playerID, list)
end

function LifeDayDreamsScreenplay:isParticipant(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())	
	local participantList = getQuestStatus("lifeday_dreams:participantList")
	local list = ""
	
	if (participantList ~= nil and participantList ~= "") then
		list = TarkinLib:splitString(participantList, ",")
		for i = 1, #list, 1 do
			if (list[i] == playerID) then
				return true
			end
		end
	end
	
	return false
end

function LifeDayDreamsScreenplay:setBindPoint(pPlayer)
	if (LifeDayDreamsScreenplay:isLifeDayDreamsEventEnabled() == false or TarkinLib:isEligibleState(pPlayer) == false) then
		return
	end

	-- If the player is outside, and within city limits, set a bind point for the location where they stood when they traveled using the orb
	if (SceneObject(pPlayer):getParentID() == 0) then
		local cityRegionName = getCityRegionName(pPlayer)
		if (cityRegionName == "Coronet City" or cityRegionName == "Entha" or cityRegionName == "Theed City") then
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindPlanet", SceneObject(pPlayer):getZoneName())
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindXRef", SceneObject(pPlayer):getWorldPositionX())
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindYRef", SceneObject(pPlayer):getWorldPositionY())
			return	
		end
	end
	-- Otherwise, use default bind point
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindPlanet", defaultBindPoint.planet)
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindXRef", defaultBindPoint.x)
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindYRef", defaultBindPoint.y)
end

function LifeDayDreamsScreenplay:clearBindPointData(pPlayer)
	deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindPlanet")
	deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindXRef")
	deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindYRef")	
end

function LifeDayDreamsScreenplay:startDreamSequence(pPlayer)
	if (pPlayer == nil) then
		return
	end

	if (LifeDayDreamsScreenplay:isLifeDayDreamsEventEnabled() == false or TarkinLib:isEligibleState(pPlayer) == false) then
		return
	end
	
	local zone = dreamPoint.planet
	
	if (not isZoneEnabled(zone)) then
		printLuaError("Unable to switch zone for player " .. SceneObject(pPlayer):getObjectID() .. ".  Necessary zone was not enabled.")	
		return
	end

	local xRef = dreamPoint.x
	local yRef = dreamPoint.y
	local pSpawner = spawnSceneObject(zone, "object/tangible/spawning/quest_spawner.iff", xRef, 0, yRef, 0, 0)
	local spawnerX = SceneObject(pSpawner):getPositionX()	
	
	if (pSpawner == nil) then
		printLuaError("QuestSpawner:createQuestSpawner, unable to create spawner object.")
		return
	end

	local spawnPoint = getSpawnPoint(zone, xRef, yRef, -7500, 7500, true)

	if (spawnPoint == nil) then
		spawnPoint = { spawnerX, getTerrainHeight(pSpawner, xRef, yRef), yRef }
	end

	SceneObject(pPlayer):switchZone(zone, spawnPoint[1], spawnPoint[2], spawnPoint[3], 0)
	SceneObject(pSpawner):destroyObjectFromWorld()
	if (self:isParticipant(pPlayer) == false) then
		self:writeToParticipantList(pPlayer)
	end
	CreatureObject(pPlayer):setPosture(KNOCKEDDOWN)
	createEvent(7 * 1000, "LifeDayDreamsScreenplay", "sendFirstDreamMessage", pPlayer, "")
	createEvent(12 * 1000, "LifeDayDreamsScreenplay", "sendFirstDreamSui", pPlayer, "")
end

function LifeDayDreamsScreenplay:sendFirstDreamMessage(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("You awaken from what feels like a strange, far-away dream.  Mist surrounds you, and your future feels uncertain.  Something niggles at the back of your mind... A decision.  That's it.  You have an important decision to make.  But...what was it, again?  You think hard, trying to recall.")
	CreatureObject(pPlayer):setPosture(UPRIGHT)
end

function LifeDayDreamsScreenplay:sendFirstDreamSui(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("LifeDayDreamsScreenplay", "firstDreamSuiCallback")
	sui.setTitle("Choose:")
	sui.setPrompt("Do you wish to stay and further explore this unfamiliar land, or return to your normal life?")
	sui.setOkButtonText("Stay")
	sui.setCancelButtonText("Return")
	sui.sendTo(pPlayer)
end

function LifeDayDreamsScreenplay:firstDreamSuiCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		self:returnToBindPoint(pPlayer)
		return
	end
	
	if (pPlayer == nil) then
		return
	end
	
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayDreamsStatus", 0)
	self:travelKashyyyk(pPlayer)
end

function LifeDayDreamsScreenplay:travelKashyyyk(pPlayer)
	if (pPlayer == nil) then
		return
	end

	if (LifeDayDreamsScreenplay:isLifeDayDreamsEventEnabled() == false or TarkinLib:isEligibleState(pPlayer) == false) then
		return
	end
	
	if (not isZoneEnabled(kashyyykPoint.planet)) then
		printLuaError("Unable to switch zone for player " .. SceneObject(pPlayer):getObjectID() .. ".  Necessary zone was not enabled.")	
		return
	end
	
	SceneObject(pPlayer):switchZone(kashyyykPoint.planet, kashyyykPoint.x, 0, kashyyykPoint.y, 0)
end

function LifeDayDreamsScreenplay:returnToBindPoint(pPlayer)
	if (pPlayer == nil) then
		return
	end

	if (TarkinLib:isEligibleState(pPlayer) == false) then
		return
	end
	
	local zone = defaultBindPoint.planet
	local xRef = defaultBindPoint.x
	local yRef = defaultBindPoint.y
	
	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindPlanet") ~= nil and readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindPlanet") ~= "") then
		zone = readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindPlanet")
	end

	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindXRef") ~= nil and readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindXRef") ~= "") then
		xRef = readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindXRef")
	end

	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindYRef") ~= nil and readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindYRef") ~= "") then
		yRef = readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayPlayerBindYRef")
	end

	if (zone == nil or zone == "" or xRef == nil or xRef == "" or yRef == nil or yRef == "") then
		zone = defaultBindPoint.planet
		xRef = defaultBindPoint.x
		yRef = defaultBindPoint.y
	end
	
	if (not isZoneEnabled(zone)) then
		printLuaError("Unable to switch zone for player " .. SceneObject(pPlayer):getObjectID() .. ".  Necessary zone was not enabled.")	
		return
	end
	
	SceneObject(pPlayer):switchZone(zone, xRef, 0, yRef, 0)
end

function LifeDayDreamsScreenplay:notifyEnteredKashyyyk(pArea, pPlayer)
	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end
	--if it's the player's first time in Kashyyyk, a mobile barks out a message
	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayDreamsStatus") == "0") then
		local mobileID = readData("LifeDayDreamsScreenplay:mobile:1")
		local pBarker = getSceneObject(mobileID)

		if (pBarker ~= nil) then
			CreatureObject(pBarker):doAnimation("wave_greeting")
			spatialChat(pBarker, "@player_quest:lifeday_2019_greeting_bark") -- "Hello, young friend!  Chief Attilochit is waiting to speak to you, in his hut in the village.  You'd better hurry up and see him, you're late!"
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayDreamsStatus", 1)
		end
	end
	
	return 0
end

function LifeDayDreamsScreenplay:notifyEnteredNestArea(pArea, pPlayer)
	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end

	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "inNestArea", 1)

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "0") then
		CreatureObject(pPlayer):sendSystemMessage("Use the radial menu on Rorryyhn's ashes to scatter them in this area.")
	end

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "2") then
		self:spawnNest(pPlayer)
	end
	
	return 0
end

function LifeDayDreamsScreenplay:notifyExitedNestArea(pArea, pPlayer)
	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "2") then
		self:despawnNest(pPlayer)
	end
		
	deleteScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "inNestArea")

	return 0
end

function LifeDayDreamsScreenplay:endDreamSequence(pPlayer)
	if (pPlayer == nil) then
		return
	end

	if (TarkinLib:isEligibleState(pPlayer) == false) then
		return
	end
	
	local zone = dreamPoint.planet
	
	if (not isZoneEnabled(zone)) then
		printLuaError("Unable to switch zone for player " .. SceneObject(pPlayer):getObjectID() .. ".  Necessary zone was not enabled.")	
		return
	end

	local xRef = dreamPoint.x
	local yRef = dreamPoint.y
	local pSpawner = spawnSceneObject(zone, "object/tangible/spawning/quest_spawner.iff", xRef, 0, yRef, 0, 0)

	if (pSpawner == nil) then
		printLuaError("QuestSpawner:createQuestSpawner, unable to create spawner object.")
		return
	end

	local spawnPoint = getSpawnPoint(zone, xRef, yRef, -7500, 7500, true)

	if (spawnPoint == nil) then
		spawnPoint = { spawnerX, getTerrainHeight(pSpawner, xRef, yRef), yRef }
	end

	SceneObject(pPlayer):switchZone(zone, spawnPoint[1], spawnPoint[2], spawnPoint[3], 0)
	SceneObject(pSpawner):destroyObjectFromWorld()
	createEvent(7 * 1000, "LifeDayDreamsScreenplay", "sendEndDreamMessage", pPlayer, "")
	createEvent(12 * 1000, "LifeDayDreamsScreenplay", "sendEndDreamSui", pPlayer, "")
end

function LifeDayDreamsScreenplay:sendEndDreamMessage(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("The pull of the real world is strong... This dream is ending, and you know you must awaken and go back.  Deep down, you know you may never return to this dream-Kashyyyk once you leave this final time.")
end

function LifeDayDreamsScreenplay:sendEndDreamSui(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("LifeDayDreamsScreenplay", "endDreamSuiCallback")

	sui.setTitle("Choose:")
	sui.setPrompt("Do you wish to wish to wake up and return to your normal life, or do you want to remain in the Kashyyyk dreamland a while longer?")
	sui.setOkButtonText("Return To The Real World")
	sui.setCancelButtonText("Stay On Kashyyyk")
	sui.sendTo(pPlayer)
end

function LifeDayDreamsScreenplay:endDreamSuiCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		self:travelKashyyyk(pPlayer)
		return
	end
	
	if (pPlayer == nil) then
		return
	end
	
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayDreamsStatus", 2)
	local pBadge = giveItem(pInventory, lifeDayBadge, -1)
	if (pBadge ~= nil) then
		CreatureObject(pPlayer):sendSystemMessage("A Life Day reward badge has been placed in your inventory!")
	end
	self:returnToBindPoint(pPlayer)
end

function LifeDayDreamsScreenplay:giveAshes(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end
	
	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full to receive Rorryyhn's ashes.  Make some room, and try again.")
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local playerID = CreatureObject(pPlayer):getObjectID()
	local pAshes = giveItem(pInventory, ashes, -1)

	if (pAshes ~= nil) then
		local waypointID = PlayerObject(pGhost):addWaypoint("kashyyyk_main", "Scatter Rorryyhn's Ashes", "", -404, 735, WAYPOINTYELLOW, true, true, 0)
		writeData(playerID .. ":ashesWaypointID", waypointID)

		if (waypointID ~= nil) then
			CreatureObject(pPlayer):sendSystemMessage("Rorryyhn's ashes have been placed in your inventory. Proceed to the waypoint to scatter them over his favorite hunting grounds.")
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 0)
		else
			SceneObject(pAshes):destroyObjectFromWorld()
			SceneObject(pAshes):destroyObjectFromDatabase()			
		end
	end
end

function LifeDayDreamsScreenplay:assignBirdHunt(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local playerID = SceneObject(pPlayer):getObjectID()
	local waypointID = PlayerObject(pGhost):addWaypoint("kashyyyk_main", "Search for the Shyyyo Bird", "", -404, 735, WAYPOINTYELLOW, true, true, 0)
	if (waypointID ~= nil) then
		writeData(playerID .. ":nestWaypointID", waypointID)
	end
end

function LifeDayDreamsScreenplay:hatchShyyyoBird(pPlayer)
	if (pPlayer == nil) then
		return
	end

	CreatureObject(pPlayer):sendSystemMessage("The egg begins to quake and shake in your hands.  A crack splits across it, and before you know it, a baby Shyyyo bird emerges.")	

	local randX = getRandomNumber(0, 4)
	local pShyyyoBird = spawnBaby("kashyyyk_main", "shyyyo_bird", -598 + randX, 18.8235, -131, 175, 0)
	
	if (pShyyyoBird ~= nil) then
		CreatureObject(pShyyyoBird):setOptionBit(NONE)

		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
		if (pInventory ~= nil) then
			local pEgg = getContainerObjectByTemplate(pInventory, egg, true)
			if (pEgg ~= nil) then
				SceneObject(pEgg):destroyObjectFromWorld()
				SceneObject(pEgg):destroyObjectFromDatabase()
				local pCrackedEgg = giveItem(pInventory, crackedEgg, -1)
			end
		end

		birdID = SceneObject(pShyyyoBird):getObjectID()
		local pPetBird = forceTameBaby(pPlayer, birdID, false)
		if (pPetBird == nil) then
			local pBirdArea = spawnActiveArea("kashyyyk_main", "object/active_area.iff", SceneObject(pShyyyoBird):getWorldPositionX(), SceneObject(pShyyyoBird):getWorldPositionZ(), SceneObject(pShyyyoBird):getWorldPositionY(), 50, 0) 
			if pBirdArea ~= nil then
				CreatureObject(pPlayer):sendSystemMessage("You were unable to tame the Shyyyo bird.  If you want to tame this bird, please correct the reason that you were unable to tame it before you leave the immediate area.  If you correct the issue, you will tame the bird as you leave.  If have not corrected it, the bird will go free.")	
				local playerID = SceneObject(pPlayer):getObjectID()
				createObserver(EXITEDAREA, "LifeDayDreamsScreenplay", "notifyExitedBirdArea", pBirdArea)
				writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "birdArea", SceneObject(pBirdArea):getObjectID())
				writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "birdID", birdID)		
			end
		else
			AiAgent(pShyyyoBird):setHomeLocation(SceneObject(pPlayer):getPositionX(), SceneObject(pPlayer):getPositionZ(), SceneObject(pPlayer):getPositionY(), SceneObject(pPlayer):getParent())
			AiAgent(pShyyyoBird):executeBehavior()
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 4)
		end
	end
end

function LifeDayDreamsScreenplay:notifyExitedBirdArea(pArea, pPlayer)
	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end
	
	areaID = SceneObject(pArea):getObjectID()
	if (tonumber(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "birdArea")) == areaID) then
		birdID = tonumber(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "birdID"))
		pBird = getSceneObject(birdID)
	
		if (pBird ~= nil) then
			local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
			if (pInventory ~= nil) then
				local pEgg = getContainerObjectByTemplate(pInventory, egg, true)
				if (pEgg ~= nil) then
					SceneObject(pEgg):destroyObjectFromWorld()
					SceneObject(pEgg):destroyObjectFromDatabase()
					local pCrackedEgg = giveItem(pInventory, crackedEgg, -1)
				end
			end

			if (not AiAgent(pBird):isPet()) then
				local pPetBird = forceTameBaby(pPlayer, birdID, false)	
				if (pPetBird == nil) then
					createEvent(1000, "LifeDayDreamsScreenplay", "destroyObject", pBird, "")
					createEvent(5000, "LifeDayDreamsScreenplay", "destroyObject", pArea, "")
					CreatureObject(pPlayer):sendSystemMessage("The Shyyyo bird has gone free.")
					writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 4)
					return 0
				else
					AiAgent(pPetBird):setHomeLocation(SceneObject(pPlayer):getPositionX(), SceneObject(pPlayer):getPositionZ(), SceneObject(pPlayer):getPositionY(), SceneObject(pPlayer):getParent())
					AiAgent(pPetBird):executeBehavior()
					createEvent(5000, "LifeDayDreamsScreenplay", "destroyObject", pArea, "")
					writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 4)
					return 0
				end										
			else
				createEvent(5000, "LifeDayDreamsScreenplay", "destroyObject", pArea, "")
				writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 4)
				return 0	
			end
		else
			createEvent(5000, "LifeDayDreamsScreenplay", "destroyObject", pArea, "")
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 4)
			return 0
		end
	end
	return 0
end

function LifeDayDreamsScreenplay:spawnNest(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local pNest = spawnSceneObject(nest.planet, nest.itemPath, nest.x, nest.z, nest.y, nest.cellID, nest.ow, nest.ox, nest.oy, nest.oz)
	if (pNest ~= nil) then
		writeData("LifeDayDreamsScreenplay:nest:" .. playerID, SceneObject(pNest):getObjectID())
		CreatureObject(pPlayer):sendSystemMessage("Have a look around the area and see if you can find more evidence of a Shyyyo bird.")
	end
end

function LifeDayDreamsScreenplay:searchNest(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") ~= "2") then
		return
	end
	
	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full to search this nest.  Make some room and try again.")
	else
		CreatureObject(pPlayer):sendSystemMessage("You reach into the nest and retrieve a large, still-warm egg.  Perhaps you should consult Arrithar about it.")
		local pEgg = giveItem(pInventory, egg, -1)
		if(pEgg ~= nil) then
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 3)
			local pGhost = CreatureObject(pPlayer):getPlayerObject()
			local playerID = CreatureObject(pPlayer):getObjectID()
			local oldWaypointID = readData(playerID .. ":nestWaypointID", waypointID)

			if oldWaypointID ~= "" and oldWaypointID ~= nil and oldWaypointID ~= 0 then
				PlayerObject(pGhost):removeWaypoint(oldWaypointID, true)
				deleteData(playerID .. ":nestWaypointID")
			end

			local newWaypointID = PlayerObject(pGhost):addWaypoint("kashyyyk_main", "Return to Arrithar", "", -595.082, -144.376, WAYPOINTYELLOW, true, true, 0)
			writeData(playerID .. ":arritharWaypointID", newWaypointID)	
			createEvent(1000, "LifeDayDreamsScreenplay", "despawnNest", pPlayer, "")	
		end
	end		
end

function LifeDayDreamsScreenplay:despawnNest(pPlayer)
	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local nestID = readData("LifeDayDreamsScreenplay:nest:" .. playerID)
	if ((nestID ~= nil) and (getSceneObject(nestID) ~= nil)) then
		local pNest = getSceneObject(nestID)
		if (pNest ~= nil) then 
    			deleteData("LifeDayDreamsScreenplay:nest:" .. playerID)
       			SceneObject(pNest):destroyObjectFromWorld()
			SceneObject(pNest):destroyObjectFromDatabase()
		end
	end
end

function LifeDayDreamsScreenplay:destroyObject(pObject)
	if (SceneObject(pObject):isPlayerCreature()) then
		return
	end

	SceneObject(pObject):destroyObjectFromWorld()

	if (not SceneObject(pObject):isCreatureObject()) then
		SceneObject(pObject):destroyObjectFromDatabase()
	end
end

function LifeDayDreamsScreenplay:setRequiredItem(pPlayer, item)
	if (pPlayer == nil) then
		return
	end
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. item, 0)
end

function LifeDayDreamsScreenplay:setRequiredHead(pPlayer, head)
	if (pPlayer == nil) then
		return
	end
	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredHead:" .. head, 0)
end

function LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, item)
	if (pPlayer == nil or item == nil) then
		return false
	end
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return false
	end

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. item) == nil or readScreenPlayData(pPlayer,"LifeDayDreamsScreenplay", "requiredItem:" .. item) == "" ) then
		return false
	end

	local quantity = 0
	local counter = 0
	local itemPath = ""
	
	for i=1, #questItems, 1 do
		if (questItems[i].item == item) then
			quantity = questItems[i].quantity
			itemPath = questItems[i].itemPath
			break
		end
	end

	if (quantity < 1) then 
		return false
	end
	
	for i = 0, SceneObject(pInventory):getContainerObjectsSize()-1, 1 do
		local pItem = SceneObject(pInventory):getContainerObject(i)
		if (pItem ~= nil) then
			local pPath = SceneObject(pItem):getTemplateObjectPath()
			if (pPath == itemPath and counter < quantity) then
			self:writeToRemovalList(pPlayer, pItem)
			counter = counter + 1
			end
		end
	end

	if (counter == quantity) then
		return true
	end
	
	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	removeQuestStatus("lifeday_dreams:removalList:" .. playerID)
	return false
end

function LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, head)
	if (pPlayer == nil or head == nil) then
		return false
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return false
	end

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredHead:" .. head) == nil or readScreenPlayData(pPlayer,"LifeDayDreamsScreenplay", "requiredHead:" .. head) == "" ) then
		return false
	end

	local itemPath = ""
	
	for i=1, #questHeads, 1 do
		if (questHeads[i].item == head) then
			itemPath = questHeads[i].itemPath
			break
		end
	end
	
	local pItem = getContainerObjectByTemplate(pInventory, itemPath, true)
	if (pItem ~= nil) then
			return true
	end

	return false
end

function LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local removalList = getQuestStatus("lifeday_dreams:removalList:" .. playerID)
	local list = ""
	
	if (removalList ~= nil and removalList ~= "") then
		list = TarkinLib:splitString(removalList, ",")
		for i = 1, #list, 1 do
			local objectID = list[i]
			local pItem = getSceneObject(objectID)
			if (pItem ~= nil) then
       	 			SceneObject(pItem):destroyObjectFromWorld()
       	 			SceneObject(pItem):destroyObjectFromDatabase()
			end
		end
	end
	removeQuestStatus("lifeday_dreams:removalList:" .. playerID)			
end

function LifeDayDreamsScreenplay:scatterAshes(pPlayer, pAshes)
	if (pPlayer == nil or pAshes == nil) then
		return
	end

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") ~= "0" or readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "inNestArea") ~= "1") then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if (pInventory ~= nil) then
		if (SceneObject(pInventory):isContainerFullRecursive()) then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full.  Make some room and try again.")
			return
		end

		local pAshes = getContainerObjectByTemplate(pInventory, ashes, true)
		if (pAshes ~= nil) then
			local pGhost = CreatureObject(pPlayer):getPlayerObject()
			local playerID = CreatureObject(pPlayer):getObjectID()
			local oldWaypointID = readData(playerID .. ":ashesWaypointID", waypointID)

			if oldWaypointID ~= "" and oldWaypointID ~= nil and oldWaypointID ~= 0 then
				PlayerObject(pGhost):removeWaypoint(oldWaypointID, true)
				deleteData(playerID .. ":ashesWaypointID")
			end

			local newWaypointID = PlayerObject(pGhost):addWaypoint("kashyyyk_main", "Return to Arrithar", "", -595.082, -144.376, WAYPOINTYELLOW, true, true, 0)
			writeData(playerID .. ":arritharWaypointID", newWaypointID)	
		
			SceneObject(pAshes):destroyObjectFromWorld()
			SceneObject(pAshes):destroyObjectFromDatabase()
			local pEmptyAshes = giveItem(pInventory, emptyAshes, -1)
			CreatureObject(pPlayer):sendSystemMessage("You uncork the container and scatter Rorryyhn's ashes to the winds.  While doing so, you happen to notice a large blue feather that stands out from its surroundings, and you pick it up.  Perhaps Arrithar would know something about it.")
			local pFeather = giveItem(pInventory, feather, -1)
			writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 1)	
		end
	end
end

function LifeDayDreamsScreenplay:giveShield(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

        if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your reward.  Make some room and try again.")
		return
	end   

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local playerID = CreatureObject(pPlayer):getObjectID()
	local waypointID = readData(playerID .. ":arritharWaypointID", waypointID)

	if waypointID ~= "" and waypointID ~= nil and waypointID ~= 0 then
		PlayerObject(pGhost):removeWaypoint(waypointID, true)
		deleteData(playerID .. ":arritharWaypointID")
	end

	local pShield = giveItem(pInventory, rewardShield, -1)
	if (rewardShield ~= nil) then
		CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest", 2)
	end

end

function LifeDayDreamsScreenplay:completeTrial(pPlayer, head)
	if (pPlayer == nil or head == nil) then
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return
	end
	
	local itemPath = ""
	local trophyPath = ""
	
	for i=1, #questHeads, 1 do
		if (questHeads[i].item == head) then
			itemPath = questHeads[i].itemPath
			trophyPath = questHeads[i].rewardPath
			break
		end
	end
	
	local pHead = getContainerObjectByTemplate(pInventory, itemPath, true)
	if (pHead ~= nil) then
		if (trophyPath ~= nil) then
			local pTrophy = giveItem(pInventory, trophyPath, -1)
			if (pTrophy ~= nil) then
				SceneObject(pHead):destroyObjectFromWorld()
				SceneObject(pHead):destroyObjectFromDatabase()
				writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredHead:" .. head, 1)
				CreatureObject(pPlayer):sendSystemMessage("The creature's head has been mounted and placed in your inventory.")
			end
		end
	end
end

function LifeDayDreamsScreenplay:giveAttilochitReward(pPlayer)
                if (pPlayer == nil) then
                                return
                end
                
                local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
                
                if (pInventory == nil) then
                                return
                end
                
                if (SceneObject(pInventory):isContainerFullRecursive()) then
                                CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your reward.  Make some room and try again.")
                                return
                end        
                
                local pReward = giveItem(pInventory, rewardTrophy, -1)
                
                if (pReward ~= nil) then
                                writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitQuest", 0)
                                CreatureObject(pPlayer):sendSystemMessage("A reward has been placed in your inventory.")
                end        
end

function LifeDayDreamsScreenplay:giveAttilochitMount(pPlayer, mount)
	if (pPlayer == nil or mount == nil) then
        	return
	end
                
        local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
                
        if (pInventory == nil) then
                return
        end
                
        if (SceneObject(pInventory):isContainerFullRecursive()) then
        	CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your reward.  Make some room and try again.")
                return
        end        

	for i=1, #mounts, 1 do
		if (mount == mounts[i].mountName) then
			local mountPath = mounts[i].mountPath
               		local pMount = giveItem(pInventory, mountPath, -1)
                
                	if (pMount ~= nil) then
                               	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitQuest", 1)
                                CreatureObject(pPlayer):sendSystemMessage("A pet schematic has been placed in your inventory.  A bio-engineer will need to craft this pet.  Your pet will need some time to grow up after you tame it, and it will need to be mount-trained by a creature handler.")
				return
                	end
		end
	end
end

function LifeDayDreamsScreenplay:giveReyyruaPoem(pPlayer)
	if (pPlayer == nil) then
		return
	end
                
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
                
	if (pInventory == nil) then
		return
	end

	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest", 0)        
        
	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive the poem.  Make some room and try again.")
		return
	end        
                
	local pReward = giveItem(pInventory, rewardPoem, -1)
                
	if (pReward ~= nil) then
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest", 1)
		CreatureObject(pPlayer):sendSystemMessage("A handwritten poem has been placed in your inventory.")
	end        
end

function LifeDayDreamsScreenplay:giveReyyruaEggnog(pPlayer)
	if (pPlayer == nil) then
		return
	end
                
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
                
	if (pInventory == nil) then
		return
	end
                
	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your reward.  Make some room and try again.")
		return
	end        
                
	local pReward = giveItem(pInventory, rewardEggnog, -1)
                
	if (pReward ~= nil) then
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest", 2)
		CreatureObject(pPlayer):sendSystemMessage("A cup of varactyl eggnog has been placed in your inventory.")
	end        
end

function LifeDayDreamsScreenplay:smokePipe(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local zone = dreamPoint.planet
	
	if (not isZoneEnabled(zone)) then
		printLuaError("Unable to switch zone for player " .. SceneObject(pPlayer):getObjectID() .. ".  Necessary zone was not enabled.")	
		return
	end

	local xRef = dreamPoint.x
	local yRef = dreamPoint.y
	local pSpawner = spawnSceneObject(zone, "object/tangible/spawning/quest_spawner.iff", xRef, 0, yRef, 0, 0)
	local spawnerX = SceneObject(pSpawner):getPositionX()	
	
	if (pSpawner == nil) then
		printLuaError("QuestSpawner:createQuestSpawner, unable to create spawner object.")
		return
	end

	local spawnPoint = getSpawnPoint(zone, xRef, yRef, -7500, 7500, true)

	if (spawnPoint == nil) then
		spawnPoint = { spawnerX, getTerrainHeight(pSpawner, xRef, yRef), yRef }
	end

	local pBacca = spawnMobile("dreamland", "lifeday_bacca", 1, spawnPoint[1], spawnPoint[2], spawnPoint[3] + 2, 179, 0)
	local pFreyyr = spawnMobile("dreamland", "lifeday_freyyr", 1, spawnPoint[1] + 2, spawnPoint[2], spawnPoint[3] + 2, -155, 0)
	local pChaldrrl = spawnMobile("dreamland", "lifeday_chaldrrl", 1, spawnPoint[1] - 2, spawnPoint[2], spawnPoint[3] + 2, 155, 0)

	if (pBacca ~= nil) then
		writeData("LifeDayDreamsScreenplay:bacca:" .. SceneObject(pPlayer):getObjectID(), SceneObject(pBacca):getObjectID())

		local pBaccaArea = spawnActiveArea(SceneObject(pBacca):getZoneName(), "object/active_area.iff", SceneObject(pBacca):getWorldPositionX(), SceneObject(pBacca):getWorldPositionZ(), SceneObject(pBacca):getWorldPositionY(), 50, 0)
		if pBaccaArea ~= nil then
			createObserver(ENTEREDAREA, "LifeDayDreamsScreenplay", "notifyEnteredBaccaArea", pBaccaArea)
			createObserver(ENTEREDAREA, "LifeDayDreamsScreenplay", "notifyExitedBaccaArea", pBaccaArea)
 			writeData("LifeDayDreamsScreenplay:LifeDayBaccaArea:" .. SceneObject(pPlayer):getObjectID(), SceneObject(pBaccaArea):getObjectID())
		end

		SceneObject(pPlayer):switchZone(zone, spawnPoint[1], spawnPoint[2], spawnPoint[3], 0)
		SceneObject(pSpawner):destroyObjectFromWorld()
	end	

	if (pFreyyr ~= nil) then
		writeData("LifeDayDreamsScreenplay:freyyr:" .. SceneObject(pPlayer):getObjectID(), SceneObject(pFreyyr):getObjectID())
	end

	if (pChaldrrl ~= nil) then
		writeData("LifeDayDreamsScreenplay:chaldrrl:" .. SceneObject(pPlayer):getObjectID(), SceneObject(pChaldrrl):getObjectID())
	end
end

function LifeDayDreamsScreenplay:notifyEnteredBaccaArea(pArea, pPlayer)
	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end

	areaID = SceneObject(pArea):getObjectID()
	if (readData("LifeDayDreamsScreenplay:LifeDayBaccaArea:" .. SceneObject(pPlayer):getObjectID()) == (SceneObject(pArea):getObjectID())) then
		local pBaccaID = tonumber(readData("LifeDayDreamsScreenplay:bacca:" .. SceneObject(pPlayer):getObjectID()))
		local pBacca = getSceneObject(pBaccaID)
		if (pBacca ~= nil) then
			spatialChat(pBacca, "@player_quest:lifeday_2019_bacca_bark") -- "You must agree, Freyyr!  The hrrtayyk seems to have gotten far easier than when I implemented it.  Pups these days have a soft belly.  Look at this one!  Wait...it looks at us."
			return 0
		end
	end

	return 0
end

function LifeDayDreamsScreenplay:notifyExitedBaccaArea(pArea, pPlayer)
	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end

	-- If the player leaves Dreamland, despawn Bacca et al
	if (SceneObject(pPlayer):getZoneName() ~= "dreamland") then
		local pBaccaID = readData("LifeDayDreamsScreenplay:bacca:" .. SceneObject(pPlayer):getObjectID())
		local pBacca = getSceneObject(pBaccaID)	

		if (pBacca ~= nil) then
			SceneObject(pBacca):destroyObjectFromWorld()
		end

		local pFreyyrID = readData("LifeDayDreamsScreenplay:freyyr:" .. SceneObject(pPlayer):getObjectID())
		local pFreyyr= getSceneObject(pFreyyrID)	

		if (pFreyyr ~= nil) then
			SceneObject(pFreyyr):destroyObjectFromWorld()
		end

		local pChaldrrlID = readData("LifeDayDreamsScreenplay:chaldrrl:" .. SceneObject(pPlayer):getObjectID())
		local pChaldrrl= getSceneObject(pChaldrrlID)	

		if (pChaldrrl ~= nil) then
			SceneObject(pChaldrrl):destroyObjectFromWorld()
		end
	end
	
	areaID = SceneObject(pArea):getObjectID()
	if (readData("LifeDayDreamsScreenplay:LifeDayBaccaArea:" .. SceneObject(pPlayer):getObjectID()) == (SceneObject(pArea):getObjectID())) then
		createEvent(10, "LifeDayDreamsScreenplay", "destroyObject", pArea, "")
	end
	
	return 0
end

function LifeDayDreamsScreenplay:giveShorbaccaRewards(pPlayer)
	if (pPlayer == nil) then
		return
	end
                
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
                
	if (pInventory == nil) then
		return
	end
                
	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your rewards.  Make some room and try again.")
		return
	end        

  	local randNum = getRandomNumber(1, #paintingRewards)
	local pPipe = giveItem(pInventory, pipe, -1)
	local pPainting =  giveItem(pInventory, paintingRewards[randNum].path, -1)
               
	if (pPipe ~= nil and pPainting ~= nil) then
		CreatureObject(pPlayer):sendSystemMessage("A ceremonial pipe and a painting of your ancestor have been placed in your inventory.")
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest", 3)
	else
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest", 2)
	end
end

function LifeDayDreamsScreenplay:returnShorbacca(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	if (not isZoneEnabled(shorbaccaPoint.planet)) then
		printLuaError("Unable to switch zone for player " .. SceneObject(pPlayer):getObjectID() .. ".  Necessary zone was not enabled.")	
		return
	end

	writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest", 1)	
	SceneObject(pPlayer):switchZone(shorbaccaPoint.planet, shorbaccaPoint.x, 0, shorbaccaPoint.y, 0)

	-- When the player leaves Dreamland, despawn Bacca et al
	local pBaccaID = readData("LifeDayDreamsScreenplay:bacca:" .. SceneObject(pPlayer):getObjectID())
	local pBacca = getSceneObject(pBaccaID)	

	if (pBacca ~= nil) then
		SceneObject(pBacca):destroyObjectFromWorld()
	end

	local pFreyyrID = readData("LifeDayDreamsScreenplay:freyyr:" .. SceneObject(pPlayer):getObjectID())
	local pFreyyr= getSceneObject(pFreyyrID)	

	if (pFreyyr ~= nil) then
		SceneObject(pFreyyr):destroyObjectFromWorld()
	end

	local pChaldrrlID = readData("LifeDayDreamsScreenplay:chaldrrl:" .. SceneObject(pPlayer):getObjectID())
	local pChaldrrl= getSceneObject(pChaldrrlID)	

	if (pChaldrrl ~= nil) then
		SceneObject(pChaldrrl):destroyObjectFromWorld()
	end
end

function LifeDayDreamsScreenplay:hasCompletedAllQuests(pPlayer)
	--Check if Chief Attilochit quests are done
	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitQuest") ~= "1") then
		print("Attilochit false")--debug
		return false
	end

	--Check if Reyyrua quest is done
	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest") ~= "2") then
		print("Reyyrua false")--debug
		return false
	end	
	
	-- Check if Shorbacca quest is done
	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest") ~= "3") then
		print("Shorbacca false")--debug
		return false
	end

	-- Check if Arrithar quest is done
	if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") ~= "4") then
		print("Arrithar false")--debug
		return false
	end
	
	return true
end

function LifeDayDreamsScreenplay:claimGift(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local accountID = PlayerObject(pGhost):getAccountID()
	local numGiftsClaimed = tonumber(getQuestStatus("lifeday_dreams:numGifts:" .. accountID))
	local giftClaimed = readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayClaimedGift")

	if (giftClaimed ~= nil and giftClaimed ~= "") then
		CreatureObject(pPlayer):sendSystemMessage("You already claimed your gift.  No cheating!")
		return
	end

	if (numGiftsClaimed ~= nil and numGiftsClaimed ~= "" and numGiftsClaimed >= 5) then
		CreatureObject(pPlayer):sendSystemMessage("You have already claimed a gift on five characters.  That's all you get!")	
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return
	end	

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your gift.  Make some room and try again.")
		return
	end	
	
	local pGift = giveItem(pInventory, lifeDayGift, -1)
	if (pGift ~= nil) then	
		if (numGiftsClaimed == nil or numGiftsClaimed == "") then
			numGiftsClaimed = 0
		end
		SceneObject(pGift):setCustomObjectName(CreatureObject(pPlayer):getFirstName() .. "'s Life Day Gift")
		numGiftsClaimed = numGiftsClaimed + 1
		setQuestStatus("lifeday_dreams:numGifts:" .. accountID, numGiftsClaimed)
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayClaimedGift" , 1)
		CreatureObject(pPlayer):sendSystemMessage("Happy Life Day!  Your gift has been placed in your inventory.")
	end
end

function LifeDayDreamsScreenplay:openGift(pPlayer, pGiftBox)
	if (pPlayer == nil or pGiftBox == nil) then
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return
	end	

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full receive your gifts.  Make some room and try again.")
		return
	end	
	
	local randNum = getRandomNumber(1, #lifeDayGiftOptions)

	local pOrb = giveItem(pInventory, lifeDayOrb, -1)
	local pGift = giveItem(pInventory, lifeDayGiftOptions[randNum].path, -1)
	
	
	if (pGift ~= nil and pOrb ~= nil) then
		SceneObject(pGiftBox):destroyObjectFromWorld()
       		SceneObject(pGiftBox):destroyObjectFromDatabase()
		CreatureObject(pPlayer):sendSystemMessage("You opened your gift!")
	end
	
end

function LifeDayDreamsScreenplay:playerLoggedIn(pPlayer)
	if (self:isLifeDayDreamsEventEnabled() == false) then
		local zoneName = SceneObject(pPlayer):getZoneName()
		if (zoneName == "kashyyyk_main" or zoneName == "dreamland") then
			SceneObject(pPlayer):switchZone(defaultBindPoint.planet, defaultBindPoint.x, 0, defaultBindPoint.y, 0)
			CreatureObject(pPlayer):sendSystemMessage("The Life Day dream is over.  You have been re-zoned to Naboo.")
			print("Re-zoning straggler player: " .. CreatureObject(pPlayer):getFirstName() .. " from zone " .. zoneName .. ".")
		end
	end
end

function LifeDayDreamsScreenplay:isLifeDayDreamsEventEnabled()
	if (os.difftime(eventStartTime, os.time()) <= 0 and os.difftime(eventCleanupTime, os.time()) > 0) then
		return true
	else		
		return false
	end
end

--2019 Life Day Orb Object Menu Component
LifeDay2019OrbObjectMenuComponent = { }

function LifeDay2019OrbObjectMenuComponent:fillObjectMenuResponse(pOrb, pMenuResponse, pPlayer)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	-- Item must be in player's base-level inventory to use
	if (pInventory ~= SceneObject(pOrb):getParent()) then
		return 0
	end	
	
	--For the duration of the event, and if the player has not completed the Life Day quests, offer the radial menu to use the orb
	if (LifeDayDreamsScreenplay:isLifeDayDreamsEventEnabled()== true and TarkinLib:isEligibleState(pPlayer) == true) then

		local lifeDayDreamsStatus = readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayDreamsStatus")
		if (SceneObject(pPlayer):getZoneName() ~= "kashyyyk_main") then
			if ((lifeDayDreamsStatus == nil or lifeDayDreamsStatus == "") and SceneObject(pPlayer):getZoneName() ~= "dreamland") then
				menuResponse:addRadialMenuItem(20, 3, "Use")
			elseif (lifeDayDreamsStatus == "0" or lifeDayDreamsStatus == "1") then
				menuResponse:addRadialMenuItem(22, 3, "Use")
			end
		end
	end
end

function LifeDay2019OrbObjectMenuComponent:handleObjectMenuSelect(pOrb, pPlayer, selectedID)
	if (pPlayer == nil or pOrb == nil) then
		return 0
	end

	if (selectedID == 20) then
		LifeDayDreamsScreenplay:setBindPoint(pPlayer) 
		LifeDayDreamsScreenplay:startDreamSequence(pPlayer)
	elseif (selectedID == 22) then
		LifeDayDreamsScreenplay:setBindPoint(pPlayer)
		LifeDayDreamsScreenplay:travelKashyyyk(pPlayer)
	end
	return 1
end

--2019 Life Day Portal Object Menu Component
LifeDay2019PortalObjectMenuComponent = { }

function LifeDay2019PortalObjectMenuComponent:fillObjectMenuResponse(pPortal, pMenuResponse, pPlayer)
	if (pPlayer == nil or pPortal == nil) then
		return 0
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if (TarkinLib:isEligibleState(pPlayer) == true) then
			menuResponse:addRadialMenuItem(20, 3, "Return")
	end
end

function LifeDay2019PortalObjectMenuComponent:handleObjectMenuSelect(pPortal, pPlayer, selectedID)
	if (pPlayer == nil or pPortal == nil) then
		return 0
	end

	if (selectedID == 20) then
	
		if(LifeDayDreamsScreenplay:hasCompletedAllQuests(pPlayer) == true) then
			LifeDayDreamsScreenplay:endDreamSequence(pPlayer)
		else
			LifeDayDreamsScreenplay:returnToBindPoint(pPlayer)
		end
	end
	return 1
end

--2019 Life Day Tree Object Menu Component
LifeDay2019TreeObjectMenuComponent = { }

function LifeDay2019TreeObjectMenuComponent:fillObjectMenuResponse(pTree, pMenuResponse, pPlayer)
	if (pPlayer == nil or pTree == nil) then
		return 0
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local accountID = PlayerObject(pGhost):getAccountID()
	local numGiftsClaimed = tonumber(getQuestStatus("lifeday_dreams:numGifts:" .. accountID))
	
	--Players can claim a present once from the Life Day Tree
	local giftClaimed = readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "lifeDayClaimedGift")
	if ((giftClaimed == nil or giftClaimed == "") and (numGiftsClaimed == nil or numGiftsClaimed == "" or numGiftsClaimed < 5)) then
		menuResponse:addRadialMenuItem(20, 3, "Receive Life Day Gift")
	end
end

function LifeDay2019TreeObjectMenuComponent:handleObjectMenuSelect(pTree, pPlayer, selectedID)
	if (pPlayer == nil or pTree == nil) then
		return 0
	end

	if (selectedID == 20) then
		LifeDayDreamsScreenplay:claimGift(pPlayer)
	end
	return 1
end


--2019 Life Day Gift Object Menu Component
LifeDay2019GiftObjectMenuComponent = { }

function LifeDay2019GiftObjectMenuComponent:fillObjectMenuResponse(pGift, pMenuResponse, pPlayer)
	if (pPlayer == nil or pGift == nil) then
		return 0
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	-- Item must be in player's base-level inventory to use
	if (pInventory ~= SceneObject(pGift):getParent()) then
		return 0
	end	

	menuResponse:addRadialMenuItem(20, 3, "Open Gift")
end

function LifeDay2019GiftObjectMenuComponent:handleObjectMenuSelect(pGift, pPlayer, selectedID)
	if (pPlayer == nil or pGift == nil) then
		return 0
	end

	if (selectedID == 20) then
		LifeDayDreamsScreenplay:openGift(pPlayer, pGift)
	end
	return 1
end

--Wookiee Ashes Object Menu Component
WookieeAshesObjectMenuComponent = { }

function WookieeAshesObjectMenuComponent:fillObjectMenuResponse(pAshes, pMenuResponse, pPlayer)
	if (pPlayer == nil or pAshes == nil) then
		return 0
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	-- Item must be in player's base-level inventory to use
	if (pInventory ~= SceneObject(pAshes):getParent()) then
		return 0
	end	

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") ~= "0") then
		return 0
	end
	
	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "inNestArea") ~= "1") then
		return 0
	end	
	
	menuResponse:addRadialMenuItem(20, 3, "Scatter Ashes")
end

function WookieeAshesObjectMenuComponent:handleObjectMenuSelect(pAshes, pPlayer, selectedID)
	if (pPlayer == nil or pAshes == nil) then
		return 0
	end

	if (selectedID == 20) then
		LifeDayDreamsScreenplay:scatterAshes(pPlayer, pAshes)
	end
	return 1
end

--Nest Object Menu Component
NestObjectMenuComponent = { }

function NestObjectMenuComponent:fillObjectMenuResponse(pNest, pMenuResponse, pPlayer)
	if (pPlayer == nil or pNest == nil) then
		return 0
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") ~= "2") then
		return 0
	end
	
	menuResponse:addRadialMenuItem(20, 3, "Search Nest")
end

function NestObjectMenuComponent:handleObjectMenuSelect(pNest, pPlayer, selectedID)
	if (pPlayer == nil or pNest == nil) then
		return 0
	end

	if (selectedID == 20) then
		LifeDayDreamsScreenplay:searchNest(pPlayer)
	end
	return 1
end

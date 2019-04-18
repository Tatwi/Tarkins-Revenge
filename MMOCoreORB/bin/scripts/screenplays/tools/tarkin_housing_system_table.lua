-- Tarkin's Revenge Housing System
-- This table contains all the compatible strutures, deeds, and prices for the housing system, organized by structure template name.
-- IMPORTANT: Building Lua files **MUST** have a lotSize = #, line and a stucture terminal child object, else shit goes sideways real fast!
-- IMPORTANT: Using NPC structures by dropping a structure terminal in them **WILL** break the BDB structure entries for the player. Don't do it!
-- Format: "Structure Template Name", price,  "Name the player sees for compatible deeds", "All deed templates that will work this structure",
--
-- How it works:
-- 1. Get the structure template name of the building in question
-- 2. Search this table for structure template name
-- 3. If the name was found, note the table index number where it was found
-- 4. Use the index number to pull out price [index+1], friendly description of the compatible deeds [index+2], and the list of compatible deeds [index+3]
-- 5. Search the player's inventory for deeds
-- 6. Compare deed names found in the iventory against the list in [index+3]
-- 7. If a compatible deed is found, allow the player to buy the structure.
-- 
-- Small Houses 10k
-- Medium Houses 50k
-- Large Houses 200k
-- Merchant Tents 30k
-- Player Guild Halls 500k
-- NGE Houses 200k
-- Factories 10k
-- Player City Cantinas 500k
-- Player City Theaters 300k
-- Player City Hospitals 500k
-- NPC City Guildhalls 1mil
-- NPC City Cantinas 2mil
-- NPC City Theaters 2mil
-- NPC City Hotels 2mil
-- NPC Capitol Buildings 5mil
-- Large NPC City Hospitals 2mil
-- Small NPC City Hospitals 1mil (unsupported at this time, need to make player versions)
-- NPC City Salon Tents 80k
-- NPC Bunkers 2mil, 5mil, 10mil

housingSystemTable = {
	-- Small Houses
	"player_house_corellia_small_style_01.iff", 10000, "Small Corellian Houses", "corellia_house_small_deed.iff corellia_house_small_floor_02_deed.iff corellia_house_small_style_02_deed.iff corellia_house_small_style_02_floor_02_deed.iff", 
	"player_house_corellia_small_style_01_floorplan_02.iff", 10000, "Small Corellian Houses", "corellia_house_small_deed.iff corellia_house_small_floor_02_deed.iff corellia_house_small_style_02_deed.iff corellia_house_small_style_02_floor_02_deed.iff",
	"player_house_corellia_small_style_02.iff", 10000, "Small Corellian Houses", "corellia_house_small_deed.iff corellia_house_small_floor_02_deed.iff corellia_house_small_style_02_deed.iff corellia_house_small_style_02_floor_02_deed.iff",
	"player_house_corellia_small_style_02_floorplan_02.iff", 10000, "Small Corellian Houses", "corellia_house_small_deed.iff corellia_house_small_floor_02_deed.iff corellia_house_small_style_02_deed.iff corellia_house_small_style_02_floor_02_deed.iff",
	"player_house_generic_small_style_01.iff", 10000, "Small Generic Houses", "generic_house_small_deed.iff generic_house_small_floor_02_deed.iff generic_house_small_style_02_deed.iff generic_house_small_style_02_floor_02_deed.iff",
	"player_house_generic_small_style_01_floorplan_02.iff", 10000, "Small Generic Houses", "generic_house_small_deed.iff generic_house_small_floor_02_deed.iff generic_house_small_style_02_deed.iff generic_house_small_style_02_floor_02_deed.iff",
	"player_house_generic_small_style_02.iff", 10000, "Small Generic Houses", "generic_house_small_deed.iff generic_house_small_floor_02_deed.iff generic_house_small_style_02_deed.iff generic_house_small_style_02_floor_02_deed.iff",
	"player_house_generic_small_style_02_floorplan_02.iff", 10000, "Small Generic Houses", "generic_house_small_deed.iff generic_house_small_floor_02_deed.iff generic_house_small_style_02_deed.iff generic_house_small_style_02_floor_02_deed.iff",
	"player_house_naboo_small_style_01.iff", 10000, "Small Naboo Houses", "naboo_house_small_deed.iff naboo_house_small_style_02_deed.iff",
	"player_house_naboo_small_style_02.iff", 10000, "Small Naboo Houses", "naboo_house_small_deed.iff naboo_house_small_style_02_deed.iff",
	"player_house_tatooine_small_style_01.iff", 10000, "Small Tatooine Houses", "tatooine_house_small_deed.iff tatooine_house_small_style_02_deed.iff",
	"player_house_tatooine_small_style_02.iff", 10000, "Small Tatooine Houses", "tatooine_house_small_deed.iff tatooine_house_small_style_02_deed.iff",
	"generic_small_window_s01.iff", 10000, "Small Generic Windowed Style 1", "generic_small_window_s01_deed.iff",
	"generic_small_window_s02.iff", 10000, "Small Generic Windowed Style 2", "generic_small_window_s02_deed.iff",
	"naboo_small_window_s01.iff", 10000, "Small Windowed Naboo House", "naboo_small_window_s01_deed.iff",
	"tatooine_small_window_s01.iff", 10000, "Small Windowed Tatooine House", "tatooine_small_window_s01_deed.iff",
	
	-- Medium Houses
	"player_house_corellia_medium_style_01.iff", 50000, "Medium Corellian Houses", "corellia_house_medium_deed.iff corellia_house_medium_style_02_deed.iff",
	"player_house_corellia_medium_style_02.iff", 50000, "Medium Corellian Houses", "corellia_house_medium_deed.iff corellia_house_medium_style_02_deed.iff",
	"player_house_generic_medium_style_01.iff", 50000, "Medium Generic Houses", "generic_house_medium_deed.iff generic_house_medium_style_02_deed.iff",
	"player_house_generic_medium_style_02.iff", 50000, "Medium Generic Houses", "generic_house_medium_deed.iff generic_house_medium_style_02_deed.iff",	
	"player_house_naboo_medium_style_01.iff", 50000, "Medium Naboo Houses", "naboo_house_medium_deed.iff naboo_house_medium_style_02_deed.iff",
	"player_house_tatooine_medium_style_01.iff", 50000, "Medium Tatooine House", "tatooine_house_medium_deed.iff",
	"player_house_tatooine_medium_style_02.iff", 50000, "Medium Tatooine House", "tatooine_house_medium_deed.iff",
	"generic_medium_window_s01.iff", 50000, "Medium Generic Windowed Style 1", "generic_medium_window_s01_deed.iff",
	"generic_medium_window_s02.iff", 50000, "Medium Generic Windowed Style 2", "generic_medium_window_s02_deed.iff",
	
	-- Large Houses
	"player_house_corellia_large_style_01.iff", 200000, "Large Corellian Houses", "corellia_house_large_deed.iff corellia_house_large_style_02_deed.iff",
	"player_house_corellia_large_style_02.iff", 200000, "Large Corellian Houses", "corellia_house_large_deed.iff corellia_house_large_style_02_deed.iff",
	"player_house_generic_large_style_01.iff", 200000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_house_generic_large_style_02.iff", 200000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",	
	"player_house_naboo_large_style_01.iff", 200000, "Large Naboo House", "naboo_house_large_deed.iff",
	"player_house_tatooine_large_style_01.iff", 200000, "Large Tatooine House", "tatooine_house_large_deed.iff",
	"player_house_tatooine_large_style_02.iff", 200000, "Large Tatooine House", "tatooine_house_large_deed.iff",
	"generic_large_window_s01.iff", 200000, "Large Generic Windowed Style 1", "generic_large_window_s01_deed.iff",
	"generic_large_window_s02.iff", 200000, "Large Generic Windowed Style 2", "generic_large_window_s02_deed.iff",
	
	-- Player Guild Halls
	"player_guildhall_corellia_style_01.iff", 500000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_guildhall_generic_style_01.iff", 500000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_guildhall_naboo_style_01.iff", 500000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_guildhall_tatooine_style_01.iff", 500000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_guildhall_tatooine_style_02.iff", 500000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	
	-- Merchant Tents
	"player_merchant_tent_style_01.iff", 30000, "Merchant Tents", "merchant_tent_style_01_deed.iff merchant_tent_style_02_deed.iff merchant_tent_style_03_deed.iff",
	"player_merchant_tent_style_02.iff", 30000, "Merchant Tents", "merchant_tent_style_01_deed.iff merchant_tent_style_02_deed.iff merchant_tent_style_03_deed.iff",
	"player_merchant_tent_style_03.iff", 30000, "Merchant Tents", "merchant_tent_style_01_deed.iff merchant_tent_style_02_deed.iff merchant_tent_style_03_deed.iff",
	
	-- NGE Houses
	"atat_house.iff", 200000, "AT-AT House", "atat_house_deed.iff",
	"bespin_house.iff", 200000, "Bespin House", "bespin_house_deed.iff",
	"commando_house.iff", 200000, "Commando House", "commando_house_deed.iff",
	"emperors_house.iff", 200000, "Emperors House", "emperors_house_deed.iff",
	"hangar_house.iff", 200000, "Hangar", "hangar_house_deed.iff",
	"jabbas_house.iff", 200000, "Jabas House", "jabbas_house_deed.iff",
	"jedi_house.iff", 200000, "Jedi House", "jedi_house_deed.iff",
	"musty_house.iff", 200000, "Mustafar Bunker", "musty_house_deed.iff",
	"ns_hut.iff", 200000, "Nightsister Hut", "ns_hut_deed.iff",
	"rebel_house.iff", 200000, "Rebel House", "rebel_house_deed.iff",
	"relaxation_house.iff", 200000, "Relaxation House", "relaxation_house_deed.iff",
	"sandcrawler_house.iff", 200000, "Sandcrawler", "sandcrawler_house_deed.iff",
	"sith_house.iff", 200000, "Sith House", "sith_house_deed.iff",
	"sm_hut_house.iff", 200000, "Singing Mountain Clan House", "sm_hut_deed.iff",
	"tree_house.iff", 200000, "Tree House", "tree_house_deed.iff",
	"vehicle_house.iff", 200000, "Vehicle Garage House", "vehicle_house_deed.iff",
	"vipbunker_house.iff", 200000, "VIP Bunker", "vipbunker_house_deed.iff",
	"yoda_house.iff", 200000, "Yoda House", "yoda_house_deed.iff",
	"yt1300_house.iff", 200000, "YT-1300 House", "yt1300_house_deed.iff",
	
	-- Factories
	"clothing_factory.iff", 10000, "Clothing Factory", "factory_clothing_deed.iff",
	"food_factory.iff", 10000, "Food/Chemical Factory", "factory_food_deed.iff",
	"structure_factory.iff", 10000, "Structure Factory", "factory_structure_deed.iff",
	"weapon_factory.iff", 10000, "Item/Weapon Factory", "factory_item_deed.iff",
	
	-- Player City Cantinas
	"cantina_corellia.iff", 500000, "Any Player City Cantina", "cantina_corellia_deed.iff cantina_naboo_deed.iff cantina_tatooine_deed.iff",		
	"cantina_naboo.iff", 500000, "Any Player City Cantina", "cantina_corellia_deed.iff cantina_naboo_deed.iff cantina_tatooine_deed.iff",
	"cantina_tatooine.iff", 500000, "Any Player City Cantina", "cantina_corellia_deed.iff cantina_naboo_deed.iff cantina_tatooine_deed.iff",
	
	-- Player City Theaters
	"theater_corellia.iff",	300000, "Any Player City Theater", "theater_corellia_deed.iff theater_naboo_deed.iff theater_tatooine_deed.iff",
	"theater_naboo.iff", 300000, "Any Player City Theater", "theater_corellia_deed.iff theater_naboo_deed.iff theater_tatooine_deed.iff",
	"theater_tatooine.iff", 300000, "Any Player City Theater", "theater_corellia_deed.iff theater_naboo_deed.iff theater_tatooine_deed.iff",
	
	-- Player City Hospitals
	"hospital_corellia.iff", 500000, "Any Player City Hospital", "hospital_corellia_deed.iff hospital_naboo_deed.iff hospital_tatooine_deed.iff",
	"hospital_naboo.iff", 500000, "Any Player City Hospital", "hospital_corellia_deed.iff hospital_naboo_deed.iff hospital_tatooine_deed.iff",
	"hospital_tatooine.iff", 500000, "Any Player City Hospital", "hospital_corellia_deed.iff hospital_naboo_deed.iff hospital_tatooine_deed.iff",
	
	-- Converted NPC Structures:
	
	--Undecorated NPC Bunkers
	"player_npc_bunker_small.iff", 2000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_bunker_medium.iff", 5000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_bunker_large.iff", 10000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	
	-- Undecorated NPC City Guildhalls
	"player_npc_combat_guildhall_corellia.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_combat_guildhall_naboo.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_combat_guildhall_tatooine.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_commerce_guildhall_corellia.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_commerce_guildhall_naboo.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_commerce_guildhall_tatooine.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_university_corellia.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_university_naboo.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_university_tatooine.iff", 1000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	
	-- Undecorated NPC City Cantinas
	"player_npc_cantina_corellia.iff", 2000000, "Player City Corellian Cantina", "cantina_corellia_deed.iff",
	"player_npc_cantina_naboo.iff", 2000000, "Player City Naboo Cantina", "cantina_naboo_deed.iff",
	"player_npc_cantina_tatooine.iff", 2000000, "Player City Tatooine Cantina", "cantina_tatooine_deed.iff",
	
	-- Undecorated NPC City Theaters
	"player_npc_theater_corellia.iff", 2000000, "Player City Corellian Theater", "theater_corellia_deed.iff",
	"player_npc_theater_naboo.iff", 2000000, "Player City Naboo Theater", "theater_naboo_deed.iff",
	"player_npc_theater_tatooine.iff", 2000000, "Player City Tatooine Theater", "theater_tatooine_deed.iff",
	
	-- Undecorated NPC City Hotels
	"player_npc_hotel_corellia.iff", 2000000, "Player City Corellian Cantina", "cantina_corellia_deed.iff",
	"player_npc_hotel_naboo.iff", 2000000, "Player City Naboo Cantina", "cantina_naboo_deed.iff",
	"player_npc_hotel_tatooine.iff", 2000000, "Player City Tatooine Cantina", "cantina_tatooine_deed.iff",
	
	-- Undecorated NPC City Salon Tents
	"player_salon_tent_style_01.iff", 80000, "Merchant Tents", "merchant_tent_style_01_deed.iff merchant_tent_style_02_deed.iff merchant_tent_style_03_deed.iff",
	"player_salon_tent_style_02.iff", 80000, "Merchant Tents", "merchant_tent_style_01_deed.iff merchant_tent_style_02_deed.iff merchant_tent_style_03_deed.iff",
	"player_salon_tent_style_03.iff", 80000, "Merchant Tents", "merchant_tent_style_01_deed.iff merchant_tent_style_02_deed.iff merchant_tent_style_03_deed.iff",
	
	-- Undecorated NPC City Capitols
	"player_npc_capitol_corellia.iff", 5000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_capitol_naboo.iff", 5000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"player_npc_capitol_tatooine.iff", 5000000, "Generic Large Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
}

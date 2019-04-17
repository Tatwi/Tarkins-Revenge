-- Tarkin's Revenge Housing System
-- This table contains all the compatible strutures, deeds, and prices for the housing system, organized by structure template name.
-- Format: "Structure Template Name", price,  "Name the player sees for compatible deeds", "All deed templates that will work this structure",
--
-- How it works:
-- 1. Get the structure template name of the building in question
-- 2. Search this table for structure template name
-- 3. If the name was found, note the table index number where it was found
-- 4. Use the index number to pull out price [index+1], friendly description of the compatible deeds [index+2], and the list of compatible deeds [index+3]
-- 5. Search the player's inventory for deeds
-- 6. Compare deed names found in the iventory against the list in [index+3]
-- 7. If a compatible deed is found, allow the player to buy the item.

housingSystemTable = {
	"player_house_tatooine_small_style_01.iff", 15000, "Small Tatooine Houses", "tatooine_house_small_deed.iff tatooine_house_small_style_02_deed.iff",
	"player_house_tatooine_small_style_02.iff", 15000, "Small Tatooine Houses", "tatooine_house_small_deed.iff tatooine_house_small_style_02_deed.iff",
	"player_npc_commerce_guildhall_tatooine.iff", 250000, "Large Generic Houses", "generic_house_large_deed.iff generic_house_large_style_02_deed.iff",
	"clothing_factory.iff", 100000, "All Factory Deeds", "factory_clothing_deed.iff factory_food_deed.iff factory_item_deed.iff factory_structure_deed.iff",
	"food_factory.iff", 100000, "All Factory Deeds", "factory_clothing_deed.iff factory_food_deed.iff factory_item_deed.iff factory_structure_deed.iff",
	"item_factory.iff", 100000, "All Factory Deeds", "factory_clothing_deed.iff factory_food_deed.iff factory_item_deed.iff factory_structure_deed.iff",
	"structure_factory.iff", 100000, "All Factory Deeds", "factory_clothing_deed.iff factory_food_deed.iff factory_item_deed.iff factory_structure_deed.iff",
}

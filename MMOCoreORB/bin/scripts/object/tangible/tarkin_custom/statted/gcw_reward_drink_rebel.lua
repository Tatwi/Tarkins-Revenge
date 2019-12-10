object_tangible_tarkin_custom_statted_gcw_reward_drink_rebel = object_tangible_tarkin_custom_statted_shared_gcw_reward_drink_rebel:new {
	templateType = CONSUMABLE,

	factionRestriction = "Rebel",

	duration = 1800,
	filling = 40,
	nutrition = 10,

	effectType = 2, -- Duration Based Buff
	eventTypes = {FACTIONAWARDED},

	fillingMin = 40,
	fillingMax = 10,
	flavorMin = 1800,
	flavorMax = 5400,
	nutritionMin = 10,
	nutritionMax = 25,
	quantityMin = 5,
	quantityMax = 15,

	modifiers = { "faction_increase", 0 },

	buffName = "food.faction_increase",
	buffCRC = 0xD0B34F80,
	speciesRestriction = "",

	numberExperimentalProperties = {1, 1, 1, 2, 2, 2, 2},
	experimentalProperties = {"XX", "XX", "XX", "OQ", "PE", "FL", "OQ", "DR", "PE", "DR", "OQ"},
	experimentalWeights = {1, 1, 1, 1, 2, 2, 1, 1, 3, 3, 1},
	experimentalGroupTitles = {"null", "null", "null", "exp_nutrition", "exp_flavor", "exp_quantity", "exp_filling"},
	experimentalSubGroupTitles = {"null", "null", "hitpoints", "nutrition", "flavor", "quantity", "filling"},
	experimentalMin = {0, 0, 1000, 75, 60, 60, 80},
	experimentalMax = {0, 0, 1000, 120, 120, 100, 120},
	experimentalPrecision = {0, 0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 4, 1, 1, 1, 1},
}

ObjectTemplates:addTemplate(object_tangible_tarkin_custom_statted_gcw_reward_drink_rebel, "object/tangible/tarkin_custom/statted/gcw_reward_drink_rebel.iff")


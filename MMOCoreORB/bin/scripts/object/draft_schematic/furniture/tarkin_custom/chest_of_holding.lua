object_draft_schematic_furniture_tarkin_custom_chest_of_holding = object_draft_schematic_furniture_tarkin_custom_shared_chest_of_holding:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Chest of Holding",

	craftingToolTab = 512, -- (See DraftSchematicObjectTemplate.h)
	complexity = 11,
	size = 2,
	factoryCrateSize = 10,

	xpType = "crafting_structure_general",
	xp = 720,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_furniture_ingredients_n", "craft_furniture_ingredients_n"},
	ingredientTitleNames = {"panelling", "frame"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"metal", "metal"},
	resourceQuantities = {120, 240},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/tarkin_custom_chest_of_holding.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_tarkin_custom_chest_of_holding, "object/draft_schematic/furniture/tarkin_custom/chest_of_holding.iff")

object_draft_schematic_item_tarkin_custom_data_screen = object_draft_schematic_item_tarkin_custom_shared_data_screen:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Data Screen",

	craftingToolTab = 512, -- (See DraftSchematicObjectTemplate.h)
	complexity = 12,
	size = 2,
	factoryCrateSize = 10,

	xpType = "crafting_structure_general",
	xp = 140,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_furniture_ingredients_n", "craft_furniture_ingredients_n"},
	ingredientTitleNames = {"frame", "screen"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"metal", "fiberplast"},
	resourceQuantities = {25, 20},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/data_screen.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_data_screen, "object/draft_schematic/item/tarkin_custom/data_screen.iff")

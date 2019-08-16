object_draft_schematic_item_tarkin_custom_data_terminal_01 = object_draft_schematic_item_tarkin_custom_shared_data_terminal_01:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Data Terminal, Style 1",

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
	ingredientTitleNames = {"screen", "frame"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"fiberplast", "metal"},
	resourceQuantities = {4, 8},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/data_terminal_01.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_data_terminal_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_terminal_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_terminal_04.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_data_terminal_01, "object/draft_schematic/item/tarkin_custom/data_terminal_01.iff")

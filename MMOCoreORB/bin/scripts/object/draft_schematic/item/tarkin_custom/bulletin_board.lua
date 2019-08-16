object_draft_schematic_item_tarkin_custom_bulletin_board = object_draft_schematic_item_tarkin_custom_shared_bulletin_board:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Bulletin Board",

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
	ingredientTitleNames = {"frame", "backer"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"wood", "fiberplast"},
	resourceQuantities = {6, 12},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/bulletin_board.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_whiteboard_01.iff",
			"object/tangible/tarkin_custom/decorative/shared_whiteboard_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_whiteboard_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_chalkboard_01.iff",
			"object/tangible/tarkin_custom/decorative/shared_chalkboard_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_letterboard_01.iff",
			"object/tangible/tarkin_custom/decorative/shared_letterboard_02.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_bulletin_board, "object/draft_schematic/item/tarkin_custom/bulletin_board.iff")

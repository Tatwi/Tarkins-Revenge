object_draft_schematic_item_tarkin_custom_noticeboard = object_draft_schematic_item_tarkin_custom_shared_noticeboard:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Noticeboard",

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
	resourceQuantities = {50, 20},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/noticeboard.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_noticeboard_imp.iff",
			"object/tangible/tarkin_custom/decorative/shared_noticeboard_imp_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_noticeboard_reb.iff",
			"object/tangible/tarkin_custom/decorative/shared_noticeboard_reb_02.iff",
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_noticeboard, "object/draft_schematic/item/tarkin_custom/noticeboard.iff")

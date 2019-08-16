object_draft_schematic_item_tarkin_custom_sticky_flimsi_01 = object_draft_schematic_item_tarkin_custom_shared_sticky_flimsi_01:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Sticky Flimsi, Style 1",

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
	ingredientTitleNames = {"paper", "adhesive"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"cereal", "fiberplast"},
	resourceQuantities = {3, 3},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/sticky_flimsi_01.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_04.iff",
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_05.iff",
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_06.iff",
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_07.iff",
			"object/tangible/tarkin_custom/decorative/shared_sticky_flimsi_08.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_sticky_flimsi_01, "object/draft_schematic/item/tarkin_custom/sticky_flimsi_01.iff")

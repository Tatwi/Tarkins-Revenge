object_draft_schematic_item_tarkin_custom_tome_01 = object_draft_schematic_item_tarkin_custom_shared_tome_01:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Ancient Tome, Style 1",

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
	ingredientTitleNames = {"paper", "leather_binding"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"fiberplast", "hide_leathery"},
	resourceQuantities = {8, 2},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/tome_01.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_tome_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_04.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_05.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_06.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_07.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_08.iff",
			"object/tangible/tarkin_custom/decorative/shared_tome_09.iff",

	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_tome_01, "object/draft_schematic/item/tarkin_custom/tome_01.iff")

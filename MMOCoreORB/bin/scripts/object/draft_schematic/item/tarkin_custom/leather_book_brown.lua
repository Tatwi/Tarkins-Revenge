object_draft_schematic_item_tarkin_custom_leather_book_brown = object_draft_schematic_item_tarkin_custom_shared_leather_book_brown:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Leather Book, Brown",

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

	targetTemplate = "object/tangible/tarkin_custom/decorative/leather_book_brown.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_leather_book_black.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_blue.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_cerulean.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_teal.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_green.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_gold.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_orange.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_red.iff",
			"object/tangible/tarkin_custom/decorative/shared_leather_book_purple.iff",

	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_leather_book_brown, "object/draft_schematic/item/tarkin_custom/leather_book_brown.iff")

object_draft_schematic_item_tarkin_custom_notebook = object_draft_schematic_item_tarkin_custom_shared_notebook:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Notebook",

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
	ingredientTitleNames = {"paper", "binding"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"fiberplast", "aluminum"},
	resourceQuantities = {8, 6},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/notebook.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_cookbook.iff",
			"object/tangible/tarkin_custom/decorative/shared_family_book.iff",
			"object/tangible/tarkin_custom/decorative/shared_max_rebo_book.iff",
			"object/tangible/tarkin_custom/decorative/shared_ewok_book.iff",
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_notebook, "object/draft_schematic/item/tarkin_custom/notebook.iff")

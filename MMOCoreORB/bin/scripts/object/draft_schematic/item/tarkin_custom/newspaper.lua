object_draft_schematic_item_tarkin_custom_newspaper = object_draft_schematic_item_tarkin_custom_shared_newspaper:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Newspaper",

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
	ingredientTitleNames = {"paper", "ink"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"fiberplast", "petrochem_inert_polymer"},
	resourceQuantities = {8, 4},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/newspaper.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_newspaper, "object/draft_schematic/item/tarkin_custom/newspaper.iff")

object_draft_schematic_item_tarkin_custom_public_notice = object_draft_schematic_item_tarkin_custom_shared_public_notice:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Public Notice",

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

	targetTemplate = "object/tangible/tarkin_custom/decorative/public_notice.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_public_notice, "object/draft_schematic/item/tarkin_custom/public_notice.iff")

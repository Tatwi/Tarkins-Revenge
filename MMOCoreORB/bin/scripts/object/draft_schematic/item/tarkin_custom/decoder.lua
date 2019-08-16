object_draft_schematic_item_tarkin_custom_decoder = object_draft_schematic_item_tarkin_custom_shared_decoder:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Decoder",

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
	ingredientTitleNames = {"frame", "display"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"metal", "fiberplast"},
	resourceQuantities = {6, 2},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/decoder.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_decoder, "object/draft_schematic/item/tarkin_custom/decoder.iff")

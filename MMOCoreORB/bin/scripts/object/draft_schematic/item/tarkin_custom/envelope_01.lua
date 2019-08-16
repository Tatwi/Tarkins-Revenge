object_draft_schematic_item_tarkin_custom_envelope_01 = object_draft_schematic_item_tarkin_custom_shared_envelope_01:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Envelope, Style 1",

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
	resourceTypes = {"cereal", "fiberplast"},
	resourceQuantities = {4, 4},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/envelope_01.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_envelope_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_envelope_03.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_envelope_01, "object/draft_schematic/item/tarkin_custom/envelope_01.iff")

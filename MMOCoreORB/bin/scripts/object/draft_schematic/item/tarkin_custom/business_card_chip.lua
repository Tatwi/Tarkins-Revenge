object_draft_schematic_item_tarkin_custom_business_card_chip = object_draft_schematic_item_tarkin_custom_shared_business_card_chip:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Business Card Chip",

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
	ingredientTitleNames = {"plasteel", "wiring"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"fiberplast", "copper"},
	resourceQuantities = {10, 4},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/business_card_chip.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_business_card_chip, "object/draft_schematic/item/tarkin_custom/business_card_chip.iff")

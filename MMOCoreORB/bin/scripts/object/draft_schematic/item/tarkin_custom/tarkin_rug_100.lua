object_draft_schematic_item_tarkin_custom_tarkin_rug_100 = object_draft_schematic_item_tarkin_custom_shared_tarkin_rug_100:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Week 8 Rugs Schematic",

	craftingToolTab = 512, -- (See DraftSchematicObjectTemplate.h)
	complexity = 15,
	size = 2,
	factoryCrateSize = 0,

	xpType = "crafting_structure_general",
	xp = 250,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_furniture_ingredients_n"},
	ingredientTitleNames = {"warp_weft"},
	ingredientSlotType = {0},
	resourceTypes = {"hide_wooly"},
	resourceQuantities = {200},
	contribution = {100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/rugs/tarkin_rug_100.iff",

	additionalTemplates = {
		"object/tangible/tarkin_custom/decorative/rugs/shared_tarkin_rug_23.iff",
		"object/tangible/tarkin_custom/decorative/rugs/shared_tarkin_rug_05.iff",
		"object/tangible/tarkin_custom/decorative/rugs/shared_tarkin_rug_112.iff",
		"object/tangible/tarkin_custom/decorative/rugs/shared_tarkin_rug_127.iff",
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_tarkin_rug_100, "object/draft_schematic/item/tarkin_custom/tarkin_rug_100.iff")

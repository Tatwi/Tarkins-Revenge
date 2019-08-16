object_draft_schematic_item_tarkin_custom_flimsiplast_01 = object_draft_schematic_item_tarkin_custom_shared_flimsiplast_01:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Flimsiplast, Style 1",

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
	resourceQuantities = {6, 6},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/flimsiplast_01.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_04.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_05.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_06.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_07.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_08.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_09.iff",
			"object/tangible/tarkin_custom/decorative/shared_flimsiplast_10.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_flimsiplast_01, "object/draft_schematic/item/tarkin_custom/flimsiplast_01.iff")

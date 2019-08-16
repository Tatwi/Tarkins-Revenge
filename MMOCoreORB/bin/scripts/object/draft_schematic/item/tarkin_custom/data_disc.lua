object_draft_schematic_item_tarkin_custom_data_disc = object_draft_schematic_item_tarkin_custom_shared_data_disc:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Data Disc",

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
	ingredientTitleNames = {"memory_module", "processing_module"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"fiberplast", "copper"},
	resourceQuantities = {8, 2},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/data_disc.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_data_disc_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_disc_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_disc_04.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_disc_05.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_disc_06.iff",
			"object/tangible/tarkin_custom/decorative/shared_data_disc_07.iff",
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_data_disc, "object/draft_schematic/item/tarkin_custom/data_disc.iff")

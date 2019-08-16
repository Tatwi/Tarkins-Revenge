object_draft_schematic_item_tarkin_custom_personal_datapad = object_draft_schematic_item_tarkin_custom_shared_personal_datapad:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Personal Datapad",

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
	ingredientTitleNames = {"frame", "screen"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"metal", "fiberplast"},
	resourceQuantities = {25, 20},
	contribution = {100, 100},

	targetTemplate = "object/tangible/tarkin_custom/decorative/personal_datapad.iff",

	additionalTemplates = {
			"object/tangible/tarkin_custom/decorative/shared_personal_datapad_02.iff",
			"object/tangible/tarkin_custom/decorative/shared_personal_datapad_03.iff",
			"object/tangible/tarkin_custom/decorative/shared_personal_datapad_04.iff",
			"object/tangible/tarkin_custom/decorative/shared_personal_datapad_05.iff",
			"object/tangible/tarkin_custom/decorative/shared_personal_datapad_06.iff",
			"object/tangible/tarkin_custom/decorative/shared_personal_datapad_07.iff",
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_personal_datapad, "object/draft_schematic/item/tarkin_custom/personal_datapad.iff")

object_draft_schematic_item_tarkin_custom_wanted_poster_human_female = object_draft_schematic_item_tarkin_custom_shared_wanted_poster_human_female:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Wanted: Human Female",

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

	targetTemplate = "object/tangible/tarkin_custom/decorative/tarkin_wanted_poster_human_female.iff",

	additionalTemplates = {"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_bothan_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_ithorian_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_mon_cal_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_nautolan_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_rodian_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_sullustan_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_togruta_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_trandoshan_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_twilek_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_wookiee_female.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_zabrak_female.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_wanted_poster_human_female, "object/draft_schematic/item/tarkin_custom/wanted_poster_human_female.iff")

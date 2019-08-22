object_draft_schematic_item_tarkin_custom_wanted_poster_human_male = object_draft_schematic_item_tarkin_custom_shared_wanted_poster_human_male:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Wanted: Human Male",

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

	targetTemplate = "object/tangible/tarkin_custom/decorative/tarkin_wanted_poster_human_male.iff",

	additionalTemplates = {"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_advozse.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_bothan_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_chadra_fan.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_devaronian_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_duros.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_gand.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_iktotchi.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_ithorian_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_mon_cal_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_nautolan_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_rodian_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_trandoshan_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_twilek_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_wookiee_male.iff",
		"object/tangible/tarkin_custom/decorative/shared_tarkin_wanted_poster_zabrak_male.iff"
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_wanted_poster_human_male, "object/draft_schematic/item/tarkin_custom/wanted_poster_human_male.iff")

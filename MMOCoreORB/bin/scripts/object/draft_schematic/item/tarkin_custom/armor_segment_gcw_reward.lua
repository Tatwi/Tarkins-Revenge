object_draft_schematic_item_tarkin_custom_armor_segment_gcw_reward = object_draft_schematic_item_tarkin_custom_shared_armor_segment_gcw_reward:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Interwoven Composite Segment",

	craftingToolTab = 2, -- (See DraftSchematicObjectTemplate.h)
	complexity = 33,
	size = 1,
	factoryCrateSize = 50,

	xpType = "crafting_clothing_armor",
	xp = 600,

	assemblySkill = "armor_assembly",
	experimentingSkill = "armor_experimentation",
	customizationSkill = "armor_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_weapon_ingredients_n"},
	ingredientTitleNames = {"segment_layer_assembly_plate", "armor_layer_weld_tabs", "segment_mounting_tabs", "reinforcement_matrix", "flexor_matrix", "defensive_layer", "segment_enhancement", "defensive_layer_2", "defensive_layer_3", "power_supply"},
	ingredientSlotType = {0, 0, 0, 1, 1, 3, 3, 3, 3, 3},
	resourceTypes = {"aluminum_titanium", "ore_intrusive_chanlon", "bone_mammal_yavin4", "object/tangible/component/armor/shared_bone_fragment_woolamander_harrower.iff", "object/tangible/component/armor/shared_hide_gurk_king.iff", "object/tangible/component/armor/shared_armor_layer.iff", "object/tangible/component/armor/shared_base_armor_segment_enhancement.iff", "object/tangible/component/armor/shared_armor_layer.iff", "object/tangible/component/armor/shared_armor_layer.iff", "object/tangible/component/weapon/shared_geonosian_power_cube_base.iff"},
	resourceQuantities = {160, 160, 75, 1, 1, 1, 1, 1, 1, 1},
	contribution = {100, 100, 100, 100, 100, 100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/tarkin_custom/statted/armor_segment_gcw_reward.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_armor_segment_gcw_reward, "object/draft_schematic/item/tarkin_custom/armor_segment_gcw_reward.iff")

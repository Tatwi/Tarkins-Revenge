object_draft_schematic_item_tarkin_custom_gcw_reward_drink_rebel = object_draft_schematic_item_tarkin_custom_shared_gcw_reward_drink_rebel:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Death Star Destruction",

   craftingToolTab = 4, -- (See DraftSchematicObjectTemplate.h)
   complexity = 15, 
   size = 1, 

   xpType = "crafting_food_general", 
   xp = 120, 

   assemblySkill = "food_assembly", 
   experimentingSkill = "food_experimentation", 
   customizationSkill = "", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_food_ingredients_n", "craft_food_ingredients_n", "craft_food_ingredients_n", "craft_food_ingredients_n", "craft_food_ingredients_n", "craft_food_ingredients_n"},
   ingredientTitleNames = {"flavor_agent", "questionable_liquid_component", "distilled_water", "alcohol", "carbosyrup", "additive"},
   ingredientSlotType = {0, 0, 0, 1, 2, 1},
   resourceTypes = {"fruit_fruits", "fuel_petrochem_liquid", "water", "object/tangible/food/crafted/shared_drink_alcohol.iff", "object/tangible/component/food/shared_ingredient_carbosyrup.iff", "object/tangible/food/crafted/additive/shared_additive_heavy.iff"},
   resourceQuantities = {25, 15, 15, 2, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/tarkin_custom/statted/gcw_reward_drink_rebel.iff",

   additionalTemplates = {}

}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_gcw_reward_drink_rebel, "object/draft_schematic/item/tarkin_custom/gcw_reward_drink_rebel.iff")

object_draft_schematic_item_tarkin_custom_pet_customization_kit = object_draft_schematic_item_tarkin_custom_shared_pet_customization_kit:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Pet Grooming Kit",

   craftingToolTab = 8192, -- (See DraftSchematicObjectTemplate.h)
   complexity = 12, 
   size = 1, 

   xpType = "crafting_bio_engineer_creature", 
   xp = 40, 

   assemblySkill = "bio_engineer_assembly", 
   experimentingSkill = "bio_engineer_experimentation", 
   customizationSkill = "bio_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n", "craft_droid_ingredients_n"},
   ingredientTitleNames = {"assembly_enclosure", "grooming_tools", "dye", "electronic_control_unit", "color_stowage"},
   ingredientSlotType = {1, 0, 0, 1, 1},
   resourceTypes = {"object/tangible/component/clothing/shared_synthetic_cloth.iff", "metal", "fruit", "object/tangible/component/item/shared_electronic_control_unit.iff", "object/tangible/component/droid/shared_droid_storage_compartment.iff"},
   resourceQuantities = {1, 9, 6, 1, 1},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/tarkin_custom/statted/pet_customization.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_item_tarkin_custom_pet_customization_kit, "object/draft_schematic/item/tarkin_custom/pet_customization_kit.iff")

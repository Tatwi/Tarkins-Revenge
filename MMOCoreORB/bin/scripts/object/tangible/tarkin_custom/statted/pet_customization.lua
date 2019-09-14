object_tangible_tarkin_custom_statted_pet_customization = object_tangible_tarkin_custom_statted_shared_pet_customization:new {
	templateType = PETCUSTOMKIT,
	objectMenuComponent = "PetGroomingKitObjectMenuComponent",

	numberExperimentalProperties = {1, 1, 1, 2},
	experimentalProperties = {"XX", "XX", "XX", "DR", "OQ"},
	experimentalWeights = {1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "null", "exp_quality"},
	experimentalSubGroupTitles = {"null", "null", "hit_points", "charges"},
	experimentalMin = {0, 0, 1000, 1},
	experimentalMax = {0, 0, 1000, 10},
	experimentalPrecision = {0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 1},
}

ObjectTemplates:addTemplate(object_tangible_tarkin_custom_statted_pet_customization, "object/tangible/tarkin_custom/statted/pet_customization.iff")

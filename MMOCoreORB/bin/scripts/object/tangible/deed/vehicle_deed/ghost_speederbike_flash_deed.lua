object_tangible_deed_vehicle_deed_ghost_speederbike_flash_deed = object_tangible_deed_vehicle_deed_shared_ghost_speederbike_flash_deed:new {

	templateType = VEHICLEDEED,	
	controlDeviceObjectTemplate = "object/intangible/vehicle/ghost_speederbike_flash_pcd.iff",
	generatedObjectTemplate = "object/mobile/vehicle/ghost_speederbike_flash.iff",
	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "SR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hit_points"},
	experimentalMin = {0, 0, 1000},
	experimentalMax = {0, 0, 2500},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 1},
}

ObjectTemplates:addTemplate(object_tangible_deed_vehicle_deed_ghost_speederbike_flash_deed, "object/tangible/deed/vehicle_deed/ghost_speederbike_flash_deed.iff")

object_mobile_vehicle_ghost_speederbike_flash = object_mobile_vehicle_shared_ghost_speederbike_flash:new {
	templateType = VEHICLE,
	decayRate = 15, -- Damage tick per decay cycle
	decayCycle = 600 -- Time in seconds per cycle
}

ObjectTemplates:addTemplate(object_mobile_vehicle_ghost_speederbike_flash, "object/mobile/vehicle/ghost_speederbike_flash.iff")

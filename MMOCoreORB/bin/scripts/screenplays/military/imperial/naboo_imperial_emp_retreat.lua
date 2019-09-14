NabooImperialEmpRetreatScreenPlay = ScreenPlay:new {
        numberOfActs = 1,

        screenplayName = "NabooImperialEmpRetreatScreenPlay",
}

registerScreenPlay("NabooImperialEmpRetreatScreenPlay", true)

function NabooImperialEmpRetreatScreenPlay:start()
	if (isZoneEnabled("naboo")) then
		self:spawnSceneObjects()
		self:spawnMobiles()
	end
end

function NabooImperialEmpRetreatScreenPlay:spawnSceneObjects()

	-- Terminals

	spawnSceneObject("naboo", "object/tangible/beta/beta_terminal_wound.iff", 2440.9, 292.0, -3890.5, 0, 0, 0, 1, 0)
	spawnSceneObject("naboo", "object/tangible/terminal/terminal_mission_imperial.iff", 2431.1, 292.0, -3911.5, 0, 0, 0, 1, 0)
	spawnSceneObject("naboo", "object/tangible/terminal/imp_travel_term.iff", 2437, 292.0, -3900, 0, 0, 0, 1, 0)

end

function NabooImperialEmpRetreatScreenPlay:spawnMobiles()

	spawnMobile("naboo", "stormtrooper_sentry", 360, 2438.1, 292.0, -3909.5, 169, 0)
	spawnMobile("naboo", "stormtrooper_sentry", 360, 2447.1, 292.0, -3907.8, 169, 0)

	spawnMobile("naboo", "stormtrooper_rifleman_sentry", 360, 2428.2, 292.0, -3929.3, 77, 0)
	spawnMobile("naboo", "stormtrooper_sniper_sentry", 360, 2431.3, 292.0, -3944.4, 81, 0)
	spawnMobile("naboo", "imperial_major_sentry", 360, 2422.8, 292.0, -3954.6, 171, 0)

	spawnMobile("naboo", "stormtrooper_combat_medic_sentry", 360, 2412.2, 292.0, -3941.2, 77, 0)
	spawnMobile("naboo", "stormtrooper_bombardier_sentry", 360, 2418.7, 292.0, -3911.8, -161, 0)

	spawnMobile("naboo", "stormtrooper_bombardier_sentry", 360, 2447.4, 292.0, -3900.9, -110, 0)
	spawnMobile("naboo", "stormtrooper_bombardier_sentry", 360, 2437.4, 292.0, -3904.9, 70, 0)

	spawnMobile("naboo", "imperial_recruiter", 1, 2425.95, 292.0, -3910.45, 156, 0)	
end


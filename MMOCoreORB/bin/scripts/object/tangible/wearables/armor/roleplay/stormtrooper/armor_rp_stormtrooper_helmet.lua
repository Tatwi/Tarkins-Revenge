object_tangible_wearables_armor_roleplay_stormtrooper_armor_rp_stormtrooper_helmet = object_tangible_wearables_armor_roleplay_stormtrooper_shared_armor_rp_stormtrooper_helmet:new {
	templateType = ARMOROBJECT,

	objectMenuComponent = "ArmorObjectMenuComponent",

	playerRaces = { 
				"object/creature/player/human_male.iff",
				"object/creature/player/human_female.iff",
				"object/creature/player/zabrak_male.iff",
				"object/creature/player/zabrak_female.iff",
				"object/mobile/vendor/human_female.iff",
				"object/mobile/vendor/human_male.iff",
				"object/mobile/vendor/zabrak_female.iff",
				"object/mobile/vendor/zabrak_male.iff" },

	-- These are default Blue Frog stats
	healthEncumbrance = 0,
	actionEncumbrance = 0,
	mindEncumbrance = 0,

	-- LIGHT, MEDIUM, HEAVY
	rating = LIGHT,

	maxCondition = 1000,
	
   	kinetic = 0,
	energy = 0,
	electricity = 0,
	stun = 0,
	blast = 0,
	heat = 0,
	cold = 0,
	acid = 0,
	lightSaber = 0,

}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_stormtrooper_armor_rp_stormtrooper_helmet, "object/tangible/wearables/armor/roleplay/stormtrooper/armor_rp_stormtrooper_helmet.iff")
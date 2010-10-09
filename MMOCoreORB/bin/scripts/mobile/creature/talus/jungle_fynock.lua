jungle_fynock = Creature:new {
	templateType = NPCCREATURE,
	gameObjectType = 1024,
	objectName = "@mob/creature_names:jungle_fynock",
	socialGroup = "Fynock",
	pvpFaction = "",
	faction = "",
	level = 13,
	chanceHit = 0.300000,
	damageMin = 140,
	damageMax = 150,
	range = 0,
	baseXp = 609,
	baseHAM = 1700,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "meat_avian",
	meatAmount = 28,
	hideType = "hide_leathery",
	hideAmount = 18,
	boneType = "bone_avian",
	boneAmount = 15,
	milk = 0.000000,
	tamingChance = 0.250000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = STALKER + PACK,
	diet = CARNIVORE,

	templates = {},
	weapons = {},
	attacks = {
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(jungle_fynock, "jungle_fynock")

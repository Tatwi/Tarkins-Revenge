giant_peko_peko = Creature:new {
	objectName = "@mob/creature_names:giant_peko_peko",
	socialGroup = "peko",
	faction = "",
	level = 23,
	chanceHit = 0.35,
	damageMin = 210,
	damageMax = 220,
	baseXp = 2219,
	baseHAM = 5900,
	baseHAMmax = 7200,
	armor = 0,
	resists = {10,125,150,-1,-1,150,-1,-1,-1},
	meatType = "meat_avian",
	meatAmount = 155,
	hideType = "hide_wooly",
	hideAmount = 70,
	boneType = "bone_avian",
	boneAmount = 45,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 8,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/giant_peko_peko.iff"},
	hues = { 0, 17, 33, 57, 65, 73, 81, 89, 97 },
	controlDeviceTemplate = "object/intangible/pet/peko_peko_hue.iff",
	scale = 1.5,
	lootGroups = {
	 {
	        groups = {
				{group = "peko_peko_trophy", chance = 10000000}
			},
			lootChance = 25000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"dizzyattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(giant_peko_peko, "giant_peko_peko")

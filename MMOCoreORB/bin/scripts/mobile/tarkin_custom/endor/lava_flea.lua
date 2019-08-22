lava_flea = Creature:new {
	customName = "a lava flea",
	socialGroup = "korga_tribe",
	faction = "korga_tribe",
	level = 44,
	chanceHit = 0.46,
	damageMin = 390,
	damageMax = 490,
	baseXp = 4370,
	baseHAM = 9500,
	baseHAMmax = 11600,
	armor = 1,
	resists = {130,130,160,115,-1,-1,0,-1,-1},
	meatType = "meat_insect",
	meatAmount = 60,
	hideType = "hide_scaley",
	hideAmount = 60,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/som/lava_flea.iff"},
	controlDeviceTemplate = "object/intangible/pet/lava_flea.iff",

	lootGroups = {
		{
			groups = {
				{group = "korga_cave_lava_flea", chance = 10000000},
			},
			lootChance = 500000
		}
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(lava_flea, "lava_flea")

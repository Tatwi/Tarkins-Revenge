kubaza_beetle = Creature:new {
	customName = "a kubaza beetle",
	socialGroup = "korga_tribe",
	faction = "korga_tribe",
	level = 18,
	chanceHit = 0.32,
	damageMin = 160,
	damageMax = 170,
	baseXp = 1257,
	baseHAM = 8500,
	baseHAMmax = 9300,
	armor = 0,
	resists = {50,50,25,-1,30,5,85,5,-1},
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

	templates = {"object/mobile/som/kubaza_beetle.iff"},
	controlDeviceTemplate = "object/intangible/pet/kubaza_beetle.iff",

	lootGroups = {
		{
			groups = {
				{group = "korga_cave_kubaza_beetle", chance = 10000000},
			},
			lootChance = 500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"mediumpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(kubaza_beetle, "kubaza_beetle")

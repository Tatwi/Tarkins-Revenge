tarkin_halloween_spider_02 = Creature:new {
	customName = "a skittering arachnid",
	socialGroup = "halloween",
	faction = "",
	level = 50,
	chanceHit = 0.32,
	damageMin = 160,
	damageMax = 170,
	baseXp = 1257,
	baseHAM = 28500,
	baseHAMmax = 29300,
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
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 0.75,
	templates = {"object/mobile/hermit_spider.iff"},
	lootGroups = {
		{
			groups = {
				{group = "halloween", chance = 10000000},
			},
			lootChance = 7500000
		},
		{	
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "armor_attachments", chance = 5000000}	
			},
			lootChance = 100000
		},
		{	
			groups = {
				{group = "halloween_spiders", chance = 10000000},
			},
			lootChance = 333333
		},	
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"mediumpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_spider_02, "tarkin_halloween_spider_02")

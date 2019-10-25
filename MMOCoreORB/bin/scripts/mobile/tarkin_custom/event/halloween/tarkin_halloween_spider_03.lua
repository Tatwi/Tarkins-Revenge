tarkin_halloween_spider_03 = Creature:new {
	customName = "a dungeon creeper",
	socialGroup = "halloween",
	faction = "",
	level = 70,
	chanceHit = 0.76,
	damageMin = 390,
	damageMax = 490,
	baseXp = 9370,
	baseHAM = 29500,
	baseHAMmax = 31600,
	armor = 1,
	resists = {130,130,160,115,-1,-1,0,-1,-1},
	meatType = "meat_insect",
	meatAmount = 80,
	hideType = "hide_scaley",
	hideAmount = 80,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	templates = {"object/mobile/spider_royal_guard.iff"},
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
			lootChance = 200000
		},
		{	
			groups = {
				{group = "halloween_spiders", chance = 10000000},
			},
			lootChance = 333333
		},	
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_spider_03, "tarkin_halloween_spider_03")

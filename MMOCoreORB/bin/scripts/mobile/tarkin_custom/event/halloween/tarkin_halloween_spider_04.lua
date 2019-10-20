tarkin_halloween_spider_04 = Creature:new {
	customName = "a spider queen mother",
	socialGroup = "halloween",
	faction = "",
	level = 90,
	chanceHit = 0.85,
	damageMin = 450,
	damageMax = 500,
	baseXp = 9370,
	baseHAM = 29500,
	baseHAMmax = 31600,
	armor = 2,
	resists = {50,20,50,20,70,5,25,50,-1},
	meatType = "meat_insect",
	meatAmount = 90,
	hideType = "hide_scaley",
	hideAmount = 90,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 2.0,
	templates = {"object/mobile/spider_queen_consort.iff"},
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
			lootChance = 250000
		},
		{	
			groups = {
				{group = "halloween_spiders", chance = 10000000},
			},
			lootChance = 333333
		},	
	},
	weapons = {"creature_spit_spray_red"},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_spider_04, "tarkin_halloween_spider_04")

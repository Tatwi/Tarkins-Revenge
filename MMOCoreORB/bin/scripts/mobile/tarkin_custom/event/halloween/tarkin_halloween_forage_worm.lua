tarkin_halloween_forage_worm = Creature:new {
	objectName = "@mob/creature_names:forage_worm",
	socialGroup = "halloween",
	faction = "",
	level = 51,
	chanceHit = 0.51,
	damageMin = 400,
	damageMax = 510,
	baseXp = 9007,
	baseHAM = 20000,
	baseHAMmax = 23000,
	armor = 1,
	resists = {135,135,-1,160,160,160,-1,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 60,
	hideType = "hide_leathery",
	hideAmount = 60,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/beast_master/bm_forage_worm.iff"},
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
				{group = "halloween_forage_worms", chance = 10000000},
			},
			lootChance = 333333
		},	
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_forage_worm, "tarkin_halloween_forage_worm")

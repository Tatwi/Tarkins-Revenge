tusken_avenger = Creature:new {
	objectName = "@mob/creature_names:tusken_avenger",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	level = 48,
	chanceHit = 0.49,
	damageMin = 385,
	damageMax = 480,
	baseXp = 4734,
	baseHAM = 10000,
	baseHAMmax = 12200,
	armor = 0,
	resists = {40,10,0,50,-1,30,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/tusken_raider.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 5000000},
				{group = "tusken_common", chance = 2000000},
				{group = "bone_armor", chance = 1500000},
				{group = "chitin_armor", chance = 1500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 5000000},
				{group = "clothing_attachments", chance = 5000000}
			},
			lootChance = 3000000
		},
		{
			groups = {
				{group = "color_crystals", chance = 5000000},
				{group = "power_crystals", chance = 5000000}
			},
			lootChance = 1500000
		}
	},
	weapons = {"tusken_weapons"},
	conversationTemplate = "",
	attacks = merge(marksmanmaster,brawlermaster,fencermaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(tusken_avenger, "tusken_avenger")

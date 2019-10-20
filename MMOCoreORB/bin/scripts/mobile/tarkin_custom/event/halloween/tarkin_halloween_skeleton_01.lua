tarkin_halloween_skeleton_01 = Creature:new {
	customName = "a skeleton",
	socialGroup = "halloween",
	faction = "",
	level = 45,
	chanceHit = 0.45,
	damageMin = 420,
	damageMax = 450,
	baseXp = 3551,
	baseHAM = 18800,
	baseHAMmax = 20800,
	armor = 0,
	resists = {30,45,10,50,40,10,50,30,-1},
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
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/halloween_skeleton_1.iff"},
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
			lootChance = 50000
		},
		{	
			groups = {
				{group = "halloween_skeletons", chance = 10000000},
			},
			lootChance = 333333
		},			
	},
	weapons = {},
	conversationTemplate = "",
	attacks = merge(brawlermid)
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_skeleton_01, "tarkin_halloween_skeleton_01")

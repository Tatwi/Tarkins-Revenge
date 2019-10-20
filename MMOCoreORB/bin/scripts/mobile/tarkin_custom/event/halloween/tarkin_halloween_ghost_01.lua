tarkin_halloween_ghost_01 = Creature:new {
	customName = "a timid ghost",
	socialGroup = "halloween",
	faction = "",
	level = 60,
	chanceHit = 0.6,
	damageMin = 250,
	damageMax = 265,
	baseXp = 8100,
	baseHAM = 30500,
	baseHAMmax = 31500,
	armor = 1,
	resists = {40,20,40,20,50,10,-1,-1,-1},
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

	templates = {
		"object/mobile/tarkin_ghost_01.iff",
		"object/mobile/tarkin_ghost_02.iff",
		"object/mobile/tarkin_ghost_03.iff",
		"object/mobile/tarkin_ghost_04.iff"},
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
				{group = "halloween_ghosts", chance = 10000000},
			},
			lootChance = 333333
		},	
	},
	weapons = {"aqualish_polearm_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermid,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_ghost_01, "tarkin_halloween_ghost_01")

tarkin_halloween_ghost_04 = Creature:new {
	customName = "a melancholy ghost",
	socialGroup = "halloween",
	faction = "",
	level = 35,
	chanceHit = 0.41,
	damageMin = 320,
	damageMax = 350,
	baseXp = 3551,
	baseHAM = 8800,
	baseHAMmax = 10800,
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
			lootChance = 50000
		},
		{	
			groups = {
				{group = "halloween_ghosts", chance = 10000000},
			},
			lootChance = 333333
		},			
	},
	weapons = {"event_melee_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermid)
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_ghost_04, "tarkin_halloween_ghost_04")

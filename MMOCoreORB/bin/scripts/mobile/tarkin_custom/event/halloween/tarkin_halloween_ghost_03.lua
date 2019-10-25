tarkin_halloween_ghost_03 = Creature:new {
	customName = "a slobbering ghost",
	socialGroup = "halloween",
	faction = "",
	level = 80,
	chanceHit = 0.65,
	damageMin = 350,
	damageMax = 500,
	baseXp = 10200,
	baseHAM = 32500,
	baseHAMmax = 34500,
	armor = 2,
	resists = {5,60,70,-1,40,55,15,0,-1},
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
			lootChance = 200000
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
	attacks = merge(pikemanmaster,fencermaster,brawlermaster,tkamaster,swordsmanmaster)
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_ghost_03, "tarkin_halloween_ghost_03")

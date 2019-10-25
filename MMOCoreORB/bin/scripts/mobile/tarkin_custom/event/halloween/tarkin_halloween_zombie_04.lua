tarkin_halloween_zombie_04 = Creature:new {
	customName = "a rabid zombie",
	socialGroup = "halloween",
	faction = "",
	level = 85,
	chanceHit = 0.7,
	damageMin = 450,
	damageMax = 600,
	baseXp = 12174,
	baseHAM = 33400,
	baseHAMmax = 35000,
	armor = 2,
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
		"object/mobile/dressed_zombie_storyteller.iff",
		"object/mobile/outbreak_undead_boss_f_hum_02.iff",
		"object/mobile/outbreak_undead_boss_m_twe_01.iff",
		"object/mobile/outbreak_undead_civilian_09.iff",
		"object/mobile/outbreak_undead_civilian_15.iff",
		"object/mobile/outbreak_undead_civilian_43.iff"},
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
				{group = "halloween_zombies", chance = 10000000},
			},
			lootChance = 333333
		},			
	},
	weapons = {"event_ranged_weapons"},
	conversationTemplate = "",
	attacks = merge(pistoleermaster,carbineermaster,riflemanmaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_zombie_04, "tarkin_halloween_zombie_04")

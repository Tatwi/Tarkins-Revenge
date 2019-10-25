tarkin_halloween_deathtrooper_02 = Creature:new {
	customName = "a plague-stricken deathtrooper",
	socialGroup = "halloween",
	faction = "",
	level = 95,
	chanceHit = 0.95,
	damageMin = 650,
	damageMax = 750,
	baseXp = 19174,
	baseHAM = 53400,
	baseHAMmax = 55000,
	armor = 1,
	resists = {165,165,175,-1,200,20,20,-1,-1},
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
		"object/mobile/outbreak_undead_deathtrooper_09_m.iff",
		"object/mobile/outbreak_undead_deathtrooper_11_m.iff",
		"object/mobile/outbreak_undead_deathtrooper_12_m.iff",
		"object/mobile/outbreak_undead_deathtrooper_14_m.iff"},
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
				{group = "halloween_death_troopers", chance = 10000000},
			},
			lootChance = 333333
		},			
	},
	weapons = {"imperial_weapons_medium"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_deathtrooper_02, "tarkin_halloween_deathtrooper_02")

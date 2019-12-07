lifeday_minstyngar = Creature:new {
	customName = "a minstyngar",
	socialGroup = "minstyngar",
	faction = "",
	level = 22,
	chanceHit = 0.33,
	damageMin = 190,
	damageMax = 200,
	baseXp = 2006,
	baseHAM = 5400,
	baseHAMmax = 6600,
	armor = 0,
	resists = {115,120,5,-1,-1,-1,5,145,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/minstyngar.iff"},
	lootGroups = {
		{
			groups = {
				{group = "lifeday_minstyngar_horn", chance = 10000000},
			},
			lootChance = 3333300
		},
		{
	        groups = {
				{group = "lifeday_minstyngar_head", chance = 10000000},	
			},
			lootChance = 1250000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(lifeday_minstyngar, "lifeday_minstyngar")

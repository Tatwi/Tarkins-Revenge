lifeday_webweaver = Creature:new {
	customName = "a webweaver",
	socialGroup = "webweaver",
	faction = "",
	level = 30,
	chanceHit = 0.39,
	damageMin = 290,
	damageMax = 300,
	baseXp = 3005,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {25,25,25,25,25,-1,25,-1,-1},
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/webweaver.iff"},
	lootGroups = {
		{
			groups = {
				{group = "lifeday_webweaver_eye", chance = 10000000},
			},
			lootChance = 3333300
		},
		{
	        groups = {
				{group = "lifeday_webweaver_head", chance = 10000000},	
			},
			lootChance = 1250000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"posturedownattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(lifeday_webweaver, "lifeday_webweaver")

lifeday_kkorrwrot = Creature:new {
	customName = "a kkorrwrot",
	socialGroup = "kkorrwrot",
	faction = "",
	level = 19,
	chanceHit = 0.33,
	damageMin = 190,
	damageMax = 220,
	baseXp = 1609,
	baseHAM = 4100,
	baseHAMmax = 5000,
	armor = 0,
	resists = {120,5,5,-1,-1,-1,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 3,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/kkorrwrot.iff"},
	lootGroups = {
		{
			groups = {
				{group = "lifeday_kkorrwrot_leg", chance = 10000000},
			},
			lootChance = 3333300
		},
		{
	        groups = {
				{group = "lifeday_kkorrwrot_head", chance = 10000000},	
			},
			lootChance = 1250000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(lifeday_kkorrwrot, "lifeday_kkorrwrot")

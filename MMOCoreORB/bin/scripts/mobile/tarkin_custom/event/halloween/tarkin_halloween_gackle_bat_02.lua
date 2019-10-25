tarkin_halloween_gackle_bat_02 = Creature:new {
	customName = "a gackle bat behemoth",
	socialGroup = "halloween",
	faction = "",
	level = 80,
	chanceHit = 0.8,
	damageMin = 495,
	damageMax = 585,
	baseXp = 3560,
	baseHAM = 30500,
	baseHAMmax = 34950,
	armor = 1,
	resists = {140,140,-1,15,15,-1,-1,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 75,
	hideType = "hide_bristley",
	hideAmount = 75,
	boneType = "bone_mammal",
	boneAmount = 40,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 2.25,
	templates = {"object/mobile/gackle_bat_hue.iff"},
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
				{group = "halloween_gackle_bats", chance = 10000000},
			},
			lootChance = 333333
		},	
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"dizzyattack",""},
		{"blindattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_gackle_bat_02, "tarkin_halloween_gackle_bat_02")

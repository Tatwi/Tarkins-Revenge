tarkin_halloween_gackle_bat_01 = Creature:new {
	customName = "a gackle bat youngling",
	socialGroup = "halloween",
	faction = "",
	level = 50,
	chanceHit = 0.5,
	damageMin = 405,
	damageMax = 495,
	baseXp = 3560,
	baseHAM = 20500,
	baseHAMmax = 24950,
	armor = 0,
	resists = {115,115,0,-1,-1,-1,-1,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 35,
	hideType = "hide_bristley",
	hideAmount = 35,
	boneType = "bone_mammal",
	boneAmount = 18,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 0.5,
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
			lootChance = 100000
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
		{"",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_gackle_bat_01, "tarkin_halloween_gackle_bat_01")

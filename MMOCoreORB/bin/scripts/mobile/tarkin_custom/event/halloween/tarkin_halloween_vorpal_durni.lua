tarkin_halloween_vorpal_durni = Creature:new {
	customName = "a titanic vorpal durni",
	socialGroup = "halloween",
	faction = "",
	level = 85,
	chanceHit = 0.7,
	damageMin = 450,
	damageMax = 600,
	baseXp = 12174,
	baseHAM = 53400,
	baseHAMmax = 55000,
	armor = 2,
	resists = {40,60,70,-1,40,55,15,0,-1},
	meatType = "meat_carnivore",
	meatAmount = 175,
	hideType = "hide_wooly",
	hideAmount = 175,
	boneType = "bone_mammal",
	boneAmount = 140,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 5,
	templates = {"object/mobile/beast_master/bm_mutated_durni.iff"},
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
				{group = "halloween_vorpal_durnis", chance = 10000000},
			},
			lootChance = 333333
		},			
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"stunattack",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(tarkin_halloween_vorpal_durni, "tarkin_halloween_vorpal_durni")

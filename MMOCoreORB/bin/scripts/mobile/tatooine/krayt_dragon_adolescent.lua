krayt_dragon_adolescent = Creature:new {
	objectName = "@mob/creature_names:krayt_dragon_adolescent",
	socialGroup = "krayt",
	faction = "",
	level = 336,
	chanceHit = 12.0,
	damageMin = 931,
	damageMax = 1500,
	baseXp = 26356,
	baseHAM = 150000,
	baseHAMmax = 201000,
	armor = 2,
	resists = {170,170,30,30,120,30,30,30,-1},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 750,
	boneType = "bone_mammal",
	boneAmount = 675,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/krayt_dragon_hue.iff"},
	hues = { 16, 17, 18, 19, 20, 21, 22, 23 },
	scale = 0.7;
	lootGroups = {
		{
	        groups = {
				{group = "krayt_dragon_common", chance = 3300000},
				{group = "krayt_tissue_uncommon", chance = 3300000},
				{group = "krayt_pearls", chance = 3400000}
			},
			lootChance = 6000000
		},
		{
	        groups = {
				{group = "composite_armor", chance = 2000000},
				{group = "ubese_armor", chance = 2000000},
				{group = "melee_two_handed", chance = 2000000},
				{group = "rifles", chance = 2000000},
				{group = "krayt_pearls", chance = 2000000}				
			},
			lootChance = 10000000
		},
		{	
			groups = {
				{group = "krayt_trophy", chance = 10000000}
			},
			lootChance = 25000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"creatureareaknockdown",""}
	}
}

CreatureTemplates:addCreatureTemplate(krayt_dragon_adolescent, "krayt_dragon_adolescent")

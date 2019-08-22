aakuan_spice_guard_poi = Creature:new {
	objectName = "",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	customName = "an Aa'kuan Spice Guard",
	socialGroup = "aakuans",
	faction = "aakuans",
	level = 85,
	chanceHit = 0.43,
	damageMin = 250,
	damageMax = 260,
	baseXp = 7822,
	baseHAM = 38000,
	baseHAMmax = 42000,
	armor = 1,
	resists = {70,70,40,10,60,10,10,25,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_aakuan_defender_human_female_01.iff",
		"object/mobile/dressed_aakuan_defender_human_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 1400000},
				{group = "aakuan_common", chance = 1300000},
				{group = "armor_attachments", chance = 1200000},
				{group = "clothing_attachments", chance = 1200000},
				{group = "rifles", chance = 1533333},
				{group = "carbines", chance = 1533333},
				{group = "pistols", chance = 1533334},
				{group = "aakuan_rare", chance = 300000}
			},
		    lootChance = 3500000
		}
	},
	weapons = {"aakuan_2h_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/fancy",
	attacks = swordsmanmaster
}

CreatureTemplates:addCreatureTemplate(aakuan_spice_guard_poi, "aakuan_spice_guard_poi")

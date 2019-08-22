aakuan_guardian_poi = Creature:new {
	objectName = "@mob/creature_names:aakuan_guardian",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "aakuans",
	faction = "aakuans",
	level = 50,
	chanceHit = 0.42,
	damageMin = 220,
	damageMax = 230,
	baseXp = 6637,
	baseHAM = 35400,
	baseHAMmax = 37000,
	armor = 1,
	resists = {60,60,30,20,55,40,40,50,-1},
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
		"object/mobile/dressed_aakuan_guardian_trandoshan_female_01.iff",
		"object/mobile/dressed_aakuan_guardian_trandoshan_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3200000},
				{group = "aakuan_common", chance = 2300000},
				{group = "armor_attachments", chance = 800000},
				{group = "clothing_attachments", chance = 800000},
				{group = "rifles", chance = 900000},
				{group = "carbines", chance = 900000},
				{group = "pistols", chance = 900000},
				{group = "aakuan_rare", chance = 200000}
			},
		    lootChance = 3000000
		}
	},
	weapons = {"aakuan_1h_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/fancy",
	attacks = fencermaster
}

CreatureTemplates:addCreatureTemplate(aakuan_guardian_poi, "aakuan_guardian_poi")

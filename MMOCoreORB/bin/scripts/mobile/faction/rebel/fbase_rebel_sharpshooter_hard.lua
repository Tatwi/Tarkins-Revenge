fbase_rebel_sharpshooter_hard = Creature:new {
	objectName = "@mob/creature_names:fbase_rebel_sharpshooter_hard",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 78,
	chanceHit = 0.78,
	damageMin = 535,
	damageMax = 780,
	baseXp = 7800,
	baseHAM = 14500,
	baseHAMmax = 22000,
	armor = 1,
	resists = {110,110,140,25,25,25,25,-1,-1},
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
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_rebel_trooper_bith_m_01.iff",
		"object/mobile/dressed_rebel_trooper_human_female_01.iff",
		"object/mobile/dressed_rebel_trooper_human_male_01.iff",
		"object/mobile/dressed_rebel_trooper_sullustan_male_01.iff",
		"object/mobile/dressed_rebel_trooper_twk_female_01.iff",
		"object/mobile/dressed_rebel_trooper_twk_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 200000},
				{group = "junk", chance = 5000000},
				{group = "weapons_all", chance = 1250000},
				{group = "factional_imperial", chance = 1250000},
				{group = "clothing_attachments", chance = 1150000},
				{group = "armor_attachments", chance = 1150000}
			}
		}
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(brawlermaster,marksmanmaster,riflemanmid)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_sharpshooter_hard, "fbase_rebel_sharpshooter_hard")

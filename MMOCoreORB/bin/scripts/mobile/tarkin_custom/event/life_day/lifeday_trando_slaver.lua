lifeday_trando_slaver = Creature:new {
	customName = "a trandoshan slaver",
	socialGroup = "slaver",
	faction = "slaver",
	level = 15,
	chanceHit = 0.31,
	damageMin = 160,
	damageMax = 170,
	baseXp = 831,
	baseHAM = 2400,
	baseHAMmax = 3000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
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
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_blood_razor_pirate_cutthroat_tran_m.iff",
		"object/mobile/dressed_criminal_thug_trandoshan_male_01.iff",
		"object/mobile/dressed_commando_trainer_trandoshan_male_01.iff",
		"object/mobile/dressed_blood_razor_pirate_strong_tran_m.iff",
		"object/mobile/dressed_tatooine_trandoshan_slaver.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 2450000},
				{group = "tailor_components", chance = 1500000},
				{group = "loot_kit_parts", chance = 6050000},
			}
		}
	},
	weapons = {"pirate_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",
	attacks = merge(brawlermid,marksmanmid)
}

CreatureTemplates:addCreatureTemplate(lifeday_trando_slaver, "lifeday_trando_slaver")

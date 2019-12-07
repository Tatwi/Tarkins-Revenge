lifeday_chief_attilochit = Creature:new {
	customName = "Chief Attilochit",
	socialGroup = "",
	faction = "",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = INVULNERABLE + CONVERSABLE + INTERESTING,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_ep3_forest_warchief.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "LifeDayDreamsAttilochitConvoTemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(lifeday_chief_attilochit, "lifeday_chief_attilochit")

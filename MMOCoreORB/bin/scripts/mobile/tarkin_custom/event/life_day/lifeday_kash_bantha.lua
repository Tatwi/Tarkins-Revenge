lifeday_kash_bantha = Creature:new {
	customName = "a Kashyyyk bantha",
	socialGroup = "bantha",
	faction = "",
	level = 25,
	chanceHit = 0.35,
	damageMin = 230,
	damageMax = 240,
	baseXp = 2543,
	baseHAM = 7700,
	baseHAMmax = 8550,
	armor = 0,
	resists = {135,110,10,150,-1,-1,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 4,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	hues = { 0, 1, 2, 3, 7 },
	templates = {"object/mobile/kashyyyk_bantha.iff"},
	lootGroups = {
		{
			groups = {
				{group = "lifeday_kash_bantha_pelt", chance = 10000000},
			},
			lootChance = 3333300
		},
		{
	        groups = {
				{group = "lifeday_kash_bantha_head", chance = 10000000},	
			},
			lootChance = 1250000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"posturedownattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(lifeday_kash_bantha, "lifeday_kash_bantha")

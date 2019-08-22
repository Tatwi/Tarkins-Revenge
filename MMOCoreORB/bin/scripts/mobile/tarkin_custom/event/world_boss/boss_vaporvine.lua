boss_vaporvine = Creature:new {
	customName = "Vaporvine",
	socialGroup = "self",
	faction = "",
	level = 300,
	chanceHit = 30,
	damageMin = 1180,
	damageMax = 2250,
	baseXp = 28549,
	baseHAM = 410000,
	baseHAMmax = 501000,
	armor = 2,
	resists = {184,100,53,198,13,6,169,156,32},
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
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 2.5,

	templates = {"object/mobile/som/jundak.iff"},
	lootGroups = {
		{
			groups = {
				{group = "av_21_scheme", chance = 3333333},
				{group = "boss_phrik_shard", chance = 3333334},
				{group = "boss_acklay_venom", chance = 3333333},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "boss_mokk_blood", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "boss_themepark_components", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "all_deco", chance = 2000000},
				{group = "all_deco_two", chance = 2000000},
				{group = "all_deco_three", chance = 2000000},
				{group = "all_deco_four", chance = 2000000},
				{group = "all_deco_five", chance = 2000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "all_deco", chance = 2000000},
				{group = "all_deco_two", chance = 2000000},
				{group = "all_deco_three", chance = 2000000},
				{group = "all_deco_four", chance = 2000000},
				{group = "all_deco_five", chance = 2000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "all_deco", chance = 2000000},
				{group = "all_deco_two", chance = 2000000},
				{group = "all_deco_three", chance = 2000000},
				{group = "all_deco_four", chance = 2000000},
				{group = "all_deco_five", chance = 2000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "all_deco", chance = 2000000},
				{group = "all_deco_two", chance = 2000000},
				{group = "all_deco_three", chance = 2000000},
				{group = "all_deco_four", chance = 2000000},
				{group = "all_deco_five", chance = 2000000},
			},
			lootChance = 10000000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}
CreatureTemplates:addCreatureTemplate(boss_vaporvine, "boss_vaporvine")

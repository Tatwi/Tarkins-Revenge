boss_baneblight = Creature:new {
	customName = "Baneblight",
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
	resists = {128,193,121,86,128,114,193,55,161},
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
	scale = 3,

	templates = {"object/mobile/beast_master/bm_reek.iff"},
	lootGroups = {
		{
			groups = {
				{group = "av_21_pp", chance = 1428571},
				{group = "av_21_scheme", chance = 1428571},
				{group = "jetpack_base", chance = 1428571},
				{group = "jetpack_parts", chance = 4285716},
				{group = "mandalorian_jetpack", chance = 1428571},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "elite_backpacks", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "cu_nge_subcomponents", chance = 10000000},
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
CreatureTemplates:addCreatureTemplate(boss_baneblight, "boss_baneblight")

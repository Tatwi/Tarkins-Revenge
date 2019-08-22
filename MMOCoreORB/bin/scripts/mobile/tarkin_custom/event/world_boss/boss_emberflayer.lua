boss_emberflayer = Creature:new {
	customName = "Emberflayer",
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
	resists = {37,79,187,12,88,52,71,181,100},
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
	scale = .5,

	templates = {"object/mobile/som/tanray.iff"},
	lootGroups = {
		{
			groups = {
				{group = "boss_phrik_shard", chance = 3333333},
				{group = "boss_janta_blood", chance = 3333334},
				{group = "boss_rancor_tooth", chance = 3333333},
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
		{"strongdisease",""},
		{"knockdownattack",""}
	}
}
CreatureTemplates:addCreatureTemplate(boss_emberflayer, "boss_emberflayer")

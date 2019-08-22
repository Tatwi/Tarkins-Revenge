boss_blazehound = Creature:new {
	customName = "Blazehound",
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
	resists = {108,22,91,91,33,122,10,54,52},
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
	scale = 4,

	templates = {"object/mobile/beast_master/bm_mooc.iff"},
	lootGroups = {
		{
			groups = {
				{group = "nge_smc_house_hut", chance = 454545},
				{group = "nge_ns_house_hut", chance = 454545},
				{group = "nge_house_bespin", chance = 454546},
				{group = "nge_house_commando", chance = 454546},
				{group = "nge_yoda_house", chance = 454546},
				{group = "nge_house_jabba", chance = 454546},
				{group = "nge_house_mustafar", chance = 454546},
				{group = "nge_house_sand_crawler", chance = 454546},
				{group = "nge_house_tree", chance = 454546},
				{group = "nge_house_vehicle", chance = 454546},
				{group = "nge_house_barn", chance = 454546},
				{group = "nge_house_diner", chance = 454546},
				{group = "nge_house_atat", chance = 454545},
				{group = "nge_house_hangar", chance = 454545},
				{group = "nge_house_relaxation", chance = 454545},
				{group = "nge_house_vip", chance = 454545},
				{group = "nge_house_jedi", chance = 454545},
				{group = "nge_house_sith", chance = 454545},
				{group = "nge_house_yt1300", chance = 454545},
				{group = "rebel_spire", chance = 454545},
				{group = "imperial_spire", chance = 454545},
				{group = "nge_house_atat", chance = 454545}
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
		{"creatureareadisease",""},
		{"mildpoison",""}
	}
}
CreatureTemplates:addCreatureTemplate(boss_blazehound, "boss_blazehound")

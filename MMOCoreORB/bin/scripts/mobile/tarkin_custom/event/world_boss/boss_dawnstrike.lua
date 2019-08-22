boss_dawnstrike = Creature:new {
	customName = "Dawnstrike",
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
	resists = {132,192,46,56,36,46,157,54,115},
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

	templates = {"object/mobile/beast_master/bm_mutated_griffon.iff"},
	lootGroups = {
		{
			groups = {
				{group = "boss_krayt_tissues", chance = 3333333},
				{group = "smuggled_bantha_ivory", chance = 3333334},
				{group = "nge_smc_house_hut", chance = 151515},
				{group = "nge_ns_house_hut", chance = 151515},
				{group = "nge_house_bespin", chance = 151515},
				{group = "nge_house_commando", chance = 151515},
				{group = "nge_yoda_house", chance = 151515},
				{group = "nge_house_jabba", chance = 151515},
				{group = "nge_house_mustafar", chance = 151516},
				{group = "nge_house_sand_crawler", chance = 151515},
				{group = "nge_house_tree", chance = 151515},
				{group = "nge_house_vehicle", chance = 151516},
				{group = "nge_house_barn", chance = 151515},
				{group = "nge_house_diner", chance = 151515},
				{group = "nge_house_atat", chance = 151515},
				{group = "nge_house_hangar", chance = 151516},
				{group = "nge_house_relaxation", chance = 151515},
				{group = "nge_house_vip", chance = 151515},
				{group = "nge_house_jedi", chance = 151515},
				{group = "nge_house_sith", chance = 151515},
				{group = "nge_house_yt1300", chance = 151515},
				{group = "rebel_spire", chance = 151515},
				{group = "imperial_spire", chance = 151515},
				{group = "nge_house_atat", chance = 151515},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "armor_attachments", chance = 5000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nge_cu_vehicles", chance = 10000000},
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
		{"",""},
		{"intimidationattack",""}
	}
}
CreatureTemplates:addCreatureTemplate(boss_dawnstrike, "boss_dawnstrike")

black_sun_ghost_poi_3 = Creature:new {
	customName = "Black Sun Ghost",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 152,
	chanceHit = 8.5,
	damageMin = 900,
	damageMax = 1125,
	baseXp = 14314,
	baseHAM = 165000,
	baseHAMmax = 165000,
	armor = 2,
	resists = {65,65,70,60,35,35,90,50,55},
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,

	templates = {"object/mobile/dressed_death_watch_grey.iff"},
	lootGroups = {
		{
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "armor_attachments", chance = 5000000}
			},
			lootChance = 7000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "armor_attachments", chance = 5000000}
			},
			lootChance = 7000000
		},
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 2500000},
				{group = "death_watch_bunker_lieutenants", chance = 2500000},
				{group = "death_watch_bunker_ingredient_protective",  chance = 2500000},
				{group = "death_watch_bunker_ingredient_binary",  chance = 2500000}
			},
			lootChance = 700000
		},
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 2500000},
				{group = "death_watch_bunker_lieutenants", chance = 2500000},
				{group = "death_watch_bunker_ingredient_protective",  chance = 2500000},
				{group = "death_watch_bunker_ingredient_binary",  chance = 2500000}
			},
			lootChance = 700000
		},
		{	
			groups = {
				{group = "black_sun_outpost_rare", chance = 7000000},
				{group = "bounty_hunter_schemes", chance = 1900000},
				{group = "black_sun_mando_armor", chance = 1000000},
				{group = "deed_voucher", chance = 100000}		
			},
			lootChance = 700000
		},
		{	
			groups = {
				{group = "black_sun_outpost_rare", chance = 6000000},
				{group = "bounty_hunter_schemes", chance = 2400000},
				{group = "black_sun_mando_armor", chance = 1500000},
				{group = "deed_voucher", chance = 100000}		
			},
			lootChance = 700000
		},		
	},
	weapons = {"black_sun_outpost_ranged_weapons"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,riflemanmaster,marksmanmaster,tkamaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(black_sun_ghost_poi_3, "black_sun_ghost_poi_3")

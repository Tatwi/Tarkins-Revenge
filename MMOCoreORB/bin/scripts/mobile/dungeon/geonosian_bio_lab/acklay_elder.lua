acklay_elder = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "Elder Acklay",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 180,
	chanceHit = 92.5,
	damageMin = 1600,
	damageMax = 2800,
	baseXp = 24884,
	baseHAM = 270000,
	baseHAMmax = 398000,
	armor = 3,
	resists = {130,145,155,155,145,30,30,30,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 35,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 1.3,

	templates = {"object/mobile/acklay_hue.iff"},
	lootGroups = {
		{
			groups = {
				{group = "acklay", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "deed_voucher", chance = 1000000},
				{group = "clothing_attachments", chance = 4500000},
				{group = "armor_attachments", chance = 4500000}
			},
			lootChance = 5000000
		},
	},
	weapons = {"creature_spit_large_yellow"},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"creatureareaknockdown","knockdownChance=50"},
		{"dizzyattack","dizzyChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(acklay_elder, "acklay_elder")

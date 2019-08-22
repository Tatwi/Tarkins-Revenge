gungan_common = {
	description = "",
	minimumLevel = 0,
	maximumLevel = -1,
	lootItems = {
		{itemTemplate = "gungan_signet", weight = 1666667},
		{itemTemplate = "gungan_lance", weight =  1666667},
		{groupTemplate = "misc_decoloot_schemes", weight = 5000000},
		{itemTemplate = "swamp_speeder_schematic", weight =  1666666}
	}
}

addLootGroupTemplate("gungan_common", gungan_common)

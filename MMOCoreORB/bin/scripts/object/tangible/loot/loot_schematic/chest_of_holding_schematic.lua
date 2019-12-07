object_tangible_loot_loot_schematic_chest_of_holding_schematic = object_tangible_loot_loot_schematic_shared_chest_of_holding_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/furniture/tarkin_custom/chest_of_holding.iff",
	targetUseCount = 10,
}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_chest_of_holding_schematic, "object/tangible/loot/loot_schematic/chest_of_holding_schematic.iff")

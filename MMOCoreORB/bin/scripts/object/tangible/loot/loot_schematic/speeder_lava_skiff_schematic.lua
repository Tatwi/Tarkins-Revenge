object_tangible_loot_loot_schematic_speeder_lava_skiff_schematic = object_tangible_loot_loot_schematic_shared_speeder_lava_skiff_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_artisan_master",
	targetDraftSchematic = "object/draft_schematic/vehicle/civilian/speeder_lava_skiff.iff",
	targetUseCount = 5,
}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_speeder_lava_skiff_schematic, "object/tangible/loot/loot_schematic/speeder_lava_skiff_schematic.iff")

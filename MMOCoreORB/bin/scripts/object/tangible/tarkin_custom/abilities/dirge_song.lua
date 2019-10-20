object_tangible_tarkin_custom_abilities_dirge_song = object_tangible_tarkin_custom_abilities_shared_dirge_song:new {
	templateType = XPPURCHASE,
	attributeListComponent = "XpPurchaseAttributeListComponent",
	objectMenuComponent = "XpPurchaseMenuComponent",
	requiredSkill = "social_entertainer_novice",
	grantType = "ability",
	grantName = "startMusic+dirge",
	xpType = "music",
	xpAmount = 0,
	noTrade = 0,
	noRemove = false
}

ObjectTemplates:addTemplate(object_tangible_tarkin_custom_abilities_dirge_song, "object/tangible/tarkin_custom/abilities/dirge_song.iff")

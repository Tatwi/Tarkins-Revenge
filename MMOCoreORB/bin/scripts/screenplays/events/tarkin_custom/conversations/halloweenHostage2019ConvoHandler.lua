-- //////////////////////////////////////////////////////
-- //         halloweenHostage2019ConvoHandler.lua     //
-- //                  Tarkin's Revenge                //
-- // 		2019 Halloween Dungeon Event 	       //
-- //                    October 2019                  //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

--	States:
--	1 = Player has already claimed a reward

halloweenHostage2019ConvoHandler = conv_handler:new {}

function halloweenHostage2019ConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	
	if (tonumber(readScreenPlayData(pPlayer, "halloweenHostage2019", "state")) == 1) then
		return convoTemplate:getScreen("already_completed")
	else	
		return convoTemplate:getScreen("intro")
	end
end


function halloweenHostage2019ConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local pReward = ""
	local pBadge = ""

	if (pGhost == nil) then
		return pConvScreen
	end

	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "give_reward_1") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/loot/loot_schematic/be_skeletal_tauntaun_schematic.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			CreatureObject(pPlayer):sendSystemMessage("A creature handler will need to craft this pet.  Your Skeletal Tauntaun will need some time to grow up after you tame it, and it will need to be mount-trained by a creature handler.")
		end
	end

	if (screenID == "give_reward_2") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/loot/loot_schematic/ghost_flash_speeder_schematic.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end

	if (screenID == "give_reward_3") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/wearables/backpack/back_gmf_wings.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end

	if (screenID == "give_reward_4") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/tcg/series8/wearable_exogorth_gloves.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end

	if (screenID == "give_reward_5") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/costumes/costume_skeleton.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end

	if (screenID == "give_reward_6") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/costumes/costume_undead.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end
	if (screenID == "give_reward_7") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/wearables/cybernetic/cybernetic_anakin_forearm.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end

	if (screenID == "give_reward_8") then
		if pInventory == nil then
			return false
		end

		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
		else
			pReward = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/dirge_song.iff", -1)
			pBadge = giveItem(pInventory, "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_halloween_2019.iff", -1)
			writeScreenPlayData(pPlayer, "halloweenHostage2019", "state", 1)
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end

	return pConvScreen
end

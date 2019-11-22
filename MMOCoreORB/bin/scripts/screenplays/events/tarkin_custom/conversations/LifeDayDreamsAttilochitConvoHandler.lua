-- //////////////////////////////////////////////////////
-- //       LifeDayDreamsAttilochitConvoHandler.lua    //
-- //                  Tarkin's Revenge                //
-- //                      Nov 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

LifeDayDreamsAttilochitConvoHandler = conv_handler:new {}

function LifeDayDreamsAttilochitConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:mouf_paw") == "0") then
		return convoTemplate:getScreen("attilochit_check_mouf")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:webweaver_eye") == "0") then
		return convoTemplate:getScreen("attilochit_check_webweaver")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:walluga_ear") == "0") then
		return convoTemplate:getScreen("attilochit_check_walluga")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:uller_horn") == "0") then
		return convoTemplate:getScreen("attilochit_check_uller")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:minstyngar_horn") == "0") then
		return convoTemplate:getScreen("attilochit_check_minstyngar")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:kkorrwrot_leg") == "0") then
		return convoTemplate:getScreen("attilochit_check_kkorrwrot")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:kashyyyk_bantha_pelt") == "0") then
		return convoTemplate:getScreen("attilochit_check_bantha")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:bolotaur_fang") == "0") then
		return convoTemplate:getScreen("attilochit_check_bolotaur")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:bolotaur_fang") == "1") then
		if(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitComplete") == "0") then
			return convoTemplate:getScreen("attilochit_offer_mount")
		elseif(readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitComplete") == "1") then
			return convoTemplate:getScreen("attilochit_complete")
		else
			return convoTemplate:getScreen("attilochit_bolotaur_done")
		end		
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:kashyyyk_bantha_pelt") == "1") then
		return convoTemplate:getScreen("attilochit_bantha_done")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:kkorrwrot_leg") == "1") then
		return convoTemplate:getScreen("attilochit_kkorrwrot_done")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:minstyngar_horn") == "1") then
		return convoTemplate:getScreen("attilochit_minstyngar_done")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:uller_horn") == "1") then
		return convoTemplate:getScreen("attilochit_uller_done")	
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:walluga_ear") == "1") then
		return convoTemplate:getScreen("attilochit_walluga_done")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:webweaver_eye") == "1") then
		return convoTemplate:getScreen("attilochit_webweaver_done")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:mouf_paw") == "1") then
		return convoTemplate:getScreen("attilochit_mouf_done")
	else		
		return convoTemplate:getScreen("attilochit_intro")
	end
end

function LifeDayDreamsAttilochitConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local pReward = ""

	if (pGhost == nil) then
		return pConvScreen
	end

	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	
	--Assign quest
	if (screenID == "attilochit_assign_mouf") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "mouf_paw")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "mouf_head")
	elseif (screenID == "attilochit_assign_webweaver") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "webweaver_eye")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "webweaver_head")
	elseif (screenID == "attilochit_assign_walluga") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "walluga_ear")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "walluga_head")
	elseif (screenID == "attilochit_assign_uller") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "uller_horn")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "uller_head")
	elseif (screenID == "attilochit_assign_minstyngar") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "minstyngar_horn")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "minstyngar_head")
	elseif (screenID == "attilochit_assign_kkorrwrot") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "kkorrwrot_leg")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "kkorrwrot_head")
	elseif (screenID == "attilochit_assign_bantha") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "kashyyyk_bantha_pelt")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "kashyyyk_bantha_head")
	elseif (screenID == "attilochit_assign_bolotaur") then
		LifeDayDreamsScreenplay:setRequiredItem(pPlayer, "bolotaur_fang")
		LifeDayDreamsScreenplay:setRequiredHead(pPlayer, "bolotaur_head")
	
	--Check for task complete & offer the correct conversation option
	elseif (screenID == "attilochit_check_mouf") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "mouf_paw") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "mouf_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_mouf_reply_01", "attilochit_mouf_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_mouf_reply_02", "attilochit_mouf_not_done")		
		end
	elseif (screenID == "attilochit_check_webweaver") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "webweaver_eye") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "webweaver_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_webweaver_reply_01", "attilochit_webweaver_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_webweaver_reply_02", "attilochit_webweaver_not_done")		
		end
	elseif (screenID == "attilochit_check_walluga") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "walluga_ear") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "walluga_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_walluga_reply_01", "attilochit_walluga_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_walluga_reply_02", "attilochit_walluga_not_done")		
		end
	elseif (screenID == "attilochit_check_uller") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "uller_horn") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "uller_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_uller_reply_01", "attilochit_uller_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_uller_reply_02", "attilochit_uller_not_done")		
		end
	elseif (screenID == "attilochit_check_minstyngar") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "minstyngar_horn") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "minstyngar_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_minstyngar_reply_01", "attilochit_minstyngar_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_minstyngar_reply_02", "attilochit_minstyngar_not_done")		
		end
	elseif (screenID == "attilochit_check_kkorrwrot") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "kkorrwrot_leg") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "kkorrwrot_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_kkorrwrot_reply_01", "attilochit_kkorrwrot_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_kkorrwrot_reply_02", "attilochit_kkorrwrot_not_done")		
		end
	elseif (screenID == "attilochit_check_bantha") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "kashyyyk_bantha_pelt") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "kashyyyk_bantha_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_bantha_reply_01", "attilochit_bantha_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_bantha_reply_02", "attilochit_bantha_not_done")		
		end
	elseif (screenID == "attilochit_check_bolotaur") then
		if (LifeDayDreamsScreenplay:hasRequiredItem(pPlayer, "bolotaur_fang") == true and LifeDayDreamsScreenplay:hasRequiredHead(pPlayer, "bolotaur_head") == true) then
			clonedConversation:addOption("@player_quest:attilochit_check_bolotaur_reply_01", "attilochit_bolotaur_success")
		else
			clonedConversation:addOption("@player_quest:attilochit_check_bolotaur_reply_02", "attilochit_bolotaur_not_done")		
		end
		
	--Take quest items & give trophy
	elseif (screenID == "attilochit_mouf_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "mouf_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "mouf_paw", 1)
	elseif (screenID == "attilochit_webweaver_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "webweaver_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "webweaver_eye", 1)
	elseif (screenID == "attilochit_walluga_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "walluga_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "walluga_ear", 1)
	elseif (screenID == "attilochit_uller_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "uller_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "uller_horn", 1)		
	elseif (screenID == "attilochit_minstyngar_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "minstyngar_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "minstyngar_horn", 1)
	elseif (screenID == "attilochit_kkorrwrot_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "kkorrwrot_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "kkorrwrot_leg", 1)
	elseif (screenID == "attilochit_bantha_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "kashyyyk_bantha_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "kashyyyk_bantha_pelt", 1)
	elseif (screenID == "attilochit_bolotaur_success") then
		LifeDayDreamsScreenplay:deleteQuestItems(pPlayer)
		LifeDayDreamsScreenplay:completeTrial(pPlayer, "bolotaur_head")		
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "requiredItem:" .. "bolotaur_fang", 1)
	
	--Present the reward trophy
	elseif (screenID == "attilochit_final") then
		LifeDayDreamsScreenplay:giveAttilochitReward(pPlayer)

	--Give the chosen mount schematic
	elseif (screenID == "attilochit_bantha") then
		LifeDayDreamsScreenplay:giveAttilochitMount(pPlayer, "bantha")
	elseif (screenID == "attilochit_bolotaur") then
		LifeDayDreamsScreenplay:giveAttilochitMount(pPlayer, "bolotaur")
	elseif (screenID == "attilochit_mouf") then
		LifeDayDreamsScreenplay:giveAttilochitMount(pPlayer, "mouf")
	end
	
	return pConvScreen
end

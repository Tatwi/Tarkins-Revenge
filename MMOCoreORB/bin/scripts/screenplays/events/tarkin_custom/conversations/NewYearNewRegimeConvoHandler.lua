-- //////////////////////////////////////////////////////
-- //          NewYearNewRegimeConvoHandler.lua        //
-- //                  Tarkin's Revenge                //
-- //             A Galactic Civil War Event           //
-- //                      Nov 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

NewYearNewRegimeConvoHandler = conv_handler:new {}

function NewYearNewRegimeConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	
	if (NewYearNewRegimeScreenplay:isGcwEventEnabled() == true) then
		if ((NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) or (NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true)) then
			return convoTemplate:getScreen("new_regime_tell_me_more")
		else		
			return convoTemplate:getScreen("new_regime_intro")
		end
	else	
		return convoTemplate:getScreen("new_regime_event_over")
	end
end

function NewYearNewRegimeConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
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

	if (screenID == "new_regime_join_rebel") then
		NewYearNewRegimeScreenplay:writeToRebelList(pPlayer)
		NewYearNewRegimeScreenplay:writeToPointsList(pPlayer)
	end

	if (screenID == "new_regime_join_imperial") then
		NewYearNewRegimeScreenplay:writeToImperialList(pPlayer)
		NewYearNewRegimeScreenplay:writeToPointsList(pPlayer)
	end

	if (screenID == "new_regime_player_points") then
		NewYearNewRegimeScreenplay:announcePlayerPoints(pPlayer)
	end

	if (screenID == "new_regime_score") then
		NewYearNewRegimeScreenplay:announceScore(pPlayer)
	end

	if (screenID == "new_regime_yes_join") then
		if (CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
			clonedConversation:addOption("@player_quest:new_regime_yes_join_reply_01", "new_regime_join_rebel")
		elseif (CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
			clonedConversation:addOption("@player_quest:new_regime_yes_join_reply_02", "new_regime_join_imperial")
		else
			clonedConversation:addOption("@player_quest:new_regime_yes_join_reply_03", "new_regime_cant_join")
		end
	end

	if (screenID == "new_regime_tell_me_more") then
		if (NewYearNewRegimeScreenplay:hasFlag(pPlayer) == true) then
			clonedConversation:addOption("@player_quest:new_regime_tell_me_more_reply_04", "new_regime_redeem_flag")
		end

		if (tonumber(NewYearNewRegimeScreenplay:getPlayerPoints(pPlayer)) > 0) then
			clonedConversation:addOption("@player_quest:new_regime_tell_me_more_reply_05", "new_regime_redeem_points")		
		end
		
		--Admin option for testing purposes
		if (CreatureObject(pPlayer):hasSkill("tarkin_admin_01")) then
			clonedConversation:addOption("@player_quest:new_regime_admin_reset_reply", "new_regime_admin_reset")		
		end
	end

	if (screenID == "new_regime_state_winner") then
		NewYearNewRegimeScreenplay:stateWinner(pPlayer)
	end

	if (screenID == "new_regime_event_over") then
		if ((NewYearNewRegimeScreenplay:getWinner() == "rebel" and NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true and CreatureObject(pPlayer):getFaction() == FACTIONREBEL) or (NewYearNewRegimeScreenplay:getWinner() == "imperial" and NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true and CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL)) then
			clonedConversation:addOption("@player_quest:new_regime_event_over_reply_02", "new_regime_claim_rewards")
		end
	end

	if (screenID == "new_regime_thank_flag") then
		NewYearNewRegimeScreenplay:redeemFlags(pPlayer)
	end

	if (screenID == "new_regime_thank_points") then
		NewYearNewRegimeScreenplay:redeemPoints(pPlayer)
	end

	if (screenID == "new_regime_admin_reset") then
		NewYearNewRegimeScreenplay:adminReset()
	end

	return pConvScreen
end

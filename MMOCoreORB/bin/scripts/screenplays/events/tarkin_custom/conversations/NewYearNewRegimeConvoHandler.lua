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
		if(NewYearNewRegimeScreenplay:isOnPointsList(pPlayer) == false) then
			NewYearNewRegimeScreenplay:writeToPointsList(pPlayer)
		end
	elseif (screenID == "new_regime_join_imperial") then
		NewYearNewRegimeScreenplay:writeToImperialList(pPlayer)
		if(NewYearNewRegimeScreenplay:isOnPointsList(pPlayer) == false) then
			NewYearNewRegimeScreenplay:writeToPointsList(pPlayer)
		end
	elseif (screenID == "new_regime_player_points") then
		NewYearNewRegimeScreenplay:announcePlayerPoints(pPlayer)
	elseif (screenID == "new_regime_score") then
		NewYearNewRegimeScreenplay:announceScore(pPlayer)
	elseif (screenID == "new_regime_yes_join") then
		if (CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
			clonedConversation:addOption("@player_quest:new_regime_yes_join_reply_01", "new_regime_join_rebel")
		elseif (CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
			clonedConversation:addOption("@player_quest:new_regime_yes_join_reply_02", "new_regime_join_imperial")
		else
			clonedConversation:addOption("@player_quest:new_regime_yes_join_reply_03", "new_regime_cant_join")
		end
	elseif (screenID == "new_regime_tell_me_more") then
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
	elseif (screenID == "new_regime_thank_flag") then
		NewYearNewRegimeScreenplay:redeemFlags(pPlayer)
	elseif (screenID == "new_regime_thank_points") then
		NewYearNewRegimeScreenplay:redeemPoints(pPlayer)
	elseif (screenID == "new_regime_state_winner") then
		NewYearNewRegimeScreenplay:stateWinner(pPlayer)
	elseif (screenID == "new_regime_event_over") then
		if (NewYearNewRegimeScreenplay:isEligibleToClaimRewards(pPlayer) == true) then
			clonedConversation:addOption("@player_quest:new_regime_event_over_reply_02", "new_regime_claim_rewards")
		end
	elseif (screenID == "new_regime_claim_rewards") then
		if (NewYearNewRegimeScreenplay:getWinner() == "rebel") then
			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed1") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_01_reb", "new_regime_select_reward_1_reb") --Galaxy at War Winner Badge
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed2") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_02_reb", "new_regime_select_reward_2_reb") --Shadow Box Display
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed3") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_03_reb", "new_regime_select_reward_3_reb") --Rebel Vistas Painting
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed4") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_04_reb", "new_regime_select_reward_4_reb") --Death Star Destruction Soda Schematic
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed5") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_05_reb", "new_regime_select_reward_5_reb") --Interwoven Composite Armor Segment Schematic
			end
		elseif (NewYearNewRegimeScreenplay:getWinner() == "imperial") then
			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed1") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_01_imp", "new_regime_select_reward_1_imp") --Galaxy at War Winner Badge
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed2") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_02_imp", "new_regime_select_reward_2_imp") --Shadow Box Display
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed3") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_03_imp", "new_regime_select_reward_3_imp") --Imperial Vistas Painting
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed4") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_04_imp", "new_regime_select_reward_4_imp") --Order 66 Cookies Schematic
			end

			if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed5") ~= "1") then
				clonedConversation:addOption("@player_quest:new_regime_new_regime_claim_rewards_reply_05_imp", "new_regime_select_reward_5_reb") --Interwoven Composite Armor Segment Schematic
			end
		end
	elseif (screenID == "new_regime_select_reward_1_reb") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "rebel", 1)		
	elseif (screenID == "new_regime_select_reward_2_reb") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "rebel", 2)		
	elseif (screenID == "new_regime_select_reward_3_reb") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "rebel", 3)		
	elseif (screenID == "new_regime_select_reward_4_reb") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "rebel", 4)		
	elseif (screenID == "new_regime_select_reward_5_reb") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "rebel", 5)		
	elseif (screenID == "new_regime_select_reward_1_imp") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "imperial", 1)		
	elseif (screenID == "new_regime_select_reward_2_imp") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "imperial", 2)		
	elseif (screenID == "new_regime_select_reward_3_imp") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "imperial", 3)		
	elseif (screenID == "new_regime_select_reward_4_imp") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "imperial", 4)		
	elseif (screenID == "new_regime_select_reward_5_reb") then
		NewYearNewRegimeScreenplay:claimReward(pPlayer, "imperial", 5)		
	elseif (screenID == "new_regime_admin_reset") then
		NewYearNewRegimeScreenplay:adminReset()
	end

	return pConvScreen
end

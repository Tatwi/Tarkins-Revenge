-- //////////////////////////////////////////////////////
-- //        LifeDayDreamsShorbaccaConvoHandler.lua    //
-- //                  Tarkin's Revenge                //
-- //                      Nov 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

LifeDayDreamsShorbaccaConvoHandler = conv_handler:new {}

function LifeDayDreamsShorbaccaConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest") == "0") then
		return convoTemplate:getScreen("shorbacca_03")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest") == "1") then
		return convoTemplate:getScreen("shorbacca_07")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest") == "2") then
		return convoTemplate:getScreen("shorbacca_09")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest") == "3") then
		return convoTemplate:getScreen("shorbacca_10")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "attilochitQuest") ~= "1") then
		return convoTemplate:getScreen("shorbacca_speak_later")
	else		
		return convoTemplate:getScreen("shorbacca_intro")
	end
end

function LifeDayDreamsShorbaccaConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pConvScreen
	end

	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	
	-- Trip Out
	if (screenID == "shorbacca_04") then
		CreatureObject(pPlayer):sendSystemMessage("You feel a whoosh of air around you, and the ground beneath your feet no longer feels solid...")
		createEvent(2 * 1000, "LifeDayDreamsScreenplay", "smokePipe", pPlayer, "")

	-- Decline Pipe
	elseif (screenID == "shorbacca_06") then
		writeScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "shorbaccaQuest" , 0)

	-- Give Pipe
	elseif (screenID == "shorbacca_09") then
		LifeDayDreamsScreenplay:giveShorbaccaRewards(pPlayer)
	end	
	
	return pConvScreen
end

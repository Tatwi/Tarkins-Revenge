-- //////////////////////////////////////////////////////
-- //        LifeDayDreamsReyyruaConvoHandler.lua      //
-- //                  Tarkin's Revenge                //
-- //                      Nov 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

LifeDayDreamsReyyruaConvoHandler = conv_handler:new {}

function LifeDayDreamsReyyruaConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest") == "0") then
		return convoTemplate:getScreen("reyyrua_15")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest") == "1") then
		return convoTemplate:getScreen("reyyrua_16")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "reyyruaQuest") == "2") then
		return convoTemplate:getScreen("reyyrua_final")		
	else		
		return convoTemplate:getScreen("reyyrua_intro")
	end
end

function LifeDayDreamsReyyruaConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pConvScreen
	end

	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	
	-- Give Poem
	if (screenID == "reyyrua_16") then
		LifeDayDreamsScreenplay:giveReyyruaPoem(pPlayer)
	
	-- Give Eggnog Reward
	elseif (screenID == "reyyrua_18") then
		LifeDayDreamsScreenplay:giveReyyruaEggnog(pPlayer)
	end	
	
	return pConvScreen
end

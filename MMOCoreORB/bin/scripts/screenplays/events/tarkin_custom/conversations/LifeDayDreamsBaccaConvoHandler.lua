-- //////////////////////////////////////////////////////
-- //         LifeDayDreamsBaccaConvoHandler.lua       //
-- //                  Tarkin's Revenge                //
-- //                      Nov 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

LifeDayDreamsBaccaConvoHandler = conv_handler:new {}

function LifeDayDreamsBaccaConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	return convoTemplate:getScreen("bacca_intro")
end

function LifeDayDreamsBaccaConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pConvScreen
	end

	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	
	-- Return to Shorbacca
	if (screenID == "bacca_13") then
		CreatureObject(pPlayer):sendSystemMessage("You feel your head begin to spin, and quickly all fades to black...")
		createEvent(2 * 1000, "LifeDayDreamsScreenplay", "returnShorbacca", pPlayer, "")
	end	
	
	return pConvScreen
end

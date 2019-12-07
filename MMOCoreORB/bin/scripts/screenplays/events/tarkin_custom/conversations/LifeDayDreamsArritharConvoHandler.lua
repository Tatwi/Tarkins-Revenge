-- //////////////////////////////////////////////////////
-- //        LifeDayDreamsArritharConvoHandler.lua     //
-- //                  Tarkin's Revenge                //
-- //                      Nov 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

LifeDayDreamsArritharConvoHandler = conv_handler:new {}

function LifeDayDreamsArritharConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "1") then
		return convoTemplate:getScreen("arrithar_12")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "2" or readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "3") then
		return convoTemplate:getScreen("arrithar_23")
	elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "4") then
		return convoTemplate:getScreen("arrithar_27")
	else		
		return convoTemplate:getScreen("arrithar_intro")
	end
end

function LifeDayDreamsArritharConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pConvScreen
	end

	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	
	--Assign quest
	if (screenID == "arrithar_10") then
		LifeDayDreamsScreenplay:giveAshes(pPlayer)

	--Give shield
	elseif (screenID == "arrithar_13") then
		LifeDayDreamsScreenplay:giveShield(pPlayer)

	--Tell to find bird
	elseif (screenID == "arrithar_20") then
		LifeDayDreamsScreenplay:assignBirdHunt(pPlayer)

	--Offer coversation options based on whether the egg has been found
	elseif (screenID == "arrithar_23") then
		if (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "2") then
			clonedConversation:addOption("@player_quest:arrithar_23_reply_01", "arrithar_24") --I went back, but found nothing.
		elseif (readScreenPlayData(pPlayer, "LifeDayDreamsScreenplay", "arritharQuest") == "3") then
			clonedConversation:addOption("@player_quest:arrithar_23_reply_02", "arrithar_25") --I did better than that!		
		end

	elseif (screenID =="arrithar_25") then
		local playerID = CreatureObject(pPlayer):getObjectID()
		local waypointID = readData(playerID .. ":arritharWaypointID", waypointID)
	
		if waypointID ~= "" and waypointID ~= nil and waypointID ~= 0 then
			PlayerObject(pGhost):removeWaypoint(waypointID, true)
			deleteData(playerID .. ":arritharWaypointID")
		end

	--Hatch egg
	elseif (screenID == "arrithar_26") then
		createEvent(2 * 1000, "LifeDayDreamsScreenplay", "hatchShyyyoBird", pPlayer, "")
	end

	return pConvScreen
end

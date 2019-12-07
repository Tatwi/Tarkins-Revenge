--/////////////////////////////////////////////////////////
--//   		     Home For The Holidays	 	 //
--//     	  a Tarkin's Revenge Screenplay	 	 //
--//    	         November 2019		 	 //
--/////////////////////////////////////////////////////////
--// A Life Day reward item, the Home For The Holidays   //
--// ticket allows players to set a "Home" location,     //
--// anywhere outdoors within the city limits of Coronet,//
--// Theed, or Mos Entha.  They may then use the ticket  //
--// to return to that point at any time, as long as 	 //
--// they are not in combat, are outdoors, and are alive //
--// & standing.	 				 //
--/////////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")
includeFile("tools/tarkin_lib.lua")

HomeForTheHolidaysScreenplay = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "HomeForTheHolidaysScreenplay"
}

registerScreenPlay("HomeForTheHolidaysScreenplay", true)

function HomeForTheHolidaysScreenplay:start()
--do nothing
end

function HomeForTheHolidaysScreenplay:hasBindPoint(pPlayer)
	if(readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet") ~= nil and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet") ~= "" and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef") ~= nil and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef") ~= "" and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef") ~= nil and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef") ~= "") then
		return true
	else
		return false
	end
end

function HomeForTheHolidaysScreenplay:initializeBindPoint(pPlayer, pTicket)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("HomeForTheHolidaysScreenplay", "SetBindPointSuiCallback")
	sui.setTitle("Set Home Location")
	sui.setPrompt("By choosing 'Yes' below, you will permanently set your teleport location to the place where you are currently standing.  You will not be able to change this location later.  Whenever you use this ticket in the future, you will teleport to this exact spot.  This character is the only character who will be able to use this ticket after the Home location has been set.  Is this what you want to do?")
	sui.setOkButtonText("Yes")
	sui.setCancelButtonText("Cancel")
	sui.setTargetNetworkId(SceneObject(pTicket):getObjectID())
	sui.sendTo(pPlayer)

end

function HomeForTheHolidaysScreenplay:SetBindPointSuiCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end

	if (SceneObject(pPlayer):getParentID() ~= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You must be outside to set a Home location.")
		return
	end

	local suiPageData = LuaSuiPageData(LuaSuiBoxPage(pSui):getSuiPageData())
	local ticketID = suiPageData:getTargetNetworkId()
	local pTicket = getSceneObject(ticketID)
	
	if (pTicket == nil) then
		return
	end
	
	if (TangibleObject(pTicket):getLuaStringData("ownerID") ~= "") then
		CreatureObject(pPlayer):sendSystemMessage("You cannot set a new Home location on a ticket that has already been initialized.")
		return
	end	
		
	local cityRegionName = getCityRegionName(pPlayer)
	if (cityRegionName == "Coronet City" or cityRegionName == "Entha" or cityRegionName == "Theed City") then
		-- Set zone, x, y locations on player
		writeScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet", SceneObject(pPlayer):getZoneName())
		writeScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef", SceneObject(pPlayer):getWorldPositionX())
		writeScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef", SceneObject(pPlayer):getWorldPositionY())
			
		-- Set playerID on ticket
		local playerID = SceneObject(pPlayer):getObjectID()
		TangibleObject(pTicket):setLuaStringData("ownerID", playerID)
			
		-- Rename ticket to reflect ownership
		SceneObject(pTicket):setCustomObjectName(CreatureObject(pPlayer):getFirstName() .. "'s Ticket Home")

		-- Send player a message
		CreatureObject(pPlayer):sendSystemMessage("Your home location has been set to " .. math.floor(SceneObject(pPlayer):getWorldPositionX()) .. ", " .. math.floor(SceneObject(pPlayer):getWorldPositionY()) .. " " .. SceneObject(pPlayer):getZoneName() .."." )

		return
	else
		CreatureObject(pPlayer):sendSystemMessage("You must be within the city limits of Coronet, Theed, or Mos Entha to set a Home location.")
		return
	end
end

function HomeForTheHolidaysScreenplay:travelHome(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local zone = ""
	local xRef = ""
	local yRef = ""
	
	if(readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet") ~= nil and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet") ~= "") then
		zone = readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet")
	end

	if(readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef") ~= nil and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef") ~= "") then
		xRef = tonumber(readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef"))
	end

	if(readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef") ~= nil and readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef") ~= "") then
		yRef = tonumber(readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef"))
	end

	if (zone == nil or zone == "" or xRef == nil or xRef == "" or yRef == nil or yRef == "") then
		CreatureObject(pPlayer):sendSystemMessage("Error: Home location was faulty, please see an admin.")
		return
	end
	
	if (not isZoneEnabled(zone)) then
		CreatureObject(pPlayer):sendSystemMessage("Unable to switch zone.  Necessary zone was not enabled.")	
		return
	end
	
	SceneObject(pPlayer):switchZone(zone, xRef, 0, yRef, 0)
end

function HomeForTheHolidaysScreenplay:clearBindPoint(pTicket)
	if (pTicket == nil) then
		return
	end	
	
	local playerID = tonumber(TangibleObject(pTicket):getLuaStringData("ownerID"))
	local pPlayer = getSceneObject(playerID)
	deleteScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet")
	deleteScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindXRef")
	deleteScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindYRef")
	TangibleObject(pTicket):deleteLuaStringData("ownerID")
	SceneObject(pTicket):setCustomObjectName("Home for the Holidays")
end


--Home For The Holidays Object Menu Component
HomeForTheHolidaysObjectMenuComponent = { }

function HomeForTheHolidaysObjectMenuComponent:fillObjectMenuResponse(pObject, pMenuResponse, pPlayer)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	-- Item must be in player's base-level inventory to use
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if (pInventory == nil or pInventory ~= SceneObject(pObject):getParent()) then
		return 0
	end	
		
	if (TarkinLib:isEligibleState(pPlayer) == true) then
		if (HomeForTheHolidaysScreenplay:hasBindPoint(pPlayer) == false) then
			if (SceneObject(pPlayer):getParentID() == 0) then
				local cityRegionName = getCityRegionName(pPlayer)		
				if (cityRegionName == "Coronet City" or cityRegionName == "Entha" or cityRegionName == "Theed City") then
					menuResponse:addRadialMenuItem(20, 3, "Set Home Location")
				end
			end
		elseif (HomeForTheHolidaysScreenplay:hasBindPoint(pPlayer) == true) then
			local playerID = tostring(SceneObject(pPlayer):getObjectID())
			if (TangibleObject(pObject):getLuaStringData("ownerID") == playerID) then
				local zone = readScreenPlayData(pPlayer, "HomeForTheHolidaysScreenplay", "playerBindPlanet")
				if (isZoneEnabled(zone)) then
					menuResponse:addRadialMenuItem(21, 3, "Travel Home")
				end
			end
		end
	end
	if (CreatureObject(pPlayer):hasSkill("tarkin_admin_01")) then
		if (TangibleObject(pObject):getLuaStringData("ownerID") ~= nil and TangibleObject(pObject):getLuaStringData("ownerID") ~= "") then 
			menuResponse:addRadialMenuItem(22, 3, "Clear Home Location")
		end
	end
end

function HomeForTheHolidaysObjectMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	if (selectedID == 20) then
		HomeForTheHolidaysScreenplay:initializeBindPoint(pPlayer, pObject)
	elseif (selectedID == 21) then
		HomeForTheHolidaysScreenplay:travelHome(pPlayer)
	elseif (selectedID == 22) then
		HomeForTheHolidaysScreenplay:clearBindPoint(pObject)
	end
	return 1
end

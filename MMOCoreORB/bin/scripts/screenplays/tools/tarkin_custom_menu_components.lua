--////////////////////////////////////////////////////////
--//   		 Tarkin Custom Menu Components	 	//
--//    	 a Tarkin's Revenge Screenplay	        //
--//    	   	 November 2019			//
--////////////////////////////////////////////////////////
--// Adds custom menu components for objects not	//
--// specifically tied to other screenplays.		//
--////////////////////////////////////////////////////////

tarkin_custom_menu_components = ScreenPlay:new {
	numberOfActs = 1
}

registerScreenPlay("tarkin_custom_menu_components", true)

function tarkin_custom_menu_components:start()
	-- Do Nothing
end

--Retsa-Seltzer Radial Menu Functions
RetsaSeltzerObjectMenuComponent = { }

function RetsaSeltzerObjectMenuComponent:fillObjectMenuResponse(pObject, pMenuResponse, pPlayer)

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	-- Item must be in player's base-level inventory to use
	if (pInventory ~= SceneObject(pObject):getParent()) then
		return 0
	end

	menuResponse:addRadialMenuItem(20, 3, "Use")	
end

function RetsaSeltzerObjectMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then
		local maxPoints = 35
		local foodFilling = CreatureObject(pPlayer):getFoodFilling()
		local drinkFilling = CreatureObject(pPlayer):getDrinkFilling()
	
		if (drinkFilling >= 99) then
			CreatureObject(pPlayer):sendSystemMessage("You are too full to use this item!")
			return 0
		end

		local availDrinkFilling = 100 - drinkFilling
		local pointsCanMove = math.min(maxPoints, availDrinkFilling)
		local pointsToMove = math.min(pointsCanMove, foodFilling)

		CreatureObject(pPlayer):setFoodFilling(foodFilling - pointsToMove)
		CreatureObject(pPlayer):setDrinkFilling(100)
		CreatureObject(pPlayer):sendSystemMessage("You feel hungrier than before.  That seltzer must have worked.")		
	end
	return 1
end

--Salty Snackbox Radial Menu Functions
SaltySnackboxObjectMenuComponent = { }

function SaltySnackboxObjectMenuComponent:fillObjectMenuResponse(pObject, pMenuResponse, pPlayer)

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	-- Item must be in player's base-level inventory to use
	if (pInventory ~= SceneObject(pObject):getParent()) then
		return 0
	end
	
	menuResponse:addRadialMenuItem(20, 3, "Use")	
end

function SaltySnackboxObjectMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then
		local maxPoints = 35
		local foodFilling = CreatureObject(pPlayer):getFoodFilling()
		local drinkFilling = CreatureObject(pPlayer):getDrinkFilling()
		
		if (foodFilling >= 99) then
			CreatureObject(pPlayer):sendSystemMessage("You are too full to use this item!")
			return 0
		end

		local availFoodFilling = 100 - foodFilling
		local pointsCanMove = math.min(maxPoints, availFoodFilling)
		local pointsToMove = math.min(pointsCanMove, drinkFilling)

		CreatureObject(pPlayer):setDrinkFilling(drinkFilling - pointsToMove)
		CreatureObject(pPlayer):setFoodFilling(100)
		CreatureObject(pPlayer):sendSystemMessage("You feel thirstier than before.  That snackbox must have worked.")		
	end
	return 1
end

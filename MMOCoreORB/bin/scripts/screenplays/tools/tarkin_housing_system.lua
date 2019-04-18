-- Tarkin's Revenge Housing System
-- Allows players to purchase admin-placed structures by selecting the Buy option on the structure terminal
-- Custom Lua calls: setStructureOwner(pPlayer, pStrucSceneObj), hasEnoughLots(pPlayer, pStructure)

local ObjectManager = require("managers.object.object_manager")
includeFile("tools/tarkin_housing_system_table.lua")

TarkinHousingSystem = ScreenPlay:new {
	numberOfActs = 1,
}
registerScreenPlay("TarkinHousingSystem", true)

function TarkinHousingSystem:openWindow(pPlayer, pStructure, StructureObjectID)
	if (pPlayer == nil or pStructure == nil) then
		return
	end
	
	local hasEnoughLots = hasEnoughLots(pPlayer, pStructure) -- Returns: lotSize for not enough, 0 player when enough lots
	
	if (hasEnoughLots ~= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You do not have enough lots available to purchase this structure. Lots required: " .. tostring(hasEnoughLots))
		return
	end
	
	local structTemplateName = HelperFuncs:getFileNameFromPath(SceneObject(pStructure):getTemplateObjectPath())
	local structIndex = HelperFuncs:getTableIndex(structTemplateName, housingSystemTable)
	
		-- Bail on unsupported structure types owned by valid admin characters (such as city halls)
	if (structIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Imperial Housing Authority encountered a problem accessing this structure's records. You will not be able to purchase this structure.")
		return
	end
	
	local price = housingSystemTable[structIndex+1]
	
	local friendlyName = housingSystemTable[structIndex+2]
	local okDeeds = housingSystemTable[structIndex+3]
	
	-- Does player have the correct deed in his inventory?
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if pInventory == nil then
		return 1
	end

	local playerID = CreatureObject(pPlayer):getObjectID()
	local inventory = LuaSceneObject(pInventory)

	local numberOfItems = inventory:getContainerObjectsSize()
	local deedFound = "";
	local deedFoundName = "";

	for i = 0, numberOfItems - 1, 1 do
		local pItem = inventory:getContainerObject(i)

		if pItem ~= nil then
			local item = SceneObject(pItem)
			deedFound = HelperFuncs:getFileNameFromPath(item:getTemplateObjectPath())
			
			if string.match(okDeeds, deedFound)then
				deedFoundName = item:getDisplayedName()
				
				writeScreenPlayData(pPlayer, "TarkinHousingSystem", "houseDeedFound", tostring(item:getObjectID()))
				break
			end
			
			deedFoundName = "none"
		end
	end
	
	if (deedFoundName == "none") then
		writeScreenPlayData(pPlayer, "TarkinHousingSystem", "houseDeedFound", "none") 
	end

	-- All OK, carry on!

	local sui = SuiMessageBox.new("TarkinHousingSystem", "confirmWindow") -- calls showItems on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Buy Structure")

	local promptText = "This structure belongs to Imperial Housing Authority and may be purchased.\n\n"
	promptText = (promptText .. "Instructions:\n")
	promptText = (promptText .. "1. Remain inside the structure or nearby the factory.\n")
	promptText = (promptText .. "2. Have the correct deed in your inventory. If you have multiple compatible deeds, the first one found will be used.\n")
	promptText = (promptText .. "3. Have enough credits to purchase the structure.\n")
	promptText = (promptText .. "4. Press OK to make the purchase.\n\n")
	promptText = (promptText .. "Price: " .. tostring(price) .." credits\n\n")
	promptText = (promptText .. "Compatible Deeds:\n")
	promptText = (promptText .. friendlyName .. "\n\n")
	promptText = (promptText .. "Compatible deed found in your inventory:\n")
	promptText = (promptText .. deedFoundName)
	sui.setPrompt(promptText)
	
	writeScreenPlayData(pPlayer, "TarkinHousingSystem", "housePrice", tostring(price))
	writeScreenPlayData(pPlayer, "TarkinHousingSystem", "structureObjectID", tostring(StructureObjectID))

	sui.sendTo(pPlayer)
end

function TarkinHousingSystem:confirmWindow(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		self:deleteData(pPlayer)
		return
	end

	local sui = SuiMessageBox.new("TarkinHousingSystem", "doPurchase") -- calls itemSelection on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	
	local houseDeedFound = readScreenPlayData(pPlayer, "TarkinHousingSystem", "houseDeedFound")
	local price = tonumber(readScreenPlayData(pPlayer, "TarkinHousingSystem", "housePrice"))
	
	local cashCredits = CreatureObject(pPlayer):getCashCredits()
	local bankCredits = CreatureObject(pPlayer):getBankCredits()
	local playerCredits = cashCredits + bankCredits

	if (playerCredits < price) then
		sui.setTitle("Request Rejected")
		sui.setPrompt("Insufficient Funds:\nYou require at least " .. tostring(price) .. " total credits in your bank or cash to make this purchase.")
		writeScreenPlayData(pPlayer, "TarkinHousingSystem", "nsf", "true")
		
		sui.sendTo(pPlayer)
		return
	end	
	
	if (houseDeedFound == "none") then
		sui.setTitle("Request Rejected")
		local promptText = "In order to purchase this structure you must have a compatible deed in your inventory. The compatible deeds are listed in the Buy window.\n\n"
		promptText = (promptText .. "Deeds are crafted by players and may be puchased from the Bazaar or from player vendors.")
		sui.setPrompt(promptText)
	else
		sui.setTitle("Confirm Purhase")
		sui.setPrompt("Are you sure you want to purchase this structure?")
	end
	
	sui.sendTo(pPlayer)
end

function TarkinHousingSystem:doPurchase(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		self:deleteData(pPlayer)
		return
	end
	
	local houseDeedFound = readScreenPlayData(pPlayer, "TarkinHousingSystem", "houseDeedFound")
	local nsf = readScreenPlayData(pPlayer, "TarkinHousingSystem", "nsf")
	
	if (houseDeedFound == "none" or nsf == "true") then
		self:deleteData(pPlayer)
		return
	end
	
	-- Do purchase
	local price = tonumber(readScreenPlayData(pPlayer, "TarkinHousingSystem", "housePrice"))
	local cashCredits = CreatureObject(pPlayer):getCashCredits()
	local bankCredits = CreatureObject(pPlayer):getBankCredits()
	local playerCredits = cashCredits + bankCredits
	
	if (playerCredits < price) then
		CreatureObject(pPlayer):sendSystemMessage("Error: Insufficient Funds")
		self:deleteData(pPlayer)
		return
	end
	
	local pDeed = getSceneObject(houseDeedFound)
	
	if (pDeed == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error: Deed Not Found")
		self:deleteData(pPlayer)
		return
	end
	
	local structureObjectID = tonumber(readScreenPlayData(pPlayer, "TarkinHousingSystem", "structureObjectID"))
	local pStrucSceneObj = getSceneObject(structureObjectID)
	
	if (pStrucSceneObj == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error: Structure Not Found")
		self:deleteData(pPlayer)
		return
	end
	
	-- Use cash first
	if (price <= cashCredits) then
			CreatureObject(pPlayer):subtractCashCredits(price)

	-- Pay remainder from bank
	else
		price = price - cashCredits
		CreatureObject(pPlayer):subtractCashCredits(cashCredits)
		CreatureObject(pPlayer):setBankCredits(bankCredits - price)
	end
	
	-- Consume the deed
	SceneObject(pDeed):destroyObjectFromWorld()
	SceneObject(pDeed):destroyObjectFromDatabase()
	

	-- Transfer ownership
	setStructureOwner(pPlayer, pStrucSceneObj)
	
	CreatureObject(pPlayer):sendSystemMessage("Purchase complete!")
	self:deleteData(pPlayer)
end

function TarkinHousingSystem:deleteData(pPlayer)
	deleteScreenPlayData(pPlayer, "TarkinHousingSystem", "houseDeedFound")
	deleteScreenPlayData(pPlayer, "TarkinHousingSystem", "housePrice")
	deleteScreenPlayData(pPlayer, "TarkinHousingSystem", "nsf")
	deleteScreenPlayData(pPlayer, "TarkinHousingSystem", "structureObjectID")
end

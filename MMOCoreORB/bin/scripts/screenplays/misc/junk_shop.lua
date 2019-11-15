-- //////////////////////////////////////////////////////
-- //          		junk_shop.lua       	       //
-- //                  Tarkin's Revenge                //
-- //                     July 2019                    //
-- //////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")
includeFile("misc/junk_shop_data.lua")

junkShopScreenplay = ScreenPlay:new {
	numberOfActs = 1,
	
	ownerLocs = {
		{ planet = "corellia", x = 41.6, z = 28.0, y = -4593.2, angle = 170, cell = 0 }, -- Coronet
		{ planet = "naboo", x = -5042.0, z = 6.0, y = 4081.6, angle = 131, cell = 0 }, -- Theed
		{ planet = "tatooine", x = 1219.9, z = 7.0, y = 2934.3, angle = -38, cell = 0 }, -- Mos Entha
	}
}

registerScreenPlay("junkShopScreenplay", true)

function junkShopScreenplay:start()
	self:spawnMobiles()
end

function junkShopScreenplay:spawnMobiles()
	local mobiles = self.ownerLocs
	for i = 1, #mobiles, 1 do
		if isZoneEnabled(mobiles[i].planet) then
			spawnMobile(mobiles[i].planet, "junk_shop_owner", 1, mobiles[i].x, mobiles[i].z, mobiles[i].y, mobiles[i].angle, mobiles[i].cell)
		end
	end
end


junkShopOwnerConvoHandler = conv_handler:new {}

function junkShopOwnerConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

		if (screenID == "launch_wares_sui") then
			junkShopOwnerConvoHandler:sendCategorySui(pPlayer)
		end

	return pConvScreen
end

function junkShopOwnerConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
		return convoTemplate:getScreen("start")
end

function junkShopOwnerConvoHandler:sendCategorySui(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end


	local sui = SuiListBox.new("junkShopOwnerConvoHandler", "sendPurchaseSui") -- calls sendPurchaseSui on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Categories:")

	local promptText = "Choose a category of goods to browse."

	sui.setPrompt(promptText)
	for i = 1,  #junkShopCategories, 1 do
		sui.add(junkShopCategories[i].displayText, "")
	end

	sui.sendTo(pPlayer)
end


function junkShopOwnerConvoHandler:sendPurchaseSui(pPlayer, pSui, eventIndex, args)

	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return 
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No category was selected...")
		return
	end

	local selectedCategoryIndex = tonumber(args)+1
	local selectedCategory = junkShopCategories[selectedCategoryIndex].saleCategory
	local categoryData = junkShopOwnerConvoHandler:getCategoryDataTable(selectedCategory)
	writeScreenPlayData(pPlayer, "junkShopScreenplay", "selectedCategory", selectedCategory) 
	local sui = SuiListBox.new("junkShopOwnerConvoHandler", "handleSuiPurchase") -- calls handleSuiPurchase on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Items Available:")

	local promptText = ""
	if(selectedCategory == "species_costumes") then
		promptText = "Select the costume you would like to purchase from the salesman. \n\nPlease note, species costumes are only wearable by HUMANS, and are gender-specific."
	elseif(selectedCategory == "rp_imp_armor" or selectedCategory == "rp_reb_armor") then
		promptText = "These decomissioned armors offer no protection, have no encumbrance or factional requirements, and do not have sockests.  They are solely for roleplay and appearance purposes."
	else
		promptText = "Select the item you would like to purchase from the salesman."
	end

	sui.setPrompt(promptText)

	for i = 1,  #categoryData, 1 do
		sui.add(categoryData[i].displayText .. " (Cost: " .. categoryData[i].itemCost .. ")", "")
	end
	
	sui.sendTo(pPlayer)
end


function junkShopOwnerConvoHandler:handleSuiPurchase(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return junkShopOwnerConvoHandler:sendCategorySui(pPlayer)
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No item was selected...")
		return
	end

	local selectedPurchaseIndex = tonumber(args) + 1
	local category = readScreenPlayData(pPlayer, "junkShopScreenplay", "selectedCategory")
	local categoryData = junkShopOwnerConvoHandler:getCategoryDataTable(category)
	local selectedPurchase = categoryData[selectedPurchaseIndex].itemPath
	local cost = categoryData[selectedPurchaseIndex].itemCost
	local itemName = getStringId(categoryData[selectedPurchaseIndex].displayText)
	
	--First, determine whether player has enough money for the item
	
	local cashCredits = CreatureObject(pPlayer):getCashCredits()
	local bankCredits = CreatureObject(pPlayer):getBankCredits()
	local playerCredits = cashCredits + bankCredits

	if playerCredits < cost then
		CreatureObject(pPlayer):sendSystemMessage("Insufficient Funds: You require at least " .. tostring(cost) .. " total credits in your bank or cash to purchase this item.")
			return
	end

	--Use cash first
	if (cost <= cashCredits) then
			CreatureObject(pPlayer):subtractCashCredits(cost)

	--Pay remainder from bank
	else
		cost = cost - cashCredits
		CreatureObject(pPlayer):subtractCashCredits(cashCredits)
		CreatureObject(pPlayer):setBankCredits(bankCredits - cost)
	end
	
	--Second, grant the item
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is full, make some room and try again.")
		return
	else
		local pItem = giveItem(pInventory, selectedPurchase, -1)
	end
	
	-- Third, send system message to player to announce that they have paid
		CreatureObject(pPlayer):sendSystemMessage("You have paid " .. tostring(cost) .. " credits, and received [" .. itemName .. "].")

	deleteScreenPlayData(pPlayer, "junkShopScreenplay", "selectedCategory")
end


function junkShopOwnerConvoHandler:getCategoryDataTable(category)
	if category == "wearable_palette_posters" then
		return palettePostersWearable
	elseif category =="be_palette_posters" then
		return palettePostersBE
	elseif category =="species_costumes" then
		return speciesCostumes
	elseif category =="rp_imp_armor" then
		return rpImpArmor
	elseif category =="rp_reb_armor" then
		return rpRebArmor
	end
end

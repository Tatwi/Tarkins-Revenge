--////////////////////////////////////////////////////////
--//   		   Cooperative Thanskgiving	 	//
--//    	 a Tarkin's Revenge Screenplay	        //
--//    	   	 November 2019			//
--////////////////////////////////////////////////////////
--// Players kill an infestation of Pharples in Coronet //
--// as well as forage for various food items which     //
--// they contribute to a community feast table.    	//
--// Rewards are given to all contributors when all the //
--// required items have been donated to the table. 	//
--// Additional rewards become available as players 	//
--// hit target numbers of contributed items.		//
--////////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")
includeFile("tools/tarkin_lib.lua")

CooperativeThanksgivingScreenplay = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "CooperativeThanksgivingScreenplay",
}
	--Config Values
local eventStartTime = os.time{ year=2019, month=11, day=28, hour=12, min=0 } --Go live: 11/28/2019, noon  
local eventCleanupTime = os.time{ year=2019, month=12, day=1, hour=23, min=59 }  --Despawn the feast table and mobiles: 12/1/2019, 11:59 PM 
local pharplesToSpawn = 60 --Number of mobiles this screenplay will spawn 
local secondsToDespawn = 3600 --Number of seconds before a mobile will despawn if it has not been killed (1h = 3,600s)
local secondsToRespawn = 30 --Number of seconds before a mobile will respawn after it has been killed (2m = 120s)
	
local SpawnPointsTable = {
	{ planet = "corellia", xRef = -170, yRef = -4715, maxRadius = 650 }, --Coronet
	}
	
local mobileTemplates =  { "thanksgiving_pharple" }

local feastTable = { planet = "corellia", itemPath = "object/tangible/tarkin_custom/decorative/holiday/cooperative_thanksgiving_table.iff", x = -175.926, z = 28, y = -4825.91, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0}

local feastBanners = {
	{ planet = "corellia", itemPath = "object/tangible/furniture/decorative/corellian_flagpole.iff", x = -170.962, z = 28, y = -4825.94, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 },
	{ planet = "corellia", itemPath = "object/tangible/furniture/decorative/corellian_flagpole.iff", x = -180.801, z = 28, y = -4825.94, ow = 1, ox = 0, oy = 0, oz = 0, cellID = 0 }
}

local feastItems = {
	{ itemName = "Acorns", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_acorns.iff", x_off = 2.06948, z_off = 1, y_off = 0.457043 },
	{ itemName = "Almakian Apple Pie", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_almakian_apple_pie.iff", x_off = 1.60999, z_off = 1, y_off = 0.457578 },
	{ itemName = "Arguez Sausage", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_arguez_sausage.iff", x_off = 0.443062, z_off = 1, y_off = -0.0121679 },
	{ itemName = "Ashkar", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_ashkar.iff", x_off = -0.293226, z_off = 1.03, y_off = 0.0455327 },
	{ itemName = "Bantha Patties", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_bantha_patties.iff", x_off = -2.80268, z_off = 1, y_off = -0.599296 },	
	{ itemName = "Bantha Rump Roast", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_bantha_rump.iff", x_off = 0.160424, z_off = 1, y_off = -0.167077 },
	{ itemName = "Bantha Stew", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_bantha_stew.iff", x_off = 1.54365, z_off = 1, y_off = -0.0648924 },
	{ itemName = "A Sprig of Banthaweed", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_banthaweed.iff", x_off = -2.36572, z_off = 1, y_off = -0.291542 },
	{ itemName = "Bestinian Tang Root", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_bestinian_tang_root.iff", x_off = 0.00139962, z_off = 1, y_off = -0.660426 },
	{ itemName = "Blue Milk", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_blue_milk.iff", x_off = -0.960643, z_off = 0.26, y_off = -0.673418 },
	{ itemName = "Blueleaf Shrub", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_blueleaf_shrub.iff", x_off = 0.917749, z_off = 1, y_off = -0.533559 },
	{ itemName = "A Blumfruit", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_blumfruit.iff", x_off = 1.15873, z_off = 1, y_off = 0.510747 },
	{ itemName = "Brualki Brisket", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_brualki_brisket.iff", x_off = 0.848066, z_off = 1, y_off = -0.068172 },
	{ itemName = "Charbote Root", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_charbote_root.iff", x_off = 0.740526, z_off = 1, y_off = 0.594393 },
	{ itemName = "Cligs", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_cligs.iff", x_off = -0.752775, z_off = 1, y_off = -0.582228 },
	{ itemName = "Crumblebuns", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_crumblebuns.iff", x_off = -1.28276, z_off = 1, y_off = -0.585675 },
	{ itemName = "Custard Bread", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_custard_bread.iff", x_off = -0.955155, z_off = 1, y_off = -0.0738717 },
	{ itemName = "Denta Beans", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_denta_beans.iff", x_off = 2.81491, z_off = 1, y_off = -0.441517 },
	{ itemName = "Dewback Steaks", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_dewback_steaks.iff", x_off = 1.23125, z_off = 1, y_off = -0.60749 },
	{ itemName = "Domit Pie", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_domit_pie.iff", x_off = 0.791459, z_off = 1, y_off = 0.3509 },
	{ itemName = "A Dricklefruit", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_dricklefruit.iff", x_off = -0.796001, z_off = 1, y_off = 0.567068 },	
	{ itemName = "Gin-Jang Berries", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_gin_jang_berries.iff", x_off = 2.56594, z_off = 1, y_off = -0.0629498 },
	{ itemName = "Hwotha Berries", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_hwotha_berries.iff", x_off = -2.44273, z_off = 1, y_off = -0.664797 },
	{ itemName = "Jerba Cheese", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_jerba_cheese.iff", x_off = 2.39205, z_off = 1, y_off = -0.460875 },	
	{ itemName = "A Kavasa Fruit", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_kavasa_fruit.iff", x_off = -0.152225, z_off = 1, y_off = 0.475462 },
	{ itemName = "Kibla Greens", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_kibla_greens.iff", x_off = -1.46176, z_off = 1, y_off = -0.235919 },
	{ itemName = "Kommerken Steak", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_kommerken_steak.iff", x_off = 1.97061, z_off = 1, y_off = -0.553949 },
	{ itemName = "Luptoomian Dressing", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_luptoomian_dressing.iff", x_off = -0.361722, z_off = 1, y_off = -0.544365 },
	{ itemName = "Muja Fruit", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_muja_fruit.iff", x_off = 2.95455, z_off = 1, y_off = 0.0177029 },
	{ itemName = "Necr'ygor Omic Wine", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_necrygor_omic_wine.iff", x_off = -0.475013, z_off = 1, y_off = 0.48582 },
	{ itemName = "Nerf Casserole", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_nerf_casserole.iff", x_off = 0.357216, z_off = 1, y_off = 0.399395 },
	{ itemName = "Nuna Bacon", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_nuna_bacon.iff", x_off = 0.41229, z_off = 1.01, y_off = -0.562278 },
	{ itemName = "Oi-Oi Puff", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_oi_oi_puff.iff", x_off = 2.12751, z_off = 1.01, y_off = -0.0829039 },
	{ itemName = "Oonberry Pie", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_oonberry_pie.iff", x_off = -2.00636, z_off = 1, y_off = -0.501912 },
	{ itemName = "Para-Rolls", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_para_rolls.iff", x_off = -1.70324, z_off = 1, y_off = 0.465674 },
	{ itemName = "Phraig", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_phraig.iff", x_off = 1.19642, z_off = 1, y_off = 0.154141 },
	{ itemName = "Qana Beans", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_qana_beans.iff", x_off = -2.08087, z_off = 1, y_off = 0.02607 },
	{ itemName = "Qrikki", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_qrikki.iff", x_off = 0.519662, z_off = 1, y_off = -0.239612 },
	{ itemName = "Roast Shatual", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_roast_shatual.iff", x_off = -0.35248, z_off = 1, y_off = -0.220804 },
	{ itemName = "Rootleaf Stew", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_rootleaf_stew.iff", x_off = -2.40285, z_off = 1, y_off = 0.437597 },
	{ itemName = "Shaak and Cheese Sandwich", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_shaak_sandwich.iff", x_off = 3.01791, z_off = 1, y_off = 0.314571 },	
	{ itemName = "Spiceloaf", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_spiceloaf.iff", x_off = -1.22822, z_off = 1, y_off = 0.482768 },
	{ itemName = "A Stinkmelon", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_stinkmelon.iff", x_off = -0.818315, z_off = 1, y_off = 0.374295 },
	{ itemName = "A Sunfruit", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_sunfruit.iff", x_off = 2.35147, z_off = 1, y_off = -0.730956 },
	{ itemName = "Sweet-Sand Cookies", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_sweet_sand_cookies.iff", x_off = 2.52597, z_off = 1, y_off = 0.349203 },
	{ itemName = "Topatoes", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_topatoes.iff", x_off = -1.70145, z_off = 1, y_off = -0.129151 },
	{ itemName = "Traladon Ribs", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_traladon_ribs.iff", x_off = -2.78368, z_off = 1, y_off = -0.0659645 },
	{ itemName = "Trig-Berries", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_trig_berries.iff", x_off = -2.11534, z_off = 1, y_off = 0.460491 },
	{ itemName = "Wastril Breadsticks", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_wastril_breadsticks.iff", x_off = -1.5272, z_off = 1, y_off = 0.129392 },
	{ itemName = "Wuli Nuts", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_wuli_nuts.iff", x_off = 1.89945, z_off = 1, y_off = 0.280529 },
	{ itemName = "A Wyykmelon", itemPath = "object/tangible/tarkin_custom/decorative/holiday/thanksgiving_food_wyykmelon.iff", x_off = -2.7251, z_off = 1, y_off = 0.512005 },
}
	
local rewards = {
	{ itemPath = "object/tangible/tarkin_custom/abilities/badges/tarkin_badge_thanksgiving_2019.iff", name = "completedFeastReward" },
	{ itemPath = "object/tangible/tarkin_custom/decorative/painting_gluttons_reward.iff", name = "items200Reward" },
	{ itemPath = "object/tangible/tarkin_custom/decorative/thanksgiving_reward_rug.iff", name = "items500Reward" },
	{ itemPath = "object/tangible/tarkin_custom/statted/thanksgiving_reward_retsa_seltzer.iff", name = "items1000Reward" },
	{ itemPath = "object/tangible/tarkin_custom/statted/thanksgiving_reward_salty_snackbox.iff", name = "items2000Reward" },
}

registerScreenPlay("CooperativeThanksgivingScreenplay", true)

function CooperativeThanksgivingScreenplay:start()
	--Schedule Event Start
	if (os.difftime(eventStartTime, os.time()) >= 0) then
		if (not hasServerEvent("CooperativeThanksgivingScreenplayStart")) then
			local startEventID = createServerEvent(os.difftime(eventStartTime, os.time())*1000, "CooperativeThanksgivingScreenplay", "startThanksgivingEvent", "CooperativeThanksgivingScreenplayStart")
		else
			rescheduleServerEvent("CooperativeThanksgivingScreenplayStart", os.difftime(eventStartTime, os.time())*1000)
		end
	elseif (self:isThanksgivingEventEnabled()== true) then
		self:startThanksgivingEvent()
	end

	--Schedule Event Cleanup
	if (os.difftime(eventCleanupTime, os.time()) >= 0) then
		if (not hasServerEvent("CooperativeThanksgivingScreenplayCleanup")) then
			local cleanupEventID = createServerEvent(os.difftime(eventCleanupTime, os.time())*1000, "CooperativeThanksgivingScreenplay", "cleanupThanksgivingEvent", "CooperativeThanksgivingScreenplayCleanup")
		else
			rescheduleServerEvent("CooperativeThanksgivingScreenplayCleanup", os.difftime(eventCleanupTime, os.time())*1000)
		end
	end	
end

function CooperativeThanksgivingScreenplay:startThanksgivingEvent()
	if (isZoneEnabled("corellia")) then
		self:spawnMobiles()
		self:spawnFeastTable()
		self:spawnFoods()
	end
end

function CooperativeThanksgivingScreenplay:cleanupThanksgivingEvent()
	-- Despawn the feast table & banners
	self:despawnFeastTable()

	--Despawn the mobiles
	self:despawnMobiles()
	
	-- Remove all quest statuses
	removeQuestStatus("cooperative_thanksgiving:numContributions")
	removeQuestStatus("cooperative_thanksgiving:claimedList:completedFeastReward")
	removeQuestStatus("cooperative_thanksgiving:claimedList:items200Reward")
	removeQuestStatus("cooperative_thanksgiving:claimedList:items500Reward")
	removeQuestStatus("cooperative_thanksgiving:claimedList:items1000Reward")
	removeQuestStatus("cooperative_thanksgiving:claimedList:items2000Reward")

	local contrubutedList = getQuestStatus("cooperative_thanksgiving:contributedList")
	list = ""
	
	if (contrubutedList ~= nil and contrubutedList ~= "") then
		list = TarkinLib:splitString(contrubutedList, ",")
		for i = 1, #list, 1 do
			local playerID = tostring(list[i])
			removeQuestStatus("cooperative_thanksgiving:removalList:" .. playerID)
		end
	end

	removeQuestStatus("cooperative_thanksgiving:contributedList")
	
	for i = 0, #feastItems do
		removeQuestStatus("cooperative_thanksgiving:feastItem_" .. i)
	end
end

function CooperativeThanksgivingScreenplay:spawnFeastTable()
	--Spawn the table
	local pTable = spawnSceneObject(feastTable.planet, feastTable.itemPath, feastTable.x, feastTable.z, feastTable.y, feastTable.cellID, feastTable.ow, feastTable.ox, feastTable.oy, feastTable.oz)
        writeData("CooperativeThanksgivingScreenplay:feastTable", SceneObject(pTable):getObjectID())
	
	--Spawn the decorative banners
	for i = 1, #feastBanners, 1 do
		local pBanner = spawnSceneObject(feastBanners[i].planet, feastBanners[i].itemPath, feastBanners[i].x, feastBanners[i].z, feastBanners[i].y, feastBanners[i].cellID, feastBanners[i].ow, feastBanners[i].ox, feastBanners[i].oy, feastBanners[i].oz)
		writeData("CooperativeThanksgivingScreenplay:feastBanners:" .. i, SceneObject(pBanner):getObjectID())
	end
end

function CooperativeThanksgivingScreenplay:spawnFoods()

	--In the event of a server outage, spawn all the foods that have been contributed back onto the table when the server starts	
	local planet = feastTable.planet
	local cellID = feastTable.cellID
	local tableX = feastTable.x
	local tableZ = feastTable.z
	local tableY = feastTable.y
	local tableOw = feastTable.ow
	local tableOx = feastTable.ox
	local tableOy = feastTable.oy
	local tableOz = feastTable.oz

	for i = 1, #feastItems do
		if (getQuestStatus("cooperative_thanksgiving:feastItem_" .. i) ~= nil) then 
			local pFood = spawnSceneObject(planet, feastItems[i].itemPath, tableX + feastItems[i].x_off, tableZ + feastItems[i].z_off, tableY + feastItems[i].y_off, cellID, tableOw, tableOx, tableOy, tableOz)
			writeData("CooperativeThanksgivingScreenplay:feastItem:"..tostring(i), SceneObject(pFood):getObjectID())
		end
	end
end

function CooperativeThanksgivingScreenplay:despawnFeastTable()
	--Table itself
	local tableID = readData("CooperativeThanksgivingScreenplay:feastTable")
	if ((tableID ~= nil) and (getSceneObject(tableID) ~= nil)) then
		local pTable = getSceneObject(tableID)
    		deleteData("CooperativeThanksgivingScreenplay:feastTable")
       		SceneObject(pTable):destroyObjectFromWorld()
		SceneObject(pTable):destroyObjectFromDatabase()
	end
	
	--Everything on the table
	for i = 1, #feastItems, 1 do
		local foodID = readData("CooperativeThanksgivingScreenplay:feastItem:"..tostring(i))
       		if ((foodID ~= nil) and (getSceneObject(foodID) ~= nil)) then
        		local pFood = getSceneObject(foodID)
    			deleteData(tostring(foodID)..":feastItem")
    			deleteData("CooperativeThanksgivingScreenplay:feastItem:"..tostring(i))
       	 		SceneObject(pFood):destroyObjectFromWorld()
			SceneObject(pFood):destroyObjectFromDatabase()
		end
	end

	--Decorative banners
	for i = 1, #feastBanners, 1 do
		local bannerID = readData("CooperativeThanksgivingScreenplay:feastBanners:"..tostring(i))
       		if ((bannerID ~= nil) and (getSceneObject(bannerID) ~= nil)) then
        		local pBanner = getSceneObject(bannerID)
    			deleteData("CooperativeThanksgivingScreenplay:feastBanners:"..tostring(i))
       	 		SceneObject(pBanner):destroyObjectFromWorld()
			SceneObject(pBanner):destroyObjectFromDatabase()
		end
	end
end

function CooperativeThanksgivingScreenplay:despawnMobiles()
	print("despawning mobiles...") --debug
	for i = 1, pharplesToSpawn, 1 do
		local mobileID = readData("CooperativeThanksgivingScreenplay:mobile:"..tostring(i))
       		if ((mobileID ~= nil) and (getSceneObject(mobileID) ~= nil)) then
        		local pMobile = getSceneObject(mobileID)
			print("got mobile, deleting...") --debug
    			deleteData("CooperativeThanksgivingScreenplay:mobile:"..tostring(i))
       	 		SceneObject(pMobile):destroyObjectFromWorld()
		end
	end
end

function CooperativeThanksgivingScreenplay:writeToContributedList(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local playerID = SceneObject(pPlayer):getObjectID()
	local list = getQuestStatus("cooperative_thanksgiving:contributedList")

	if (list == nil or list == "") then
		list = playerID
	else
		list = list .. "," .. playerID
	end

	setQuestStatus("cooperative_thanksgiving:contributedList", list)
end

function CooperativeThanksgivingScreenplay:writeToClaimedList (pPlayer, reward)
	if (pPlayer == nil) then
		return
	end
	
	local playerID = SceneObject(pPlayer):getObjectID()
	local list = getQuestStatus("cooperative_thanksgiving:claimedList:" .. reward)

	if (list == nil or list == "") then
		list = playerID
	else
		list = list .. "," .. playerID
	end

	setQuestStatus("cooperative_thanksgiving:claimedList:" .. reward, list)
end

function CooperativeThanksgivingScreenplay:writeToRemovalList (pPlayer, pFood)
	if (pPlayer == nil or pFood == nil) then
		return
	end
	
	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local foodID = SceneObject(pFood):getObjectID()
	local list = getQuestStatus("cooperative_thanksgiving:removalList:" .. playerID)

	if (list == nil or list == "") then
		list = foodID
	else
		list = list .. "," .. foodID
	end

	setQuestStatus("cooperative_thanksgiving:removalList:" .. playerID, list)
end

function CooperativeThanksgivingScreenplay:hasContributed(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())	
	local contributedList = getQuestStatus("cooperative_thanksgiving:contributedList")
	local list = ""
	
	if (contributedList ~= nil and contributedList ~= "") then
		list = TarkinLib:splitString(contributedList, ",")
		for i = 1, #list, 1 do
			if (list[i] == playerID) then
				return true
			end
		end
	end
	
	return false
end

function CooperativeThanksgivingScreenplay:hasClaimed (pPlayer, reward)
	if (pPlayer == nil) then
		return true
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())	
	local claimedList = getQuestStatus("cooperative_thanksgiving:claimedList:" .. reward)
	local list = ""
	
	if (claimedList ~= nil and claimedList ~= "") then
		list = TarkinLib:splitString(claimedList, ",")
		for i = 1, #list, 1 do
			if (list[i] == playerID) then
				return true
			end
		end
	end
	
	return false
end

function CooperativeThanksgivingScreenplay:hasFood(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return false
	end

	for i=1, #feastItems, 1 do
		local pFood = getContainerObjectByTemplate(pInventory, feastItems[i].itemPath, true)
		if (pFood ~= nil) then
			return true
		end
	end
	return false
end

function CooperativeThanksgivingScreenplay:tableFull()
	for i=1, #feastItems, 1 do
		local pFood = getQuestStatus("cooperative_thanksgiving:feastItem_" .. i)
		if (pFood == nil) then
			return false
		end
	end
	return true
end

function CooperativeThanksgivingScreenplay:contributeItems(pPlayer, pTable)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local sui = SuiMessageBox.new("CooperativeThanksgivingScreenplay", "contributeItemsSuiCallback")

	if (pTable == nil) then
		sui.setTargetNetworkId(0)
	else
		sui.setTargetNetworkId(SceneObject(pTable):getObjectID())
	end
	sui.setForceCloseDistance(25)
	sui.setTitle("Confirm Action")
	local promptText = "This will contribute all eligible food items in your inventory to the feast table.  Is this what you want to do?"
	sui.setPrompt(promptText)
	sui.sendTo(pPlayer)
end

function CooperativeThanksgivingScreenplay:contributeItemsSuiCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	if (pPlayer == nil) then
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return
	end

	local planet = feastTable.planet
	local cellID = feastTable.cellID
	local tableX = feastTable.x
	local tableZ = feastTable.z
	local tableY = feastTable.y
	local tableOw = feastTable.ow
	local tableOx = feastTable.ox
	local tableOy = feastTable.oy
	local tableOz = feastTable.oz

	for j = 0, SceneObject(pInventory):getContainerObjectsSize()-1, 1 do
		local pObject = SceneObject(pInventory):getContainerObject(j)
		if (pObject ~= nil) then
			local pPath = SceneObject(pObject):getTemplateObjectPath()
			for i = 1, #feastItems do
				if (pPath == feastItems[i].itemPath) then
					-- If the item has not yet been contributed, spawn one on the table	
					if (getQuestStatus("cooperative_thanksgiving:feastItem_" .. i) == nil) then 
						local pFood = spawnSceneObject(planet, pPath, tableX + feastItems[i].x_off, tableZ + feastItems[i].z_off, tableY + feastItems[i].y_off, cellID, tableOw, tableOx, tableOy, tableOz)
						setQuestStatus("cooperative_thanksgiving:feastItem_" .. i, 1)
						writeData("CooperativeThanksgivingScreenplay:feastItem:"..tostring(i), SceneObject(pFood):getObjectID())
					end
			
					-- Schedule the item for deletion
					self:writeToRemovalList(pPlayer, pObject)
			
					-- Increase the number of contributions
					if(getQuestStatus("cooperative_thanksgiving:numContributions") == nil) then
						setQuestStatus("cooperative_thanksgiving:numContributions", 1)
					else
						local numItemsContributed = tonumber(getQuestStatus("cooperative_thanksgiving:numContributions"))
						setQuestStatus("cooperative_thanksgiving:numContributions", numItemsContributed + 1)
					end 
				end
			end
		end
	end
	-- Add the playerID to a contributed list
	if(self:hasContributed(pPlayer) == false) then
		self:writeToContributedList(pPlayer)
	end

	-- Delete the contributed foods from the player's inventory
	self:deleteContributions(pPlayer)
		
	-- Send the player a message thanking them for their contribution & stating how many items are left to contribute	
	local message = "Thank you for your contribution!  " .. getQuestStatus("cooperative_thanksgiving:numContributions") .. " items have been contributed so far."


	if (self:tableFull() == false) then
		message = message .. "  The items remaining to fill the table are: \n"
	
		local counter = 0

		for i = 1, #feastItems do		
			if (getQuestStatus("cooperative_thanksgiving:feastItem_" .. i) == nil) then
				if(counter == 0) then
					message = message .. feastItems[i].itemName
				else
					message = message .. ", " .. feastItems[i].itemName
				end
				counter = counter + 1
			end
		end
	else
		message = message .. "  The table has been filled, but you may continue contributing to get rewards.  The highest reward you may earn comes at 2000 contributions."
	end
		
	CreatureObject(pPlayer):sendSystemMessage(message)		
end

function CooperativeThanksgivingScreenplay:deleteContributions(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local removalList = getQuestStatus("cooperative_thanksgiving:removalList:" .. playerID)
	local list = ""
	
	if (removalList ~= nil and removalList ~= "") then
		list = TarkinLib:splitString(removalList, ",")
		for i = 1, #list, 1 do
			local foodID = list[i]
			local pFood = getSceneObject(foodID)
			if (pFood ~= nil) then
       	 			SceneObject(pFood):destroyObjectFromWorld()
       	 			SceneObject(pFood):destroyObjectFromDatabase()
			end
		end
	end
	removeQuestStatus("cooperative_thanksgiving:removalList:" .. playerID)			
end

function CooperativeThanksgivingScreenplay:giveReward(pPlayer, reward)
	if (pPlayer == nil) then
		return
	end

	if (self:hasClaimed(pPlayer, reward) == true) then
			CreatureObject(pPlayer):sendSystemMessage("You may only claim this reward once.")
			return
	end	

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end
	
	if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full! Make some room, then claim your reward.")
			return
	end
	
	local pPath = ""
	
	for i=1, #rewards, 1 do	
		if (reward == rewards[i].name) then
			pPath = rewards[i].itemPath
		end
	end
	
	if (pPath ~= nil and pPath ~= "") then
		local pReward = giveItem(pInventory, pPath, -1)
		if (pReward ~= nil) then
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory")
			self:writeToClaimedList(pPlayer, reward)
		end		
	end
	

end

function CooperativeThanksgivingScreenplay:spawnMobiles()
	local spawns = 1 --Number of mobile spawns created
	local pMobile

	for i=1, pharplesToSpawn, 1  do
		self:respawnMobile(i)		
	end
end

function CooperativeThanksgivingScreenplay:respawnMobile(i)

	local mobileTemplate = mobileTemplates[getRandomNumber(1, #mobileTemplates)]
	local referencePoint = getRandomNumber(1, #SpawnPointsTable)
	local zone = SpawnPointsTable[referencePoint].planet

	if (not isZoneEnabled(zone)) then --If the zone is not enabled, send error message
		printLuaError("Unable to spawn mobile.  Necessary zones were not enabled.")	
	end

	local xRef = SpawnPointsTable[referencePoint].xRef
	local yRef = SpawnPointsTable[referencePoint].yRef
	local maxRadius = SpawnPointsTable[referencePoint].maxRadius
	local pSpawner = spawnSceneObject(zone, "object/tangible/spawning/quest_spawner.iff", xRef, 0, yRef, 0, 0)

	if (pSpawner == nil) then
		printLuaError("QuestSpawner:createQuestSpawner, unable to create spawner object.")
		return
	end

	local spawnPoint = getSpawnPointInArea(zone, xRef, yRef, maxRadius)
		
	if (spawnPoint == nil) then
		spawnPoint = { spawnerX, getTerrainHeight(pSpawner, xRef, yRef), yRef }
	end

	local pMobile = spawnMobile(zone, mobileTemplate, 0, spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360) - 180, 0)

	SceneObject(pSpawner):destroyObjectFromWorld()	

	if (pMobile ~= nil) then
		writeData("CooperativeThanksgivingScreenplay:mobile:"..tostring(i), SceneObject(pMobile):getObjectID())
		createEvent(10, "CooperativeThanksgivingScreenplay", "setupMobile", pMobile, "")
	end
end

function CooperativeThanksgivingScreenplay:setupMobile(pMobile)
	createObserver(OBJECTDESTRUCTION, "CooperativeThanksgivingScreenplay", "notifyMobileDead", pMobile)
	createEvent(secondsToDespawn * 1000, "CooperativeThanksgivingScreenplay", "despawnMobile", pMobile, "")
end

function CooperativeThanksgivingScreenplay:notifyMobileDead(pMobile, pKiller)
	if (pMobile == nil) then
		return 1
	end

	if (pKiller == nil) then
		return 1
	end

	--If the event is over, don't respawn any more pharples
	if( self:isThanksgivingEventEnabled() == false) then
		return 1
	end
	
	local index = 1

	for i=1, pharplesToSpawn, 1 do
		local oldID = readData("CooperativeThanksgivingScreenplay:mobile:"..tostring(i))
		local mobileID = SceneObject(pMobile):getObjectID()

		if(oldID == mobileID) then
			index = i
			break
		end
	end

	deleteData("CooperativeThanksgivingScreenplay:mobile:"..tostring(i))
	createEvent(secondsToRespawn * 1000, "CooperativeThanksgivingScreenplay", "respawnMobile", index, "") --Respawn after death

	return 1
end

function CooperativeThanksgivingScreenplay:despawnMobile(pMobile)
	if (pMobile == nil or CreatureObject(pMobile):isDead()) then
		return
	end

	if (CreatureObject(pMobile):isInCombat()) then --If mobile is in combat at the scheduled despawn time, don't actually complete the despawn.  Instead, set a new despawn timer.
		createEvent(secondsToDespawn * 1000, "CooperativeThanksgivingScreenplay", "despawnMobile", pMobile, "")
		return		
	end

	SceneObject(pMobile):destroyObjectFromWorld()
	createEvent(2 * 1000, "CooperativeThanksgivingScreenplay", "respawnMobile", pNewMobile, "")
	return 1
end

function CooperativeThanksgivingScreenplay:deleteOneThousandList()
	removeQuestStatus("cooperative_thanksgiving:claimedList:items1000Reward")
end

function CooperativeThanksgivingScreenplay:isThanksgivingEventEnabled()
	if (os.difftime(eventStartTime, os.time()) <= 0 and os.difftime(eventCleanupTime, os.time()) > 0) then
		return true
	else		
		return false
	end
end

--Feast Table Radial Menu Functions
CooperativeThanksgivingTableObjectMenuComponent = { }

function CooperativeThanksgivingTableObjectMenuComponent:fillObjectMenuResponse(pTable, pMenuResponse, pPlayer)

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if (CooperativeThanksgivingScreenplay:hasFood(pPlayer) == true) then
		menuResponse:addRadialMenuItem(115, 3, "Contribute Food")
	end
	
	if (CooperativeThanksgivingScreenplay:hasContributed(pPlayer) == true) then
		if (CooperativeThanksgivingScreenplay:tableFull() == true and CooperativeThanksgivingScreenplay:hasClaimed(pPlayer, "completedFeastReward") == false) then	
			menuResponse:addRadialMenuItem(116, 3, "Claim Full Table Reward")	
		end
	
		if (tonumber(getQuestStatus("cooperative_thanksgiving:numContributions")) >= 200 and CooperativeThanksgivingScreenplay:hasClaimed(pPlayer, "items200Reward") == false) then	
			menuResponse:addRadialMenuItem(117, 3, "Claim 200 Contributions Reward")	
		end
	
		if (tonumber(getQuestStatus("cooperative_thanksgiving:numContributions")) >= 500 and CooperativeThanksgivingScreenplay:hasClaimed(pPlayer, "items500Reward") == false) then	
			menuResponse:addRadialMenuItem(118, 3, "Claim 500 Contributions Reward")	
		end
	
		if (tonumber(getQuestStatus("cooperative_thanksgiving:numContributions")) >= 1000 and CooperativeThanksgivingScreenplay:hasClaimed(pPlayer, "items1000Reward") == false) then	
			menuResponse:addRadialMenuItem(119, 3, "Claim 1000 Contributions Reward")	
		end	

		if (tonumber(getQuestStatus("cooperative_thanksgiving:numContributions")) >= 2000 and CooperativeThanksgivingScreenplay:hasClaimed(pPlayer, "items2000Reward") == false) then	
			menuResponse:addRadialMenuItem(120, 3, "Claim 2000 Contributions Reward")	
		end	
	end
	if (CreatureObject(pPlayer):hasSkill("tarkin_admin_01")) then
		menuResponse:addRadialMenuItem(121, 3, "Reset the 1000 reward DEBUG")
		menuResponse:addRadialMenuItem(122, 3, "DespawnMobiles DEBUG")
	end
end

function CooperativeThanksgivingTableObjectMenuComponent:handleObjectMenuSelect(pTable, pPlayer, selectedID)
	if (pPlayer == nil or pTable == nil) then
		return 0
	end
	
	if (selectedID == 115) then 
		CooperativeThanksgivingScreenplay:contributeItems(pPlayer, pTable)
	end
	
	if (selectedID == 116) then 
		CooperativeThanksgivingScreenplay:giveReward(pPlayer, "completedFeastReward")
	end
	
	if (selectedID == 117) then 
		CooperativeThanksgivingScreenplay:giveReward(pPlayer, "items200Reward")
	end	
	
	if (selectedID == 118) then 
		CooperativeThanksgivingScreenplay:giveReward(pPlayer, "items500Reward")
	end	
	
	if (selectedID == 119) then 
		CooperativeThanksgivingScreenplay:giveReward(pPlayer, "items1000Reward")
	end	

	if (selectedID == 120) then 
		CooperativeThanksgivingScreenplay:giveReward(pPlayer, "items2000Reward")
	end

	if (selectedID == 121) then 
		CooperativeThanksgivingScreenplay:deleteOneThousandList()
	end

	if (selectedID == 122) then 
		CooperativeThanksgivingScreenplay:despawnMobiles()
	end
	return 1
end

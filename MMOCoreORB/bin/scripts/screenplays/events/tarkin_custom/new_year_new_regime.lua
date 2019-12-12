--////////////////////////////////////////////////////////
--//   		    New Year, New Regime	 	//
--//    	    a Tarkin screenplay	                //
--////////////////////////////////////////////////////////
--// A month-long server-wide GCW event, where players  //
--// accumulate points for their faction based on       //
--// participation in various activities, such as  	//
--// combat, capture the flag, slicing signposts, and   //
--// base busting.  Only one faction shall reign!  	//
--////////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")
includeFile("../custom_scripts/screenplays/events/new_regime_data.lua")
includeFile("../custom_scripts/screenplays/tools/tarkin_lib.lua")

NewYearNewRegimeScreenplay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "NewYearNewRegimeScreenplay",
}

--CONFIG
--------------------------------------------------------
local eventStartTime = os.time{ year=2020, month=1, day=1, hour=0, min=0 } --Go live: 1/1/2020, midnight
local eventEndTime = os.time{ year=2020, month=1, day=31, hour=23, min=59 } --Stop the points-earning phase: 1/31/2020, 11:59 PM 
local eventCleanupTime = os.time{ year=2020, month=2, day=29, hour=23, min=59 }  --Despawn the quest giver: 2/29/2020, 11:59 PM 
local timeToDespawnFlag =   6 * 60 * 60 * 1000 -- 6 hours
local timeToDespawnSignpost =  1 * 24 * 60 * 60 * 1000 -- 1 day
local numFlagsToSpawn = 100  --number of flags plus signposts should be less than total number of locations defined in new_regime_data
local numSignpostsToSpawn = 20
local daysPassedSinceEnd = math.ceil((((os.time() - eventEndTime)/ 60) / 60) / 24)
local buildingID = 610000478

-- Points values for various activities
local pvpPointsValue = 100
local pvePointsValue = 2
local captureSameFlagPointsValue = 2
local captureOpposingFlagPointsValue = 5
local sliceSignpostPointsValue = 10
local flipBasePointsValue = 500

-- Rewards
local imperialChip = "object/tangible/tarkin_custom/decorative/imperial_membership_chip.iff"
local rebelChip = "object/tangible/tarkin_custom/decorative/rebel_membership_chip.iff"

local imp1000Reward = "object/tangible/tarkin_custom/decorative/gcw_1000_painting_reward_imp.iff"
local imp2500Reward = "object/tangible/tarkin_custom/decorative/gcw_2500_painting_reward_imp.iff"
local imp5000Reward = "object/tangible/tarkin_custom/decorative/gcw_5000_painting_reward_imp.iff"
local imp10000Reward = "object/tangible/tarkin_custom/decorative/gcw_10000_painting_reward_imp.iff"

local reb1000Reward = "object/tangible/tarkin_custom/decorative/gcw_1000_painting_reward_reb.iff"
local reb2500Reward = "object/tangible/tarkin_custom/decorative/gcw_2500_painting_reward_reb.iff"
local reb5000Reward = "object/tangible/tarkin_custom/decorative/gcw_5000_painting_reward_reb.iff"
local reb10000Reward = "object/tangible/tarkin_custom/decorative/gcw_10000_painting_reward_reb.iff"

local impRewards = {
	"object/tangible/tarkin_custom/abilities/badges/tarkin_badge_imp_new_year_new_regime.iff",
	"object/tangible/tarkin_custom/decorative/gcw_shadow_box_reward.iff",
	"object/tangible/tarkin_custom/decorative/gcw_imperial_winner_painting.iff",
	"object/tangible/loot/loot_schematic/gcw_reward_food_imperial_schematic.iff",
	"object/tangible/loot/loot_schematic/armor_segment_gcw_reward_schematic.iff"
}

local rebRewards = {
	"object/tangible/tarkin_custom/abilities/badges/tarkin_badge_reb_new_year_new_regime.iff",
	"object/tangible/tarkin_custom/decorative/gcw_shadow_box_reward.iff",
	"object/tangible/tarkin_custom/decorative/gcw_rebel_winner_painting.iff",
	"object/tangible/loot/loot_schematic/gcw_reward_drink_rebel_schematic.iff",
	"object/tangible/loot/loot_schematic/armor_segment_gcw_reward_schematic.iff"
}
--------------------------------------------------------

registerScreenPlay("NewYearNewRegimeScreenplay", true)

local screenplayStationaryMobiles = {
	{ mobile = "war_game_master", planet = "tatooine", timer = 1, x = 1239.68, z = 7, y = 2970.76, facing = -57, cellID = 0 },
	{ mobile = "imperial_recruiter", planet = "tatooine", timer = 1, x = 1277.73, z = 7, y = 2970.45, facing = -2, cellID = 0 },
	{ mobile = "rebel_recruiter", planet = "tatooine", timer = 1, x = 1279.47, z = 5.9962, y = 2908.11, facing = 157, cellID = 0 },
}

local screenplayStationaryObjects = {
	{ path = "object/static/worldbuilding/furniture/ui_faction_imperial_small.iff", planet = "tatooine", x = 1238.33, z = 8.6, y = 2969.19, cellID = 0, ow = 0.92388, ox = 0, oy = -0.382683, oz = 0 },
	{ path = "object/tangible/veteran_reward/frn_vet_rug_imperial.iff", planet = "tatooine", x = 1241.32, z = 7, y = 2971.68, cellID = 0, ow = 0.987688, ox = 0, oy = 0.156434, oz = 0 },
	{ path = "object/static/worldbuilding/furniture/ui_faction_rebel_small.iff", planet = "tatooine", x = 1239.09, z = 8.6, y = 2970, cellID = 0, ow = 0.92388, ox = 0, oy = -0.382683, oz = 0 },
	{ path = "object/tangible/veteran_reward/frn_vet_rug_rebel.iff", planet = "tatooine", x = 1238.79, z = 7, y = 2968.96, cellID = 0, ow = -0.833886, ox = 0, oy = -0.551937, oz = 0 },
	{ path = "object/tangible/furniture/imperial/table_s1.iff", planet = "tatooine", x = 1277.59, z = 7, y = 2971.49, cellID = 0, ow = 0.0572395, ox = 0, oy = 0.999836, oz = 0 },
	{ path = "object/static/item/item_tapestry_imperial.iff", planet = "tatooine", x = 1278.73, z = 7, y = 2969.41, cellID = 0, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0 },
	{ path = "object/static/item/item_tapestry_imperial.iff", planet = "tatooine", x = 1276.55, z = 7, y = 2969.41,  cellID = 0, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0 },
	{ path = "object/tangible/furniture/imperial/table_s1.iff", planet = "tatooine", x = 1279.65, z = 6, y = 2906.91, cellID = 0, ow = 0.999573, ox = 0, oy = -0.0292143, oz = 0 },
	{ path = "object/static/item/item_tapestry_rebel.iff", planet = "tatooine", x = 1276.45, z = 7, y = 2909.28, cellID = 0, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0 },
	{ path = "object/static/item/item_tapestry_rebel.iff", planet = "tatooine", x = 1278.78, z = 7, y = 2909.28, cellID = 0, ow = 0.707107, ox = 0, oy = -0.707107, oz = 0 },
}

local scoreboard = {
	{ path = "object/tangible/tarkin_custom/decorative/tarkin_scoreboard.iff", planet = "tatooine", x = 1245.68, z = 8.90312, y = 2958.44, cellID = 0, ow = 0, ox = 0, oy = -1, oz = 0 },
}

function NewYearNewRegimeScreenplay:start()	
	local pBuilding = getSceneObject(buildingID)
	if (pBuilding ~= nil) then 
		local pBlock1 = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/echo_base_door_lg.iff", -5.49954, -56.2, 20.9947, 610000510, -0.707107, 0, -0.707107,0)
		local pBlock2 = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/echo_base_door_lg.iff", 0.0818403, -32.4584, -27.7428, 610000496, 1, 0, 0, 0)
		local pBars2= spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/thm_kash_cave_myyydril_bars.iff", 0.0818403, -32.4584, -27.7428, 610000496, 0.707107, 0, -0.707107, 0)
		local pBlock3 = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/echo_base_door_lg.iff", -9.23351, -32.4518, -37.0238, 610000494, 0.707107, 0, -0.707107, 0)
		local pBars3 = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/thm_kash_cave_myyydril_bars.iff", -9.23351, -32.4518, -37.0238, 610000494, 1, 0, 0, 0)
		SceneObject(pBlock1):setCustomObjectName("Blocked")
		SceneObject(pBlock2):setCustomObjectName("Blocked")
		SceneObject(pBlock3):setCustomObjectName("Blocked")
	end

	--Schedule Event Start
	if (os.difftime(eventStartTime, os.time()) >= 0) then
		if (not hasServerEvent("NewYearNewRegimeScreenplayStart")) then
			local startEventID = createServerEvent(os.difftime(eventStartTime, os.time())*1000, "NewYearNewRegimeScreenplay", "startNewYearEvent", "NewYearNewRegimeScreenplayStart")
		else
			rescheduleServerEvent("NewYearNewRegimeScreenplayStart", os.difftime(eventStartTime, os.time())*1000)
		end
	elseif (self:isGcwEventEnabled() == true) then
		self:startNewYearEvent()
	elseif (self:isClaimingPeriodEnabled() == true) then
		self:spawnGameMaster()
	end

	--Schedule Event End
	if (os.difftime(eventEndTime, os.time()) >= 0) then
		if (not hasServerEvent("NewYearNewRegimeScreenplayEnd")) then
			local endEventID = createServerEvent(os.difftime(eventEndTime, os.time())*1000, "NewYearNewRegimeScreenplay", "endNewYearEvent", "NewYearNewRegimeScreenplayEnd")
		else
			rescheduleServerEvent("NewYearNewRegimeScreenplayEnd", os.difftime(eventEndTime, os.time())*1000)
		end
	end

	--Schedule Event Cleanup
	if (os.difftime(eventCleanupTime, os.time()) >= 0) then
		if (not hasServerEvent("NewYearNewRegimeScreenplayCleanup")) then
			local cleanupEventID = createServerEvent(os.difftime(eventCleanupTime, os.time())*1000, "NewYearNewRegimeScreenplay", "cleanupNewYearEvent", "NewYearNewRegimeScreenplayCleanup")
		else
			rescheduleServerEvent("NewYearNewRegimeScreenplayCleanup", os.difftime(eventCleanupTime, os.time())*1000)
		end
	end
end

function NewYearNewRegimeScreenplay:startNewYearEvent()
	self:spawnGameMaster()		
	self:spawnSignposts()
	self:spawnFlags()
	self:spawnBaseSceneObjects()
	self:setupBuilding()
	
	local randomFaction = getRandomNumber(0,1)
	if (randomFaction == 0) then
		setQuestStatus("new_regime:baseFaction", "rebel")
	else
		setQuestStatus("new_regime:baseFaction", "imperial")
	end

	self:spawnBaseMobiles()
end

function NewYearNewRegimeScreenplay:endNewYearEvent()
	--despawn flags
	local flagIDList = getQuestStatus("new_regime:flagIDList")
	local list = ""
	local pFlag = ""
	setQuestStatus("new_regime:activeFlagCount", "0")
	
	if (flagIDList ~= nil and flagIDList ~= "") then
		list = TarkinLib:splitString(flagIDList, ",")
		for i = 1, #list, 1 do
			pFlag = getSceneObject(tonumber(list[i])) 
			if (pFlag ~= nil) then
				self:despawnFlag(pFlag)
			end
		end
		removeQuestStatus("new_regime:flagIDList")
	end

	--despawn signposts
	local signpostIDList = getQuestStatus("new_regime:signpostIDList")
	list = ""
	local pSignpost = ""
	
	if (signpostIDList ~= nil and signpostIDList ~= "") then
		list = TarkinLib:splitString(signpostIDList, ",")
		for i = 1, #list, 1 do
			pSignpost = getSceneObject(tonumber(list[i])) 
			if (pSignpost ~= nil) then
				self:despawnSignpost(pSignpost)
			end
		end
		removeQuestStatus("new_regime:signpostIDList")
	end

	--remove player variables
	local pointsList = getQuestStatus("new_regime:pointsList")
	list = ""
	local pPlayerID = ""
	
	if (pointsList ~= nil and pointsList ~= "") then
		list = TarkinLib:splitString(pointsList, ",")
		for i = 1, #list, 1 do
			pPlayer = getSceneObject(tonumber(list[i])) 
			if (pPlayer ~= nil) then
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "secondDNASample")
			end
		end
	end

	--despawn base mobiles
	self:despawnBaseMobiles()

	--cancel server events
	if (hasServerEvent("respawnFlagsEvent")) then
		rescheduleServerEvent("respawnFlagsEvent", -1)
		dropServerEvent("respawnFlagsEvent")
	end
	
	if (hasServerEvent("respawnSignpostsEvent")) then
		rescheduleServerEvent("respawnSignpostsEvent", -1)
		dropServerEvent("respawnSignpostsEvent")
	end

	--remove quest statuses
	removeQuestStatus("new_regime:flagList")
	removeQuestStatus("new_regime:signpostList")
	removeQuestStatus("new_regime:activeFlagCount")
	removeQuestStatus("new_regime:baseFlipper")
	removeQuestStatus("new_regime:destroyList")
end

function NewYearNewRegimeScreenplay:cleanupNewYearEvent()
	--remove player variables
	local pointsList = getQuestStatus("new_regime:pointsList")
	list = ""
	local pPlayerID = ""
	
	if (pointsList ~= nil and pointsList ~= "") then
		list = TarkinLib:splitString(pointsList, ",")
		for i = 1, #list, 1 do
			pPlayer = getSceneObject(tonumber(list[i])) 
			if (pPlayer ~= nil) then
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerRedeemedPoints")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed1")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed2")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed3")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed4")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed5")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward1000")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward2500")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward5000")
				deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward10000")
			end
		end
	end

	--remove quest statuses
	removeQuestStatus("new_regime:baseFaction")
	removeQuestStatus("new_regime:rebelList")
	removeQuestStatus("new_regime:imperialList")
	removeQuestStatus("new_regime:pointsList")
	removeQuestStatus("new_regime:rebelPoints")
	removeQuestStatus("new_regime:imperialPoints")

	--despawn game master, recruiters, & scene objects
	self:despawnGameMaster()
end

function NewYearNewRegimeScreenplay:spawnGameMaster()

	for i=1, #screenplayStationaryMobiles, 1 do
		local pMobile = spawnMobile(screenplayStationaryMobiles[i].planet, screenplayStationaryMobiles[i].mobile, screenplayStationaryMobiles[i].timer, screenplayStationaryMobiles[i].x, screenplayStationaryMobiles[i].z, screenplayStationaryMobiles[i].y, screenplayStationaryMobiles[i].facing, screenplayStationaryMobiles[i].cellID)
		if (pMobile ~= nil) then
        		writeData("NewYearNewRegimeScreenplay:stationaryMobile:"..tostring(i),SceneObject(pMobile):getObjectID())
		end
	end

	for i=1, #screenplayStationaryObjects, 1 do
		local pObject = spawnSceneObject(screenplayStationaryObjects[i].planet, screenplayStationaryObjects[i].path, screenplayStationaryObjects[i].x, screenplayStationaryObjects[i].z, screenplayStationaryObjects[i].y, screenplayStationaryObjects[i].cellID, screenplayStationaryObjects[i].ow, screenplayStationaryObjects[i].ox, screenplayStationaryObjects[i].oy, screenplayStationaryObjects[i].oz)
		if (pObject ~= nil) then
        		writeData("NewYearNewRegimeScreenplay:stationaryObject:"..tostring(i),SceneObject(pObject):getObjectID())
		end
	end

	for i=1, #scoreboard, 1 do
		local pScoreboard = spawnSceneObject(scoreboard[i].planet, scoreboard[i].path, scoreboard[i].x, scoreboard[i].z, scoreboard[i].y, scoreboard[i].cellID, scoreboard[i].ow, scoreboard[i].ox, scoreboard[i].oy, scoreboard[i].oz)
		if (pScoreboard ~= nil) then
        		writeData("NewYearNewRegimeScreenplay:scoreboard:"..tostring(i),SceneObject(pScoreboard):getObjectID())
			TangibleObject(pScoreboard):setLuaStringData("scoreboardName", "new_year_new_regime_scoreboard")
		end
	end
end

function NewYearNewRegimeScreenplay:despawnGameMaster()

    for i = 1, #screenplayStationaryMobiles, 1 do
        local mobileID = readData("NewYearNewRegimeScreenplay:stationaryMobile:"..tostring(i))
        if ((mobileID ~= nil) and (getSceneObject(mobileID) ~= nil)) then
        	local pMobile = getSceneObject(mobileID)
    		deleteData(tostring(mobileID)..":stationaryMobile")
    		deleteData("NewYearNewRegimeScreenplay:stationaryMobile:"..tostring(i))
       	 	SceneObject(pMobile):destroyObjectFromWorld()
	end
    end

    for i = 1, #screenplayStationaryObjects, 1 do
        local objectID = readData("NewYearNewRegimeScreenplay:stationaryObject:"..tostring(i))
        if ((objectID ~= nil) and (getSceneObject(objectID) ~= nil)) then
        	local pObject = getSceneObject(objectID)
    		deleteData(tostring(objectID)..":stationaryObject")
    		deleteData("NewYearNewRegimeScreenplay:stationaryObject:"..tostring(i))
       	 	SceneObject(pObject):destroyObjectFromWorld()
       	 	SceneObject(pObject):destroyObjectFromDatabase()
        end
    end

    for i = 1, #scoreboard, 1 do
        local scoreboardID = readData("NewYearNewRegimeScreenplay:scoreboard:"..tostring(i))
        if ((scoreboardID ~= nil) and (getSceneObject(scoreboardID) ~= nil)) then
        	local pScoreboard = getSceneObject(scoreboardID)
    		deleteData(tostring(scoreboardID)..":scoreboard")
    		deleteData("NewYearNewRegimeScreenplay:scoreboard:"..tostring(i))
       	 	SceneObject(pScoreboard):destroyObjectFromWorld()
       	 	SceneObject(pScoreboard):destroyObjectFromDatabase()
        end
    end

    return 0
end

function NewYearNewRegimeScreenplay:chooseRandomLocation()
	local maxNum = #locations
	local randomNumber = getRandomNumber(maxNum)
	return randomNumber
end

function NewYearNewRegimeScreenplay:setupBuilding()
	local pBuilding = getSceneObject(buildingID)

	if (pBuilding == nil) then
		return false
	end

	createObserver(EXITEDBUILDING, "NewYearNewRegimeScreenplay", "notifyExitedBase", pBuilding)
	return true
end

function NewYearNewRegimeScreenplay:notifyExitedBase(pBuilding, pPlayer)

	if (pPlayer == nil or pBuilding == nil) then
		return 0
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())

	if (getQuestStatus("new_regime:baseFlipper") == playerID) then
		removeQuestStatus("new_regime:baseFlipper")
	end

	if (SceneObject(pPlayer):isPlayerCreature()) then
		deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample")
		deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "secondDNASample")
	end
	
	return 0
end

function NewYearNewRegimeScreenplay:writeToRebelList(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local accountID = PlayerObject(pGhost):getAccountID()
	local list = getQuestStatus("new_regime:rebelList")

	if (list == nil or list == "") then
		list = accountID
	else
		list = list .. "," .. accountID
	end

	setQuestStatus("new_regime:rebelList", list)
end

function NewYearNewRegimeScreenplay:writeToImperialList(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local accountID = PlayerObject(pGhost):getAccountID()
	local list = getQuestStatus("new_regime:imperialList")

	if (list == nil or list == "") then
		list = accountID
	else
		list = list .. "," .. accountID
	end

	setQuestStatus("new_regime:imperialList", list)
end

function NewYearNewRegimeScreenplay:writeToPointsList(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local playerID = SceneObject(pPlayer):getObjectID()
	local list = getQuestStatus("new_regime:pointsList")

	if (list == nil or list == "") then
		list = playerID
	else
		list = list .. "," .. playerID
	end

	setQuestStatus("new_regime:pointsList", list)

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
		local pReward = giveItem(pInventory, imperialChip, -1)

		if (pReward ~= nil) then
			SceneObject(pReward):setCustomObjectName(CreatureObject(pPlayer):getFirstName() .. "'s Imperial Membership Chip")
			CreatureObject(pPlayer):sendSystemMessage("Evidence of your participation in this event has been placed in your inventory.")
		end
	elseif (CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
		local pReward = giveItem(pInventory, rebelChip, -1)
		if (pReward ~= nil) then
			SceneObject(pReward):setCustomObjectName(CreatureObject(pPlayer):getFirstName() .. "'s Rebel Alliance Membership Chip")
			CreatureObject(pPlayer):sendSystemMessage("Evidence of your participation in this event has been placed in your inventory.")
		end
	end



end

function NewYearNewRegimeScreenplay:writeToFlagList(location)
	if (location == nil) then
		return
	end

	local list = getQuestStatus("new_regime:flagList")

	if (list == nil or list == "") then
		list = location
	else
		list = list .. "," .. location
	end

	setQuestStatus("new_regime:flagList", list)
end

function NewYearNewRegimeScreenplay:writeToSignpostList(location)
	if (location == nil) then
		return
	end

	local list = getQuestStatus("new_regime:signpostList")

	if (list == nil or list == "") then
		list = location
	else
		list = list .. "," .. location
	end

	setQuestStatus("new_regime:signpostList", list)
end

function NewYearNewRegimeScreenplay:writeToFlagIDList(pFlag)
	if (pFlag == nil) then
		return
	end

	local flagID = tostring(SceneObject(pFlag):getObjectID())
	
	local list = getQuestStatus("new_regime:flagIDList")

	if (list == nil or list == "") then
		list = flagID
	else
		list = list .. "," .. flagID
	end

	setQuestStatus("new_regime:flagIDList", list)
end

function NewYearNewRegimeScreenplay:writeToSignpostIDList(pSignpost)
	if (pSignpost == nil) then
		return
	end

	local signpostID = tostring(SceneObject(pSignpost):getObjectID())
	
	local list = getQuestStatus("new_regime:signpostIDList")

	if (list == nil or list == "") then
		list = signpostID
	else
		list = list .. "," .. signpostID
	end

	setQuestStatus("new_regime:signpostIDList", list)
end

function NewYearNewRegimeScreenplay:writeToFailureList(pPlayer, pSignpost)
	if (pPlayer == nil or pSignpost == nil) then
		return
	end

	local signpostObjectID = tostring(SceneObject(pSignpost):getObjectID())
	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	
	
	local list = getQuestStatus("new_regime:failure" .. signpostObjectID)

	if (list == nil or list == "") then
		list = playerID
	else
		list = list .. "," .. playerID
	end

	setQuestStatus("new_regime:failure" .. signpostObjectID, list)
end

function NewYearNewRegimeScreenplay:writeToDestroyList(pMobile)
	if (pMobile == nil) then
		return
	end

	local mobileID = tostring(SceneObject(pMobile):getObjectID())
	
	local list = getQuestStatus("new_regime:destroyList")

	if (list == nil or list == "") then
		list = mobileID
	else
		list = list .. "," .. mobileID
	end

	setQuestStatus("new_regime:destroyList", list)
end

function NewYearNewRegimeScreenplay:isLocationTaken(location)
	if (location == nil) then
		return true
	end
	
	local signpostList = getQuestStatus("new_regime:signpostList")
	local flagList = getQuestStatus("new_regime:flagList")
	local list = ""
	
	if (signpostList ~= nil and signpostList ~= "") then
		list = TarkinLib:splitString(signpostList, ",")
		for i = 1, #list, 1 do
			if list[i] == tostring(location) then
				return true
			end
		end
	end

	if (flagList ~= nil and flagList ~= "") then
		list = TarkinLib:splitString(flagList, ",")
		for i = 1, #list, 1 do
			if list[i] == tostring(location) then
				return true
			end
		end
	end
	return false
end

function NewYearNewRegimeScreenplay:isOnRebelList(pPlayer)
	if (pPlayer == nil) then
		return false
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local accountID = PlayerObject(pGhost):getAccountID()	
	local rebelList = getQuestStatus("new_regime:rebelList")
	local list = ""
	
	if (rebelList ~= nil and rebelList ~= "") then
		list = TarkinLib:splitString(rebelList, ",")
		for i = 1, #list, 1 do
			if (tonumber(list[i]) == accountID) then
				return true
			end
		end
	end
	
	return false
end

function NewYearNewRegimeScreenplay:isOnImperialList(pPlayer)
	if (pPlayer == nil) then
		return false
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local accountID = PlayerObject(pGhost):getAccountID()	
	local imperialList = getQuestStatus("new_regime:imperialList")
	local list = ""
	
	if (imperialList ~= nil and imperialList ~= "") then
		list = TarkinLib:splitString(imperialList, ",")
		for i = 1, #list, 1 do
			if (tonumber(list[i]) == accountID) then
				return true
			end
		end
	end
	
	return false
end

function NewYearNewRegimeScreenplay:isOnFailureList(pPlayer, pSignpost)
	if (pPlayer == nil or pSignpost == nil) then
		return true
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())	
	local signpostObjectID = tostring(SceneObject(pSignpost):getObjectID())
	local failureList = getQuestStatus("new_regime:failure" .. signpostObjectID)
	local list = ""
	
	if (failureList ~= nil and failureList ~= "") then
		list = TarkinLib:splitString(failureList, ",")
		for i = 1, #list, 1 do
			if (list[i] == playerID) then
				return true
			end
		end
	end
	
	return false
end

function NewYearNewRegimeScreenplay:isOnPointsList(pPlayer)
	if (pPlayer == nil) then
		return true
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())	
	local pointsList = getQuestStatus("new_regime:pointsList")
	local list = ""
	
	if (pointsList ~= nil and pointsList ~= "") then
		list = TarkinLib:splitString(pointsList, ",")
		for i = 1, #list, 1 do
			if (list[i] == playerID) then
				return true
			end
		end
	end
	
	return false
end

function NewYearNewRegimeScreenplay:hasSquadLeader(pPlayer)
	if (pPlayer ~= nil and CreatureObject(pPlayer):isGrouped()) then
		local pGroupLeader = CreatureObject(pPlayer):getGroupLeader()
		if (CreatureObject(pGroupLeader):hasSkill("outdoors_squadleader_novice")) then
			return true
		end
	end

	return false
end

function NewYearNewRegimeScreenplay:spawnFlags()
	local flagIDList = getQuestStatus("new_regime:flagIDList")
	local list = ""
	local pFlag = ""
	setQuestStatus("new_regime:activeFlagCount", "0")
	
	if (flagIDList ~= nil and flagIDList ~= "") then
		list = TarkinLib:splitString(flagIDList, ",")
		for i = 1, #list, 1 do
			pFlag = getSceneObject(tonumber(list[i])) 
			if (pFlag ~= nil) then
				self:despawnFlag(pFlag)
			end
		end
		removeQuestStatus("new_regime:flagIDList")
	end

	removeQuestStatus("new_regime:flagList")
	
	if (self:isGcwEventEnabled() == false) then
		return
	end
	for i = 1, (numFlagsToSpawn/2), 1 do
		local location = self:chooseRandomLocation()
		for i = 1, #locations, 1 do
			if (self:isLocationTaken(location) == false) then
				break
			else
				location = self:chooseRandomLocation()
			end
		end
		pFlag = spawnSceneObject(locations[location].planet, "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_imp_standing.iff", locations[location].x, locations[location].z, locations[location].y, locations[location].cellID, math.rad(locations[location].facing))
		self:writeToFlagList(location)
		self:writeToFlagIDList(pFlag)
		
		location = self:chooseRandomLocation()
		for i = 1, #locations, 1 do
			if (self:isLocationTaken(location) == false) then
				break
			else
				location = self:chooseRandomLocation()
			end
		end
		pFlag = spawnSceneObject(locations[location].planet, "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_reb_standing.iff", locations[location].x, locations[location].z, locations[location].y, locations[location].cellID, math.rad(locations[location].facing))
		self:writeToFlagList(location)
		self:writeToFlagIDList(pFlag)
	end	

	if (not hasServerEvent("respawnFlagsEvent")) then
		local eventID = createServerEvent(timeToDespawnFlag, "NewYearNewRegimeScreenplay", "spawnFlags", "respawnFlagsEvent")
	else
		rescheduleServerEvent("respawnFlagsEvent", timeToDespawnFlag)
	end
	
	setQuestStatus("new_regime:activeFlagCount", numFlagsToSpawn)
	self:broadcastMessage("all", "GALACTIC CIVIL WAR BROADCAST: Flags have been reset throughout the galaxy!")
end

function NewYearNewRegimeScreenplay:despawnFlag(pFlag)
	if (pFlag == nil) then
		return
	end

	SceneObject(pFlag):destroyObjectFromWorld()
	SceneObject(pFlag):destroyObjectFromDatabase()
	return 1
end

function NewYearNewRegimeScreenplay:spawnSignposts()
	local signpostIDList = getQuestStatus("new_regime:signpostIDList")
	local list = ""
	local pSignpost = ""
	
	if (signpostIDList ~= nil and signpostIDList ~= "") then
		list = TarkinLib:splitString(signpostIDList, ",")
		for i = 1, #list, 1 do
			pSignpost = getSceneObject(tonumber(list[i])) 
			if (pSignpost ~= nil) then
				self:despawnSignpost(pSignpost)
			end
		end
		removeQuestStatus("new_regime:signpostIDList")
	end

	removeQuestStatus("new_regime:signpostList")	

	if (self:isGcwEventEnabled() == false) then
		return
	end
	for i = 1, (numSignpostsToSpawn/2), 1 do
		local location = self:chooseRandomLocation()
		for i = 1, #locations, 1 do
			if (self:isLocationTaken(location) == false) then
				break
			end
		end
		pSignpost = spawnSceneObject(locations[location].planet, "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp.iff", locations[location].x, locations[location].z, locations[location].y, locations[location].cellID, math.rad(locations[location].facing))
		self:writeToSignpostList(location)
		self:writeToSignpostIDList(pSignpost)
		location = self:chooseRandomLocation()
		for i = 1, #locations, 1 do
			if (self:isLocationTaken(location) == false) then
				break
			end
		end
		pSignpost = spawnSceneObject(locations[location].planet, "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb.iff", locations[location].x, locations[location].z, locations[location].y, locations[location].cellID, math.rad(locations[location].facing))
		self:writeToSignpostList(location)
		self:writeToSignpostIDList(pSignpost)
	end	
	
	if (not hasServerEvent("respawnSignpostsEvent")) then
		local eventID = createServerEvent(timeToDespawnSignpost, "NewYearNewRegimeScreenplay", "spawnSignposts", "respawnSignpostsEvent")
	else
		rescheduleServerEvent("respawnSignpostsEvent", timeToDespawnSignpost)
	end	
	
	self:broadcastMessage("all", "GALACTIC CIVIL WAR BROADCAST: Signposts have been reset throughout the galaxy!")
end

function NewYearNewRegimeScreenplay:despawnSignpost(pSignpost)
	if (pSignpost == nil) then
		return
	end

	local signpostObjectID = tostring(SceneObject(pSignpost):getObjectID())
	removeQuestStatus("new_regime:failure" .. signpostObjectID)
	SceneObject(pSignpost):destroyObjectFromWorld()
	SceneObject(pSignpost):destroyObjectFromDatabase()
	return 1
end

function NewYearNewRegimeScreenplay:captureFlag(pPlayer, pFlag)
	if (pPlayer == nil or pFlag == nil) then
		return
	end
	
	if (self:isGcwEventEnabled() == false) then
		CreatureObject(pPlayer):sendSystemMessage("The event has ended, and you may not capture this flag.")
		self:despawnFlag(pFlag)
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if (pInventory ~= nil) then
		if (SceneObject(pInventory):isContainerFullRecursive()) then
			CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full to capture this flag.  Make some room and try again.")
		else
			local itemTemplate = ""
			if(SceneObject(pFlag):getTemplateObjectPath() == "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_imp_standing.iff") then
				itemTemplate = "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_imp_deco.iff"
			elseif (SceneObject(pFlag):getTemplateObjectPath() == "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_reb_standing.iff") then
				itemTemplate = "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_reb_deco.iff"
			end
			
			self:despawnFlag(pFlag)
			local pPlayerFlag = giveItem(pInventory, itemTemplate, -1)
			local activeFlagCount = tonumber(getQuestStatus("new_regime:activeFlagCount")) - 1
			setQuestStatus("new_regime:activeFlagCount", activeFlagCount)
			CreatureObject(pPlayer):sendSystemMessage("Flag captured!  There are " .. activeFlagCount .. " flags remaining to be found throughout the galaxy.")

		end
	end
end

function NewYearNewRegimeScreenplay:checkSignpostSliceSuccess(pPlayer)
	local success = false
	local randomNum = 0

	if (CreatureObject(pPlayer):hasSkill("combat_smuggler_master")) then -- 4 in 5 chance of success
		randomNum = getRandomNumber(0,4)
		if (randomNum > 0) then
			success = true
		end
	elseif (CreatureObject(pPlayer):hasSkill("combat_smuggler_slicing_04")) then -- 3 in 4 chance of success
		randomNum = getRandomNumber(0,3)
		if (randomNum > 0) then
			success = true
		end
	elseif (CreatureObject(pPlayer):hasSkill("combat_smuggler_slicing_03")) then -- 3 in 5 chance of success
		randomNum = getRandomNumber(0,4)
		if (randomNum > 1) then
			success = true
		end
	elseif (CreatureObject(pPlayer):hasSkill("combat_smuggler_slicing_02")) then -- 1 in 2 chance of success
		randomNum = getRandomNumber(0,1)
		if (randomNum ~= 0) then
			success = true
		end
	elseif (CreatureObject(pPlayer):hasSkill("combat_smuggler_slicing_01")) then -- 2 in 5 chance of success
		randomNum = getRandomNumber(0,4)
		if (randomNum > 2) then
			success = true
		end
	elseif (CreatureObject(pPlayer):hasSkill("combat_smuggler_novice")) then -- 1 in 3 chance of success
		randomNum = getRandomNumber(0,2)
		if (randomNum > 1) then
			success = true
		end
	end

	return success
end

function NewYearNewRegimeScreenplay:flipSignpost(pPlayer, pSignpost)
	if (pPlayer == nil or pSignpost == nil) then
		return
	end
	
	if (self:isGcwEventEnabled() == false) then
		CreatureObject(pPlayer):sendSystemMessage("The event has ended, and you may not slice this signpost.")
		self:despawnSignpost(pSignpost)
		return
	end
	
	local success = self:checkSignpostSliceSuccess(pPlayer)
	
	if (success == false) then
		self:writeToFailureList(pPlayer, pSignpost)
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong!  A wire slipped, and this signpost no longer responds to your attempts to slice it.")
		return
	end
	
	local newSignpostPath = ""
	local planet = SceneObject(pSignpost):getZoneName()
	local xPos = SceneObject(pSignpost):getWorldPositionX()
	local zPos = SceneObject(pSignpost):getWorldPositionZ()
	local yPos = SceneObject(pSignpost):getWorldPositionY()
	local facing = SceneObject(pSignpost):getDirectionAngle()
	local cellID = SceneObject(pSignpost):getParentID()

	if (self:isOnRebelList(pPlayer) == true) then
		if (SceneObject(pSignpost):getTemplateObjectPath() == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp.iff") then
			newSignpostPath = "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp_defaced.iff"
		elseif (SceneObject(pSignpost):getTemplateObjectPath() == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb_defaced.iff") then
			newSignpostPath = "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb.iff"
		end
		
	elseif (self:isOnImperialList(pPlayer) == true) then
		if (SceneObject(pSignpost):getTemplateObjectPath() == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb.iff") then
			newSignpostPath = "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb_defaced.iff"
		elseif (SceneObject(pSignpost):getTemplateObjectPath() == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp_defaced.iff") then
			newSignpostPath = "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp.iff"
		end	
	end
	
	if (newSignpostPath == "") then
		return
	end

	self:despawnSignpost(pSignpost)
	local pNewSignpost = spawnSceneObject(planet, newSignpostPath, xPos, zPos, yPos, cellID, math.rad(facing))
	self:writeToSignpostIDList(pNewSignpost)

	CreatureObject(pPlayer):sendSystemMessage("Success!  Your attempts to subvert your enemy have paid off.")
	self:grantPoints(pPlayer, "flipsignpost")
end

function NewYearNewRegimeScreenplay:spawnBaseMobiles()
	if (self:isGcwEventEnabled() == false) then
		return
	end
	
	local baseFaction = getQuestStatus("new_regime:baseFaction")

	local attackers = ""
	local defenders = ""
	if (baseFaction == "rebel") then
		spawnMobile("tatooine", "fbase_rebel_army_captain_hard", 300, -4.14491, -5.21663, -11.8474, -158, 610000480)
		spawnMobile("tatooine", "fbase_rebel_army_captain_hard", 300, -6.5353, -5.21663, -11.8833, 144, 610000480)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, -21.8588, -7, -21.5693, -4, 610000484)
		spawnMobile("tatooine", "fbase_rebel_grenadier_hard", 300, -37.9065, -7, -29.0985, 139, 610000492)
		spawnMobile("tatooine", "fbase_rebel_heavy_trooper_hard", 300, -40.428, -7, -32.9279, 85, 610000492)
		spawnMobile("tatooine", "fbase_rebel_squad_leader_hard", 300, -37.9597, -7, -36.3316, 37, 610000492)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, -34.5124, -7, -33.1885, 83, 610000492)
		spawnMobile("tatooine", "fbase_rebel_rifleman_hard", 300, -9.57297, -7, -32.8656, -84, 610000487)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, 1.18732, -7, -20.6038, 144, 610000485)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 10.9496, -7, -27.6935, 7, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, -22.019, -7, 0.12801, 147, 610000482)
		spawnMobile("tatooine", "fbase_rebel_sharpshooter_hard", 300, 3.24882, -6.99669, -3.74262, -48, 610000488)
		spawnMobile("tatooine", "fbase_rebel_sharpshooter_hard", 300, 2.74526, -6.99669, 4.11187, -154, 610000488)
		spawnMobile("tatooine", "fbase_rebel_squad_leader_hard", 300, -3.28816, -6.99452, 3.67125, 128, 610000488)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, -3.14247, -6.99452, -3.8299, 38, 610000488)
		spawnMobile("tatooine", "fbase_rebel_heavy_trooper_hard", 300, 22.1671, -7, 0.155613, -57, 610000490)
		spawnMobile("tatooine", "fbase_rebel_army_captain_hard", 300, 15.8233, -7, 14.2537, 76, 610000486)
		spawnMobile("tatooine", "fbase_rebel_army_captain_hard", 300, 15.7882, -7, 17.2779, 92, 610000486)
		spawnMobile("tatooine", "fbase_rebel_sharpshooter_hard", 300, 20.3265, -7, 21.2655, 170, 610000486)
		spawnMobile("tatooine", "fbase_rebel_grenadier_hard", 300, 25.891, -7, 10.9105, -37, 610000486)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 27.1008, -7, 19.5798, -130, 610000486)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 11.2419, -7, -18.8182, 178, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 34.6389, -18, -27.5488, -4, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 34.6285, -18, -20.5, 178, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 11.5098, -31, -29.0289, -8, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 11.7898, -31, -20.2513, 178, 610000489)
		spawnMobile("tatooine", "fbase_rebel_heavy_trooper_hard", 300, -0.225603, -31, -6.50957, 179, 610000488)
		spawnMobile("tatooine", "fbase_rebel_rifleman_hard", 300, 5.80469, -31, 0.0266841, -89, 610000488)
		spawnMobile("tatooine", "fbase_rebel_sharpshooter_hard", 300, 0.940379, -31, 5.40106, -16, 610000488)
		spawnMobile("tatooine", "fbase_rebel_grenadier_hard", 300, -5.18232, -31, 0.483408, 88, 610000488)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, 11.6834, -31, 25.0546, 131, 610000500)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, 21.0574, -31, 25.624, -143, 610000500)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, 10.594, -31, 15.4618, 37, 610000500)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, 20.4796, -31, 14.8947, -35, 610000500)
		spawnMobile("tatooine", "fbase_rebel_squad_leader_hard", 300, -0.308516, -31, 41.2114, -124, 610000504)
		spawnMobile("tatooine", "fbase_rebel_heavy_trooper_hard", 300, -19.6573, -31, 39.8711, 83, 610000502)
		spawnMobile("tatooine", "fbase_rebel_rifleman_hard", 300, -15.124, -31, 45.8821, 149, 610000502)
		spawnMobile("tatooine", "fbase_rebel_sharpshooter_hard", 300, -11.7592, -31, 26.1313, -113, 610000501)
		spawnMobile("tatooine", "fbase_rebel_grenadier_hard", 300, -10.4944, -31, 15.5798, -27, 610000501)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, -21.4718, -31, 16.3034, 41, 610000501)
		spawnMobile("tatooine", "fbase_rebel_squad_leader_hard", 300, -21.3998, -31, 26.7657, 138, 610000501)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 34.221, -42.0075, -20.8553, 179, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 34.8271, -42, -28.0123, -5, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 11.4574, -55, -28.3534, -2, 610000489)
		spawnMobile("tatooine", "fbase_rebel_guardsman_hard", 300, 10.7656, -55, -18.6022, 175, 610000489)
		spawnMobile("tatooine", "fbase_rebel_rifleman_hard", 300, 2.52074, -55, -5.25457, 148, 610000488)
		spawnMobile("tatooine", "fbase_rebel_sharpshooter_hard", 300, 3.84114, -55, 3.603, 47, 610000488)
		spawnMobile("tatooine", "fbase_rebel_grenadier_hard", 300, -4.90806, -55, 3.63946, -83, 610000488)
		spawnMobile("tatooine", "fbase_rebel_squad_leader_hard", 300, -4.81899, -55, -3.22214, -117, 610000488)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, -17.5525, -55, -16.0945, -122, 610000508)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, -28.0314, -55, -16.1664, 121, 610000508)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, -22.0021, -55, -36.9794, -8, 610000508)
		spawnMobile("tatooine", "fbase_rebel_army_captain_hard", 300, 20.3841, -55, 27.2268, 169, 610000511)
		spawnMobile("tatooine", "fbase_rebel_army_captain_hard", 300, 23.6869, -55, 27.1508, 178, 610000511)
		spawnMobile("tatooine", "fbase_rebel_commando_hard", 300, 27.6923, -55, 16.1682, -37, 610000511)
		spawnMobile("tatooine", "fbase_rebel_squad_leader_hard", 300, 16.8689, -55, 16.3815, 34, 610000511)
	elseif (baseFaction == "imperial") then
		spawnMobile("tatooine", "fbase_imperial_army_captain_hard", 300, -4.14491, -5.21663, -11.8474, -158, 610000480)
		spawnMobile("tatooine", "fbase_imperial_army_captain_hard", 300, -6.5353, -5.21663, -11.8833, 144, 610000480)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, -21.8588, -7, -21.5693, -4, 610000484)
		spawnMobile("tatooine", "fbase_stormtrooper_bombardier_hard", 300, -37.9065, -7, -29.0985, 139, 610000492)
		spawnMobile("tatooine", "fbase_dark_trooper_hard", 300, -40.428, -7, -32.9279, 85, 610000492)
		spawnMobile("tatooine", "fbase_stormtrooper_squad_leader_hard", 300, -37.9597, -7, -36.3316, 37, 610000492)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, -34.5124, -7, -33.1885, 83, 610000492)
		spawnMobile("tatooine", "fbase_stormtrooper_rifleman_hard", 300, -9.57297, -7, -32.8656, -84, 610000487)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, 1.18732, -7, -20.6038, 144, 610000485)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 10.9496, -7, -27.6935, 7, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, -22.019, -7, 0.12801, 147, 610000482)
		spawnMobile("tatooine", "fbase_stormtrooper_sniper_hard", 300, 3.24882, -6.99669, -3.74262, -48, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_sniper_hard", 300, 2.74526, -6.99669, 4.11187, -154, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_squad_leader_hard", 300, -3.28816, -6.99452, 3.67125, 128, 610000488)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, -3.14247, -6.99452, -3.8299, 38, 610000488)
		spawnMobile("tatooine", "fbase_dark_trooper_hard", 300, 22.1671, -7, 0.155613, -57, 610000490)
		spawnMobile("tatooine", "fbase_imperial_army_captain_hard", 300, 15.8233, -7, 14.2537, 76, 610000486)
		spawnMobile("tatooine", "fbase_imperial_army_captain_hard", 300, 15.7882, -7, 17.2779, 92, 610000486)
		spawnMobile("tatooine", "fbase_stormtrooper_sniper_hard", 300, 20.3265, -7, 21.2655, 170, 610000486)
		spawnMobile("tatooine", "fbase_stormtrooper_bombardier_hard", 300, 25.891, -7, 10.9105, -37, 610000486)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 27.1008, -7, 19.5798, -130, 610000486)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 11.2419, -7, -18.8182, 178, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 34.6389, -18, -27.5488, -4, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 34.6285, -18, -20.5, 178, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 11.5098, -31, -29.0289, -8, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 11.7898, -31, -20.2513, 178, 610000489)
		spawnMobile("tatooine", "fbase_dark_trooper_hard", 300, -0.225603, -31, -6.50957, 179, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_rifleman_hard", 300, 5.80469, -31, 0.0266841, -89, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_sniper_hard", 300, 0.940379, -31, 5.40106, -16, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_bombardier_hard", 300, -5.18232, -31, 0.483408, 88, 610000488)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, 11.6834, -31, 25.0546, 131, 610000500)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, 21.0574, -31, 25.624, -143, 610000500)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, 10.594, -31, 15.4618, 37, 610000500)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, 20.4796, -31, 14.8947, -35, 610000500)
		spawnMobile("tatooine", "fbase_stormtrooper_squad_leader_hard", 300, -0.308516, -31, 41.2114, -124, 610000504)
		spawnMobile("tatooine", "fbase_dark_trooper_hard", 300, -19.6573, -31, 39.8711, 83, 610000502)
		spawnMobile("tatooine", "fbase_stormtrooper_rifleman_hard", 300, -15.124, -31, 45.8821, 149, 610000502)
		spawnMobile("tatooine", "fbase_stormtrooper_sniper_hard", 300, -11.7592, -31, 26.1313, -113, 610000501)
		spawnMobile("tatooine", "fbase_stormtrooper_bombardier_hard", 300, -10.4944, -31, 15.5798, -27, 610000501)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, -21.4718, -31, 16.3034, 41, 610000501)
		spawnMobile("tatooine", "fbase_stormtrooper_squad_leader_hard", 300, -21.3998, -31, 26.7657, 138, 610000501)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 34.221, -42.0075, -20.8553, 179, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 34.8271, -42, -28.0123, -5, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 11.4574, -55, -28.3534, -2, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_hard", 300, 10.7656, -55, -18.6022, 175, 610000489)
		spawnMobile("tatooine", "fbase_stormtrooper_rifleman_hard", 300, 2.52074, -55, -5.25457, 148, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_sniper_hard", 300, 3.84114, -55, 3.603, 47, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_bombardier_hard", 300, -4.90806, -55, 3.63946, -83, 610000488)
		spawnMobile("tatooine", "fbase_stormtrooper_squad_leader_hard", 300, -4.81899, -55, -3.22214, -117, 610000488)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, -17.5525, -55, -16.0945, -122, 610000508)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, -28.0314, -55, -16.1664, 121, 610000508)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, -22.0021, -55, -36.9794, -8, 610000508)
		spawnMobile("tatooine", "fbase_imperial_army_captain_hard", 300, 20.3841, -55, 27.2268, 169, 610000511)
		spawnMobile("tatooine", "fbase_imperial_army_captain_hard", 300, 23.6869, -55, 27.1508, 178, 610000511)
		spawnMobile("tatooine", "fbase_storm_commando_hard", 300, 27.6923, -55, 16.1682, -37, 610000511)
		spawnMobile("tatooine", "fbase_stormtrooper_squad_leader_hard", 300, 16.8689, -55, 16.3815, 34, 610000511)
	end
end

function NewYearNewRegimeScreenplay:spawnBaseSceneObjects()
	if (self:isGcwEventEnabled() == false) then
		return
	end

	local pBuilding = getSceneObject(buildingID)
	if (pBuilding == nil) then 
		return
	end

	local pOverrideTerminal = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/tarkin_gcw_dna_override_terminal.iff", 3.22947, -31.25, -2.1708, 610000488, -0.453475, 0.121508, -0.852862, -0.228524)
	local pFirstSampleTerminal = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/tarkin_gcw_first_dna_terminal.iff", 14.75, -7, 15.9511, 610000486, math.rad(90))
	local pSecondSampleTerminal = spawnSceneObject("tatooine", "object/tangible/tarkin_custom/decorative/tarkin_gcw_second_dna_terminal.iff", 21.9979, -55, 28.25, 610000511, math.rad(-179))
end

function NewYearNewRegimeScreenplay:despawnBaseMobiles()
	local pBuilding = getSceneObject(buildingID)
	if (pBuilding == nil) then
		return
	end

	for i = 1, 36, 1 do
		local pCell = BuildingObject(pBuilding):getCell(i)

		if (pCell ~= nil) then
			for j = 1, SceneObject(pCell):getContainerObjectsSize(), 1 do
				local pMobile = SceneObject(pCell):getContainerObject(j - 1)
				if (pMobile ~= nil) then
					if (SceneObject(pMobile):isCreatureObject() and not SceneObject(pMobile):isPlayerCreature() and not SceneObject(pMobile):isOwned()) then
						self:writeToDestroyList(pMobile)
					end
				end
			end
		end
	end

	self:destroyMobiles()
end

function NewYearNewRegimeScreenplay:destroyMobiles()
	local destroyList = getQuestStatus("new_regime:destroyList")
	local list = ""
	local pMobile = ""
	
	if (destroyList ~= nil and destroyList ~= "") then
		list = TarkinLib:splitString(destroyList, ",")
		for i = 1, #list, 1 do
			pMobile = getSceneObject(tonumber(list[i])) 
			if (pMobile ~= nil) then
				SceneObject(pMobile):destroyObjectFromWorld()
			end
		end
	end

	removeQuestStatus("new_regime:destroyList")
end

function NewYearNewRegimeScreenplay:triggerBaseCallout(pPlayer)
	if (self:isGcwEventEnabled() == false) then
		return
	end 

	if(self:isOnPointsList(pPlayer) == false) then
		self:writeToPointsList(pPlayer)
	end

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local baseFaction = getQuestStatus("new_regime:baseFaction")
	setQuestStatus("new_regime:baseFlipper", playerID)
	CreatureObject(pPlayer):sendSystemMessage("You have activated the DNA override. Return to the top level of the base and collect the first DNA sample from the terminal.  Be advised: enemy players have been notified of your presence!")

	local attackers = ""
	local defenders = ""

	if (baseFaction == "rebel") then
		attackers = "Imperials"
		defenders = "Rebels"
	elseif (baseFaction == "imperial") then
		attackers = "Rebels"
		defenders = "Imperials"
	end

	self:broadcastMessage(baseFaction, "GALACTIC CIVIL WAR BROADCAST: Attention " .. defenders .. ": the base at 1945 4135, Tatooine is under attack by " .. attackers .. "!  Please respond quickly, or you will lose the base.")
end

function NewYearNewRegimeScreenplay:cancelBaseCallout(pPlayer)
	if (self:isGcwEventEnabled() == false) then
		return
	end 

	local baseFaction = getQuestStatus("new_regime:baseFaction")
	local bioEngineerID = getQuestStatus("new_regime:baseFlipper")
	local bioEngineer = getSceneObject(tonumber(bioEngineerID)) 

	local attackers = ""
	local defenders = ""

	if (baseFaction == "rebel") then
		attackers = "Imperials"
		defenders = "Rebels"
	elseif (baseFaction == "imperial") then
		attackers = "Rebels"
		defenders = "Imperials"
	end

	removeQuestStatus("new_regime:baseFlipper")
	deleteScreenPlayData(bioEngineer, "NewYearNewRegimeScreenplay", "firstDNASample")
	deleteScreenPlayData(bioEngineer, "NewYearNewRegimeScreenplay", "secondDNASample")
	self:broadcastMessage("all", "GALACTIC CIVIL WAR BROADCAST: " .. defenders .. " are on-site, responding to the attack on their base.  A DNA override has been deactivated.")
end

function NewYearNewRegimeScreenplay:flipBase(pPlayer)

	if (self:isGcwEventEnabled() == false) then
		return
	end 
	
	self:despawnBaseMobiles()

	removeQuestStatus("new_regime:baseFlipper")
	deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample")
	deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "secondDNASample")
	
	local oldBaseFaction = getQuestStatus("new_regime:baseFaction")
	local newBaseFaction = ""
	local overtakers = ""

	if (oldBaseFaction == "rebel") then
		newBaseFaction = "imperial"
		overtakers = "Imperial"
	elseif (oldBaseFaction == "imperial") then
		newBaseFaction = "rebel"
		overtakers = "Rebel"
	end

	setQuestStatus("new_regime:baseFaction", newBaseFaction)

	self:broadcastMessage("all", "GALACTIC CIVIL WAR BROADCAST: The base at 1945 4135, Tatooine has been overtaken by " .. overtakers .. " forces!") 
	self: spawnBaseMobiles()
	
end

function NewYearNewRegimeScreenplay:determinePvPPoints(pKiller, pVictim)
	if (self:isGcwEventEnabled() == false) then
		return
	end 

	if((self:isOnRebelList(pKiller) == true and CreatureObject(pKiller):isRebel() and self:isOnImperialList(pVictim) == true and CreatureObject(pVictim):isImperial()) or (self:isOnImperialList(pKiller) == true and CreatureObject(pKiller):isImperial() and self:isOnRebelList(pVictim) == true and CreatureObject(pVictim):isRebel())) then
		self:grantPoints(pKiller, "pvp")
	end
end

function NewYearNewRegimeScreenplay:determinePvEPoints(pPlayer, faction)
	if (self:isGcwEventEnabled() == false) then
		return
	end 

	if((self:isOnRebelList(pPlayer) == true and CreatureObject(pPlayer):isRebel() and faction == "imperial") or (self:isOnImperialList(pPlayer) == true and CreatureObject(pPlayer):isImperial() and faction == "rebel")) then
		self:grantPoints(pPlayer, "pve")
	end
end

function NewYearNewRegimeScreenplay:getPlayerPoints(pPlayer)
	local points = 0
	if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints") ~= "") then
		points = tonumber(readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints"))
	end
	return points
end

function NewYearNewRegimeScreenplay:getPlayerRedeemedPoints(pPlayer)
	local points = 0
	if (readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerRedeemedPoints") ~= "") then
		points = tonumber(readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerRedeemedPoints"))
	end
	return points
end

function NewYearNewRegimeScreenplay:getImperialPoints()
	local points = 0
	local imperialPoints = getQuestStatus("new_regime:imperialPoints")
	if (imperialPoints ~= nil and imperialPoints ~= "") then
		points = tonumber(getQuestStatus("new_regime:imperialPoints"))
	end
	return points
end

function NewYearNewRegimeScreenplay:getRebelPoints()
	local points = 0
	local rebelPoints = getQuestStatus("new_regime:rebelPoints")
	if (rebelPoints ~= nil and rebelPoints ~= "") then
		points = tonumber(getQuestStatus("new_regime:rebelPoints"))
	end
	return points
end
	
function NewYearNewRegimeScreenplay:grantPoints(pPlayer, reason)
	if (pPlayer == nil or self:isGcwEventEnabled() == false) then
		return
	end 
	
	local points = 0
	local pointsAdder = 0
	local playerPoints = self:getPlayerPoints(pPlayer)
	local bonusPoints = false
	
	if (reason == "pve") then
		points = pvePointsValue
	elseif (reason == "pvp") then
		points = pvpPointsValue
	elseif (reason == "sameflag") then	
		points = captureSameFlagPointsValue
	elseif (reason == "opposingflag") then
		points = captureOpposingFlagPointsValue
	elseif (reason == "flipsignpost") then
		points = sliceSignpostPointsValue
	elseif (reason == "flipbase") then	
		points = flipBasePointsValue
	end
	
	if (points > 0) then
		if (self:hasSquadLeader(pPlayer) == true) then
			if (points * 0.1 > 10) then
				pointsAdder = points * 0.1
			else
				pointsAdder = 1
			end

			bonusPoints = true
		end
	end
	local pointsGranted = points + pointsAdder
	local totalPoints = playerPoints + pointsGranted
	
	deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints")
	writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints", totalPoints)
	CreatureObject(pPlayer):sendSystemMessage("You have earned " .. pointsGranted .. " points to use in your galactic fight!  You now have ".. totalPoints .. " points in total.")
	if (bonusPoints == true) then
		CreatureObject(pPlayer):sendSystemMessage("Your group leader is a Squad Leader, so you earned bonus points!")
	end

	if(self:isOnPointsList(pPlayer) == false) then
		self:writeToPointsList(pPlayer)
	end
end

function NewYearNewRegimeScreenplay:redeemPoints(pPlayer)
	if (pPlayer == nil or self:isGcwEventEnabled() == false) then
		return
	end 

	local playerPoints = self:getPlayerPoints(pPlayer)
	local totalFactionPoints = 0
	local redeemedPoints = self:getPlayerRedeemedPoints(pPlayer)

	if (playerPoints == 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have no points to redeem.")
		return
	end

	if (CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
		local rebelPoints = self:getRebelPoints()
		totalFactionPoints = rebelPoints + playerPoints
		setQuestStatus("new_regime:rebelPoints", totalFactionPoints)		
	elseif (CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
		local imperialPoints = self:getImperialPoints()
		totalFactionPoints = imperialPoints + playerPoints
		setQuestStatus("new_regime:imperialPoints", totalFactionPoints)
	else
		return
	end

	deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints")
	writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerPoints", "0")
	deleteScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerRedeemedPoints")
	writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "playerRedeemedPoints", playerPoints + redeemedPoints)

	playerPoints = self:getPlayerPoints(pPlayer)
	redeemedPoints = self:getPlayerRedeemedPoints(pPlayer)

	TarkinLib:writeToScoreboardList(pPlayer, "new_year_new_regime_scoreboard", redeemedPoints)
	
	CreatureObject(pPlayer):sendSystemMessage("You have turned in your points.  You now have " .. playerPoints .. " points, and your faction has " .. totalFactionPoints .. " points.  You have redeemed a total of " .. redeemedPoints .. " points for your faction.")

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	-- Earn reward for 1000 points
	if (redeemedPoints >= 1000 and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward1000") ~= "1") then
		CreatureObject(pPlayer):sendSystemMessage("You have earned a reward thanks to your generous contributions!")
		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("You do not have enough space in your inventory to claim your reward.  Make some room, and your reward will be granted the next time you redeem points.")
			return
		end
	
		if(CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
			local pReward = giveItem(pInventory, imp1000Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward1000", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		elseif(CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
			local pReward = giveItem(pInventory, reb1000Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward1000", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		end
	end

	-- Earn reward for 2500 points
	if (redeemedPoints >= 2500 and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward2500") ~= "1") then
		CreatureObject(pPlayer):sendSystemMessage("You have earned a reward thanks to your generous contributions!")
		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("You do not have enough space in your inventory to claim your reward.  Make some room, and your reward will be granted the next time you redeem points.")
			return
		end
	
		if(CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
			local pReward = giveItem(pInventory, imp2500Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward2500", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		elseif(CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
			local pReward = giveItem(pInventory, reb2500Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward2500", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		end
	end

	-- Earn reward for 5000 points
	if (redeemedPoints >= 5000 and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward5000") ~= "1") then
		CreatureObject(pPlayer):sendSystemMessage("You have earned a reward thanks to your generous contributions!")
		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("You do not have enough space in your inventory to claim your reward.  Make some room, and your reward will be granted the next time you redeem points.")
			return
		end
	
		if(CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
			local pReward = giveItem(pInventory, imp5000Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward5000", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		elseif(CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
			local pReward = giveItem(pInventory, reb5000Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward5000", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		end
	end

	-- Earn reward for 10,000 points
	if (redeemedPoints >= 10000 and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward10000") ~= "1") then
		CreatureObject(pPlayer):sendSystemMessage("You have earned a reward thanks to your generous contributions!")
		if SceneObject(pInventory):isContainerFullRecursive() then
			CreatureObject(pPlayer):sendSystemMessage("You do not have enough space in your inventory to claim your reward.  Make some room, and your reward will be granted the next time you redeem points.")
			return
		end
	
		if(CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) then
			local pReward = giveItem(pInventory, imp10000Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward10000", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		elseif(CreatureObject(pPlayer):getFaction() == FACTIONREBEL) then
			local pReward = giveItem(pInventory, reb10000Reward, -1)
			if (pReward ~= nil) then
				writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "reward10000", "1")
				CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
			end
		end
	end

end

function NewYearNewRegimeScreenplay:isEligibleToClaimRewards(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	-- Cannot claim rewards on characters created after the points-earning phase
	if (PlayerObject(pGhost):getCharacterAgeInDays() < daysPassedSinceEnd) then
		return false
	end

	-- If the account is declared for the winning faction, and the character trying to claim also belongs to that faction, they can claim rewards
	if ((self:getWinner() == "rebel" and self:isOnRebelList(pPlayer) == true and CreatureObject(pPlayer):getFaction() == FACTIONREBEL) or (self:getWinner() == "imperial" and self:isOnImperialList(pPlayer) == true and CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL)) then
		return true
	end
	
	return false
end

function NewYearNewRegimeScreenplay:claimReward(pPlayer, faction, num)
	if (pPlayer == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if SceneObject(pInventory):isContainerFullRecursive() then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is too full to claim your reward.  Make some room and try again.")
		return
	end

	if (faction == "imperial") then
		local pReward = giveItem(pInventory, impRewards[num], -1)

		if (pReward ~= nil) then
			writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed" .. tostring(num), "1")
			if(self:isOnPointsList(pPlayer) == false) then
				self:writeToPointsList(pPlayer)
			end
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	elseif (faction == "rebel") then
		local pReward = giveItem(pInventory, rebRewards[num], -1)

		if (pReward ~= nil) then
			writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "claimed" .. tostring(num), "1")
			if(self:isOnPointsList(pPlayer) == false) then
				self:writeToPointsList(pPlayer)
			end
			CreatureObject(pPlayer):sendSystemMessage("Your reward has been placed in your inventory.")
		end
	end
end

function NewYearNewRegimeScreenplay:isEligibleState(pPlayer)
	if (pPlayer == nil or CreatureObject(pPlayer):isIncapacitated() or CreatureObject(pPlayer):isDead() or CreatureObject(pPlayer):getPosture() ~= UPRIGHT or CreatureObject(pPlayer):hasState() == RIDINGMOUNT) then
		return false
	end
	return true
end

function NewYearNewRegimeScreenplay:hasFlag(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return false
	end

	local pFlag = getContainerObjectByTemplate(pInventory, "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_imp_deco.iff", true)
	if (pFlag ~= nil) then
		return true
	end

	pFlag = getContainerObjectByTemplate(pInventory, "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_reb_deco.iff", true)
	if (pFlag ~= nil) then
		return true
	end
	return false
end

function NewYearNewRegimeScreenplay:redeemFlags(pPlayer)
	if (pPlayer == nil or self:isGcwEventEnabled() == false) then
		return
	end 

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return false
	end

	local playerFaction = CreatureObject(pPlayer):getFaction()

	for i = 1, 100, 1 do
		local pFlag = getContainerObjectByTemplate(pInventory, "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_imp_deco.iff", true)
		if (pFlag ~= nil) then
			SceneObject(pFlag):destroyObjectFromWorld()
			SceneObject(pFlag):destroyObjectFromDatabase()
			if (playerFaction == FACTIONREBEL) then
				self:grantPoints(pPlayer, "opposingflag")
			elseif (playerFaction == FACTIONIMPERIAL) then
				self:grantPoints(pPlayer, "sameflag")
			end
		end

		pFlag = getContainerObjectByTemplate(pInventory, "object/tangible/tarkin_custom/decorative/tarkin_gcw_flag_reb_deco.iff", true)
		if (pFlag ~= nil) then
			SceneObject(pFlag):destroyObjectFromWorld()
			SceneObject(pFlag):destroyObjectFromDatabase()
			if (playerFaction == FACTIONIMPERIAL) then
				self:grantPoints(pPlayer, "opposingflag")
			elseif (playerFaction == FACTIONREBEL) then
				self:grantPoints(pPlayer, "sameflag")
			end
		end
	end
end

function NewYearNewRegimeScreenplay:announcePlayerPoints(pPlayer)
	local playerPoints = self:getPlayerPoints(pPlayer)
	local redeemedPoints = self:getPlayerRedeemedPoints(pPlayer)

	CreatureObject(pPlayer):sendSystemMessage("You currently have " .. playerPoints .. " points that you have not turned in.  You have redeemed a total of " .. redeemedPoints .. " points for your faction.")
end

function NewYearNewRegimeScreenplay:announceScore(pPlayer)
	local imperialPoints = self:getImperialPoints()
	local rebelPoints = self:getRebelPoints()

	local leader = ""

	if (imperialPoints > rebelPoints) then
		leader = "The Empire is in the lead!  "
	elseif (rebelPoints > imperialPoints) then
		leader = "The Rebel Alliance is in the lead!  "
	end
		
	CreatureObject(pPlayer):sendSystemMessage(leader .. "Currently, the Empire has " .. imperialPoints .. " points, and the Alliance has " .. rebelPoints .. " points.  Remember, this only reflects points that have been turned in.  Players may have accumulated points that they have not yet redeemed.")
end

function NewYearNewRegimeScreenplay:getWinner()
	local imperialPoints = self:getImperialPoints()
	local rebelPoints = self:getRebelPoints()

	if (imperialPoints > rebelPoints) then
		return "imperial"
	elseif (rebelPoints > imperialPoints) then
		return "rebel"
	elseif (imperialPoints == rebelPoints) then --in the event of a points tie, the win goes to whichever faction was holding the base when the event ended
		local winner = getQuestStatus("new_regime:baseFaction")
		return winner
	end
end

function NewYearNewRegimeScreenplay:stateWinner(pPlayer)
	local winner = self:getWinner()
	local imperialPoints = self:getImperialPoints()
	local rebelPoints = self:getRebelPoints()
		
	if (winner == "imperial") then
		CreatureObject(pPlayer):sendSystemMessage("The Empire has won!  The final score was " .. imperialPoints .. " points for the Empire, and " .. rebelPoints .. " points for the Rebellion.")
	elseif (winner == "rebel") then
		CreatureObject(pPlayer):sendSystemMessage("The Alliance has won!  The final score was " .. rebelPoints .. " points for the Alliance, and " .. imperialPoints .. " points for the Empire.")
	end

	if (imperialPoints == rebelPoints) then 
		CreatureObject(pPlayer):sendSystemMessage("Since the two sides came to a tie, the win was awarded to the faction that held the base when the event ended.")
	end	
end

function NewYearNewRegimeScreenplay:broadcastMessage(group, message) --group should be "all", "rebel", or "imperial"
	local pointsList = getQuestStatus("new_regime:pointsList")
	local rebelList = getQuestStatus("new_regime:rebelList")
	local imperialList = getQuestStatus("new_regime:imperialList")
	local list = ""
	local pPlayer = ""

	if (pointsList ~= nil and pointsList ~= "") then
		list = TarkinLib:splitString(pointsList, ",")
		for i = 1, #list, 1 do
			pPlayer = getSceneObject(tonumber(list[i])) 
			if (pPlayer ~= nil) then
				if (group == "all" or (group == "rebel" and self:isOnRebelList(pPlayer) == true) or (group == "imperial" and self:isOnImperialList(pPlayer) == true)) then
					CreatureObject(pPlayer):sendSystemMessage(message)
				end
			end
		end
	end
end

function NewYearNewRegimeScreenplay:adminReset()
	self:endNewYearEvent()
	self:cleanupNewYearEvent()
end

function NewYearNewRegimeScreenplay:isGcwEventEnabled()
	if (os.difftime(eventStartTime, os.time()) <= 0 and os.difftime(eventEndTime, os.time()) > 0) then
		return true
	else		
		return false
	end
end

function NewYearNewRegimeScreenplay:isClaimingPeriodEnabled()
	if (os.difftime(eventEndTime, os.time()) <= 0 and os.difftime(eventCleanupTime, os.time()) > 0) then
		return true
	else		
		return false
	end
end

-- Signpost Object Radial Menu Functions
GCWSignpostObjectMenuComponent = { }

function GCWSignpostObjectMenuComponent:fillObjectMenuResponse(pSignpost, pMenuResponse, pPlayer)

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if(NewYearNewRegimeScreenplay:isOnFailureList(pPlayer, pSignpost) == true) then
		CreatureObject(pPlayer):sendSystemMessage("You find this signpost unresponsive to subsequent attempts to slice it.")
		return
	end	
	
	if (CreatureObject(pPlayer):hasSkill("combat_smuggler_novice") and not (NewYearNewRegimeScreenplay:isOnFailureList(pPlayer, pSignpost) == true)) then
		local signpostPath = SceneObject(pSignpost):getTemplateObjectPath()
		if ((((signpostPath == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp.iff" or signpostPath == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb_defaced.iff") and NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) or ((signpostPath == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_reb.iff" or signpostPath == "object/tangible/tarkin_custom/decorative/tarkin_gcw_signpost_imp_defaced.iff") and NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true)) and CreatureObject(pPlayer):isOvert() and NewYearNewRegimeScreenplay:isEligibleState(pPlayer) == true) then
			menuResponse:addRadialMenuItem(115, 3, "Slice Signpost")
		end
	end
end

function GCWSignpostObjectMenuComponent:handleObjectMenuSelect(pSignpost, pPlayer, selectedID)
	if (pPlayer == nil or pSignpost == nil) then
		return 0
	end
	
	if (selectedID == 115) then 
		NewYearNewRegimeScreenplay:flipSignpost(pPlayer, pSignpost)
	end
	return 1
end

-- Flag Object Radial Menu Functions
GCWFlagObjectMenuComponent = { }

function GCWFlagObjectMenuComponent:fillObjectMenuResponse(pFlag, pMenuResponse, pPlayer)

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if ((NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true or NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) and CreatureObject(pPlayer):isOvert() and NewYearNewRegimeScreenplay:isEligibleState(pPlayer) == true) then
		menuResponse:addRadialMenuItem(115, 3, "Capture This Flag")
	end
end

function GCWFlagObjectMenuComponent:handleObjectMenuSelect(pFlag, pPlayer, selectedID)
	if (pPlayer == nil or pFlag == nil) then
		return 0
	end
	
	if (selectedID == 115) then 
		NewYearNewRegimeScreenplay:captureFlag(pPlayer, pFlag)
	end
	return 1
end

-- DNA Override Terminal Object Radial Menu Functions
GCWOverrideTerminalObjectMenuComponent = { }

function GCWOverrideTerminalObjectMenuComponent:fillObjectMenuResponse(pTerminal, pMenuResponse, pPlayer)
	if (NewYearNewRegimeScreenplay:isGcwEventEnabled() == false) then
		return
	end 

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	local baseFaction = getQuestStatus("new_regime:baseFaction")

	-- If the user is the same faction as the base
	if ((baseFaction == "rebel" and CreatureObject(pPlayer):getFaction() == FACTIONREBEL and NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) or (baseFaction == "imperial" and CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL and NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true)) then
		if (getQuestStatus("new_regime:baseFlipper") ~= nil and CreatureObject(pPlayer):isOvert()) then
			menuResponse:addRadialMenuItem(115, 3, "Deactivate DNA Override")
		end

	-- If the user is the opposite faction as the base
	elseif ((baseFaction == "imperial" and CreatureObject(pPlayer):getFaction() == FACTIONREBEL and NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) or (baseFaction == "rebel" and CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL and NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true)) then 
		if (CreatureObject(pPlayer):hasSkill("outdoors_bio_engineer_master") and CreatureObject(pPlayer):isOvert()) then
			if (getQuestStatus("new_regime:baseFlipper") == nil) then
				menuResponse:addRadialMenuItem(116, 3, "Activate DNA Override")
			elseif (getQuestStatus("new_regime:baseFlipper") == playerID and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample") == "1" and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "secondDNASample") == "1") then
				menuResponse:addRadialMenuItem(117, 3, "Overide DNA Sequence")
			end
		end
	end
end

function GCWOverrideTerminalObjectMenuComponent:handleObjectMenuSelect(pTerminal, pPlayer, selectedID)
	if (pPlayer == nil or pTerminal == nil) then
		return 0
	end
	
	if (selectedID == 115) then 
		NewYearNewRegimeScreenplay:cancelBaseCallout(pPlayer)
	elseif (selectedID == 116) then 
		NewYearNewRegimeScreenplay:triggerBaseCallout(pPlayer)
	elseif (selectedID == 117) then 
		NewYearNewRegimeScreenplay:flipBase(pPlayer)
	end
	return 1
end

-- First DNA Sample Terminal Object Radial Menu Functions
GCWFirstDNATerminalObjectMenuComponent = { }

function GCWFirstDNATerminalObjectMenuComponent:fillObjectMenuResponse(pTerminal, pMenuResponse, pPlayer)
	if (NewYearNewRegimeScreenplay:isGcwEventEnabled() == false) then
		return
	end 

	local baseFaction = getQuestStatus("new_regime:baseFaction")
	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	-- If the user is the opposite faction as the base
	if ((baseFaction == "imperial" and CreatureObject(pPlayer):getFaction() == FACTIONREBEL and NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) or (baseFaction == "rebel" and CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL and NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true)) then 

		if (CreatureObject(pPlayer):hasSkill("outdoors_bio_engineer_master") and CreatureObject(pPlayer):isOvert() and getQuestStatus("new_regime:baseFlipper") ~= nil and getQuestStatus("new_regime:baseFlipper") == playerID and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample") ~= "1") then
			menuResponse:addRadialMenuItem(115, 3, "Collect First DNA Sample")
		end
	end
end

function GCWFirstDNATerminalObjectMenuComponent:handleObjectMenuSelect(pTerminal, pPlayer, selectedID)
	if (pPlayer == nil or pTerminal == nil) then
		return 0
	end
	
	if (selectedID == 115) then 
		writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample", "1")
		CreatureObject(pPlayer):sendSystemMessage("You have collected the first DNA sample!  Next, collect the second DNA sample from the lowest level of the base.")		
	end
	return 1
end

-- Second DNA Sample Terminal Object Radial Menu Functions
GCWSecondDNATerminalObjectMenuComponent = { }

function GCWSecondDNATerminalObjectMenuComponent:fillObjectMenuResponse(pTerminal, pMenuResponse, pPlayer)
	if (NewYearNewRegimeScreenplay:isGcwEventEnabled() == false) then
		return
	end 

	local playerID = tostring(SceneObject(pPlayer):getObjectID())
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	local baseFaction = getQuestStatus("new_regime:baseFaction")

	-- If the user is the opposite faction as the base
	if ((baseFaction == "imperial" and CreatureObject(pPlayer):getFaction() == FACTIONREBEL and NewYearNewRegimeScreenplay:isOnRebelList(pPlayer) == true) or (baseFaction == "rebel" and CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL and NewYearNewRegimeScreenplay:isOnImperialList(pPlayer) == true)) then 
		if (CreatureObject(pPlayer):hasSkill("outdoors_bio_engineer_master") and CreatureObject(pPlayer):isOvert() and getQuestStatus("new_regime:baseFlipper") ~= nil and getQuestStatus("new_regime:baseFlipper") == playerID and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "firstDNASample") == "1" and readScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "secondDNASample") ~= "1") then
			menuResponse:addRadialMenuItem(115, 3, "Collect Second DNA Sample")
		end
	end
end

function GCWSecondDNATerminalObjectMenuComponent:handleObjectMenuSelect(pTerminal, pPlayer, selectedID)
	if (pPlayer == nil or pTerminal == nil) then
		return 0
	end
	
	if (selectedID == 115) then 
		writeScreenPlayData(pPlayer, "NewYearNewRegimeScreenplay", "secondDNASample", "1")
		CreatureObject(pPlayer):sendSystemMessage("You have collected the second DNA sample!  Return to the override terminal to complete the DNA override sequence for this base.")		
	end
	return 1
end

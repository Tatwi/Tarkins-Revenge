--////////////////////////////////////////////////////////////////////
--//   			      Rasps of Death	                    //
--//   			    a Tarkin screenplay	  		    //
--////////////////////////////////////////////////////////////////////
--// Sources inside of the Imperial Customs and Border Control 	    //
--// Bureau are reporting that multiple batches what were to be     //
--// Boutique Pets for the wealthy and influental in have 	    //
--// broken containment from various industrial Bio-Engineering     //
--// labs. We've gathered that these batches were the result of     //
--// an innocent mistake by an intern at a lab located in 	    //
--// Coronet. Reportedly these were mixed with an extremely 	    //
--// aggressive strain of Rancor DNA, representatives from the 	    //
--// lab deny these claims and further offer their condolences 	    //
--// for those that may have been affected by this tragic accident. //
--////////////////////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

RaspsOfDeathScreenPlay = ScreenPlay:new {

	numberOfActs = 1,

	--Config Values
	raspsToSpawn = 100, --Number of mobiles this screenplay will spawn 
	numReferencePoints = 3, --Number of locations declared in SpawnPointsTable
	secondsToDespawn = 7200, --Number of seconds before a mobile will despawn if it has not been killed (2h = 7,200s)
	secondsToRespawn = 180, --Number of seconds before a mobile will respawn after it has been killed (3m = 180s)
	numMobs = 1, --Number of mobile templates to choose from, as declared below
	
	SpawnPointsTable = {
		--Corellia
		{planetName = "corellia", xRef = -224, yRef = -4558, maxRadius = 650}, --Coronet
		--Naboo
		{planetName = "naboo", xRef = -5168, yRef = 4224, maxRadius = 1200}, --Theed
		--Tatooine
		{planetName = "tatooine", xRef = 1347, yRef = 3135, maxRadius = 750}, --Mos Entha
	},
	
	mobileTemplates =  {"rasp_of_death"},
	
	screenplayName = "RaspsOfDeathScreenPlay",
	
}

registerScreenPlay("RaspsOfDeathScreenPlay", true)

function RaspsOfDeathScreenPlay:start()
	if (isZoneEnabled("corellia") and isZoneEnabled("naboo") and isZoneEnabled("tatooine")) then
		self:spawnMobiles()
	end
end

function RaspsOfDeathScreenPlay:spawnMobiles()
	local spawns = 1 --Number of mobile spawns created
	local bosses = 1 --Number of boss spawns created
	local pMobile

	while (spawns < self.raspsToSpawn + 1) do
		self:respawnMobile(pMobile)		
		spawns = spawns + 1
	end

	while (bosses <= self.numReferencePoints) do
		self:respawnBoss(pMobile, self.SpawnPointsTable[bosses].planetName)
		bosses = bosses + 1
	end
end

function RaspsOfDeathScreenPlay:respawnMobile(pOldMobile)

	local mobileTemplate = self.mobileTemplates[getRandomNumber(1, self.numMobs)]
	local referencePoint = getRandomNumber(1, self.numReferencePoints)
	local zone = self.SpawnPointsTable[referencePoint].planetName

	if (not isZoneEnabled(zone)) then --If the zone is not enabled, send error message
		printLuaError("Unable to spawn mobile.  Necessary zones were not enabled.")	
	end

	local xRef = self.SpawnPointsTable[referencePoint].xRef
	local yRef = self.SpawnPointsTable[referencePoint].yRef
	local maxRadius = self.SpawnPointsTable[referencePoint].maxRadius
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
		writeData(SceneObject(pMobile):getObjectID() .. ":mobileZone", zone)
		createEvent(10, "RaspsOfDeathScreenPlay", "setupMobile", pMobile, "")
	end
end

function RaspsOfDeathScreenPlay:respawnBoss(pOldMobile, pZone)

	local mobileTemplate = "titanic_rasp_of_death"
	local referencePoint = ""
	local zone = pZone

	if zone == "corellia" then
		referencePoint = 1
	elseif zone == "naboo" then
		referencePoint = 2
	else
		referencePoint = 3
	end

	if (not isZoneEnabled(zone)) then --If the zone is not enabled, send error message
		printLuaError("Unable to spawn mobile.  Necessary zones were not enabled.")	
	end

	local xRef = self.SpawnPointsTable[referencePoint].xRef
	local yRef = self.SpawnPointsTable[referencePoint].yRef
	local maxRadius = self.SpawnPointsTable[referencePoint].maxRadius + 1500
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
		writeData(SceneObject(pMobile):getObjectID() .. ":mobileZone", zone)
		createEvent(10, "RaspsOfDeathScreenPlay", "setupMobile", pMobile, "")
	end
	--print("Boss spawned at " .. spawnPoint[1] .. ", " .. spawnPoint[3] .. ", " .. zone) -- debug message, comment out
end

function RaspsOfDeathScreenPlay:setupMobile(pMobile)
	createObserver(OBJECTDESTRUCTION, "RaspsOfDeathScreenPlay", "notifyMobileDead", pMobile)
	createEvent(self.secondsToDespawn * 1000, "RaspsOfDeathScreenPlay", "despawnMobile", pMobile, "")
end

function RaspsOfDeathScreenPlay:setupMobile(pMobile)
	createObserver(OBJECTDESTRUCTION, "RaspsOfDeathScreenPlay", "notifyMobileDead", pMobile)
	createEvent(self.secondsToDespawn * 1000, "RaspsOfDeathScreenPlay", "despawnMobile", pMobile, "")
end

function RaspsOfDeathScreenPlay:notifyMobileDead(pMobile, pKiller)
	if (pMobile == nil) then
		return 1
	end

	if (pKiller == nil) then
		return 1
	end


	--If the event days are over, don't respawn any more rasps
	if (getFormattedTime():find("Thu Aug 15") == nil) and
	   (getFormattedTime():find("Fri Aug 16") == nil) and
           (getFormattedTime():find("Sat Aug 17") == nil) and
	   (getFormattedTime():find("Sun Aug 18") == nil) and
	   (getFormattedTime():find("Mon Aug 19") == nil) then 
		return 1
	end


	local objName = SceneObject(pMobile):getCustomObjectName()
	local objID = SceneObject(pMobile):getObjectID()
	local mobileZone = readData(objID .. ":mobileZone")
	deleteData(objID .. ":mobileZone")	

	if (objName == "a mutant rasp") then
		createEvent(self.secondsToRespawn * 1000, "RaspsOfDeathScreenPlay", "respawnMobile", pMobile, "") --Respawn regulars 3 minutes after death
	
	elseif (objName == "a titanic mutant rasp") then
		createEvent(self.secondsToDespawn * 1000, "RaspsOfDeathScreenPlay", "respawnBoss", pMobile, mobileZone) --Respawn bosses 2 hours after death
	end

	return 1
end

function RaspsOfDeathScreenPlay:despawnMobile(pMobile)
	if (pMobile == nil or CreatureObject(pMobile):isDead()) then
		return
	end

	if (CreatureObject(pMobile):isInCombat()) then --If mobile is in combat at the scheduled despawn time, don't actually complete the despawn.  Instead, set a new despawn timer.
		createEvent(self.secondsToDespawn * 1000, "RaspsOfDeathScreenPlay", "despawnMobile", pMobile, "")
		return		
	end

	SceneObject(pMobile):destroyObjectFromWorld()
	createEvent(2 * 1000, "RaspsOfDeathScreenPlay", "respawnMobile", pNewMobile, "")
	return 1
end

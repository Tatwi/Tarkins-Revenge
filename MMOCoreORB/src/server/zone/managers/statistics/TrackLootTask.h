/*
 * TrackLootTask.h
 *
 *  Created on: 07/03/2019
 *      Author: Tatwi
 * 
 * Sadly, I had to shelve this tracker, because the loot boxes around the world would crash the server, 
 * for reasons unkown. Too bad, because it worked great for NPCs!
 * Leaving this file the repo for reference.
 */

#ifndef TRACKLOOTTASK_H_
#define TRACKLOOTTASK_H_

#include "server/zone/managers/statistics/StatisticsManager.h"

class TrackLootTask : public Task {
	ManagedReference<TangibleObject*> lootItem;
	String orgData;

public:
	TrackLootTask(TangibleObject* loot, String orginData) {
		lootItem = loot;
		orgData = orginData;
	}

	void run() {
		// If loot no longer exists, abandon tracking
		if (lootItem == nullptr)
			return;
			
		ManagedReference<SceneObject*> container = lootItem->getParent().get();
		
		// If loot doesn't have parent, recheck later
		if (container == nullptr) {
			lootItem->removePendingTask("track");
			Reference<Task*> newTask = new TrackLootTask(lootItem, orgData);
			lootItem->addPendingTask("track", newTask, 500);
			
			Logger::console.info("TrackLootTask: loot doesn't have parent, recheck later");
			
			return;
		}
		
		// Gather loot origin data once
		if (orgData.length() < 2){
			StringBuffer info;
			
			ManagedReference<CreatureObject*> npc = container->getParent().get().castTo<CreatureObject*>();
			ManagedReference<SceneObject*> myParent = container->getParent().get();	
			
			// Is loot on a corpse or in a container
			if (npc != nullptr){
				info << npc->getDisplayedName() << "," << int(npc->getWorldPositionX()) << " " << int(npc->getWorldPositionY()) << " " << npc->getZone()->getZoneName();
			} else {
				info << container->getDisplayedName() << "," << int(myParent->getWorldPositionX()) << " " << int(myParent->getWorldPositionY()) << " " << myParent->getZone()->getZoneName();
			}
			
			if (orgData == "1"){
				orgData = "Exceptional,"; // Passed in as 1
			} else {
				orgData = "Legendary,"; // Passed in as 2
			}
								
			orgData += info.toString();
			
			Logger::console.info("TrackLootTask: loot information gathered for object " + String::valueOf(lootItem->getObjectID()) + " " + orgData + " generated into container " + String::valueOf(container->getObjectID()));
		}
		
		ManagedReference<CreatureObject*> player = lootItem->getParentRecursively(SceneObjectType::PLAYERCREATURE).castTo<CreatureObject*>();
		
		// If loot is still on corpse or in loot container, recheck later 
		if (player == nullptr){
			Logger::console.info("TrackLootTask: loot object " + String::valueOf(lootItem->getObjectID()) + " has not yet been looted. Rescheduling...");
			
			lootItem->removePendingTask("track");
			Reference<Task*> newTask = new TrackLootTask(lootItem, orgData);
			lootItem->addPendingTask("track", newTask, 1000);
			
			return;
		}
		
		// Player is no longer null, loot must be in player inventory, so gather player data
		Reference<PlayerObject*> ghost = player->getPlayerObject();
		ManagedReference<Account*> account = ghost->getAccount();
		
		Time now;
		String timestamp = now.getFormattedTime();	
		String accID = String::valueOf(account->getAccountID());
		String accName = account->getUsername();
		String charName = player->getFirstName();		
		
		
		// Comnbine original object data with current owner's data
		String pathAndFile = "log/lumberjack/rareloot.log";
		String content = timestamp + "," + accID + "," + accName + "," + charName + "," + orgData;
		
		// Write data to file
		File* file = new File(pathAndFile);
		FileWriter* writer = new FileWriter(file, true); // true for appending new lines

		writer->writeLine(content);

		writer->close();
		delete file;
		delete writer;
	}
};

#endif /* TRACKLOOTTASK_H_ */

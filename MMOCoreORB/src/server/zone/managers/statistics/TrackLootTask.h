/*
 * TrackLootTask.h
 *
 *  Created on: 07/03/2019
 *      Author: Tatwi
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
			
		ManagedReference<SceneObject*> myParent = lootItem->getParent().get();
		
		// If loot doesn't have parent, recheck later
		if (myParent == nullptr) {
			Reference<Task*> newTask = new TrackLootTask(lootItem, orgData);
			newTask->schedule(500);
			
			return;
		}
		
		// Gather loot origin data once
		if (orgData.length() < 2){
			StringBuffer pos;	
			
			// Is loot on a corpse or in a container
			if (myParent->isAiAgent()){
				ManagedReference<CreatureObject*> npc = lootItem->getParentRecursively(SceneObjectType::CREATURE).castTo<CreatureObject*>();
				
				if (npc != nullptr)
					pos << int(npc->getWorldPositionX()) << " " << int(npc->getWorldPositionY()) << " " << npc->getZone()->getZoneName();
				else
					pos << "?? ?? " << myParent->getZone()->getZoneName();
				
			} else {
				pos << int(myParent->getWorldPositionX()) << " " << int(myParent->getWorldPositionY()) << " " << myParent->getZone()->getZoneName();
			}
			
			if (orgData == "1"){
				orgData = "Exceptional,"; // Passed in as 1
			} else {
				orgData = "Legendary,"; // Passed in as 2
			}
								
			orgData += myParent->getDisplayedName() + "," + pos.toString();
		}
		
		ManagedReference<CreatureObject*> player = lootItem->getParentRecursively(SceneObjectType::PLAYERCREATURE).castTo<CreatureObject*>();

		// If loot is still on corpse or in loot container, recheck later 
		if (player == nullptr){
			Reference<Task*> newTask = new TrackLootTask(lootItem, orgData);
			newTask->schedule(1000);
			
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

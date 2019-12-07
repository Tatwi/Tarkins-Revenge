/*
 * SeaRecyclerMenuComponent.cpp
 *
 *       Tarkin's Revenge
 *        November 2019
 */
#include "SeaRecyclerMenuComponent.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/loot/LootManager.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"

void SeaRecyclerMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (sceneObject == NULL || !sceneObject->isTangibleObject() || player == NULL)
		return;
	
	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
	menuResponse->addRadialMenuItem(115, 3, "Recycle Attachments");
}

int SeaRecyclerMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isTangibleObject())
		return 0;

	if (!player->isPlayerCreature())
		return 0;	

	if (selectedID == 115) {	
		ManagedReference<LootManager*> lootManager = sceneObject->getZone()->getZoneServer()->getLootManager();

		if (lootManager == NULL) {
			player->sendSystemMessage("Error: LootManager is NULL. Contact an Admin for help.");
			return 0;
		}

		if (!sceneObject->isASubChildOf(player)) {
			player->sendSystemMessage("Error: Recycler must be in your inventory to use.");
			return 0;
		}	

		if (!sceneObject->isContainerObject())
			return 0;
			
		SceneObject* inventory = player->getSlottedObject("inventory");

		if (inventory == NULL)
			return 0;

		if (inventory->isContainerFullRecursive()){
			player->sendSystemMessage("Error: Not enough room in your inventory to recycle attachments.");
			return 0;
		}

		int containerSize = sceneObject->getContainerObjectsSize();
		if (containerSize > 5){  // Recycler should only hold five items
			player->sendSystemMessage("Error: Too many items in recycler.");
			return 0;
		}			

		int ingredients = 0;

		for (int i = 0; i < sceneObject->getContainerObjectsSize(); i++) {

			SceneObject* ingredient = sceneObject->getContainerObject(i);
			uint32 crc = ingredient->getServerObjectCRC();
			uint32 armor_attachment = 0xEEAE1366; // object/tangible/gem/armor.iff
			uint32 clothing_attachment = 0x8E492B0; // object/tangible/gem/clothing.iff

			if (crc == armor_attachment || crc == clothing_attachment) 
				ingredients++;
		}

		if (ingredients > 5) {
			player->sendSystemMessage("Error: Too many attachments in the recycler.");
			return 0;
		} else if (ingredients < 5) {
			player->sendSystemMessage("Error: Not enough attachments in the recycler.  You need 5 total clothing or armor attachments.");
			return 0;
		}
		
		// Deny player access to the container
		ContainerPermissions* itemPerms = sceneObject->getContainerPermissions();
		itemPerms->setInheritPermissionsFromParent(false);
		itemPerms->clearDefaultAllowPermission(ContainerPermissions::OPEN);
		itemPerms->clearDefaultAllowPermission(ContainerPermissions::MOVECONTAINER);
		itemPerms->setDefaultDenyPermission(ContainerPermissions::OPEN);
		itemPerms->setDefaultDenyPermission(ContainerPermissions::MOVECONTAINER);
		
		// Delete contents of SEA Recycler
		while (sceneObject->getContainerObjectsSize() > 0) {
			ManagedReference<SceneObject*> ingredient = sceneObject->getContainerObject(0);
			Locker locker(ingredient);
			ingredient->destroyObjectFromWorld(true);
			ingredient->destroyObjectFromDatabase(true);
		}

		// Create a random attachment
		int randomLevel = System::random(99);
		int randomRoll = System::random(1);
		int level = 0;
		String attachment = "";
		
		if (randomLevel >= 0 && randomLevel < 66)
			level = 150;
		else if (randomLevel >= 66 && randomLevel < 88)
			level = 175;
		else
			level = 250;
			
		if (randomRoll == 0)
			attachment = "armor_attachments";
		else
			attachment = "clothing_attachments";

		lootManager->createLoot(inventory, attachment, level);

		// Send player a message, letting them know that it's done.
		player->sendSystemMessage("Your attachments have been recycled into one new attachment.");

		// Reinstate player permissions to the container
		itemPerms->setInheritPermissionsFromParent(true);
		itemPerms->clearDefaultDenyPermission(ContainerPermissions::OPEN);
		itemPerms->clearDefaultDenyPermission(ContainerPermissions::MOVECONTAINER);
		itemPerms->setDefaultAllowPermission(ContainerPermissions::OPEN);
		itemPerms->setDefaultAllowPermission(ContainerPermissions::MOVECONTAINER);
	}
	return 1;
}

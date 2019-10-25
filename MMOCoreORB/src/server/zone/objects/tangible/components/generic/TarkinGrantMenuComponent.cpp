/*
 *   TarkinGrantMenuComponent.cpp
 *
 *         Tarkin's Revenge
 *           October 2019
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "TarkinGrantMenuComponent.h"
#include "server/zone/objects/draftschematic/DraftSchematic.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/objects/player/sui/callbacks/TarkinGrantSuiCallback.h"

#include "templates/tangible/TarkinGrantTemplate.h"
#include "server/zone/managers/crafting/schematicmap/SchematicMap.h"

void TarkinGrantMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (!sceneObject->isTangibleObject())
		return;

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	TarkinGrantTemplate* templateData = cast<TarkinGrantTemplate*>(sceneObject->getObjectTemplate());

	if (templateData == NULL) {
		error("No TarkinGrantTemplate for: " + String::valueOf(sceneObject->getServerObjectCRC()));
		return;
	}

	menuResponse->addRadialMenuItem(50, 3, "Grant");
}

int TarkinGrantMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isTangibleObject())
		return 0;

	if (!player->isPlayerCreature())
		return 0;

	if(selectedID == 50) {
		if (!sceneObject->isASubChildOf(player)) {
			player->sendSystemMessage("@loot_schematic:must_be_holding"); // You must be holding that in order to use it.
			return 0;
		}

		Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();

		if (ghost == NULL)
			return 0;

		TarkinGrantTemplate* templateData = cast<TarkinGrantTemplate*>(sceneObject->getObjectTemplate());

		if (templateData == NULL) {
			error("No TarkinGrantTemplate for: " + String::valueOf(sceneObject->getServerObjectCRC()));
			return 0;
		}

		StringIdManager* stringIdManager = StringIdManager::instance();

		String skillNeeded = templateData->getRequiredSkill();

		if((!skillNeeded.isEmpty() && !player->hasSkill(skillNeeded))) {
			UnicodeString skill = stringIdManager->getStringId("@skl_n:" + skillNeeded);
			StringIdChatParameter stringID("item/xp_purchase", "msg_no_min_skill"); // You must have %TO skill in order to understand this.
			stringID.setTO(skill);
			player->sendSystemMessage(stringID);
			return 0;
		}

		String speciesNeeded = templateData->getRequiredSpecies();
		
		if(!speciesNeeded.isEmpty() && player->getSpecies() != (Integer::valueOf(speciesNeeded))) {
			UnicodeString species = stringIdManager->getStringId("@player_species:species_" + speciesNeeded);
			StringIdChatParameter speciesStringID("item/xp_purchase", "msg_no_species"); // You do not meet the species requirements to learn from this item. You must be of the %RT species.
			speciesStringID.setTO(species);
			player->sendSystemMessage(speciesStringID);
			return 0;
		}		
		
		String genderNeeded = templateData->getRequiredGender();
		
		if(!genderNeeded.isEmpty() && player->getGender() != (Integer::valueOf(genderNeeded))) {
			if (genderNeeded == "0") {
				player->sendSystemMessage("You do not meet the gender requirements to learn from this item. You must be of the Male gender.");
			} else if (genderNeeded == "1") {
				player->sendSystemMessage("You do not meet the gender requirements to learn from this item. You must be of the Female gender.");
			}
			return 0;
		}		

		String grantType = templateData->getGrantType();
		String grantName = templateData->getGrantName();

		if (grantType == "ability" && ghost->hasAbility(grantName)) {
			player->sendSystemMessage("@item/xp_purchase:msg_already_have_command");
			return 0;
		} else if (grantType == "schematic") {
			DraftSchematic* schematic = SchematicMap::instance()->get(grantName.hashCode());

			if (ghost->hasSchematic(schematic)) {
				player->sendSystemMessage("@item/xp_purchase:msg_already_have_schematic");
				return 0;
			}
		} else if (grantType == "badge" &&  ghost->hasBadge(Integer::valueOf(grantName))) {
				player->sendSystemMessage("You already have this badge.");
				return 0;
		} else if (grantType == "title" &&  player->hasSkill(grantName)) {
				player->sendSystemMessage("You already have this title.");
				return 0;
		}


		ManagedReference<SuiMessageBox*> suiMessageBox = new SuiMessageBox(player, SuiWindowType::TUNE_CRYSTAL);

		suiMessageBox->setPromptTitle("Grant");
		suiMessageBox->setPromptText("Confirm that you really want to use this object to grant the item listed to yourself.");
		suiMessageBox->setCancelButton(true, "Cancel");
		suiMessageBox->setUsingObject(sceneObject);
		suiMessageBox->setCallback(new TarkinGrantSuiCallback(player->getZoneServer()));

		ghost->addSuiBox(suiMessageBox);
		player->sendMessage(suiMessageBox->generateMessage());

		return 0;
	}

	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}

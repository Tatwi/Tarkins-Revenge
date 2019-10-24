/*
 *   TarkinGrantSuiCallback.h
 *
 *       Tarkin's Revenge
 *         October 2019
 */


#ifndef TARKINGRANTSUICALLBACK_H
#define TARKINGRANTSUICALLBACK_H

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "templates/tangible/TarkinGrantTemplate.h"
#include "server/zone/managers/stringid/StringIdManager.h"
#include "server/zone/managers/crafting/schematicmap/SchematicMap.h"

class TarkinGrantSuiCallback : public SuiCallback {
public:
	TarkinGrantSuiCallback(ZoneServer* server)
		: SuiCallback(server) {
	}


	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!suiBox->isMessageBox() || player == NULL || cancelPressed)
			return;

		if(player->isDead() || player->isIncapacitated())
			return;

		Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();

		if (ghost == NULL)
			return;

		ManagedReference<SceneObject*> obj = suiBox->getUsingObject().get();

		if(obj == NULL)
			return;

		TarkinGrantTemplate* templateData = cast<TarkinGrantTemplate*>(obj->getObjectTemplate());

		if (templateData == NULL) {
			player->error("No TarkinGrantTemplate for: " + String::valueOf(obj->getServerObjectCRC()));
			return;
		}

		StringIdManager* stringIdManager = StringIdManager::instance();

		String skillNeeded = templateData->getRequiredSkill();

		if((!skillNeeded.isEmpty() && !player->hasSkill(skillNeeded))) {
			UnicodeString skill = stringIdManager->getStringId("@skl_n:" + skillNeeded);
			StringIdChatParameter stringID("item/xp_purchase", "msg_no_min_skill"); // You must have %TO skill in order to understand this.
			stringID.setTO(skill);
			player->sendSystemMessage(stringID);
			return;
		}
		
		String speciesNeeded = templateData->getRequiredSpecies();
		
		if(!speciesNeeded.isEmpty() && player->getSpecies() != (Integer::valueOf(speciesNeeded))) {
			UnicodeString species = stringIdManager->getStringId("@player_species:species_" + speciesNeeded);
			StringIdChatParameter speciesStringID("item/xp_purchase", "msg_no_species"); // You do not meet the species requirements to learn from this item. You must be of the %RT species.
			speciesStringID.setTO(species);
			player->sendSystemMessage(speciesStringID);
			return;
		}		
		
		String genderNeeded = templateData->getRequiredGender();
		
		if(!genderNeeded.isEmpty() && player->getGender() != (Integer::valueOf(genderNeeded))) {
			if (genderNeeded == "0") {
				player->sendSystemMessage("You do not meet the gender requirements to learn from this item. You must be of the Male gender.");
			} else if (genderNeeded == "1") {
				player->sendSystemMessage("You do not meet the gender requirements to learn from this item. You must be of the Female gender.");
			}
			return;
		}	

		String grantType = templateData->getGrantType();
		String grantName = templateData->getGrantName();

		if (grantType == "ability" && ghost->hasAbility(grantName)) {
			player->sendSystemMessage("@item/xp_purchase:msg_already_have_command");
			return;
		} else if (grantType == "schematic") {
			DraftSchematic* schematic = SchematicMap::instance()->get(grantName.hashCode());

			if (ghost->hasSchematic(schematic)) {
				player->sendSystemMessage("@item/xp_purchase:msg_already_have_schematic");
				return;
			}
		}
		
		if (grantType == "ability") {
			SkillManager* skillManager = SkillManager::instance();
			Ability* grantAbility = skillManager->getAbility(grantName);

			if (grantAbility == NULL) {
				player->error("Unable to learn ability: " + grantName);
				return;
			}

			ghost->addAbility(grantAbility, true);
			player->sendSystemMessage("@item/xp_purchase:msg_learned_command");

			if (!templateData->isNoRemove()) {
				obj->destroyObjectFromWorld(true);
				obj->destroyObjectFromDatabase();
			}
		} else if (grantType == "schematic") {
			ManagedReference<DraftSchematic* > schematic = SchematicMap::instance()->get(grantName.hashCode());

			if (schematic == NULL) {
				player->error("Unable to learn schematic: " + grantName);
				return;
			}

			if(ghost->addRewardedSchematic(schematic, SchematicList::QUEST, -1, true)) {
				player->sendSystemMessage("@item/xp_purchase:msg_learned_schematic");

				if (!templateData->isNoRemove()) {
					obj->destroyObjectFromWorld(true);
					obj->destroyObjectFromDatabase();
				}
			}
		} else if (grantType == "badge") {
			int badgeID = Integer::valueOf(grantName);
				
			Locker cLocker(player);
			server->getPlayerManager()->awardBadge(player->getPlayerObject(), badgeID);
			player->sendSystemMessage("You have earned a new badge!");

			String objPath = obj->getObjectTemplate()->getFullTemplateString();	
				
			if (!templateData->isNoRemove()) {
				obj->destroyObjectFromWorld(true);
				obj->destroyObjectFromDatabase();
			}

			// Give the player the no-use version of the badge as decoration
			String newObjPath = objPath.replaceFirst(".iff", "_inert.iff");

			Reference<SceneObject*> inertBadge = server->createObject(newObjPath.hashCode(), 1);
			SceneObject* inventory = player->getSlottedObject("inventory");

			if (inventory->transferObject(inertBadge, -1, true)) {
				inertBadge->sendTo(player, inertBadge);
			} else {
				inertBadge->destroyObjectFromWorld(true);
				inertBadge->destroyObjectFromDatabase();
			}
		} else if (grantType == "title") {
			SkillManager* skillManager = server->getSkillManager();		
			Skill* targetSkill = SkillManager::instance()->getSkill(grantName);		
			
			if(targetSkill == nullptr || !targetSkill->isTitle()) {
				player->sendSystemMessage("This title is invalid, please check with an admin.");					
				return;
			}

			skillManager->awardSkill(grantName, player, true, true, true);					
			player->sendSystemMessage("You have been granted a new title!  You may choose it from the list in your character sheet if you wish to display it.");
				
			if (!templateData->isNoRemove()) {
				obj->destroyObjectFromWorld(true);
				obj->destroyObjectFromDatabase();
			}
		}		
	}
};

#endif /* TARKINGRANTSUICALLBACK_H */

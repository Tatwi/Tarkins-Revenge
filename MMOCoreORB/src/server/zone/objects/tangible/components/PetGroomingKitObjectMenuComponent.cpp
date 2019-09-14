/*
 * PetGroomingKitObjectMenuComponent.h
 *
 *         Tarkin's Revenge
 *           August 2019
 */

#include "PetGroomingKitObjectMenuComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/ZoneServer.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/callbacks/PetGroomingSuiCallback.h"

void PetGroomingKitObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if(!sceneObject->isTangibleObject())
		return;

	TangibleObject* tano = cast<TangibleObject*>(sceneObject);
	if(tano == NULL)
		return;

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
}

int PetGroomingKitObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {

	if (player == NULL)
		return 0;

	if (!sceneObject->isASubChildOf(player))
		return 0;

	if (selectedID != 20)
		return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);

	if(!sceneObject->isTangibleObject())
		return 0;

	ManagedReference<TangibleObject*> kitTano = cast<TangibleObject*>(sceneObject);
	if(kitTano == NULL)
		return 0;

	uint64 targetID = player->getTargetID();
	ZoneServer* server = player->getZoneServer();
	if (server == NULL)
		return 0;

	ManagedReference<TangibleObject*> target = server->getObject(targetID, true).castTo<TangibleObject*>();
	if (target == NULL || !target->isCreatureObject() || !target->isPet()) {
		player->sendSystemMessage("You can only use a pet grooming kit on a pet!");
		return 0;
	}

	//permission check
	CreatureObject* pet = cast<CreatureObject*>(target.get());
	uint64 ownerID = pet->getCreatureLinkID();
	if ( ownerID != player->getObjectID()){
		bool hasConsent = false;

		ManagedReference<CreatureObject*> targetOwner = server->getObject(ownerID, true).castTo<CreatureObject*>();
		if (targetOwner != NULL)
		{
			Locker crossLock(targetOwner, player);
			ManagedReference<PlayerObject*> ghostOwner = targetOwner->getPlayerObject();
			for (int i = 0; i < ghostOwner->getConsentListSize(); ++i) {
				String entryName = ghostOwner->getConsentName(i);
				if (!entryName.isEmpty()){
					if (entryName == player->getFirstName().toLowerCase()){
						hasConsent = true;
					}
				}
			}
		}
		if (!hasConsent){
			player->sendSystemMessage("You require consent to groom another player's pet.");
			return 0;
		}
	}
	//end permission check

	Locker clocker(pet, player);

	String appearanceFilename = target->getObjectTemplate()->getAppearanceFilename();
	VectorMap<String, Reference<CustomizationVariable*> > variables;
	AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);
	int numPalette = 0;
	for(int i = 0; i< variables.size(); ++i)
	{
		String varkey = variables.elementAt(i).getKey();
		if (varkey.contains("color"))
		{
			++numPalette;
		}
	}

	if (numPalette == 0) {
		player->sendSystemMessage("This pet is not suitable to be groomed.");
		return 0;
	}

	ManagedReference<SuiListBox*> colorBox = new SuiListBox(player, SuiWindowType::CUSTOMIZE_KIT);
	colorBox->setUsingObject(player);
	colorBox->setCallback(new PetGroomingSuiCallback(server, numPalette, kitTano ));
	colorBox->setUsingObject(target);
	colorBox->setPromptTitle("Groom Pet");
	colorBox->setPromptText("Please select the customization action you would like to take");

	colorBox->addMenuItem("Dye Color 1");
	if (numPalette > 1 ) {
		colorBox->addMenuItem("Dye Color 2");
	}
	if (numPalette > 2 ) {
		colorBox->addMenuItem("Dye Color 3");
	}

	colorBox->setCancelButton(true, "");
	colorBox->setOkButton(true, "@ok");

	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
	ghost->addSuiBox(colorBox);
	player->sendMessage(colorBox->generateMessage());

	return 0;
}

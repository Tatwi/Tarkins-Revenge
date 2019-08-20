#ifndef INSTALLBILLBOARDCOMMAND_H_
#define INSTALLBILLBOARDCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/Zone.h"

class InstallBillboardCommand : public QueueCommand {
public:

	InstallBillboardCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		PlayerObject* ghost = creature->getPlayerObject();
		if (ghost == NULL)
			return GENERALERROR;

		if (!ghost->hasAbility("installmissionterminal"))
			return GENERALERROR;

		ManagedReference<CityRegion*> city = creature->getCityRegion().get();
		CityManager* cityManager = creature->getZoneServer()->getCityManager();

		if (city == NULL || cityManager == NULL)
			return GENERALERROR;

		if (!city->isMayor(creature->getObjectID()))
			return GENERALERROR;

		if (creature->getParent() != NULL)
			return GENERALERROR;

		if (!cityManager->canSupportMoreBillboards(city)) {
			creature->sendSystemMessage("@city/city:no_more_billboard"); // Your city can't support any more billboards at its current rank!
			return GENERALERROR;
		}

		Zone* zone = creature->getZone();

		if (zone == NULL)
			return GENERALERROR;

		if (!ghost->hasAbility("installmissionterminal"))
			return GENERALERROR;

		String billboardTemplatePath = "object/tangible/tarkin_custom/decorative/billboard_rotating.iff";

		if (billboardTemplatePath != "") {
			Locker clocker(city, creature);

			if(city->getCityTreasury() < 1000){
				StringIdChatParameter msg;
				msg.setStringId("@city/city:action_no_money");
				msg.setDI(1000);
				creature->sendSystemMessage(msg); //"The city treasury must have %DI credits in order to perform that action.");
				return GENERALERROR;
			}

			StructureObject* cityHall = city->getCityHall();
			if (cityHall == NULL)
				return GENERALERROR;

			ManagedReference<SceneObject*> sceneObject = ObjectManager::instance()->createObject(billboardTemplatePath.hashCode(), 1, "sceneobjects");

			city->addBillboard(sceneObject);
			city->subtractFromCityTreasury(1000);

			clocker.release();

			Locker locker(sceneObject);

			sceneObject->initializePosition(creature->getWorldPositionX(), creature->getWorldPositionZ(),creature->getWorldPositionY());
			sceneObject->rotate(creature->getDirectionAngle());

			Locker clocker2(cityHall, creature);

			cityHall->addChildObject(sceneObject);
			sceneObject->initializeChildObject(cityHall);

			zone->transferObject(sceneObject, -1, true);
		}


		return SUCCESS;
	}

};

#endif //INSTALLMISSIONTERMINALCOMMAND_H_

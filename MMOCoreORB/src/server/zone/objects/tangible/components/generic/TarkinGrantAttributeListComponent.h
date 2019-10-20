#ifndef TARKINGRANTATTRIBUTELISTCOMPONENT_H_
/*
 *   TarkinGrantAttributeListComponent.h
 *
 *            Tarkin's Revenge
 *              October 2019
 */


#define TARKINGRANTATTRIBUTELISTCOMPONENT_H_

#include "templates/tangible/TarkinGrantTemplate.h"
#include "server/zone/managers/stringid/StringIdManager.h"

class TarkinGrantAttributeListComponent: public AttributeListComponent {
public:

	void fillAttributeList(AttributeListMessage* alm, CreatureObject* creature, SceneObject* object) const {

		TarkinGrantTemplate* templateData = cast<TarkinGrantTemplate*> (object->getObjectTemplate());
		if (templateData == NULL) {
			return;
		}

		StringIdManager* stringIdManager = StringIdManager::instance();

		String skillNeeded = templateData->getRequiredSkill();

		if (skillNeeded != "") {
			skillNeeded = "@skl_n:" + skillNeeded;
			UnicodeString skill = stringIdManager->getStringId(skillNeeded.hashCode());
			alm->insertAttribute("skill_required", skillNeeded);
		}

	}

};

#endif /* TARKINGRANTATTRIBUTELISTCOMPONENT_H_ */

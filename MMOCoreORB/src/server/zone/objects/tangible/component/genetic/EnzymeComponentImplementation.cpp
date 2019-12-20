/* Tarkin's Revenge
 * May 2017 
 */

#include "server/zone/objects/tangible/component/genetic/EnzymeComponent.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/managers/stringid/StringIdManager.h"

void EnzymeComponentImplementation::initializeTransientMembers() {
	ComponentImplementation::initializeTransientMembers();
}

void EnzymeComponentImplementation::updateEnzyme(int value){
	byte type = 0x02;
	setCustomizationVariable(type, value, true);
}

void EnzymeComponentImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	int colorMax = values->getMaxValue("enzyme_color");
	int color = values->getCurrentValue("enzyme_color");
	int purity = values->getCurrentValue("enzyme_purity");
	int mutagen = values->getCurrentValue("enzyme_mutagen");
	int typeMax = values->getMaxValue("enzyme_type");
	int baseline = values->getCurrentValue("enzyme_baseline");


	if (colorMax != 31) {
		int finalColor = Math::min(color, 9);
		setColor(finalColor);
		updateEnzyme(finalColor);
		if(typeMax == 1) {
			setType(1);
		} else if(typeMax == 2) {
			setType(2);
			int finalBaseline = Math::min(baseline, 27); 
			setBaseline(finalBaseline);
		} else if(typeMax == 3) {
			setType(3);
		} else if(typeMax == 4) {
			setType(4);
		}		
	} else {
		setColor(31);
		int finalPurity = Math::min(purity, 20); 
		int finalMutagen = Math::min(mutagen, 20); 
		setPurity(finalPurity);
		setMutagen(finalMutagen);
		updateEnzyme(31);
	}

	ComponentImplementation::updateCraftingValues(values, firstUpdate);
}

void EnzymeComponentImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(alm, object);
		if (getColor() != 31) {
			if (getType() != 4) {
				StringBuffer str3;
				str3 << "@obj_attr_n:enzyme_color_" << getColor();
				alm->insertAttribute("enzyme_color", str3);
				if (getType() == 2){
					alm->insertAttribute("enzyme_baseline", baseline);
				}
			}
		} else {
			alm->insertAttribute("enzyme_purity", purity);
			alm->insertAttribute("mutagen_potential", mutagen);
		}
}

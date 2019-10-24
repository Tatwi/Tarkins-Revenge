/*
 *   TarkinGrantTemplate.h
 *
 *     Tarkin's Revenge
 *       October 2019
 */


#ifndef TARKINGRANTTEMPLATE_H
#define TARKINGRANTTEMPLATE_H

#include "templates/SharedTangibleObjectTemplate.h"

class TarkinGrantTemplate: public SharedTangibleObjectTemplate {
protected:

	String requiredSkill;
	String requiredSpecies;
	String requiredGender;
	String grantType, grantName;
	bool noRemove;


public:
	TarkinGrantTemplate() {
		requiredSkill = "";
		requiredSpecies = "";
		requiredGender = "";
		grantType = "";
		grantName = "";
		noRemove = false;

	}

	~TarkinGrantTemplate() {

	}

	void readObject(LuaObject* templateData) {
		SharedTangibleObjectTemplate::readObject(templateData);

		requiredSkill = templateData->getStringField("requiredSkill");
		requiredSpecies = templateData->getStringField("requiredSpecies");
		requiredGender = templateData->getStringField("requiredGender");	
		grantType = templateData->getStringField("grantType");
		grantName = templateData->getStringField("grantName");
		noRemove = templateData->getBooleanField("noRemove");

	}

	const String& getRequiredSkill() {
		return requiredSkill;
	}

	const String& getRequiredSpecies() {
		return requiredSpecies;
	}

	const String& getRequiredGender() {
		return requiredGender;
	}

	const String& getGrantType() {
		return grantType;
	}

	const String& getGrantName() {
		return grantName;
	}

	bool isNoRemove() {
		return noRemove;
	}

};


#endif /* TARKINGRANTTEMPLATE_H */

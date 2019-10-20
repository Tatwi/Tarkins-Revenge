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
	String grantType, grantName;
	bool noRemove;


public:
	TarkinGrantTemplate() {
		requiredSkill = "";
		grantType = "";
		grantName = "";
		noRemove = false;

	}

	~TarkinGrantTemplate() {

	}

	void readObject(LuaObject* templateData) {
		SharedTangibleObjectTemplate::readObject(templateData);

		requiredSkill = templateData->getStringField("requiredSkill");
		grantType = templateData->getStringField("grantType");
		grantName = templateData->getStringField("grantName");
		noRemove = templateData->getBooleanField("noRemove");

	}

	const String& getRequiredSkill() {
		return requiredSkill;
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

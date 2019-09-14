/*
 * PetGroomingKitTemplate.h
 *
 *    Tarkin's Revenge
 *      August 2019
 */

#ifndef PETGROOMINGKITTEMPLATE_H_
#define PETGROOMINGKITTEMPLATE_H_

#include "templates/SharedTangibleObjectTemplate.h"

class PetGroomingKitTemplate : public SharedTangibleObjectTemplate {

public:
	PetGroomingKitTemplate() {

	}

	~PetGroomingKitTemplate() {

	}

	void readObject(LuaObject* templateData) {
		SharedTangibleObjectTemplate::readObject(templateData);

    }

	bool isPetGroomingKitTemplate() {
		return true;
	}

};

#endif /* PETGROOMINGKITTEMPLATE_H_ */

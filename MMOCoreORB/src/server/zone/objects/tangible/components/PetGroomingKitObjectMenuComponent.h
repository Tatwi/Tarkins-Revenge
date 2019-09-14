/*
 * PetGroomingKitObjectMenuComponent.h
 *
 *         Tarkin's Revenge
 *           August 2019
 */

#ifndef PETGROOMINGKITOBJECTMENUCOMPONENT_H_
#define PETGROOMINGKITOBJECTMENUCOMPONENT_H_
 
#include "TangibleObjectMenuComponent.h"

class PetGroomingKitObjectMenuComponent : public TangibleObjectMenuComponent {
public:

	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;
	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;

};

#endif /* PETGROOMINGKITOBJECTMENUCOMPONENT_H_ */


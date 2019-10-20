/*
 *   TarkinGrantMenuComponent.h
 *
 *        Tarkin's Revenge
 *          October 2019
 */


#ifndef TARKINGRANTMENUCOMPONENT_H_
#define TARKINGRANTMENUCOMPONENT_H_

#include "server/zone/objects/tangible/components/TangibleObjectMenuComponent.h"

class TarkinGrantMenuComponent : public TangibleObjectMenuComponent {
public:

	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;
	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;

};


#endif /* TARKINGRANTMENUCOMPONENT_H_ */
#ifndef SEARECYCLERMENUCOMPONENT_H_
#define SEARECYCLERMENUCOMPONENT_H_

#include "TangibleObjectMenuComponent.h"

class SeaRecyclerMenuComponent : public TangibleObjectMenuComponent {
public:
	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;

	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;

};


#endif /* SEARECYCLERMENUCOMPONENT_H_ */

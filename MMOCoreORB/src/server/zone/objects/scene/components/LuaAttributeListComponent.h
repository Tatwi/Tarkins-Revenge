/*
 * LuaAttributeListComponent.h
 *
 *  Created on: Feb 13 2019
 *      Author: Phoenix
 */

#ifndef LUAATTRIBUTELISTCOMPONENT_H_
#define LUAATTRIBUTELISTCOMPONENT_H_

#include "AttributeListComponent.h"

namespace server {
 namespace zone {
  namespace objects {
   namespace scene {
    class SceneObject;
   }

   namespace creature {
    class CreatureObject;
   }
  }

  namespace packets {
   namespace scene {
    class AttributeListMessage;
   }
  }

  class Zone;
 }
}

using namespace server::zone::objects::scene;
using namespace server::zone::objects::creature;
using namespace server::zone::packets::scene;


class LuaAttributeListComponent : public AttributeListComponent {
    String luaClassName;

public:
    LuaAttributeListComponent(const String& className);
    ~LuaAttributeListComponent();

    virtual void fillAttributeList(AttributeListMessage* alm, CreatureObject* creature, SceneObject* object) const;

};

#endif /* LUAATTRIBUTELISTCOMPONENT_H_ */
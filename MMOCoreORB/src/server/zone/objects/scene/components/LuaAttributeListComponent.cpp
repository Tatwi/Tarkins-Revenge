/*
 * LuaAttributeListComponent.cpp
 *
 *  Created on: Feb 13 2019
 *      Author: Phoenix
 */

#include "LuaAttributeListComponent.h"

#include "server/zone/managers/director/DirectorManager.h"
#include "server/zone/packets/scene/AttributeListMessage.h"

LuaAttributeListComponent::LuaAttributeListComponent(const String& className) : luaClassName(className) {
}

LuaAttributeListComponent::~LuaAttributeListComponent(){
}

void LuaAttributeListComponent::fillAttributeList(AttributeListMessage* alm, CreatureObject* creature, SceneObject* object) const {
    if (object == NULL || creature == NULL)
        return;

    Lua* lua = DirectorManager::instance()->getLuaInstance();

    LuaFunction runMethod(lua->getLuaState(), luaClassName, "fillAttributeList", 0);
    runMethod << alm;
    runMethod << creature;
    runMethod << object;

    runMethod.callFunction();
}
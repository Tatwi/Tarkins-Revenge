/*
 * LuaAttributeListMessage.h
 *
 *  Created on: Feb 13 2019
 *      Author: Phoenix
 */

#ifndef LUAATTRIBUTELISTMESSAGE_H_
#define LUAATTRIBUTELISTMESSAGE_H_

#include "engine/engine.h"
#include "server/zone/packets/scene/AttributeListMessage.h"

namespace server {
namespace zone {
namespace packets {
namespace scene {

    class AttributeListMessage;

    class LuaAttributeListMessage {
    public:
        // Constants
        static const char className[];
        static Luna<LuaAttributeListMessage>::RegType Register[];

        // Initialize the pointer
        LuaAttributeListMessage(lua_State *L);
        ~LuaAttributeListMessage();

        int _setObject(lua_State* L);
        int insertNewAttribute(lua_State* L);

    private:
        // The pointer to the 'real object' defined in object.cc
        AttributeListMessage* realObject;
    };

}
}
}
}

#endif /* LUAATTRIBUTELISTMESSAGE_H_ */
/*
 * LuaAttributeListMessage.cpp
 *
 *  Created on: Feb 13 2019
 *      Author: Phoenix
 */

#include "LuaAttributeListMessage.h"
#include "server/zone/packets/scene/AttributeListMessage.h"

const char LuaAttributeListMessage::className[] = "LuaAttributeListMessage";

Luna<LuaAttributeListMessage>::RegType LuaAttributeListMessage::Register[] = {
        { "_setObject", &LuaAttributeListMessage::_setObject },
        { "insertNewAttribute", &LuaAttributeListMessage::insertNewAttribute },
        { 0, 0 }
};

LuaAttributeListMessage::LuaAttributeListMessage(lua_State *L) {
    realObject = (AttributeListMessage*)lua_touserdata(L, 1);
}

LuaAttributeListMessage::~LuaAttributeListMessage(){
}

int LuaAttributeListMessage::_setObject(lua_State* L) {
    realObject = (AttributeListMessage*)lua_touserdata(L, -1);

    return 0;
}

int LuaAttributeListMessage::insertNewAttribute(lua_State* L)
{
    String value = lua_tostring(L, -2);
    const String attribute = lua_tostring(L, -1);

    realObject->insertAttribute(attribute, value);

    return 0;
}
/*
 *   WearCostumeCommand.h
 *
 *     Tarkin's Revenge
 *       October 2019
 */

#ifndef WEARCOSTUMECOMMAND_H_
#define WEARCOSTUMECOMMAND_H_

#include "server/zone/ZoneProcessServer.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/skill/SkillManager.h"

class WearCostumeCommand: public QueueCommand {
public:

	WearCostumeCommand(const String& name, ZoneProcessServer* server) :
		QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<CreatureObject*> targetCreature = NULL;

		Reference<PlayerObject*> ghost = creature->getSlottedObject("ghost").castTo<PlayerObject*> ();		

		String args = arguments.toString();

		// Do some wangjangling to make sure when players try to put on costumes in the vicinity of other players wearing costumes, it recognized the arguments used
		if (!args.contains("player ") && args != "remove")
			args = "player+" + args;

		String argos = args;	

		if (args.contains(" "))	
			argos = args.replaceFirst(" ", "+");

		String fullString = String("wearCostume") + "+" + argos;

		// Using the command "/wearCostume remove" should remove the costume
		if (args == "remove") {
			creature->setAlternateAppearance("", true);
			Zone* zone = creature->getZone();

			if (zone != NULL) {
				creature->switchZone(zone->getZoneName(), creature->getPositionX(), creature->getPositionZ(), creature->getPositionY(), creature->getParentID());
			}
			
			return SUCCESS;
		}

		// If the player uses a string after "wearCostume" that does not correspond to a costume they have learned, or "remove", send them an error message
		if (!ghost->hasAbility(fullString)) {
			creature->sendSystemMessage("You do not have that costume in your collection.");
			return GENERALERROR;
		}
		
		String templateString = "";
		String templateName = "";	

		// Otherwise, look up the mobile template associated with the ability they used from a Lua table, and apply the appearance to the player
		Lua* lua = new Lua();
		lua->init();

		lua->runFile("scripts/screenplays/tools/tarkin_costume_table.lua");

		LuaObject table = lua->getGlobalObject("costumes");

		if (argos == "player+undead" || args ==  "undead") {
			argos = "undead" + getSpeciesGenderString(creature);
		}
		
		if (table.isValidTable() && table.getTableSize() > 0) {		
			for (int i = 1; i <= table.getTableSize(); ++i) {				
				if ((table.getStringAt(i)) == argos) {
					templateString = ((table.getStringAt(i+1)));
				}	
			}
		}
		delete lua;
		
		if (templateString == "") {
			return GENERALERROR;
		} else if (templateString != "" && (templateString.indexOf(".iff") == -1 || templateString.indexOf("object/mobile/shared_") == -1)) {
			return GENERALERROR;
		} else if (templateString != "") {
			TemplateManager* templateManager = TemplateManager::instance();
			String templateTest = templateString.replaceFirst("shared_", "");
			SharedObjectTemplate* templateData = templateManager->getTemplate(templateTest.hashCode());
			if (templateData == NULL) {
				return GENERALERROR;
			}
			templateName = templateString;
		}

		Locker cLocker(creature);

		creature->setAlternateAppearance(templateName, true);

		// Rezone players using a species costume, to force their hair, clothes, and equipped items to appear
		if (templateName.contains("species_")){
			Zone* zone = creature->getZone();

			if (zone != NULL) {
				creature->switchZone(zone->getZoneName(), creature->getPositionX(), creature->getPositionZ(), creature->getPositionY(), creature->getParentID());
			}
		}
		
		return SUCCESS;
	}

	String getSpeciesGenderString(CreatureObject* creature) const {
		StringBuffer result;
		int gender = creature->getGender();
		String genderString = "";
		String speciesString = creature->getSpeciesName();
		
		if (gender == 0)
			genderString = "m";
		else if (gender == 1)
			genderString = "f";

		result << speciesString << genderString;
		return result.toString();
	}
};

#endif //WEARCOSTUMECOMMAND_H_

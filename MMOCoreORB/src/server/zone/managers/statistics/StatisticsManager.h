/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef STATISTICSMANAGER_H_
#define STATISTICSMANAGER_H_

#include "server/zone/objects/mission/MissionTypes.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/login/account/Account.h"
#include "server/zone/ZoneClientSession.h"

class StatisticsManager : public Singleton<StatisticsManager>, public Logger, public Object {
	AtomicLong numberOfCompletedMissionsBounty;
	AtomicLong numberOfCompletedMissionsCrafting;
	AtomicLong numberOfCompletedMissionsDancer;
	AtomicLong numberOfCompletedMissionsDeliver;
	AtomicLong numberOfCompletedMissionsDestroy;
	AtomicLong numberOfCompletedMissionsHunting;
	AtomicLong numberOfCompletedMissionsMusician;
	AtomicLong numberOfCompletedMissionsRecon;
	AtomicLong numberOfCompletedMissionsSurvey;
	AtomicLong creditsGeneratedFromMissionsBounty;
	AtomicLong creditsGeneratedFromMissionsCrafting;
	AtomicLong creditsGeneratedFromMissionsDancer;
	AtomicLong creditsGeneratedFromMissionsDeliver;
	AtomicLong creditsGeneratedFromMissionsDestroy;
	AtomicLong creditsGeneratedFromMissionsHunting;
	AtomicLong creditsGeneratedFromMissionsMusician;
	AtomicLong creditsGeneratedFromMissionsRecon;
	AtomicLong creditsGeneratedFromMissionsSurvey;

public:
	StatisticsManager() : Logger("Statistics Manager") {
		reset();
	}

	void completeMission(unsigned int missionType, int reward) {
		switch (missionType) {
		case MissionTypes::BOUNTY:
			numberOfCompletedMissionsBounty.increment();
			creditsGeneratedFromMissionsBounty.add(reward);
			break;
		case MissionTypes::CRAFTING:
			numberOfCompletedMissionsCrafting.increment();
			creditsGeneratedFromMissionsCrafting.add(reward);
			break;
		case MissionTypes::DANCER:
			numberOfCompletedMissionsDancer.increment();
			creditsGeneratedFromMissionsDancer.add(reward);
			break;
		case MissionTypes::DELIVER:
			numberOfCompletedMissionsDeliver.increment();
			creditsGeneratedFromMissionsDeliver.add(reward);
			break;
		case MissionTypes::DESTROY:
			numberOfCompletedMissionsDestroy.increment();
			creditsGeneratedFromMissionsDestroy.add(reward);
			break;
		case MissionTypes::HUNTING:
			numberOfCompletedMissionsHunting.increment();
			creditsGeneratedFromMissionsHunting.add(reward);
			break;
		case MissionTypes::MUSICIAN:
			numberOfCompletedMissionsMusician.increment();
			creditsGeneratedFromMissionsMusician.add(reward);
			break;
		case MissionTypes::RECON:
			numberOfCompletedMissionsRecon.increment();
			creditsGeneratedFromMissionsRecon.add(reward);
			break;
		case MissionTypes::SURVEY:
			numberOfCompletedMissionsSurvey.increment();
			creditsGeneratedFromMissionsSurvey.add(reward);
			break;
		}
	}

	String getStatistics() {
		StringBuffer stats;
		stats << "Server Statistics" << endl;
		stats << "=================" << endl << endl;

		getMissionStatistics(stats);

		return stats.toString();
	}

	void reset() {
		resetMissionStatistics();
	}
	
	/**
	 * Logs player activity
	 * @param sender Creature object of character who sent credits or bought an item. Also used for the character that was deleted when logged deleted character.
	 * @param receiver Creature object of character that received the credits.
	 * @param value The amount of credits that were exchanged.
	 * @param name Name of the item bought from the vendor/bazaar and future misc string usage.
	 * @param transactionType The use case for this function. Transaction Types: character deleted 0, tip 1, bank tip 2, bazaar sale 3, vendor sale 4.
	 */
	void lumberjack(CreatureObject* sender, CreatureObject* receiver, int value, String name, int transactionType){
		// Bools for use until server config options are made
		bool LumberjackBazaar = true;
		bool LumberjackVendor = true;
		
		if (transactionType == 3 && !LumberjackBazaar)
			return;
			
		if (transactionType == 4 && !LumberjackVendor)
			return;
		
		if (sender == NULL || receiver == NULL){
			Logger::console.error("Lumberjack: Requires CreatureObject sender, CreatureObject receiver, int, string, int. When there isn't a reciever, such as logging deleted characters, use sender for both.");
			return;
		}
		
		Reference<PlayerObject*> senderGhost = sender->getPlayerObject();
		ManagedReference<Account*> senderAccount = senderGhost->getAccount();	
		Reference<PlayerObject*> receiverGhost = receiver->getPlayerObject();
		ManagedReference<Account*> receiverAccount = receiverGhost->getAccount();
		
		// Gather data
		Time now;
		String timestamp = now.getFormattedTime();

		// Sender
		String sAccID = String::valueOf(senderAccount->getStationID());
		String sAccName = senderAccount->getUsername();
		Time sCreatedTime(senderAccount->getTimeCreated());
		String sAccBorn = sCreatedTime.getFormattedTime();
		
		StringBuffer query;
		query << "SELECT ip_address, MIN(timestamp) FROM account_log WHERE account_id = '" << senderAccount->getAccountID() << "';";
		ResultSet* result = ServerDatabase::instance()->executeQuery(query);

		String sIP = "0.0.0.0:0";
		
		if (result->next())
			sIP = result->getString(0);
		
		String sCharName = sender->getFirstName();
		String sCharAge = String::valueOf(senderGhost->getCharacterAgeInDays());
		
		// Reciever
		String rAccID = "";
		String rAccName = "";
		String rAccBorn = "";
		String rIP = "0.0.0.0:0";
		String rCharName = "";
		String rCharAge = "";
		
		// Don't pull data that won't be used
		if (sender != receiver){
			rAccID = String::valueOf(receiverAccount->getStationID());
			rAccName = receiverAccount->getUsername();		
			Time rCreatedTime(receiverAccount->getTimeCreated());		
			rAccBorn = rCreatedTime.getFormattedTime();		
			StringBuffer query2;
			query2 << "SELECT ip_address, MIN(timestamp) FROM account_log WHERE account_id = '" << receiverAccount->getAccountID() << "';";
			result = ServerDatabase::instance()->executeQuery(query2);
			
			if (result->next())
				rIP = result->getString(0);

			rCharName = receiver->getFirstName();		
			rCharAge = String::valueOf(receiverGhost->getCharacterAgeInDays());
		}
		
		// Bools for use until server config options are made
		bool LumberjackTXT = true;
		bool LumberjackSQL = false;
		
		// Log to file
		if (LumberjackTXT){			
			String outputText = "";	
			String fileName = "tips";

			if (transactionType == 1){
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + ",";
			} else if (transactionType == 2) {
				fileName = "banktips";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + ",";
			} else if  (transactionType == 3){
				fileName = "bazaarsales";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + name+ "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + ",";
			} else if  (transactionType == 4){
				fileName = "vendorsales";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + name+ "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + ",";
			}  else if  (transactionType == 0){
				fileName = "deletedcharacters";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + ",";
			}
			
			File* file = new File("log/lumberjack/" + fileName + ".log");
			FileWriter* writer = new FileWriter(file, true); // true for appending new lines

			writer->writeLine(outputText);

			writer->close();
			delete file;
			delete writer;
		}
		
		// Log to SQL
		if (LumberjackSQL){
			// This functionality will be created at a later date. It will push data to separate DB that is dedicated to logging player activity.
		}
	}

private:
	void getMissionStatistics(StringBuffer& stats) {
		stats << "Number of completed missions" << endl;
		stats << "----------------------------" << endl;
		stats << "Bounty hunter: " << numberOfCompletedMissionsBounty << endl;
		stats << "Crafting: " << numberOfCompletedMissionsCrafting << endl;
		stats << "Dancing: " << numberOfCompletedMissionsDancer << endl;
		stats << "Deliver: " << numberOfCompletedMissionsDeliver << endl;
		stats << "Destroy: " << numberOfCompletedMissionsDestroy << endl;
		stats << "Hunting: " << numberOfCompletedMissionsHunting << endl;
		stats << "Musician: " << numberOfCompletedMissionsMusician << endl;
		stats << "Reconnaissance: " << numberOfCompletedMissionsRecon << endl;
		stats << "Survey: " << numberOfCompletedMissionsSurvey << endl;
		stats << "Total: " << getTotalNumberOfCompletedMissions() << endl << endl;
		stats << "Credit rewards" << endl;
		stats << "--------------" << endl;
		stats << "Bounty hunter: " << creditsGeneratedFromMissionsBounty << endl;
		stats << "Crafting: " << creditsGeneratedFromMissionsCrafting << endl;
		stats << "Dancing: " << creditsGeneratedFromMissionsDancer << endl;
		stats << "Deliver: " << creditsGeneratedFromMissionsDeliver << endl;
		stats << "Destroy: " << creditsGeneratedFromMissionsDestroy << endl;
		stats << "Hunting: " << creditsGeneratedFromMissionsHunting << endl;
		stats << "Musician: " << creditsGeneratedFromMissionsMusician << endl;
		stats << "Reconnaissance: " << creditsGeneratedFromMissionsRecon << endl;
		stats << "Survey: " << creditsGeneratedFromMissionsSurvey << endl;
		stats << "Total: " << getTotalCreditsFromCompletedMissions() << endl << endl;
	}

	long getTotalNumberOfCompletedMissions() {
		return numberOfCompletedMissionsBounty + numberOfCompletedMissionsCrafting + numberOfCompletedMissionsDancer +
				numberOfCompletedMissionsDeliver + numberOfCompletedMissionsDestroy + numberOfCompletedMissionsHunting +
				numberOfCompletedMissionsMusician + numberOfCompletedMissionsRecon + numberOfCompletedMissionsSurvey;
	}

	long getTotalCreditsFromCompletedMissions() {
		return creditsGeneratedFromMissionsBounty + creditsGeneratedFromMissionsCrafting + creditsGeneratedFromMissionsDancer +
				creditsGeneratedFromMissionsDeliver + creditsGeneratedFromMissionsDestroy + creditsGeneratedFromMissionsHunting +
				creditsGeneratedFromMissionsMusician + creditsGeneratedFromMissionsRecon + creditsGeneratedFromMissionsSurvey;
	}

	void resetMissionStatistics() {
		numberOfCompletedMissionsBounty = 0;
		numberOfCompletedMissionsCrafting = 0;
		numberOfCompletedMissionsDancer = 0;
		numberOfCompletedMissionsDeliver = 0;
		numberOfCompletedMissionsDestroy = 0;
		numberOfCompletedMissionsHunting = 0;
		numberOfCompletedMissionsMusician = 0;
		numberOfCompletedMissionsRecon = 0;
		numberOfCompletedMissionsSurvey = 0;
		creditsGeneratedFromMissionsBounty = 0;
		creditsGeneratedFromMissionsCrafting = 0;
		creditsGeneratedFromMissionsDancer = 0;
		creditsGeneratedFromMissionsDeliver = 0;
		creditsGeneratedFromMissionsDestroy = 0;
		creditsGeneratedFromMissionsHunting = 0;
		creditsGeneratedFromMissionsMusician = 0;
		creditsGeneratedFromMissionsRecon = 0;
		creditsGeneratedFromMissionsSurvey = 0;
	}
};

#endif /* STATISTICSMANAGER_H_ */

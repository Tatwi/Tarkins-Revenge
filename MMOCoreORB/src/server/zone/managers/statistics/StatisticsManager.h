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
#include "server/ServerCore.h"
#include "server/zone/objects/tangible/components/vendor/VendorDataComponent.h"


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
	 * Returns the most recently used ip address on an account (or 0.0.0.0 if a result was not found)
	 * @param account Account object obtained from PlayerObject->getAccount()
	 */
	String getLastIP(Account* account){
		String ip = "0.0.0.0";
		
		StringBuffer query;
		query << "SELECT ip_address, MIN(timestamp) FROM account_log WHERE account_id = '" << account->getAccountID() << "';";
		ResultSet* result = ServerDatabase::instance()->executeQuery(query);
		
		if (result->next())
			ip = result->getString(0);
		
		return ip;
	}
	
	/**
	 * Writes and additional line to a file on the server
	 * @param pathAndFile String The path to the file as well as the file name, such as log/mylog.log
	 * @param content String The content to be written
	 */
	void logToFile(String pathAndFile, String content){
		File* file = new File(pathAndFile);
		FileWriter* writer = new FileWriter(file, true); // true for appending new lines

		writer->writeLine(content);

		writer->close();
		delete file;
		delete writer;
	}
	
	/**
	 * Logs player credit transactions
	 * @param sender Creature object of character who sent credits or bought an item. Also used for the character that was deleted when logged deleted character.
	 * @param receiver Creature object of character that received the credits.
	 * @param vendor Scene object of vendor or bazaar terminal that made the sale. Use nullptr in cases where vendor is not applicable.
	 * @param value The amount of credits that were exchanged.
	 * @param name Name of the item bought from the vendor/bazaar.
	 * @param transactionType The use case for this function. Transaction Types: tip 1, bank tip 2, bazaar sale 3, vendor sale 4.
	 */
	void lumberjack(CreatureObject* sender, CreatureObject* receiver, SceneObject* vendor, int value, String name, int transactionType){
		// Get server config
		int logTips = ConfigManager::instance()->getLumberjackTips();
		int logBazaar = ConfigManager::instance()->getLumberjackBazaar();
		int logVendor = ConfigManager::instance()->getLumberjackVendor();
		int logToTXT = ConfigManager::instance()->getLumberjackTXT();
		int logToSQL = ConfigManager::instance()->getLumberjackSQL();
		
		if ((transactionType == 1 || transactionType == 2) && !logTips && value < logTips){
			Logger::console.info("Lumberjack: Tip logging is off.", true);
			return;
		}
		
		if (transactionType == 3 && !logBazaar && value < logBazaar){
			Logger::console.info("Lumberjack: Bazaar logging is off.", true);
			return;
		}
			
		if (transactionType == 4 && !logVendor && value < logVendor){
			Logger::console.info("Lumberjack: Vendor logging is off.", true);
			return;
		}
		
		if (sender == nullptr || receiver == nullptr){
			Logger::console.error("Lumberjack: CreatureObject for sender or receiver not found.");
			return;
		}
		
		if (transactionType > 2 && vendor == nullptr){
			Logger::console.error("Lumberjack: SceneObject for vendor or terminal not found.");
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
		String sAccID = String::valueOf(senderAccount->getAccountID());
		String sAccName = senderAccount->getUsername();
		Time sCreatedTime(senderAccount->getTimeCreated());
		String sAccBorn = sCreatedTime.getFormattedTime();
		String sIP = getLastIP(senderAccount);		
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
			rAccID = String::valueOf(receiverAccount->getAccountID());
			rAccName = receiverAccount->getUsername();		
			Time rCreatedTime(receiverAccount->getTimeCreated());		
			rAccBorn = rCreatedTime.getFormattedTime();		
			rIP = getLastIP(receiverAccount);
			rCharName = receiver->getFirstName();		
			rCharAge = String::valueOf(receiverGhost->getCharacterAgeInDays());
		}
		
		// Vendor
		String vID = "";
		StringBuffer vPos;
		String vOffer = "no";
		
		if (vendor != nullptr){
			vID = String::valueOf(vendor->getObjectID());
			vPos << int(vendor->getWorldPositionX()) << " " << int(vendor->getWorldPositionY()) << " " << vendor->getZone()->getZoneName();
		
		
			// If receiver of credits was not the vendor owner then item was offered to the vendor
			if (vendor->isVendor()){
				DataObjectComponentReference* data = vendor->getDataObjectComponent();
				if(data == NULL || data->get() == NULL || !data->get()->isVendorData()) {
					Logger::console.error("Lumberjack: Vendor has no data component");
					return;
				}

				VendorDataComponent* vendorData = cast<VendorDataComponent*>(data->get());
				if(vendorData == NULL) {
					Logger::console.error("Lumberjack: Vendor has wrong data component");
					return;
				}
				
				ZoneServer* server = ServerCore::getZoneServer();
				ManagedReference<CreatureObject*> vendorOwner = server->getObject(vendorData->getOwnerId()).castTo<CreatureObject*>();
				
				if (vendorOwner == nullptr){
					Logger::console.error("Lumberjack: CreatureObject for vendor owner not found.");
					return;
				}
				
				if (vendorOwner != receiver) 
					vOffer = "yes";	
			}
		}
		
		// Log to file
		if (logToTXT){			
			String outputText = "";	
			String fileName = "tips";

			if (transactionType == 1){
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + ",";
			} else if (transactionType == 2) {
				fileName = "banktips";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + ",";
			} else if  (transactionType == 3){
				fileName = "bazaarsales";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + "," + name + "," + vID + "," + vPos.toString() + ",";
			} else if  (transactionType == 4){
				fileName = "vendorsales";
				outputText = timestamp + "," + sAccID + "," + sAccName + "," + sAccBorn + "," + sIP + "," + sCharName + "," + sCharAge + "," + String::valueOf(value) + "," + rAccID + "," + rAccName + "," + rAccBorn + "," + rIP + "," + rCharName + "," + rCharAge + "," + name + "," + vID + "," + vPos.toString() + "," + vOffer + ",";
			}
			
			logToFile("log/lumberjack/" + fileName + ".log", outputText);
		}
		
		// Log to SQL
		if (logToSQL){
			// This functionality will be created at a later date. It will push data to separate DB that is dedicated to logging player activity.
		}
	}
	
	/**
	 * Logs player activity
	 * @param accountId Account ID
	 * @param charId Character ID
	 */
	void lumberjack(uint32 accountId, uint64 charId){
		int logDeleted = ConfigManager::instance()->getLumberjackDeleted();
		
		if (!logDeleted){
			Logger::console.info("Lumberjack: Deleted character logging is off.", true);
			return;
		}
		
		int logToTXT = ConfigManager::instance()->getLumberjackTXT();
		int logToSQL = ConfigManager::instance()->getLumberjackSQL();
		
		ZoneServer* server = ServerCore::getZoneServer();
		ManagedReference<CreatureObject*> creature = server->getObject(charId).castTo<CreatureObject*>();
		
		if (creature == nullptr){
			Logger::console.info("Lumberjack: Character not found when logging deletion of charID: " + String::valueOf(charId) + " on accountID: " + String::valueOf(accountId), true);
			return;
		}
		
		Reference<PlayerObject*> ghost = creature->getPlayerObject();
		ManagedReference<Account*> account = ghost->getAccount();
		
		// Gather data
		Time now;
		String timestamp = now.getFormattedTime();
		String accName = account->getUsername();
		Time rCreatedTime(account->getTimeCreated());
		String accBorn = rCreatedTime.getFormattedTime();
		String charName = creature->getFirstName();		
		String charAge = String::valueOf(ghost->getCharacterAgeInDays());
		String sIP = getLastIP(account);
		
		String outputText = timestamp + "," + String::valueOf(accountId) + "," + accName + "," + accBorn + "," + charName + "," + charAge + "," + sIP + ",";
		
		if (logToTXT){	
			logToFile("log/lumberjack/deletedcharacters.log", outputText);
		}
		
		if (logToSQL){
			// This functionality will be created at a later date. It will push data to separate DB that is dedicated to logging player activity.
		}
		
	}
	
	/**
	 * Logs player activity
	 * @param player1 Creature object of a player
	 * @param player2 Creature object of a player
	 * @param p1Value Credit value sent by player
	 * @param p1Before Cash on hand balance before trade
	 * @param p1After Cash on hand after trade
	 * @param p2Value Credit value sent by player
	 * @param p2Before Cash on hand balance before trade
	 * @param p3After Cash on hand after trade
	 */
	void lumberjack(CreatureObject* player1, CreatureObject* player2, uint32 p1Value, uint32 p1Before, uint32 p1After, uint32 p2Value, uint32 p2Before, uint32 p2After){
		// Don't log trades where credits were not exchanged
		if (p1Value < 1 && p2Value < 1)
			return;
			
		int logTradeCredits = ConfigManager::instance()->getLumberjackTradedCredits();
		
		if (!logTradeCredits || ( p1Value < logTradeCredits && p2Value < logTradeCredits))
			return;
			
		int logToTXT = ConfigManager::instance()->getLumberjackTXT();
		int logToSQL = ConfigManager::instance()->getLumberjackSQL();
			
		Reference<PlayerObject*> player1Ghost = player1->getPlayerObject();
		ManagedReference<Account*> player1Account = player1Ghost->getAccount();	
		Reference<PlayerObject*> player2Ghost = player2->getPlayerObject();
		ManagedReference<Account*> player2Account = player2Ghost->getAccount();
		
		// Gather data
		Time now;
		String timestamp = now.getFormattedTime();
		
		// Player 1
		String p1AccID = String::valueOf(player1Account->getAccountID());
		String p1accName = player1Account->getUsername();
		Time p1CreatedTime(player1Account->getTimeCreated());
		String p1accBorn = p1CreatedTime.getFormattedTime();
		String p1LastIP = getLastIP(player1Account);
		String p1charName = player1->getFirstName();		
		String p1charAge = String::valueOf(player1Ghost->getCharacterAgeInDays());
		
		// Player 2
		String p2AccID = String::valueOf(player2Account->getAccountID());
		String p2accName = player2Account->getUsername();
		Time p2CreatedTime(player2Account->getTimeCreated());
		String p2accBorn = p2CreatedTime.getFormattedTime();
		String p2LastIP = getLastIP(player2Account);
		String p2charName = player2->getFirstName();		
		String p2charAge = String::valueOf(player2Ghost->getCharacterAgeInDays());
		
		if (logToTXT){	
			// Transaction Datestamp, player1 account ID, player1 account name, player1 born, player1 ip, player1 character, player1 char age, credits (not used here), player2 account id, player2 account name, player2 born, player2 ip, player2 character, player2 char age, player1 balance before, player1 credits sent, player1 balance after, player2 balance before, player2 credits sent, player2 balance after,
			StringBuffer toLog;
			toLog << timestamp << ","; 
			toLog << p1AccID  << "," <<  p1accName << "," <<  p1accBorn << "," <<  p1LastIP << "," <<  p1charName << "," <<  p1charAge << ",";
			toLog << "0" << ",";
			toLog << p2AccID  << "," <<  p2accName << "," <<  p2accBorn << "," <<  p2LastIP << "," <<  p2charName << "," <<  p2charAge << ",";
			// And now the credit trade data
			toLog << p1Before  << "," <<  p1Value  << "," <<  p1After  << "," <<  p2Before  << "," <<  p2Value  << "," <<  p2After  << ",";
			
			logToFile("log/lumberjack/tradecredits.log", toLog.toString());
		}
		
		if (logToSQL){
			// This functionality will be created at a later date. It will push data to separate DB that is dedicated to logging player activity.
		}
	}
	
	/**
	 * Logs important loot information
	 * @param loot TangibleObject item that is the piece of loot
	 * @param level Exceptional 1, Legendary 2
	 */
	void lumberjack(TangibleObject* loot, int level){

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

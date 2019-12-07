--//////////////////////////////////////////////////////////////
--//   		            tarkin_lib.lua	   	      //
--//    	    	 a Tarkin screenplay	              //
--//////////////////////////////////////////////////////////////
--// Library of functions to be used in multiple screnplays.  //
--//////////////////////////////////////////////////////////////

local ObjectManager = require("managers.object.object_manager")

TarkinLib = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "TarkinLib",
}

registerScreenPlay("TarkinLib", true)

function TarkinLib:start()
--do nothing
end

function TarkinLib:splitString(string, delimiter)
	local outResults = { }
	local start = 1
	local splitStart, splitEnd = string.find( string, delimiter, start )
	while splitStart do
		table.insert( outResults, string.sub( string, start, splitStart-1 ) )
		start = splitEnd + 1
		splitStart, splitEnd = string.find( string, delimiter, start )
	end
	table.insert( outResults, string.sub( string, start ) )
	return outResults
end

function TarkinLib:isEligibleState(pPlayer)
	if (pPlayer == nil or CreatureObject(pPlayer):isIncapacitated() or CreatureObject(pPlayer):isDead() or CreatureObject(pPlayer):getPosture() ~= UPRIGHT or CreatureObject(pPlayer):hasState() == RIDINGMOUNT) then
		return false
	end
	return true
end

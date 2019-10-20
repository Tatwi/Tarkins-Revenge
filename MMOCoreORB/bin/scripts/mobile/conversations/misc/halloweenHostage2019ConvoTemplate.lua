-- //////////////////////////////////////////////////////
-- //	     halloweenHostage2019ConvoTemplate.lua     //
-- //                  Tarkin's Revenge                //
-- // 		2019 Halloween Dungeon Event 	       //
-- //                    October 2019                  //
-- //////////////////////////////////////////////////////


halloweenHostage2019ConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "halloweenHostage2019ConvoHandler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "@player_quest:halloween_2019_intro", --Help!  Oh, please help me get out of here!  These monsters kidnapped me, and I fear I'm not long for this world! 
	stopConversation = "false",
	options = {
		{"@player_quest:halloween_2019_intro_reply_01", "safe_now"}, --Calm down, you're safe now.
	}
}
halloweenHostage2019ConvoTemplate:addScreen(intro);

safe_now = ConvoScreen:new {
	id = "safe_now",
	leftDialog = "@player_quest:halloween_2019_safe_now", --Y-you mean you'll get me out of here?  I can reward you for the effort!
	stopConversation = "false",
	options = {
		{"@player_quest:halloween_2019_safe_now_reply_01", "decline_reward"}, --No need for that, ma'am, I'm just glad you're safe.
		{"@player_quest:halloween_2019_safe_now_reply_02", "accept_reward"}, --Well, it was a lot of effort to get down here.  What kind of reward we talking?
	}
}
halloweenHostage2019ConvoTemplate:addScreen(safe_now);

decline_reward = ConvoScreen:new {
	id = "decline_reward",
	leftDialog = "@player_quest:halloween_2019_decline_reward", --Oh, truly, I insist!
	stopConversation = "false",
	options = {
		{"@player_quest:halloween_2019_decline_reward_reply_01", "accept_reward"}, --Ok, if you insist...
	}
}
halloweenHostage2019ConvoTemplate:addScreen(decline_reward);

accept_reward = ConvoScreen:new {
	id = "accept_reward",
	leftDialog = "@player_quest:halloween_2019_accept_reward", --Please choose from among these options, and of course, you have my gratitude.
	stopConversation = "false",
	options = {
		{"@player_quest:halloween_2019_give_reward_reply_01", "give_reward_1"}, --Skeletal Tauntaun Mount Schematic
		{"@player_quest:halloween_2019_give_reward_reply_02", "give_reward_2"}, --Ghostly Flash Speeder Schematic
		{"@player_quest:halloween_2019_give_reward_reply_03", "give_reward_3"}, --Galactic Moon Festival Bat Wings
		{"@player_quest:halloween_2019_give_reward_reply_04", "give_reward_4"}, --Exogorth Gloves
		{"@player_quest:halloween_2019_give_reward_reply_05", "give_reward_5"}, --Skeleton Costume
		{"@player_quest:halloween_2019_give_reward_reply_06", "give_reward_6"}, --Undead Costume
		{"@player_quest:halloween_2019_give_reward_reply_07", "give_reward_7"}, --Cybernetic Arm
		{"@player_quest:halloween_2019_give_reward_reply_08", "give_reward_8"}, --Dirge Song (Entertainer Only)
	}
}
halloweenHostage2019ConvoTemplate:addScreen(accept_reward);

give_reward_1 = ConvoScreen:new {
	id = "give_reward_1",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_1);

give_reward_2 = ConvoScreen:new {
	id = "give_reward_2",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_2);

give_reward_3 = ConvoScreen:new {
	id = "give_reward_3",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_3);

give_reward_4 = ConvoScreen:new {
	id = "give_reward_4",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_4);

give_reward_5 = ConvoScreen:new {
	id = "give_reward_5",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget your brave rescue!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_5);

give_reward_6 = ConvoScreen:new {
	id = "give_reward_6",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_6);

give_reward_7 = ConvoScreen:new {
	id = "give_reward_7",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_7);

give_reward_8 = ConvoScreen:new {
	id = "give_reward_8",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(give_reward_8);

already_completed = ConvoScreen:new {
	id = "already_completed",
	leftDialog = "@player_quest:halloween_2019_already_completed", --I won't forget you, my brave rescuer!
	stopConversation = "true",
	options = {}
}
halloweenHostage2019ConvoTemplate:addScreen(already_completed);

addConversationTemplate("halloweenHostage2019ConvoTemplate", halloweenHostage2019ConvoTemplate);

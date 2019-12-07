-- //////////////////////////////////////////////////////
-- //	   LifeDayDreamsShorbaccaConvoTemplate.lua     //
-- //                 Tarkin's Revenge                 //
-- //                    Nov 2019                      //
-- //////////////////////////////////////////////////////

LifeDayDreamsShorbaccaConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "LifeDayDreamsShorbaccaConvoHandler",
	screens = {}
}

shorbacca_speak_later = ConvoScreen:new {
	id = "shorbacca_speak_later",
	leftDialog = "@player_quest:shorbacca_speak_later", --Hello, young one.  Speak to me after your hrrtayyk is complete.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_speak_later);

shorbacca_intro = ConvoScreen:new {
	id = "shorbacca_intro",
	leftDialog = "@player_quest:shorbacca_intro", --Greetings, Ascended.
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_intro_reply_01", "shorbacca_01"}, --Hello, you are some kind of Elder?
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_intro);

shorbacca_01 = ConvoScreen:new {
	id = "shorbacca_01",
	leftDialog = "@player_quest:shorbacca_01", --Do you not recognize me? I am Shorbacca, shaman of Orriorr.
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_01_reply_01", "shorbacca_02"}, --Of course, I'm sorry.  It's been a very busy day.
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_01);

shorbacca_02 = ConvoScreen:new {
	id = "shorbacca_02",
	leftDialog = "@player_quest:shorbacca_02", --It matters not, what is important is that you have completed your hrrtayyk today!  This is a proud moment in the life of every Wookiee. 
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_02_reply_01", "shorbacca_03"}, --It was a challenge, but I made it.  What happens now? 
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_02);

shorbacca_03 = ConvoScreen:new {
	id = "shorbacca_03",
	leftDialog = "@player_quest:shorbacca_03", --Now you have tested your will to survive, and found the strength of your rrakktorr.  But strength must always benefit from the guiding hand of wisdom.  Take this pipe.  Through its smoke, you will find the answers you seek.
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_03_reply_01", "shorbacca_04"}, --[You inhale a large puff of smoke from the pipe, and feel it release through your nostrils]
		{"@player_quest:shorbacca_03_reply_02", "shorbacca_05"}, --What is this?  Are you sure it's safe?
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_03);

shorbacca_04 = ConvoScreen:new {
	id = "shorbacca_04",
	leftDialog = "@player_quest:shorbacca_04", --May the spirits guide you.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_04);

shorbacca_05 = ConvoScreen:new {
	id = "shorbacca_05",
	leftDialog = "@player_quest:shorbacca_05", --A perfectly harmless combination of herbs.  It will help you relax and find the wisdom of your ancestors.
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_05_reply_01", "shorbacca_04"}, --[You accept the pipe and take a deep puff, coughing a little as the smoke expels]
		{"@player_quest:shorbacca_05_reply_02", "shorbacca_06"}, --I don't want to do this.
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_05);

shorbacca_06 = ConvoScreen:new {
	id = "shorbacca_06",
	leftDialog = "@player_quest:shorbacca_06", --A pity.  May you not use your newfound adulthood unwisely...
	stopConversation = "true",
	options = {}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_06);

shorbacca_07 = ConvoScreen:new {
	id = "shorbacca_07",
	leftDialog = "@player_quest:shorbacca_07", --Are you quite all right?
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_07_reply_01", "shorbacca_08"}, --Where am I?  Was that all in my head?
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_07);

shorbacca_08 = ConvoScreen:new {
	id = "shorbacca_08",
	leftDialog = "@player_quest:shorbacca_08", --Yes I am certain it was, but that does not mean it was not real. 
	stopConversation = "false",
	options = {
		{"@player_quest:shorbacca_08_reply_01", "shorbacca_09"}, --I feel like I learned a lot.
	}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_08);

shorbacca_09 = ConvoScreen:new {
	id = "shorbacca_09",
	leftDialog = "@player_quest:shorbacca_09", --The Great Bacca always has something to teach.  I believe you have what you need,  Please take these, as a way to remember your journey here.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_09);

shorbacca_10 = ConvoScreen:new {
	id = "shorbacca_10",
	leftDialog = "@player_quest:shorbacca_10", --Go in peace.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsShorbaccaConvoTemplate:addScreen(shorbacca_10);

addConversationTemplate("LifeDayDreamsShorbaccaConvoTemplate", LifeDayDreamsShorbaccaConvoTemplate);

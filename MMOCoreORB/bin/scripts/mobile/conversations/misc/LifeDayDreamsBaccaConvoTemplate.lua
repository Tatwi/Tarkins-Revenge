-- //////////////////////////////////////////////////////
-- //	     LifeDayDreamsBaccaConvoTemplate.lua       //
-- //                 Tarkin's Revenge                 //
-- //                    Nov 2019                      //
-- //////////////////////////////////////////////////////


LifeDayDreamsBaccaConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "LifeDayDreamsBaccaConvoHandler",
	screens = {}
}

bacca_intro = ConvoScreen:new {
	id = "bacca_intro",
	leftDialog = "@player_quest:bacca_intro", --Hello.
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_intro_reply_01", "bacca_01"}, --Hello...Who are you?
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_intro);

bacca_01 = ConvoScreen:new {
	id = "bacca_01",
	leftDialog = "@player_quest:bacca_01", --I do not know why you can see us, young one.  You are looking upon the ancestors of your people.  I am Bacca, first Chief of Orriorr.
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_01_reply_01", "bacca_02"}, --I don't know what happened, I remember a pipe.
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_01);

bacca_02 = ConvoScreen:new {
	id = "bacca_02",
	leftDialog = "@player_quest:bacca_02", --So, your shaman sent you in search of wisdom.  Clearly you need it!
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_02_reply_01", "bacca_03"}, --I suppose.
		{"@player_quest:bacca_02_reply_02", "bacca_03"}, --Hey!
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_02);

bacca_03 = ConvoScreen:new {
	id = "bacca_03",
	leftDialog = "@player_quest:bacca_03", --What knowledge do you seek? 
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_03_reply_01", "bacca_04"}, --Why can't we use our claws?
		{"@player_quest:bacca_03_reply_02", "bacca_06"}, --What makes Life Day so important?
		{"@player_quest:bacca_03_reply_03", "bacca_08"}, --What is the purpose of the hrrtayyk?
		{"@player_quest:bacca_03_reply_04", "bacca_10"}, --What values define our people?
		{"@player_quest:bacca_03_reply_05", "bacca_12"}, --I believe I have heard all I need to.		
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_03);

bacca_04 = ConvoScreen:new {
	id = "bacca_04",
	leftDialog = "@player_quest:bacca_04", --We can use our claws, child.  To climb, to craft, to use as a tool, or for any peaceful purpose.
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_04_reply_01", "bacca_05"}, --Of course.		
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_04);

bacca_05 = ConvoScreen:new {
	id = "bacca_05",
	leftDialog = "@player_quest:bacca_05", --It is when a Wookiee lashes out in anger and uses their claws to harm another that dishonor is brought.  Only animals use their claws in this way, and exile is the only recourse for such a feral spirit.
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_continue_reply", "bacca_03"}, --[Continue]		
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_05);

bacca_06 = ConvoScreen:new {
	id = "bacca_06",
	leftDialog = "@player_quest:bacca_06", --It is a celebration of all life on this planet, from the smallest Daubird to the largest Katarn, and of course for our people.  It is a celebration of Kashyyyk and her people.  We give to the animals, exchange gifts with each other, and decorate the land with joy.  It is a renewal of life. 
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_06_reply_01", "bacca_07"}, --Does it have deeper meaning for Wookiees?	
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_06);

bacca_07 = ConvoScreen:new {
	id = "bacca_07",
	leftDialog = "@player_quest:bacca_07", --Of course.  It is when we remember those that came and passed before us, and appreciate those that we share our lives with.  Our friends, our family, all who we love and respect.  It is also a time to commune with the spirit of the forest itself, usually by chewing the roots of the Orga plant.  Fireworks too as well, there are always fireworks! 
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_continue_reply", "bacca_03"}, --[Continue]
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_07);

bacca_08 = ConvoScreen:new {
	id = "bacca_08",
	leftDialog = "@player_quest:bacca_08", --As I am sure you have been told, it is the trial of ascension for our children.  By passing this rite you become an adult within our society, you open the door to the rest of your life and may set foot upon your path.  Perhaps you will become a great warrior, a crafter, an explorer, or simply something you hold a great passion for. 
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_08_reply_01", "bacca_09"}, --I learned important skills, too.	
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_08);

bacca_09 = ConvoScreen:new {
	id = "bacca_09",
	leftDialog = "@player_quest:bacca_09", --Indeed.  Not all Wookiees become warriors, yet we must all be ready to defend ourselves and our way of life in combat.  The hrrtayyk teaches us to be self-sufficient, in surviving, in thriving.  It is a way to commune with the life of our planet: which predators are dangerous, which plants are edible or poisonous, to live in and survive the harsh but beautiful world of Kashyyyk is core to the identity of all Wookiees. 
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_continue_reply", "bacca_03"}, --[Continue]
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_09);

bacca_10 = ConvoScreen:new {
	id = "bacca_10",
	leftDialog = "@player_quest:bacca_10", --A broad question that is difficult to answer.  We pride ourselves in seeking peace, balance, and honor.  We will let our anger unleash when it must, we will fight when we must, but the why is a core part of our identity. 
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_10_reply_01", "bacca_11"}, --I see.
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_10);

bacca_11 = ConvoScreen:new {
	id = "bacca_11",
	leftDialog = "@player_quest:bacca_11", --We protect, we avenge, we prevent.  Since we climbed the great wroshyr trees to elude predators we have grown beyond the animals of this planet.  We are civilized, yet do not forget our values.  This is why our technology is limited, we shape to what fits our culture, like the bowcaster, the ryyk, the pottery we make.  We do not let our culture bend to fit technology.  
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_continue_reply", "bacca_03"}, --[Continue]
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_11);

bacca_12 = ConvoScreen:new {
	id = "bacca_12",
	leftDialog = "@player_quest:bacca_12", --Very well.  I hope you go forward into adulthood a little more aware of your heritage.  
	stopConversation = "false",
	options = {
		{"@player_quest:bacca_12_reply_01", "bacca_13"}, --Thank you, how do I get back? 
	}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_12);

bacca_13 = ConvoScreen:new {
	id = "bacca_13",
	leftDialog = "@player_quest:bacca_13", --You never left.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsBaccaConvoTemplate:addScreen(bacca_13);

addConversationTemplate("LifeDayDreamsBaccaConvoTemplate", LifeDayDreamsBaccaConvoTemplate);

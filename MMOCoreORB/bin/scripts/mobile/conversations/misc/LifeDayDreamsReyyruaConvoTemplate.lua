-- //////////////////////////////////////////////////////
-- //	     LifeDayDreamsReyyruaConvoTemplate.lua     //
-- //                  Tarkin's Revenge                //
-- //                     Nov 2019                     //
-- //////////////////////////////////////////////////////


LifeDayDreamsReyyruaConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "LifeDayDreamsReyyruaConvoHandler",
	screens = {}
}

reyyrua_intro = ConvoScreen:new {
	id = "reyyrua_intro",
	leftDialog = "@player_quest:reyyrua_intro", --I have heard the village buzzing of your trials! Come, sit!
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_intro_reply_01", "reyyrua_intro_continue"}, --Of course, Elder.
		{"@player_quest:reyyrua_intro_reply_02", "reyyrua_intro_decline"}, --I'm sorry, I don't have time.
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_intro);

reyyrua_intro_continue = ConvoScreen:new {
	id = "reyyrua_intro_continue",
	leftDialog = "@player_quest:reyyrua_intro_continue", --Ah!  They were right to speak highly of you!  A good one, you are!
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_intro_continue_reply_01", "reyyrua_01"}, --Oh yeah? What do they say?		
		{"@player_quest:reyyrua_intro_continue_reply_02", "reyyrua_02"}, --Thank you, old mother!	
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_intro_continue);

reyyrua_intro_decline = ConvoScreen:new {
	id = "reyyrua_intro_decline",
	leftDialog = "@player_quest:reyyrua_intro_decline", --So many young Wookiees don't...
	stopConversation = "true",
	options = {}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_intro_decline);

reyyrua_01 = ConvoScreen:new {
	id = "reyyrua_01",
	leftDialog = "@player_quest:reyyrua_01", --Hah! Seeking flattery are you? Well, you won't get your fur fluffed here.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_01);

reyyrua_02= ConvoScreen:new {
	id = "reyyrua_02",
	leftDialog = "@player_quest:reyyrua_02", --Would you listen to an old one ramble, child?
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_02_reply_01", "reyyrua_03"}, --I would be honored.
		{"@player_quest:reyyrua_02_reply_02", "reyyrua_end"}, --Maybe later.	
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_02);

reyyrua_end= ConvoScreen:new {
	id = "reyyrua_end",
	leftDialog = "@player_quest:reyyrua_end", --Come back if you'd like to talk.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_end);

reyyrua_03= ConvoScreen:new {
	id = "reyyrua_03",
	leftDialog = "@player_quest:reyyrua_03", --These trees, child, they form the basis of our culture. The whole village grows together like the Wroshyr. Some of us are like leaves.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_03_reply_01", "reyyrua_04"}, --Leaves, revered one?
		{"@player_quest:reyyrua_03_reply_02", "reyyrua_05"}, --I should go find my friends...		
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_03);

reyyrua_04= ConvoScreen:new {
	id = "reyyrua_04",
	leftDialog = "@player_quest:reyyrua_04", --Those of our clan who take in the light around us, bask in it!  Use it to nourish and protect others.  Your mother, she was like the leaves.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_04_reply_01", "reyyrua_06"}, --*nods*
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_04);

reyyrua_05= ConvoScreen:new {
	id = "reyyrua_05",
	leftDialog = "@player_quest:reyyrua_05", --Afraid you'll learn something, young one?
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_05_reply_01", "reyyrua_04"}, --Yes...no...uh, what were you saying about leaves?
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_05);

reyyrua_06= ConvoScreen:new {
	id = "reyyrua_06",
	leftDialog = "@player_quest:reyyrua_06", --We have trunks among us too! Strong.  Sturdy.  They provide the strength and stability a tribe needs to survive.  Our backbone!  Like our Chieftan Attilochit! 
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_06_reply_01", "reyyrua_07"}, --Am I a trunk, Elder?
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_06);

reyyrua_07= ConvoScreen:new {
	id = "reyyrua_07",
	leftDialog = "@player_quest:reyyrua_07", --Hah!  You are too young for such, no child...you are a root! 
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_07_reply_01", "reyyrua_08"}, --Uh, a root?
		{"@player_quest:reyyrua_07_reply_02", "reyyrua_09"}, --I think it's time to head off.		
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_07);

reyyrua_08= ConvoScreen:new {
	id = "reyyrua_08",
	leftDialog = "@player_quest:reyyrua_08", --A root, seeking always!  Finding ways to feed our tribe through the bounties of our Kashyyyk! 
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_08_reply_01", "reyyrua_10"}, --So, all of us on the homeworld are part of the wroshyr?
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_08);

reyyrua_09= ConvoScreen:new {
	id = "reyyrua_09",
	leftDialog = "@player_quest:reyyrua_09", --Sit! Listen.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_09_reply_01", "reyyrua_08"}, --Ok. Root. Go.
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_09);

reyyrua_10= ConvoScreen:new {
	id = "reyyrua_10",
	leftDialog = "@player_quest:reyyrua_10", --All Wookiees!  Here and far away.  All of my children have gone off world, they have settled elsewhere.  But they are part of us, part of the wroshyr.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_10_reply_01", "reyyrua_11"}, --They probably don't want to be compared to trees...
		{"@player_quest:reyyrua_10_reply_02", "reyyrua_12"}, --I plan to seek my destiny off world, too!
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_10);

reyyrua_11= ConvoScreen:new {
	id = "reyyrua_11",
	leftDialog = "@player_quest:reyyrua_11", --What was that, young one?
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_11_reply_01", "reyyrua_13"}, --Uh, nothing.  I imagine you miss them?
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_11);

reyyrua_12= ConvoScreen:new {
	id = "reyyrua_12",
	leftDialog = "@player_quest:reyyrua_12", --Ah. Your family will grieve your absence. But you will still be part of us. A reaching branch.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_12_reply_01", "reyyrua_13"}, --You must miss them.
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_12);

reyyrua_13= ConvoScreen:new {
	id = "reyyrua_13",
	leftDialog = "@player_quest:reyyrua_13", --I do, I do! I have grandchildren...even great grandchildren...who I have never held.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_13_reply_01", "reyyrua_14"}, --They don't visit?
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_13);

reyyrua_14= ConvoScreen:new {
	id = "reyyrua_14",
	leftDialog = "@player_quest:reyyrua_14", --The trip is long.  Some visit.  They yearn for the trees, for the belonging.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_14_reply_01", "reyyrua_15"}, --They are homesick.
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_14);

reyyrua_15= ConvoScreen:new {
	id = "reyyrua_15",
	leftDialog = "@player_quest:reyyrua_15", --Yes.  My son, he wrote this and sent it back home to me.  You may keep this copy!  My gift for your hrrtayyk ceremony.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_15_reply_01", "reyyrua_16"}, --I will treasure it.
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_15);

reyyrua_16= ConvoScreen:new {
	id = "reyyrua_16",
	leftDialog = "@player_quest:reyyrua_16", --You are kind to listen so long to an old Wookiee ramble, child.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_16_reply_01", "reyyrua_17"}, --Thank you, Elder, for your wisdom.
		{"@player_quest:reyyrua_16_reply_02", "reyyrua_17"}, --You've shared a great deal.		
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_16);

reyyrua_17= ConvoScreen:new {
	id = "reyyrua_17",
	leftDialog = "@player_quest:reyyrua_17", --My throat needs wetting after so much talk!   Would you share in some varactyl eggnog?
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_17_reply_01", "reyyrua_18"}, --I'd love some!
		{"@player_quest:reyyrua_17_reply_02", "reyyrua_18"}, --Uh, what's varactyl eggnog?		
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_17);

reyyrua_18= ConvoScreen:new {
	id = "reyyrua_18",
	leftDialog = "@player_quest:reyyrua_18", --I made it myself!  Old family recipe.
	stopConversation = "false",
	options = {
		{"@player_quest:reyyrua_18_reply_01", "reyyrua_final"}, --Thank you, old Mother.
	}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_18);

reyyrua_final= ConvoScreen:new {
	id = "reyyrua_final",
	leftDialog = "@player_quest:reyyrua_final", --Go, like the reaching branch you are, young one!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsReyyruaConvoTemplate:addScreen(reyyrua_final);

addConversationTemplate("LifeDayDreamsReyyruaConvoTemplate", LifeDayDreamsReyyruaConvoTemplate);

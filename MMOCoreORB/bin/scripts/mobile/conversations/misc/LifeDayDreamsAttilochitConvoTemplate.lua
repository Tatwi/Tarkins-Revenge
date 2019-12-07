-- //////////////////////////////////////////////////////
-- //	    LifeDayDreamsAttilochitConvoTemplate.lua   //
-- //                  Tarkin's Revenge                //
-- //                     Nov 2019                     //
-- //////////////////////////////////////////////////////


LifeDayDreamsAttilochitConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "LifeDayDreamsAttilochitConvoHandler",
	screens = {}
}

attilochit_intro = ConvoScreen:new {
	id = "attilochit_intro",
	leftDialog = "@player_quest:attilochit_intro", --Hello, young one.  I have been expecting you.  One would have hoped, on a day as momentous as this, that you would have arrived early, with the others.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_intro_reply_01", "attilochit_intro_01"}, --I'm sorry, I overslept!
		{"@player_quest:attilochit_intro_reply_02", "attilochit_intro_02"}, --Momentous?  What day is it?
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro);

attilochit_intro_01 = ConvoScreen:new {
	id = "attilochit_intro_01",
	leftDialog = "@player_quest:attilochit_intro_01", --Overslept?  Today, on this most important of all days?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_intro_01_reply_01", "attilochit_intro_02"}, --Remind me, what is happening today?
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_01);

attilochit_intro_02 = ConvoScreen:new {
	id = "attilochit_intro_02",
	leftDialog = "@player_quest:attilochit_intro_02", --Your hrrtayyk ceremony! Today you prove yourself to the clan!
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_intro_02_reply_01", "attilochit_intro_03"}, --Oh, yes.  How do I get started with that?
		{"@player_quest:attilochit_intro_02_reply_02", "attilochit_intro_04"}, --Prove myself...how?
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_02);

attilochit_intro_03 = ConvoScreen:new {
	id = "attilochit_intro_03",
	leftDialog = "@player_quest:attilochit_intro_03", --Eager! This is good. Your hunting prowess is one of the clearest ways to gauge your readiness for adulthood.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_intro_03_reply_01", "attilochit_assign_mouf"}, --What do you want me to hunt?			
		{"@player_quest:attilochit_intro_03_reply_02", "attilochit_intro_fail"}, --I don't really hunt.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_03);

attilochit_intro_04 = ConvoScreen:new {
	id = "attilochit_intro_04",
	leftDialog = "@player_quest:attilochit_intro_04", --By beginning your rite of passage, unlocking your rrakktorr!
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_intro_02_reply_01", "attilochit_intro_03"}, --Oh, yes.  How do I get started with that?			
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_04);

attilochit_intro_04 = ConvoScreen:new {
	id = "attilochit_intro_04",
	leftDialog = "@player_quest:attilochit_intro_04", --By beginning your rite of passage, unlocking your rrakktorr!
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_intro_02_reply_01", "attilochit_intro_03"}, --Oh, yes.  How do I get started with that?			
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_04);

attilochit_assign_mouf = ConvoScreen:new {
	id = "attilochit_assign_mouf",
	leftDialog = "@player_quest:attilochit_assign_mouf", --Moufs would be a good starting place for you, yes!  You will find them in the Hracca Glade.  Bring me the head of one and three of their paws.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_mouf);

attilochit_intro_fail = ConvoScreen:new {
	id = "attilochit_intro_fail",
	leftDialog = "@player_quest:attilochit_intro_fail", --You should go back to your mother's tree until you are ready.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_fail);

attilochit_intro_fail = ConvoScreen:new {
	id = "attilochit_intro_fail",
	leftDialog = "@player_quest:attilochit_intro_fail", --You should go back to your mother's tree until you are ready.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_intro_fail);

attilochit_check_mouf = ConvoScreen:new {
	id = "attilochit_check_mouf",
	leftDialog = "@player_quest:attilochit_check_mouf", --Ah!  You've returned from the Hracca Glade, have you succeeded in your first task?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_mouf_reply_01", "attilochit_mouf_success"}, --Of course! Here is the proof!		
		--{"@player_quest:attilochit_check_mouf_reply_02", "attilochit_mouf_not_done"}, --I haven't finished my task.			
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_mouf);

attilochit_mouf_success = ConvoScreen:new {
	id = "attilochit_mouf_success",
	leftDialog = "@player_quest:attilochit_mouf_success", --You have done well, indeed!  The armorers will be grateful for new materials.  And I have this for you.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_mouf_success);

attilochit_mouf_not_done = ConvoScreen:new {
	id = "attilochit_mouf_not_done",
	leftDialog = "@player_quest:attilochit_mouf_not_done", --There is nothing to be gained in delay.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_mouf_not_done);

attilochit_mouf_done = ConvoScreen:new {
	id = "attilochit_mouf_done",
	leftDialog = "@player_quest:attilochit_mouf_done", --Are you ready for your next trial?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_mouf_done_reply_01", "attilochit_offer_webweaver"}, --Bring it on!		
		{"@player_quest:attilochit_mouf_done_reply_02", "attilochit_webweaver_delay"}, --I think I'll come back later.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_mouf_done);

attilochit_offer_webweaver = ConvoScreen:new {
	id = "attilochit_offer_webweaver",
	leftDialog = "@player_quest:attilochit_offer_webweaver", --I like your enthusiasm, young one.  Your next test brings you face to face with a nightmare.  Slay webweaver spiders in the Shadowlands, and bring back one of their heads and three of their eyes.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_assign_webweaver_reply_01", "attilochit_assign_webweaver"}, --I'm tougher than anything on 8 legs.		
		{"@player_quest:attilochit_assign_webweaver_reply_02", "attilochit_webweaver_decline"}, --Uh, I'll pass.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_webweaver);

attilochit_webweaver_delay = ConvoScreen:new {
	id = "attilochit_webweaver_delay",
	leftDialog = "@player_quest:attilochit_webweaver_delay", --If you must.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_webweaver_delay);

attilochit_assign_webweaver = ConvoScreen:new {
	id = "attilochit_assign_webweaver",
	leftDialog = "@player_quest:attilochit_assign_webweaver", --Go then!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_webweaver);

attilochit_webweaver_decline = ConvoScreen:new {
	id = "attilochit_webweaver_decline",
	leftDialog = "@player_quest:attilochit_webweaver_decline", --I had expected better of you.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_webweaver_decline);

attilochit_check_webweaver = ConvoScreen:new {
	id = "attilochit_check_webweaver",
	leftDialog = "@player_quest:attilochit_check_webweaver", --You return! Were you able to collect the items from the webweavers?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_webweaver_reply_01", "attilochit_webweaver_success"}, --It was disgusting, but I did it.		
		--{"@player_quest:attilochit_check_webweaver_reply_02", "attilochit_webweaver_not_done"}, --I haven't quite managed to complete this trial.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_webweaver);

attilochit_webweaver_success = ConvoScreen:new {
	id = "attilochit_webweaver_success",
	leftDialog = "@player_quest:attilochit_webweaver_success", --Masterfully done, young one.  Take this to remember the battle.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_webweaver_success);

attilochit_webweaver_not_done = ConvoScreen:new {
	id = "attilochit_webweaver_not_done",
	leftDialog = "@player_quest:attilochit_webweaver_not_done", --Delay only heightens fear.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_webweaver_not_done);

attilochit_webweaver_done = ConvoScreen:new {
	id = "attilochit_webweaver_done",
	leftDialog = "@player_quest:attilochit_webweaver_done", --Are you prepared to face another challenge?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_webweaver_done_reply_01", "attilochit_offer_walluga"}, --I am determined to prove my worth to our tribe!		
		{"@player_quest:attilochit_webweaver_done_reply_02", "attilochit_walluga_delay"}, --I think I need to rest a bit first.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_webweaver_done);

attilochit_offer_walluga = ConvoScreen:new {
	id = "attilochit_offer_walluga",
	leftDialog = "@player_quest:attilochit_offer_walluga", --And so you shall!  Challenge a pack of walluga in the Shadowlands and bring me 4 of their ears.  And one's head, of course.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_walluga_reply_01", "attilochit_assign_walluga"}, --Right away!		
		{"@player_quest:attilochit_offer_walluga_reply_02", "attilochit_walluga_decline"}, --Maybe later?
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_walluga);

attilochit_walluga_delay = ConvoScreen:new {
	id = "attilochit_walluga_delay",
	leftDialog = "@player_quest:attilochit_walluga_delay", --Pah!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_walluga_delay);

attilochit_assign_walluga = ConvoScreen:new {
	id = "attilochit_assign_walluga",
	leftDialog = "@player_quest:attilochit_assign_walluga", --Good hunting!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_walluga);

attilochit_walluga_decline = ConvoScreen:new {
	id = "attilochit_walluga_decline",
	leftDialog = "@player_quest:attilochit_walluga_decline", --I suppose we can wait, young one.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_walluga_decline);

attilochit_check_walluga = ConvoScreen:new {
	id = "attilochit_check_walluga",
	leftDialog = "@player_quest:attilochit_check_walluga", --Young one!  It is good to see you've safely returned from the Shadowlands.  Do you have the Walluga ears and a head?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_walluga_reply_01", "attilochit_walluga_success"}, --They weren't as much of a challenge as I thought!		
		--{"@player_quest:attilochit_check_walluga_reply_02", "attilochit_walluga_not_done"}, --I do not have them yet.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_walluga);

attilochit_walluga_success = ConvoScreen:new {
	id = "attilochit_walluga_success",
	leftDialog = "@player_quest:attilochit_walluga_success", --You have done well, quite well.  Here is your reward!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_walluga_success);

attilochit_walluga_not_done = ConvoScreen:new {
	id = "attilochit_walluga_not_done",
	leftDialog = "@player_quest:attilochit_walluga_not_done", --Do not be frightened, we would not be testing you if your clan did not believe you ready!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_walluga_not_done);

attilochit_walluga_done = ConvoScreen:new {
	id = "attilochit_walluga_done",
	leftDialog = "@player_quest:attilochit_walluga_done", --Your next test awaits, are you prepared?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_walluga_done_reply_01", "attilochit_offer_uller"}, --I was born prepared.		
		{"@player_quest:attilochit_walluga_done_reply_02", "attilochit_uller_delay"}, --I think I'll come back later.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_walluga_done);

attilochit_offer_uller = ConvoScreen:new {
	id = "attilochit_offer_uller",
	leftDialog = "@player_quest:attilochit_offer_uller", --Ha ha!  We shall see, we shall see... I know, bring me the head of an uller from the Etyyy Hunting Grounds, and 4 of their horns.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_uller_reply_01", "attilochit_assign_uller"}, --As you wish, Chieftain!		
		{"@player_quest:attilochit_offer_uller_reply_02", "attilochit_uller_decline"}, --I think I'll sit this one out.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_uller);

attilochit_uller_delay = ConvoScreen:new {
	id = "attilochit_uller_delay",
	leftDialog = "@player_quest:attilochit_uller_delay", --If you must.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_uller_delay);

attilochit_assign_uller = ConvoScreen:new {
	id = "attilochit_assign_uller",
	leftDialog = "@player_quest:attilochit_assign_uller", --Go then!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_uller);

attilochit_uller_decline = ConvoScreen:new {
	id = "attilochit_uller_decline",
	leftDialog = "@player_quest:attilochit_uller_decline", --Back to the nursery tree with you, then.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_uller_decline);

attilochit_check_uller = ConvoScreen:new {
	id = "attilochit_check_uller",
	leftDialog = "@player_quest:attilochit_check_uller", --Welcome back, child! Where is the proof of your conquered ullers?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_uller_reply_01", "attilochit_uller_success"}, --Right here, this one wasn't much of a challenge.		
		--{"@player_quest:attilochit_check_uller_reply_02", "attilochit_uller_not_done"}, --I haven't completed this trial.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_uller);

attilochit_uller_success = ConvoScreen:new {
	id = "attilochit_uller_success",
	leftDialog = "@player_quest:attilochit_uller_success", --Ah, we shall have to make the next one harder, then!  Take this anyway.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_uller_success);

attilochit_uller_not_done = ConvoScreen:new {
	id = "attilochit_uller_not_done",
	leftDialog = "@player_quest:attilochit_uller_not_done", --There is no cause for delay.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_uller_not_done);

attilochit_uller_done = ConvoScreen:new {
	id = "attilochit_uller_done",
	leftDialog = "@player_quest:attilochit_uller_done", --Your next challenge is close at hand.  Are you ready for it?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_uller_done_reply_01", "attilochit_offer_minstyngar"}, --I am ready.	
		{"@player_quest:attilochit_uller_done_reply_02", "attilochit_minstyngar_delay"}, --I'd rather to this later.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_uller_done);

attilochit_offer_minstyngar = ConvoScreen:new {
	id = "attilochit_offer_minstyngar",
	leftDialog = "@player_quest:attilochit_offer_minstyngar", --You must now face the minstyngar on the Rryatt Trail! Take the head of one, and 4 horns from its packmates. 
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_minstyngar_reply_01", "attilochit_assign_minstyngar"}, --Finally a true challenge for me!	
		{"@player_quest:attilochit_offer_minstyngar_reply_02", "attilochit_minstyngar_decline"}, --Maybe I'm not ready for this, after all...	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_minstyngar);

attilochit_minstyngar_delay = ConvoScreen:new {
	id = "attilochit_minstyngar_delay",
	leftDialog = "@player_quest:attilochit_minstyngar_delay", --Return to me when you are ready, but do not take too long, or some will question your readiness for adulthood!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_minstyngar_delay);

attilochit_assign_minstyngar = ConvoScreen:new {
	id = "attilochit_assign_minstyngar",
	leftDialog = "@player_quest:attilochit_assign_minstyngar", --Make us all proud!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_minstyngar);

attilochit_minstyngar_decline = ConvoScreen:new {
	id = "attilochit_minstyngar_decline",
	leftDialog = "@player_quest:attilochit_minstyngar_decline", --Only you can decide when you are ready.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_minstyngar_decline);

attilochit_check_minstyngar = ConvoScreen:new {
	id = "attilochit_check_minstyngar",
	leftDialog = "@player_quest:attilochit_check_minstyngar", --Young one! You've returned from the Rryatt Trail! Did you collect the trophies from the minstyngar?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_minstyngar_reply_01", "attilochit_minstyngar_success"}, --It was definitely a more difficult task, but I succeeded!		
		--{"@player_quest:attilochit_check_minstyngar_reply_02", "attilochit_minstyngar_not_done"}, --I'm not sure I am able to complete this task.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_minstyngar);

attilochit_minstyngar_success = ConvoScreen:new {
	id = "attilochit_minstyngar_success",
	leftDialog = "@player_quest:attilochit_minstyngar_success", --You have done well, indeed! These will be useful, quite useful.  Here is a token of your victory!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_minstyngar_success);

attilochit_minstyngar_not_done = ConvoScreen:new {
	id = "attilochit_minstyngar_not_done",
	leftDialog = "@player_quest:attilochit_minstyngar_not_done", --Believe in yourself, as we all do!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_minstyngar_not_done);

attilochit_minstyngar_done = ConvoScreen:new {
	id = "attilochit_minstyngar_done",
	leftDialog = "@player_quest:attilochit_minstyngar_done", --You have made great strides toward your adulthood today, are you prepared to continue?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_minstyngar_done_reply_01", "attilochit_offer_kkorrwrot"}, --I will persevere until the hrrtayyk ceremony is complete, Chieftain.	
		{"@player_quest:attilochit_minstyngar_done_reply_02", "attilochit_kkorrwrot_delay"}, --I think I'll come back later.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_minstyngar_done);

attilochit_offer_kkorrwrot = ConvoScreen:new {
	id = "attilochit_offer_kkorrwrot",
	leftDialog = "@player_quest:attilochit_offer_kkorrwrot", --Next, I ask that you bring me the head of a kkorrwrot, as well as 5 of their legs.  You may find them in the Etyyy Hunting Grounds or within the Hracca Glade.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_kkorrwrot_reply_01", "attilochit_assign_kkorrwrot"}, --As you wish.	
		{"@player_quest:attilochit_offer_kkorrwrot_reply_02", "attilochit_kkorrwrot_decline"}, --I'm not ready to face a kkorrwrot!
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_kkorrwrot);

attilochit_kkorrwrot_delay = ConvoScreen:new {
	id = "attilochit_kkorrwrot_delay",
	leftDialog = "@player_quest:attilochit_kkorrwrot_delay", --If you must.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_kkorrwrot_delay);

attilochit_assign_kkorrwrot = ConvoScreen:new {
	id = "attilochit_assign_kkorrwrot",
	leftDialog = "@player_quest:attilochit_assign_kkorrwrot", --Go with honor!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_kkorrwrot);

attilochit_kkorrwrot_decline = ConvoScreen:new {
	id = "attilochit_kkorrwrot_decline",
	leftDialog = "@player_quest:attilochit_kkorrwrot_decline", --I expected better of you, young one.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_kkorrwrot_decline);

attilochit_check_kkorrwrot = ConvoScreen:new {
	id = "attilochit_check_kkorrwrot",
	leftDialog = "@player_quest:attilochit_check_kkorrwrot", --Another triumph? Show me the items from the kkorrwrot!
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_kkorrwrot_reply_01", "attilochit_kkorrwrot_success"}, --It wasn't easy, but here they are. 		
		--{"@player_quest:attilochit_check_kkorrwrot_reply_02", "attilochit_kkorrwrot_not_done"}, --I haven't had time to do this yet.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_kkorrwrot);

attilochit_kkorrwrot_success = ConvoScreen:new {
	id = "attilochit_kkorrwrot_success",
	leftDialog = "@player_quest:attilochit_kkorrwrot_success", --Many things worth doing are difficult, young one!  Take this for your efforts.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_kkorrwrot_success);

attilochit_kkorrwrot_not_done = ConvoScreen:new {
	id = "attilochit_kkorrwrot_not_done",
	leftDialog = "@player_quest:attilochit_kkorrwrot_not_done", --This is important!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_kkorrwrot_not_done);

attilochit_kkorrwrot_done = ConvoScreen:new {
	id = "attilochit_kkorrwrot_done",
	leftDialog = "@player_quest:attilochit_kkorrwrot_done", --Are you ready for your next trial?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_kkorrwrot_done_reply_01", "attilochit_offer_bantha"}, --I'm ready to be challenged!
		{"@player_quest:attilochit_kkorrwrot_done_reply_02", "attilochit_bantha_delay"}, --I will need to do this later.	
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_kkorrwrot_done);

attilochit_offer_bantha = ConvoScreen:new {
	id = "attilochit_offer_bantha",
	leftDialog = "@player_quest:attilochit_offer_bantha", --In this, I ask that you bring me 5 Kashyyyk bantha pelts.  The tribe has need of them.  You should also bring one of their heads to me.  You can find them on the Rryatt Trail.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_bantha_reply_01", "attilochit_assign_bantha"}, --This isn't a challenge!	
		{"@player_quest:attilochit_offer_bantha_reply_02", "attilochit_bantha_decline"}, --I need a break.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_bantha);

attilochit_bantha_delay = ConvoScreen:new {
	id = "attilochit_bantha_delay",
	leftDialog = "@player_quest:attilochit_bantha_delay", --If you must.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bantha_delay);

attilochit_assign_bantha = ConvoScreen:new {
	id = "attilochit_assign_bantha",
	leftDialog = "@player_quest:attilochit_assign_bantha", --Go with honor!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_bantha);

attilochit_bantha_decline = ConvoScreen:new {
	id = "attilochit_bantha_decline",
	leftDialog = "@player_quest:attilochit_bantha_decline", --Pah!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bantha_decline);

attilochit_check_bantha = ConvoScreen:new {
	id = "attilochit_check_bantha",
	leftDialog = "@player_quest:attilochit_check_bantha", --You return!  Were you able to collect the items from the Kashyyyk banthas?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_bantha_reply_01", "attilochit_bantha_success"}, --Here are the pelts you wanted, Elder.		
		--{"@player_quest:attilochit_check_bantha_reply_02", "attilochit_bantha_not_done"}, --I haven't quite managed to complete this trial.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_bantha);

attilochit_bantha_success = ConvoScreen:new {
	id = "attilochit_bantha_success",
	leftDialog = "@player_quest:attilochit_bantha_success", --Humbly done, young one. Here is a trophy for you.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bantha_success);

attilochit_bantha_not_done = ConvoScreen:new {
	id = "attilochit_bantha_not_done",
	leftDialog = "@player_quest:attilochit_bantha_not_done", --There is no time like the present!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bantha_not_done);

attilochit_bantha_done = ConvoScreen:new {
	id = "attilochit_bantha_done",
	leftDialog = "@player_quest:attilochit_bantha_done", --We at last come to the final challenge of your hrrtayyk ceremony!
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_bantha_done_reply_01", "attilochit_offer_bolotaur"}, --I am ready to face it.
		{"@player_quest:attilochit_bantha_done_reply_02", "attilochit_bolotaur_delay"}, --I need more time to prepare.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bantha_done);

attilochit_offer_bolotaur = ConvoScreen:new {
	id = "attilochit_offer_bolotaur",
	leftDialog = "@player_quest:attilochit_offer_bolotaur", --You will hunt the bolotaur in the Etyyy Hunting Grounds, and return with 5 fangs and the head of the largest one you can find.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_bolotaur_reply_01", "attilochit_assign_bolotaur"}, --I will soon complete my challenge!	
		{"@player_quest:attilochit_offer_bolotaur_reply_02", "attilochit_bolotaur_decline"}, --I am not ready!
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_bolotaur);

attilochit_bolotaur_delay = ConvoScreen:new {
	id = "attilochit_bolotaur_delay",
	leftDialog = "@player_quest:attilochit_bolotaur_delay", --Prepare, then return to me.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur_delay);

attilochit_assign_bolotaur = ConvoScreen:new {
	id = "attilochit_assign_bolotaur",
	leftDialog = "@player_quest:attilochit_assign_bolotaur", --Return triumphant!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_assign_bolotaur);

attilochit_bolotaur_decline = ConvoScreen:new {
	id = "attilochit_bolotaur_decline",
	leftDialog = "@player_quest:attilochit_bolotaur_decline", --You are as ready now as you have ever been.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur_decline);

attilochit_check_bolotaur = ConvoScreen:new {
	id = "attilochit_check_bolotaur",
	leftDialog = "@player_quest:attilochit_check_bolotaur", --You return - have you faced the bolotaur and brought me the items I require?
	stopConversation = "false",
	options = {
		--{"@player_quest:attilochit_check_bolotaur_reply_01", "attilochit_bolotaur_success"}, --Chieftain, I have your items.	
		--{"@player_quest:attilochit_check_bolotaur_reply_02", "attilochit_bolotaur_not_done"}, --Not yet, but soon!
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_check_bolotaur);

attilochit_bolotaur_success = ConvoScreen:new {
	id = "attilochit_bolotaur_success",
	leftDialog = "@player_quest:attilochit_bolotaur_success", --You have exceeded even my expectations, young one.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur_success);

attilochit_bolotaur_not_done = ConvoScreen:new {
	id = "attilochit_bolotaur_not_done",
	leftDialog = "@player_quest:attilochit_bolotaur_not_done", --Time is wasting!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur_not_done);

attilochit_bolotaur_done = ConvoScreen:new {
	id = "attilochit_bolotaur_done",
	leftDialog = "@player_quest:attilochit_bolotaur_done", --You have felt the inner strength of our people radiate through you? Your rrakktorr?
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_bolotaur_done_reply_01", "attilochit_bolotaur_done_next"}, --I have.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur_done);

attilochit_bolotaur_done_next = ConvoScreen:new {
	id = "attilochit_bolotaur_done_next",
	leftDialog = "@player_quest:attilochit_bolotaur_done_next", --You have completed all the tasks I set for your hrrtayyk ceremony. You are a full member of our tribe, we honor you!
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_bolotaur_done_next_reply_01", "attilochit_final"}, --Thank you, Chieftain.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur_done_next);

attilochit_offer_mount = ConvoScreen:new {
	id = "attilochit_offer_mount",
	leftDialog = "@player_quest:attilochit_offer_mount", --As an adult in our clan, you may have your choice of beast to ride.  Please, take the mount of your choice.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_offer_mount_reply_01", "attilochit_bantha"}, --I would like the Kashyyyk Bantha.
		{"@player_quest:attilochit_offer_mount_reply_02", "attilochit_bolotaur"}, --I would like the Bolotaur.
		{"@player_quest:attilochit_offer_mount_reply_03", "attilochit_mouf"}, --I would like the Mouf.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_offer_mount);


attilochit_final = ConvoScreen:new {
	id = "attilochit_final",
	leftDialog = "@player_quest:attilochit_final", --This relic is a symbol of what you have endured and experienced, what our people revere.  Take it and display it with pride.
	stopConversation = "false",
	options = {
		{"@player_quest:attilochit_final_reply_01", "attilochit_offer_mount"}, --I am honored, and will do my best to serve our clan.
	}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_final);

attilochit_bantha = ConvoScreen:new {
	id = "attilochit_bantha",
	leftDialog = "@player_quest:attilochit_bantha", --You have proven yourself to your people.  You are truly worthy to be called a member of this clan.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bantha);

attilochit_bolotaur = ConvoScreen:new {
	id = "attilochit_bolotaur",
	leftDialog = "@player_quest:attilochit_bolotaur", --You have proven yourself to your people.  You are truly worthy to be called a member of this clan.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_bolotaur);

attilochit_mouf = ConvoScreen:new {
	id = "attilochit_mouf",
	leftDialog = "@player_quest:attilochit_mouf", --You have proven yourself to your people.  You are truly worthy to be called a member of this clan.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_mouf);

attilochit_complete = ConvoScreen:new {
	id = "attilochit_complete",
	leftDialog = "@player_quest:attilochit_complete", --You have proven yourself to your people.  You are truly worthy to be called a member of this clan.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsAttilochitConvoTemplate:addScreen(attilochit_complete);

addConversationTemplate("LifeDayDreamsAttilochitConvoTemplate", LifeDayDreamsAttilochitConvoTemplate);

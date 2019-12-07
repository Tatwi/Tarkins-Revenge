-- //////////////////////////////////////////////////////
-- //	    LifeDayDreamsArritharConvoTemplate.lua     //
-- //                  Tarkin's Revenge                //
-- //                     Dec 2019                     //
-- //////////////////////////////////////////////////////


LifeDayDreamsArritharConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "LifeDayDreamsArritharConvoHandler",
	screens = {}
}

arrithar_intro = ConvoScreen:new {
	id = "arrithar_intro",
	leftDialog = "@player_quest:arrithar_intro", --Greetings, stranger.  I wish we were meeting on a happier day.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_intro_reply_01", "arrithar_01"}, --What is going on today?
		{"@player_quest:arrithar_intro_reply_02", "arrithar_02"}, --Happier day?
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_intro);

arrithar_01 = ConvoScreen:new {
	id = "arrithar_01",
	leftDialog = "@player_quest:arrithar_01", --Today we are grieving the loss of Rorryyhn, my son.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_01_reply_01", "arrithar_03"}, --I'm sorry for your loss.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_01);

arrithar_02 = ConvoScreen:new {
	id = "arrithar_02",
	leftDialog = "@player_quest:arrithar_02", --Yes, today we are mourning my son, Rorryyhn.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_01_reply_01", "arrithar_03"}, --I'm sorry for your loss.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_02);

arrithar_03 = ConvoScreen:new {
	id = "arrithar_03",
	leftDialog = "@player_quest:arrithar_03", --You are kind, friend. My son would have liked you, I feel it!
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_03_reply_01", "arrithar_04"}, --I feel I would have liked him, too.
		{"@player_quest:arrithar_03_reply_02", "arrithar_05"}, --You feel it? Are you a shaman or something?
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_03);

arrithar_04 = ConvoScreen:new {
	id = "arrithar_04",
	leftDialog = "@player_quest:arrithar_04", --You would, all did! It is a shame I am too unwell to do right by him.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_04_reply_01", "arrithar_06"}, --What do you mean?
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_04);

arrithar_05 = ConvoScreen:new {
	id = "arrithar_05",
	leftDialog = "@player_quest:arrithar_05", --No, no...just a father who is failing his son.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_04_reply_01", "arrithar_06"}, --What do you mean?
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_05);

arrithar_06 = ConvoScreen:new {
	id = "arrithar_06",
	leftDialog = "@player_quest:arrithar_06", --I have been ill, I am too weak to honor his funerary wishes.  And his children too young for the task.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_06_reply_01", "arrithar_07"}, --What were his last wishes? Maybe I can help?
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_06);

arrithar_07 = ConvoScreen:new {
	id = "arrithar_07",
	leftDialog = "@player_quest:arrithar_07", --Such kindness!  Ah, his wishes.  Rorryyhn had a favorite hunting spot as a young Wook.  He always spoke of having his ashes scattered on those grounds.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_07_reply_01", "arrithar_08"}, --That doesn't sound difficult.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_07);

arrithar_08 = ConvoScreen:new {
	id = "arrithar_08",
	leftDialog = "@player_quest:arrithar_08", --Yes, yes...normally.  The area is due north of here, to the west of a large lake at the mouth of a river, but there are Trandoshan slavers there now, and it is too dangerous for the young ones.  We shall have to spread his ashes elsewhere.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_08_reply_01", "arrithar_09"}, --I would be pleased to be of service.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_08);

arrithar_09 = ConvoScreen:new {
	id = "arrithar_09",
	leftDialog = "@player_quest:arrithar_09", --Oh, but I have nothing to offer to match that generosity!  Unless...yes!  I could gift you with a memento of my son.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_09_reply_01", "arrithar_10"}, --You do me honor, elder. 
		{"@player_quest:arrithar_09_reply_02", "arrithar_11"}, --I'm not sure what I'd do with something like that.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_09);

arrithar_10 = ConvoScreen:new {
	id = "arrithar_10",
	leftDialog = "@player_quest:arrithar_10", --This urn contains my noble son's ashes. Take care with them!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_10);

arrithar_11 = ConvoScreen:new {
	id = "arrithar_11",
	leftDialog = "@player_quest:arrithar_11", --I'm certain I could find something that would be worthy of the task...
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_11_reply_01", "arrithar_10"}, --Okay, then.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_11);

arrithar_12 = ConvoScreen:new {
	id = "arrithar_12",
	leftDialog = "@player_quest:arrithar_12", --You've returned!  Was your task completed successfully?  Are my son's ashes in the clearing where he found so much joy as a child?
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_12_reply_01", "arrithar_13"}, --Yes, wise one.  I've done as you asked.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_12);

arrithar_13 = ConvoScreen:new {
	id = "arrithar_13",
	leftDialog = "@player_quest:arrithar_13", --Bless you!  The spirits smile upon you!  Please, take Rorryyhn's shield, he and I made it together just before he married.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_13_reply_01", "arrithar_14"}, --Are you sure? This is too great a gift for one task.
		{"@player_quest:arrithar_13_reply_02", "arrithar_15"}, --Thanks!
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_13);

arrithar_14 = ConvoScreen:new {
	id = "arrithar_14",
	leftDialog = "@player_quest:arrithar_14", --Of course, of course.  My son dwells peacefully with the spirits, thanks to you!
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_14_reply_01", "arrithar_16"}, --It is very well-made.  I'll attach this blue feather I found in the clearing to it.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_14);

arrithar_15 = ConvoScreen:new {
	id = "arrithar_15",
	leftDialog = "@player_quest:arrithar_15", --Of course, of course.  My son dwells peacefully with the spirits, thanks to you!
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_15_reply_01", "arrithar_16"}, --I found this blue feather in the clearing.  I'll attach it to the shield in rememberance of this day.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_15);

arrithar_16 = ConvoScreen:new {
	id = "arrithar_16",
	leftDialog = "@player_quest:arrithar_16", --A blue feather you say?   May I see it?
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_16_reply_01", "arrithar_17"}, --Of course, elder.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_16);

arrithar_17 = ConvoScreen:new {
	id = "arrithar_17",
	leftDialog = "@player_quest:arrithar_17", --Oh...what's this now?  No, it can't be...can it?
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_17_reply_01", "arrithar_19"}, --I'm not sure...?
		{"@player_quest:arrithar_17_reply_02", "arrithar_18"}, --What's going on?
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_17);

arrithar_18 = ConvoScreen:new {
	id = "arrithar_18",
	leftDialog = "@player_quest:arrithar_18", --This looks to be...though some think it only legend!  I believe, friend, that you've found a tail feather of the rare Shyyyo bird! 
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_18_reply_01", "arrithar_20"}, --I found it on the ground where I scattered Rorryyhn's ashes.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_18);

arrithar_19 = ConvoScreen:new {
	id = "arrithar_19",
	leftDialog = "@player_quest:arrithar_19", --If this is what I believe it to be, it is from the rarest of Kashyyykian birds, so elusive it is considered myth!
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_18_reply_01", "arrithar_20"}, --I found it on the ground where I scattered Rorryyhn's ashes.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_19);

arrithar_20 = ConvoScreen:new {
	id = "arrithar_20",
	leftDialog = "@player_quest:arrithar_20", --You must return to the glen and try to spot the bird itself.  What a blessing to see one, how lucky!  Oh, if only I were well enough to go.
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_20_reply_01", "arrithar_21"}, --I will go search for it, elder. I will come back with word if I am lucky enough to see it.
		{"@player_quest:arrithar_20_reply_02", "arrithar_22"}, --It wasn't the easiest journey, maybe I'll pass.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_20);

arrithar_21 = ConvoScreen:new {
	id = "arrithar_21",
	leftDialog = "@player_quest:arrithar_21", --Thank you, friend!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_21);

arrithar_22 = ConvoScreen:new {
	id = "arrithar_22",
	leftDialog = "@player_quest:arrithar_22", --The spirits speak to us in such ways, stranger.  You must try to find the bird.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_22);

arrithar_23 = ConvoScreen:new {
	id = "arrithar_23",
	leftDialog = "@player_quest:arrithar_23", --Welcome back, friend.  Were you able to spot the elusive Shyyyo bird?
	stopConversation = "false",
	options = {
		--{"@player_quest:arrithar_23_reply_01", "arrithar_24"}, --I went back, but found nothing.
		--{"@player_quest:arrithar_23_reply_02", "arrithar_25"}, --I did better than that!
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_23);

arrithar_23 = ConvoScreen:new {
	id = "arrithar_23",
	leftDialog = "@player_quest:arrithar_23", --Welcome back, friend.  Were you able to spot the elusive Shyyyo bird?
	stopConversation = "false",
	options = {
		--{"@player_quest:arrithar_23_reply_01", "arrithar_24"}, --I went back, but found nothing.
		--{"@player_quest:arrithar_23_reply_01", "arrithar_25"}, --I did better than that!
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_23);

arrithar_24 = ConvoScreen:new {
	id = "arrithar_24",
	leftDialog = "@player_quest:arrithar_24", --What a great loss.  I thought, surely...the spirits would take pity upon this old Wookiee.
	stopConversation = "true",
	options = {}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_24);

arrithar_25 = ConvoScreen:new {
	id = "arrithar_25",
	leftDialog = "@player_quest:arrithar_25", --Oh?  What have you done?
	stopConversation = "false",
	options = {
		{"@player_quest:arrithar_25_reply_01", "arrithar_26"}, --I found a nest, and inside it, this egg.
		{"@player_quest:arrithar_25_reply_02", "arrithar_26"}, --I found this weird egg.
	}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_25);

arrithar_26 = ConvoScreen:new {
	id = "arrithar_26",
	leftDialog = "@player_quest:arrithar_26", --This must be the egg of a Shyyyo bird!  How magnificent and rare this treasure.  And look, it shakes!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_26);

arrithar_27 = ConvoScreen:new {
	id = "arrithar_27",
	leftDialog = "@player_quest:arrithar_27", --What a blessing!  The spirits honor my son's journey to the afterlife.  Thank you, friend!
	stopConversation = "true",
	options = {}
}
LifeDayDreamsArritharConvoTemplate:addScreen(arrithar_27);


addConversationTemplate("LifeDayDreamsArritharConvoTemplate", LifeDayDreamsArritharConvoTemplate);

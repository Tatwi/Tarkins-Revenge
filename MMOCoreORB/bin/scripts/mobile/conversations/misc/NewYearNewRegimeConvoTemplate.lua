-- //////////////////////////////////////////////////////
-- //	       NewYearNewRegimeConvoTemplate.lua       //
-- //                  Tarkin's Revenge                //
-- //             A Galactic Civil War Event           //
-- //                     Nov 2019                     //
-- //////////////////////////////////////////////////////


NewYearNewRegimeConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "NewYearNewRegimeConvoHandler",
	screens = {}
}

new_regime_intro = ConvoScreen:new {
	id = "new_regime_intro",
	leftDialog = "@player_quest:new_regime_intro", --Welcome to the "New Year, New Regime" war games event!  This month-long event ends at 11:59 PM on January 31, 2020.  Players choose a side and compete for points, resulting in one faction being declared the ultimate winner.  There will be prizes for players on the winning side in February.  You must be a member of a faction, and you can only join once per account.  Would you be interested in participating?
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_intro_reply_01", "new_regime_yes_join"}, --Yes, I would.
		{"@player_quest:new_regime_intro_reply_02", "new_regime_no_join"}, --No, I wouldn't.
		{"@player_quest:new_regime_intro_reply_03", "new_regime_learn"}, --I would like to ask some questions about how to earn points.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_intro);

new_regime_no_join = ConvoScreen:new {
	id = "new_regime_no_join",
	leftDialog = "@player_quest:new_regime_no_join", --Well, I'll be here through the end of the month if you change your mind!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_no_join);

new_regime_yes_join = ConvoScreen:new {
	id = "new_regime_yes_join",
	leftDialog = "@player_quest:new_regime_yes_join", --Which side would you like to declare your allegience to? Choose wisely, because you cannot change your mind later.  (This choice covers all characters on your account, you may not declare again on a different character.  Any characters you have that belong to the opposite faction of the choice you make now will not be able to participate).
	stopConversation = "false",
	options = {
		--{"@player_quest:new_regime_yes_join_reply_01", "new_regime_join_rebel"}, --I am a member of the Alliance against the Empire.  Join me up with the Rebel side.
		--{"@player_quest:new_regime_yes_join_reply_02", "new_regime_join_imperial"}, --I am a proud member of the Empire.  I will fight for the Imperial side.
		--{"@player_quest:new_regime_yes_join_reply_03", "new_regime_cant_join"}, --I guess I need to join a faction first, huh?
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_yes_join);

new_regime_join_rebel = ConvoScreen:new {
	id = "new_regime_join_rebel",
	leftDialog = "@player_quest:new_regime_join_rebel", --Excellent!  The Rebellion will be glad to have you on their team.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_join_reply_01", "new_regime_tell_me_more"}, --I would like to ask some questions.
		{"@player_quest:new_regime_join_reply_02", "new_regime_end_convo"}, --Thank you, I'll be leaving now.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_join_rebel);

new_regime_join_imperial = ConvoScreen:new {
	id = "new_regime_join_imperial",
	leftDialog = "@player_quest:new_regime_join_imperial", --Excellent!  The Empire will be glad to have you on their team.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_join_reply_01", "new_regime_tell_me_more"}, --I would like to ask some questions.
		{"@player_quest:new_regime_join_reply_02", "new_regime_end_convo"}, --Thank you, I'll be leaving now.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_join_imperial);

new_regime_cant_join = ConvoScreen:new {
	id = "new_regime_cant_join",
	leftDialog = "@player_quest:new_regime_cant_join", --Yes, you must belong to a faction to participate.  Please consult with a recruiter, then come back and speak to me.
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_cant_join);

new_regime_tell_me_more = ConvoScreen:new {
	id = "new_regime_tell_me_more",
	leftDialog = "@player_quest:new_regime_tell_me_more", --What can I help you with?
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_tell_me_more_reply_01", "new_regime_learn"}, --I would like to know more about ways to earn points.
		{"@player_quest:new_regime_tell_me_more_reply_02", "new_regime_player_points"}, --Can you tell me how many points I have?
		{"@player_quest:new_regime_tell_me_more_reply_03", "new_regime_score"}, --What is the current score?
		--{"@player_quest:new_regime_tell_me_more_reply_04", "new_regime_redeem_flag"}, --I would like to turn in my flags.
		--{"@player_quest:new_regime_tell_me_more_reply_05", "new_regime_redeem_points"}, --I would like to turn in my points.
		--{"@player_quest:new_regime_admin_reset_reply", "new_regime_admin_reset"}, --I am an admin and I want to reset this entire quest line.  (TO BE USED FOR TESTING ONLY)
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_tell_me_more);

new_regime_player_points = ConvoScreen:new {
	id = "new_regime_player_points",
	leftDialog = "@player_quest:new_regime_player_points", --I can!  Let me calculate... 
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_player_points);

new_regime_score = ConvoScreen:new {
	id = "new_regime_score",
	leftDialog = "@player_quest:new_regime_score", --Here is the current score:
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_score);

new_regime_redeem_flag = ConvoScreen:new {
	id = "new_regime_redeem_flag",
	leftDialog = "@player_quest:new_regime_redeem_flag", --I will take all the flags in your inventory, is this what you want to do?
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_redeem_reply_01", "new_regime_thank_flag"}, --Yes
		{"@player_quest:new_regime_redeem_reply_02", "new_regime_tell_me_more"}, --No
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_redeem_flag);

new_regime_thank_flag = ConvoScreen:new {
	id = "new_regime_thank_flag",
	leftDialog = "@player_quest:new_regime_thank_flag", --Your faction thanks you for your service!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_thank_flag);

new_regime_redeem_points = ConvoScreen:new {
	id = "new_regime_redeem_points",
	leftDialog = "@player_quest:new_regime_redeem_points", --I will redeem all the points you have, is this what you want to do?
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_redeem_reply_01", "new_regime_thank_points"}, --Yes
		{"@player_quest:new_regime_redeem_reply_02", "new_regime_tell_me_more"}, --No
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_redeem_points);

new_regime_thank_points = ConvoScreen:new {
	id = "new_regime_thank_points",
	leftDialog = "@player_quest:new_regime_thank_points", --Your faction thanks you for your service!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_thank_points);

new_regime_learn = ConvoScreen:new {
	id = "new_regime_learn",
	leftDialog = "@player_quest:new_regime_learn", --Of course, which aspect would you like to learn more about?
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_learn_reply_01", "new_regime_teach_pvp"}, --PvP
		{"@player_quest:new_regime_learn_reply_02", "new_regime_teach_pve"}, --PvE
		{"@player_quest:new_regime_learn_reply_03", "new_regime_teach_flag"}, --Capture the Flag
		{"@player_quest:new_regime_learn_reply_04", "new_regime_teach_signpost"}, --Slicing Signposts
		{"@player_quest:new_regime_learn_reply_05", "new_regime_teach_base"}, --Base Busting
		{"@player_quest:new_regime_learn_reply_06", "new_regime_teach_squad_leader"}, --Squad Leader Bonus Points
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_learn);

new_regime_end_convo = ConvoScreen:new {
	id = "new_regime_end_convo",
	leftDialog = "@player_quest:new_regime_end_convo", --Good luck!  And remember that you must turn in your points to me before they will count in the Galactic Fight!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_end_convo);

new_regime_teach_pvp = ConvoScreen:new {
	id = "new_regime_teach_pvp",
	leftDialog = "@player_quest:new_regime_teach_pvp", --If you kill another player who is an overt member of the opposite faction, AND they are a participant in the Games for that faction, you will be awarded 100 points for the kill.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_teach_reply_01", "new_regime_tell_me_more"}, --I have another question.
		{"@player_quest:new_regime_teach_reply_02", "new_regime_end_convo"}, --Thank you, that answers all my questions.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_teach_pvp);

new_regime_teach_pve = ConvoScreen:new {
	id = "new_regime_teach_pve",
	leftDialog = "@player_quest:new_regime_teach_pve", --If you kill a non-player character of the opposite faction while overt, you will be awarded 2 points for the kill.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_teach_reply_01", "new_regime_tell_me_more"}, --I have another question.
		{"@player_quest:new_regime_teach_reply_02", "new_regime_end_convo"}, --Thank you, that answers all my questions.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_teach_pve);

new_regime_teach_flag = ConvoScreen:new {
	id = "new_regime_teach_flag",
	leftDialog = "@player_quest:new_regime_teach_flag", --If you are a participant and see one of the factional flags out on your travels, you may capture it, and bring it back to me for points!  Your own faction's flags are worth two points, and the opposite faction's flags are worth five points.  Flags may appear in any city that has a starport, even on adventure planets.  Every six hours for the duration of the event, every flag left standing will disappear, and 100 new flags will be generated.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_teach_reply_01", "new_regime_tell_me_more"}, --I have another question.
		{"@player_quest:new_regime_teach_reply_02", "new_regime_end_convo"}, --Thank you, that answers all my questions.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_teach_flag);

new_regime_teach_signpost = ConvoScreen:new {
	id = "new_regime_teach_signpost",
	leftDialog = "@player_quest:new_regime_teach_signpost", --Any smuggler who is participating in the event can compromise the opposite faction's signposts.  These can appear in any city that has a starport, and there are 20 of them located throughout the galaxy, 10 for each faction.  If you try to "slice" the signpost, and you succeed, it will appear as defaced, and you will earn 10 points.  The opposite faction may discover what you have done, and restore the signpost's appearance, so be sure to check back!  And if you see any of your faction's signposts that have been defaced, a smuggler of your own faction can attempt to restore them.  Slicing and restoring signposts sometimes works, and sometimes it does not.  If you fail, you won't be able to re-attempt until the signpost has been flipped.  Signposts will be reset in new locations once each day.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_teach_reply_01", "new_regime_tell_me_more"}, --I have another question.
		{"@player_quest:new_regime_teach_reply_02", "new_regime_end_convo"}, --Thank you, that answers all my questions.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_teach_signpost);

new_regime_teach_base = ConvoScreen:new {
	id = "new_regime_teach_base",
	leftDialog = "@player_quest:new_regime_teach_base", --There is a flippable base located at 1945, 4135, Tatooine.  If you find it is occupied by the opposite faction, you and a team can take a participating bio-engineer into the base to attempt to flip it.  When you reach the halfway point, the bio-engineer must enter the first DNA sequence.  This sends out a broadcast galaxy-wide that you are attacking the base.  Player defenders may come to prevent your takeover.  If you reach the bottom of the base without the first DNA sequence being reversed by other players, the bio-engineer can enter the second DNA sequence, and flip the base for 500 points!
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_teach_reply_01", "new_regime_tell_me_more"}, --I have another question.
		{"@player_quest:new_regime_teach_reply_02", "new_regime_end_convo"}, --Thank you, that answers all my questions.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_teach_base);

new_regime_teach_squad_leader = ConvoScreen:new {
	id = "new_regime_teach_squad_leader",
	leftDialog = "@player_quest:new_regime_teach_squad_leader", --If you complete any activity that earns you points while in a group lead by a Squad Leader of your same faction who is also participating in the Games (they do not have to be in proximity to you), you gain an automatic points bonus - 10% or 1 point, whichever is greater.
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_teach_reply_01", "new_regime_tell_me_more"}, --I have another question.
		{"@player_quest:new_regime_teach_reply_02", "new_regime_end_convo"}, --Thank you, that answers all my questions.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_teach_squad_leader);

new_regime_event_over = ConvoScreen:new {
	id = "new_regime_event_over",
	leftDialog = "@player_quest:new_regime_event_over", --The Games have ended.  Though both sides fought bravely, only one was victorious.  How can I help you?
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_event_over_reply_01", "new_regime_state_winner"}, --Who won?  What was the final score?
		--{"@player_quest:new_regime_event_over_reply_02", "new_regime_claim_rewards"}, --I would like to claim my rewards.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_event_over);

new_regime_state_winner = ConvoScreen:new {
	id = "new_regime_state_winner",
	leftDialog = "@player_quest:new_regime_state_winner", --Let me see here...
	stopConversation = "false",
	options = {
		{"@player_quest:new_regime_state_winner_reply_01", "new_regime_over_end"}, --Thank you.
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_state_winner);

new_regime_over_end = ConvoScreen:new {
	id = "new_regime_over_end",
	leftDialog = "@player_quest:new_regime_over_end", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_over_end);

new_regime_claim_rewards = ConvoScreen:new {
	id = "new_regime_claim_rewards",
	leftDialog = "@player_quest:new_regime_claim_rewards", --Congratulations, brave soldier!  The following rewards are available to you, you may claim them all.
	stopConversation = "false",
	options = {
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_01_imp", "new_regime_select_reward_1_imp"}, --Galaxy at War Winner Badge
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_02_imp", "new_regime_select_reward_2_imp"}, --Shadow Box Display
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_03_imp", "new_regime_select_reward_3_imp"}, --Imperial Vistas Painting
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_04_imp", "new_regime_select_reward_4_imp"}, --Order 66 Cookies Schematic
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_05_imp", "new_regime_select_reward_5_imp"}, --Interwoven Composite Armor Segment Schematic
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_01_reb", "new_regime_select_reward_1_reb"}, --Galaxy at War Winner Badge
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_02_reb", "new_regime_select_reward_2_reb"}, --Shadow Box Display
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_03_reb", "new_regime_select_reward_3_reb"}, --Rebel Vistas Painting
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_04_reb", "new_regime_select_reward_4_reb"}, --Death Star Destruction Soda Schematic
		--{"@player_quest:new_regime_new_regime_claim_rewards_reply_05_reb", "new_regime_select_reward_5_reb"}, --Interwoven Composite Armor Segment Schematic
	}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_claim_rewards);

new_regime_select_reward_1_imp = ConvoScreen:new {
	id = "new_regime_select_reward_1_imp",
	leftDialog = "@player_quest:new_regime_select_reward_1_imp", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_1_imp);

new_regime_select_reward_2_imp = ConvoScreen:new {
	id = "new_regime_select_reward_2_imp",
	leftDialog = "@player_quest:new_regime_select_reward_2_imp", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_2_imp);

new_regime_select_reward_3_imp = ConvoScreen:new {
	id = "new_regime_select_reward_3_imp",
	leftDialog = "@player_quest:new_regime_select_reward_3_imp", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_3_imp);

new_regime_select_reward_4_imp = ConvoScreen:new {
	id = "new_regime_select_reward_4_imp",
	leftDialog = "@player_quest:new_regime_select_reward_4_imp", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_4_imp);

new_regime_select_reward_5_imp = ConvoScreen:new {
	id = "new_regime_select_reward_5_imp",
	leftDialog = "@player_quest:new_regime_select_reward_5_imp", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_5_imp);

new_regime_select_reward_1_reb = ConvoScreen:new {
	id = "new_regime_select_reward_1_reb",
	leftDialog = "@player_quest:new_regime_select_reward_1_reb", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_1_reb);

new_regime_select_reward_2_reb = ConvoScreen:new {
	id = "new_regime_select_reward_2_reb",
	leftDialog = "@player_quest:new_regime_select_reward_2_reb", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_2_reb);

new_regime_select_reward_3_reb = ConvoScreen:new {
	id = "new_regime_select_reward_3_reb",
	leftDialog = "@player_quest:new_regime_select_reward_3_reb", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_3_reb);

new_regime_select_reward_4_reb = ConvoScreen:new {
	id = "new_regime_select_reward_4_reb",
	leftDialog = "@player_quest:new_regime_select_reward_4_reb", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_4_reb);

new_regime_select_reward_5_reb = ConvoScreen:new {
	id = "new_regime_select_reward_5_reb",
	leftDialog = "@player_quest:new_regime_select_reward_5_reb", --Luck and success to you in the new year!
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_select_reward_5_reb);

new_regime_admin_reset = ConvoScreen:new { --FOR TESTING ONLY
	id = "new_regime_admin_reset",
	leftDialog = "@player_quest:new_regime_admin_reset", --This quest line has been reset.
	stopConversation = "true",
	options = {}
}
NewYearNewRegimeConvoTemplate:addScreen(new_regime_admin_reset);

addConversationTemplate("NewYearNewRegimeConvoTemplate", NewYearNewRegimeConvoTemplate);


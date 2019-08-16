--Copyright (C) 2007 <SWGEmu>

--This File is part of Core3.

--This program is free software; you can redistribute
--it and/or modify it under the terms of the GNU Lesser
--General Public License as published by the Free Software
--Foundation; either version 2 of the License,
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules
--is making a combined work based on Engine3.
--Thus, the terms and conditions of the GNU Lesser General Public License
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3
--give you permission to combine Engine3 program with free software
--programs or libraries that are released under the GNU LGPL and with
--code included in the standard release of Core3 under the GNU LGPL
--license (or modified versions of such code, with unchanged license).
--You may copy and distribute such a system following the terms of the
--GNU LGPL for Engine3 and the licenses of the other code concerned,
--provided that you include the source code of that other code when
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated
--to grant this special exception for their modified versions;
--it is their choice whether to do so. The GNU Lesser General Public License
--gives permission to release a modified version without this exception;
--this exception also makes it possible to release a modified version
--which carries forward this exception.

-----------------------------------
--GENERAL PLAYER SETTINGS
-----------------------------------

onlineCharactersPerAccount = 3 --How many characters are allowed online from a single account.
allowSameAccountPvpRatingCredit = 0

--Blue frog / GM buff values
performanceBuff = 600
medicalBuff = 600
performanceDuration = 7200 -- in seconds
medicalDuration = 7200 -- in seconds

--Sets the experience multiplier while grouped
groupExpMultiplier = 1.0

--Sets a global experience multiplier
globalExpMultiplier = 4.0

--Sets the base number of control devices of each type that a player can have in their datapad at once
--For creature pets, A Creature Handler will have the base number + their stored pets skill mod as limit
baseStoredCreaturePets = 10
baseStoredFactionPets = 3
baseStoredDroids = 5
baseStoredVehicles = 10
baseStoredShips = 3

-----------------------------------
--VETERAN REWARDS CONFIG
-----------------------------------
veteranRewardMilestones = {90, 180, 270, 360, 450, 540, 630, 720, 810, 900, 990, 1080} --days, must be sorted low to high

veteranRewardAdditionalMilestones = 360 --frequency, in days, of additional milestones (beyond the established ones)

veteranRewards = {

		-- 90 Day Rewards
		{templateFile = "object/tangible/veteran_reward/resource.iff", milestone=90, oneTime=false, description="A Crate of Free Resources"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s1.iff", milestone=90, oneTime=false, description="@veteran_new:dataterminal1"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s2.iff", milestone=90, oneTime=false, description="@veteran_new:dataterminal2"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s3.iff", milestone=90, oneTime=false, description="@veteran_new:dataterminal3"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s4.iff", milestone=90, oneTime=false, description="@veteran_new:dataterminal4"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_protocol_droid_toy.iff", milestone=90, oneTime=false, description="@veteran_new:mini_protocoldroid"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_r2_toy.iff", milestone=90, oneTime=false, description="@veteran_new:mini_r2"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_small_naboo_house.iff", milestone=90, oneTime=false, description="Guy Remmington's Architect Model (Small Naboo House)"},
		{templateFile = "object/tangible/furniture/decorative/event_chewbacca_toy.iff", milestone=90, oneTime=false, description="Wookiee Hero Figurine"},
		{templateFile = "object/tangible/furniture/decorative/hologram_nebulon_frigate.iff", milestone=90, oneTime=false, description="Hologram of EF76 Nebulon-B"},
		{templateFile = "object/tangible/tcg/series3/decorative_boba_fett_statue.iff", milestone=90, oneTime=false, description="Boba Fett Statue"},
		{templateFile = "object/tangible/tcg/series4/consumable_t16_toy.iff", milestone=90, oneTime=false, description="T-16 Skyhopper Toy"},
		{templateFile = "object/tangible/tcg/series6/diorama_han_greedo.iff", milestone=90, oneTime=false, description="Han and Greedo Diorama"},
		{templateFile = "object/tangible/tcg/series7/diorama_max_rebo.iff", milestone=90, oneTime=false, description="Max Rebo Band Diorama"},
		{templateFile = "object/tangible/tcg/series8/decorative_palpatine_hologram.iff", milestone=90, oneTime=false, description="Emperor Palpatine Hologram"},
		{templateFile = "object/tangible/tcg/series8/diorama_yoda_xwing.iff", milestone=90, oneTime=false, description="Yoda Raising X-Wing Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_atat_toy.iff", milestone=90, oneTime=false, description="Miniature AT-AT Replica"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_imperial_guard.iff", milestone=90, oneTime=false, description="Imperial Guard Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_jawa.iff", milestone=90, oneTime=false, description="Jawa Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_luke_skywalker.iff", milestone=90, oneTime=false, description="Luke Skywalker Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_sandcrawler.iff", milestone=90, oneTime=false, description="Jawa Sandcrawler Hologram"},
		{templateFile = "object/tangible/item/market/facebook_reward_02.iff", milestone=90, oneTime=false, description="Bobble-Head C-3PO"},

		-- 180 Day Rewards
		{templateFile = "object/tangible/veteran_reward/frn_couch_falcon_corner_s01.iff", milestone=180, oneTime=false, description="@veteran_new:falconcouch"},
		{templateFile = "object/tangible/veteran_reward/frn_couch_falcon_section_s01.iff", milestone=180, oneTime=false, description="@veteran_new:falconchair"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_tie_fighter_toy.iff", milestone=180, oneTime=false, description="@veteran_new:mini_tiefighter"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_x_wing_toy.iff", milestone=180, oneTime=false, description="@veteran_new:mini_xwing"},
		{templateFile = "object/tangible/furniture/all/event_flag_game_imp_banner.iff", milestone=180, oneTime=false, description="Imperial Banner"},
		{templateFile = "object/tangible/furniture/all/event_flag_game_neut_banner.iff", milestone=180, oneTime=false, description="Neutral Banner"},
		{templateFile = "object/tangible/furniture/all/event_flag_game_reb_banner.iff", milestone=180, oneTime=false, description="Rebel Banner"},
		{templateFile = "object/tangible/event_perk/frn_hologram_data_disk_s01.iff", milestone=180, oneTime=false, description="Datadisc Hologram (Style 1)"},
		{templateFile = "object/tangible/event_perk/frn_hologram_data_disk_s02.iff", milestone=180, oneTime=false, description="Datadisc Hologram (Style 2)"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_cityhall_naboo.iff", milestone=180, oneTime=false, description="An Architect's Rendition of a Nabooian City Hall"},
		{templateFile = "object/tangible/furniture/decorative/hologram_xwing.iff", milestone=180, oneTime=false, description="Xwing Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_insignia_imperial_01.iff", milestone=180, oneTime=false, description="Imperial Insignia Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_insignia_rebel_01.iff", milestone=180, oneTime=false, description="Rebel Insignia Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_stardestroyer_01.iff", milestone=180, oneTime=false, description="Star Destroyer Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_tiefighter_01.iff", milestone=180, oneTime=false, description="TIE Fighter Hologram"},
		{templateFile = "object/tangible/tcg/series3/decorative_jango_fett_memorial_statue.iff", milestone=180, oneTime=false, description="Jango Fett Memorial Statue"},
		{templateFile = "object/tangible/tcg/series4/decorative_han_solo_statuette.iff", milestone=180, oneTime=false, description="Han Solo Statuette"},
		{templateFile = "object/tangible/tcg/series4/decorative_leia_r2_diorama.iff", milestone=180, oneTime=false, description="Princess Leia & R2-D2 Diorama"},
		{templateFile = "object/tangible/tcg/series5/decorative_deathstar_hologram.iff", milestone=180, oneTime=false, description="Death Star Under Construction Hologram"},
		{templateFile = "object/tangible/tcg/series5/decorative_skywalker_statuette.iff", milestone=180, oneTime=false, description="Luke Skywalker Statuette"},
		{templateFile = "object/tangible/tcg/series8/diorama_exogorth_crater.iff", milestone=180, oneTime=false, description="Hungry Exorgoth Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_boba_toy.iff", milestone=180, oneTime=false, description="Miniature Boba Fett Replica"},
		{templateFile = "object/tangible/tcg/series5/combine_object_atat_statuette.iff", milestone=180, oneTime=false, description="AT-AT Statuette"},
		{templateFile = "object/tangible/loot/creature_loot/collections/opt_in_mail_05.iff", milestone=180, oneTime=false, description="Bobble-Head TK-555"},
		{templateFile = "object/tangible/item/market/facebook_reward_01.iff", milestone=180, oneTime=false, description="Bobble-Head Stormtrooper Squad Leader"},

		-- 270 Day Rewards
		{templateFile = "object/tangible/deed/vehicle_deed/speederbike_flash_deed.iff", milestone=270, oneTime=true},
		{templateFile = "object/tangible/wearables/goggles/goggles_s01.iff", milestone=270, oneTime=false, description="Special Edition Goggles Style 1"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s02.iff", milestone=270, oneTime=false, description="Special Edition Goggles Style 2"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s03.iff", milestone=270, oneTime=false, description="Special Edition Goggles Style 3"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s04.iff", milestone=270, oneTime=false, description="Special Edition Goggles Style 4"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s05.iff", milestone=270, oneTime=false, description="Special Edition Goggles Style 5"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s06.iff", milestone=270, oneTime=false, description="Special Edition Goggles Style 6"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_darth_vader_toy.iff", milestone=270, oneTime=false, description="@veteran_new:mini_darthvader"},
		{templateFile = "object/tangible/tcg/series5/decorative_trench_run_diorama.iff", milestone=270, oneTime=false, description="Trench Run Diorama"},
		{templateFile = "object/tangible/buildout/event/empire_day_emperor_statue.iff", milestone=270, oneTime=false, description="Statue of the Emperor"},
		{templateFile = "object/tangible/furniture/all/frn_all_escape_pod_statuette.iff", milestone=270, oneTime=false, description="Escape Pod Statuette"},
		{templateFile = "object/tangible/tcg/series1/decorative_statuette_princess_leia.iff", milestone=270, oneTime=false, description="Princess Leia Statuette"},
		{templateFile = "object/tangible/tcg/series6/combine_object_hk47_mustafar_diorama.iff", milestone=270, oneTime=false, description="HK-47 Mustafar Diorama"},
		{templateFile = "object/tangible/tcg/series6/statuette_lando.iff", milestone=270, oneTime=false, description="Lando Statuette"},
		{templateFile = "object/tangible/tcg/series7/diorama_firgrin_dan.iff", milestone=270, oneTime=false, description="Figrin D'an Band Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_corvette.iff", milestone=270, oneTime=false, description="Corellian Corvette Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_darth_vader.iff", milestone=270, oneTime=false, description="Darth Vader Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_deathstar.iff", milestone=270, oneTime=false, description="Death Star Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_leia.iff", milestone=270, oneTime=false, description="Princess Leia Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_yoda.iff", milestone=270, oneTime=false, description="Jedi Master Yoda Hologram"},
		{templateFile = "object/tangible/tcg/series4/decorative_chewbacca_statuette.iff", milestone=270, oneTime=false, description="Chewbacca Statuette"},
		{templateFile = "object/tangible/tcg/series8/decorative_r2d2_dagobah.iff", milestone=270, oneTime=false, description="R2-D2 on Dagobah Statue"},
		{templateFile = "object/tangible/loot/creature_loot/collections/opt_in_mail_08.iff", milestone=270, oneTime=false, description="Bobble-Head Death Trooper"},

		-- 360 Day Rewards
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_a.iff", milestone=360, oneTime=false, description="@veteran_new:techconsole_a"},
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_b.iff", milestone=360, oneTime=false, description="@veteran_new:techconsole_b"},
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_c.iff", milestone=360, oneTime=false, description="@veteran_new:techconsole_c"},
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_d.iff", milestone=360, oneTime=false, description="@veteran_new:techconsole_d"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_jabba_toy.iff", milestone=360, oneTime=false, description="@veteran_new:mini_jabba"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_stormtrooper_toy.iff", milestone=360, oneTime=false, description="@veteran_new:mini_stormtrooper"},
		{templateFile = "object/tangible/tcg/series8/diorama_bespin_city.iff", milestone=360, oneTime=false, description="The Heights of Cloud City Diorama"},
		{templateFile = "object/tangible/event_perk/lifeday_holo_table.iff", milestone=360, oneTime=false, description="Holo-Entertainment Table"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_jabba_palace.iff", milestone=360, oneTime=false, description="An Architect's Rendition of Jabba's Palace"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_yt1300_01.iff", milestone=360, oneTime=false, description="YT-1300 Hologram"},
		{templateFile = "object/tangible/item/som/jundak_hunter_hologram.iff", milestone=360, oneTime=false, description="Medical Hologram (Mustafarian)"},
		{templateFile = "object/tangible/item/som/frn_holo_mustafarian_c.iff", milestone=360, oneTime=false, description="Mustafarian Hologram"},
		{templateFile = "object/tangible/tcg/series1/decorative_statuette_darth_vader.iff", milestone=360, oneTime=false, description="Darth Vader Statuette"},
		{templateFile = "object/tangible/tcg/series3/decorative_darth_vader_obi_wan_diorama.iff", milestone=360, oneTime=false, description="Darth Vader vs. Obi-Wan Kenobi Diorama"},
		{templateFile = "object/tangible/tcg/series6/diorama_jedi_council.iff", milestone=360, oneTime=false, description="Jedi Council Diorama"},
		{templateFile = "object/tangible/veteran_reward/darth_maul_statue.iff", milestone=360, oneTime=false, description="Darth Maul Statue"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_lambda.iff", milestone=360, oneTime=false, description="Lambda Shuttle Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_starfighter.iff", milestone=360, oneTime=false, description="Jedi Starfighter Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_tusken_raider_toy.iff", milestone=360, oneTime=false, description="Miniature Tusken Raider Replica"},
		{templateFile = "object/tangible/tcg/series4/decorative_tauntaun_ride.iff", milestone=360, oneTime=false, description="Antique Tauntaun Ride"},
		{templateFile = "object/tangible/item/market/yoda_bobble_head.iff", milestone=360, oneTime=false, description="Bobble-Head Yoda"},

		-- 450 Day Rewards
		{templateFile = "object/tangible/camp/camp_spit_s2.iff", milestone=450, oneTime=false, description="Camp Center (Small)"},
		{templateFile = "object/tangible/camp/camp_spit_s3.iff", milestone=450, oneTime=false, description="Camp Center (Large)"},
		{templateFile = "object/tangible/loot/misc/loot_skull_bith.iff", milestone=450, oneTime=false, description="A Bith Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_human.iff", milestone=450, oneTime=false, description="A Human Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_ithorian.iff", milestone=450, oneTime=false, description="A Ithorian Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_thune.iff", milestone=450, oneTime=false, description="A Thune Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_voritor.iff", milestone=450, oneTime=false, description="A Voritor Lizard Skull"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_kash_treecity.iff", milestone=450, oneTime=false, description="An Architect's Rendition of the Great Tree From Kachiro"},
		{templateFile = "object/tangible/furniture/ep3_rewards/avatar_hologram_squid.iff", milestone=450, oneTime=false, description="Jellyfish Hologram"},
		{templateFile = "object/tangible/hologram/hologram_hk47.iff", milestone=450, oneTime=false, description="HK-47 Hologram"},
		{templateFile = "object/tangible/hologram/hologram_ff_space_battle_2010.iff", milestone=450, oneTime=false, description="Hologram of a Space Battle"},
		{templateFile = "object/tangible/tcg/series5/combine_object_vader_statuette.iff", milestone=450, oneTime=false, description="Kneeling Vader Statuette"},
		{templateFile = "object/tangible/tcg/series5/decorative_mustafar_diorama.iff", milestone=450, oneTime=false, description="Mustafar Diorama"},
		{templateFile = "object/tangible/tcg/series6/hologram_cloud_city.iff", milestone=450, oneTime=false, description="Cloud City Hologram"},
		{templateFile = "object/tangible/tcg/series8/diorama_atat_attack.iff", milestone=450, oneTime=false, description="Raid on Echo Base Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_salacious_crumb_toy.iff", milestone=450, oneTime=false, description="Miniature Salacious Crumb Replica"},
		{templateFile = "object/tangible/veteran_reward/mace_windu_statue.iff", milestone=450, oneTime=false, description="Mace Windu Statue"},
		{templateFile = "object/tangible/tcg/series3/decorative_emperor_palpatine_statuette.iff", milestone=450, oneTime=false, description="Emperor Palpatine Statuette"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_jedi_temple.iff", milestone=450, oneTime=false, description="Jedi Temple"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_jedi_temple_burning.iff", milestone=450, oneTime=false, description="Jedi Temple Ruins"},
		{templateFile = "object/tangible/loot/creature_loot/collections/opt_in_mail_04.iff", milestone=450, oneTime=false, description="Battlefield Diorama"},

		-- 540 Day Rewards
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_01.iff", milestone=540, oneTime=false, description="Painting: Cast Wing in Flight"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_02.iff", milestone=540, oneTime=false, description="Painting: Decimator"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_03.iff", milestone=540, oneTime=false, description="Painting: Tatooine Dune Speeder"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_04.iff", milestone=540, oneTime=false, description="Painting: Weapon of War"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_05.iff", milestone=540, oneTime=false, description="Painting: Fighter Study"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_06.iff", milestone=540, oneTime=false, description="Painting: Hutt Greed"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_07.iff", milestone=540, oneTime=false, description="Painting: Smuggler's Run"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_08.iff", milestone=540, oneTime=false, description="Painting: Imperial Oppression (TIE Oppressor)"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_09.iff", milestone=540, oneTime=false, description="Painting: Emperor's Eyes (TIE Sentinel)"},

		-- 630 Day Rewards
		{templateFile = "object/tangible/veteran_reward/resource.iff", milestone=630, oneTime=false, description="A Crate of Free Resources"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s1.iff", milestone=630, oneTime=false, description="@veteran_new:dataterminal1"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s2.iff", milestone=630, oneTime=false, description="@veteran_new:dataterminal2"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s3.iff", milestone=630, oneTime=false, description="@veteran_new:dataterminal3"},
		{templateFile = "object/tangible/veteran_reward/data_terminal_s4.iff", milestone=630, oneTime=false, description="@veteran_new:dataterminal4"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_protocol_droid_toy.iff", milestone=630, oneTime=false, description="@veteran_new:mini_protocoldroid"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_r2_toy.iff", milestone=630, oneTime=false, description="@veteran_new:mini_r2"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_small_naboo_house.iff", milestone=630, oneTime=false, description="Guy Remmington's Architect Model (Small Naboo House)"},
		{templateFile = "object/tangible/furniture/decorative/event_chewbacca_toy.iff", milestone=630, oneTime=false, description="Wookiee Hero Figurine"},
		{templateFile = "object/tangible/furniture/decorative/hologram_nebulon_frigate.iff", milestone=630, oneTime=false, description="Hologram of EF76 Nebulon-B"},
		{templateFile = "object/tangible/tcg/series3/decorative_boba_fett_statue.iff", milestone=630, oneTime=false, description="Boba Fett Statue"},
		{templateFile = "object/tangible/tcg/series4/consumable_t16_toy.iff", milestone=630, oneTime=false, description="T-16 Skyhopper Toy"},
		{templateFile = "object/tangible/tcg/series6/diorama_han_greedo.iff", milestone=630, oneTime=false, description="Han and Greedo Diorama"},
		{templateFile = "object/tangible/tcg/series7/diorama_max_rebo.iff", milestone=630, oneTime=false, description="Max Rebo Band Diorama"},
		{templateFile = "object/tangible/tcg/series8/decorative_palpatine_hologram.iff", milestone=630, oneTime=false, description="Emperor Palpatine Hologram"},
		{templateFile = "object/tangible/tcg/series8/diorama_yoda_xwing.iff", milestone=630, oneTime=false, description="Yoda Raising X-Wing Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_atat_toy.iff", milestone=630, oneTime=false, description="Miniature AT-AT Replica"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_imperial_guard.iff", milestone=630, oneTime=false, description="Imperial Guard Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_jawa.iff", milestone=630, oneTime=false, description="Jawa Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_luke_skywalker.iff", milestone=630, oneTime=false, description="Luke Skywalker Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_sandcrawler.iff", milestone=630, oneTime=false, description="Jawa Sandcrawler Hologram"},
		{templateFile = "object/tangible/item/market/facebook_reward_02.iff", milestone=630, oneTime=false, description="Bobble-Head C-3PO"},

		-- 720 Day Rewards
		{templateFile = "object/tangible/veteran_reward/frn_couch_falcon_corner_s01.iff", milestone=720, oneTime=false, description="@veteran_new:falconcouch"},
		{templateFile = "object/tangible/veteran_reward/frn_couch_falcon_section_s01.iff", milestone=720, oneTime=false, description="@veteran_new:falconchair"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_tie_fighter_toy.iff", milestone=720, oneTime=false, description="@veteran_new:mini_tiefighter"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_x_wing_toy.iff", milestone=720, oneTime=false, description="@veteran_new:mini_xwing"},
		{templateFile = "object/tangible/furniture/all/event_flag_game_imp_banner.iff", milestone=720, oneTime=false, description="Imperial Banner"},
		{templateFile = "object/tangible/furniture/all/event_flag_game_neut_banner.iff", milestone=720, oneTime=false, description="Neutral Banner"},
		{templateFile = "object/tangible/furniture/all/event_flag_game_reb_banner.iff", milestone=720, oneTime=false, description="Rebel Banner"},
		{templateFile = "object/tangible/event_perk/frn_hologram_data_disk_s01.iff", milestone=720, oneTime=false, description="Datadisc Hologram (Style 1)"},
		{templateFile = "object/tangible/event_perk/frn_hologram_data_disk_s02.iff", milestone=720, oneTime=false, description="Datadisc Hologram (Style 2)"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_cityhall_naboo.iff", milestone=720, oneTime=false, description="An Architect's Rendition of a Nabooian City Hall"},
		{templateFile = "object/tangible/furniture/decorative/hologram_xwing.iff", milestone=720, oneTime=false, description="Xwing Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_insignia_imperial_01.iff", milestone=720, oneTime=false, description="Imperial Insignia Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_insignia_rebel_01.iff", milestone=720, oneTime=false, description="Rebel Insignia Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_stardestroyer_01.iff", milestone=720, oneTime=false, description="Star Destroyer Hologram"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_tiefighter_01.iff", milestone=720, oneTime=false, description="TIE Fighter Hologram"},
		{templateFile = "object/tangible/tcg/series3/decorative_jango_fett_memorial_statue.iff", milestone=720, oneTime=false, description="Jango Fett Memorial Statue"},
		{templateFile = "object/tangible/tcg/series4/decorative_han_solo_statuette.iff", milestone=720, oneTime=false, description="Han Solo Statuette"},
		{templateFile = "object/tangible/tcg/series4/decorative_leia_r2_diorama.iff", milestone=720, oneTime=false, description="Princess Leia & R2-D2 Diorama"},
		{templateFile = "object/tangible/tcg/series5/decorative_deathstar_hologram.iff", milestone=720, oneTime=false, description="Death Star Under Construction Hologram"},
		{templateFile = "object/tangible/tcg/series5/decorative_skywalker_statuette.iff", milestone=720, oneTime=false, description="Luke Skywalker Statuette"},
		{templateFile = "object/tangible/tcg/series8/diorama_exogorth_crater.iff", milestone=720, oneTime=false, description="Hungry Exorgoth Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_boba_toy.iff", milestone=720, oneTime=false, description="Miniature Boba Fett Replica"},
		{templateFile = "object/tangible/tcg/series5/combine_object_atat_statuette.iff", milestone=720, oneTime=false, description="AT-AT Statuette"},
		{templateFile = "object/tangible/loot/creature_loot/collections/opt_in_mail_05.iff", milestone=720, oneTime=false, description="Bobble-Head TK-555"},
		{templateFile = "object/tangible/item/market/facebook_reward_01.iff", milestone=720, oneTime=false, description="Bobble-Head Stormtrooper Squad Leader"},

		-- 810 Day Rewards
		{templateFile = "object/tangible/deed/vehicle_deed/speederbike_flash_deed.iff", milestone=810, oneTime=true},
		{templateFile = "object/tangible/wearables/goggles/goggles_s01.iff", milestone=810, oneTime=false, description="Special Edition Goggles Style 1"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s02.iff", milestone=810, oneTime=false, description="Special Edition Goggles Style 2"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s03.iff", milestone=810, oneTime=false, description="Special Edition Goggles Style 3"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s04.iff", milestone=810, oneTime=false, description="Special Edition Goggles Style 4"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s05.iff", milestone=810, oneTime=false, description="Special Edition Goggles Style 5"},
		{templateFile = "object/tangible/wearables/goggles/goggles_s06.iff", milestone=810, oneTime=false, description="Special Edition Goggles Style 6"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_darth_vader_toy.iff", milestone=810, oneTime=false, description="@veteran_new:mini_darthvader"},
		{templateFile = "object/tangible/tcg/series5/decorative_trench_run_diorama.iff", milestone=810, oneTime=false, description="Trench Run Diorama"},
		{templateFile = "object/tangible/buildout/event/empire_day_emperor_statue.iff", milestone=810, oneTime=false, description="Statue of the Emperor"},
		{templateFile = "object/tangible/furniture/all/frn_all_escape_pod_statuette.iff", milestone=810, oneTime=false, description="Escape Pod Statuette"},
		{templateFile = "object/tangible/tcg/series1/decorative_statuette_princess_leia.iff", milestone=810, oneTime=false, description="Princess Leia Statuette"},
		{templateFile = "object/tangible/tcg/series6/combine_object_hk47_mustafar_diorama.iff", milestone=810, oneTime=false, description="HK-47 Mustafar Diorama"},
		{templateFile = "object/tangible/tcg/series6/statuette_lando.iff", milestone=810, oneTime=false, description="Lando Statuette"},
		{templateFile = "object/tangible/tcg/series7/diorama_firgrin_dan.iff", milestone=810, oneTime=false, description="Figrin D'an Band Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_corvette.iff", milestone=810, oneTime=false, description="Corellian Corvette Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_darth_vader.iff", milestone=810, oneTime=false, description="Darth Vader Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_deathstar.iff", milestone=810, oneTime=false, description="Death Star Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_leia.iff", milestone=810, oneTime=false, description="Princess Leia Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_yoda.iff", milestone=810, oneTime=false, description="Jedi Master Yoda Hologram"},
		{templateFile = "object/tangible/tcg/series4/decorative_chewbacca_statuette.iff", milestone=810, oneTime=false, description="Chewbacca Statuette"},
		{templateFile = "object/tangible/tcg/series8/decorative_r2d2_dagobah.iff", milestone=810, oneTime=false, description="R2-D2 on Dagobah Statue"},
		{templateFile = "object/tangible/loot/creature_loot/collections/opt_in_mail_08.iff", milestone=810, oneTime=false, description="Bobble-Head Death Trooper"},

		-- 900 Day Rewards
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_a.iff", milestone=900, oneTime=false, description="@veteran_new:techconsole_a"},
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_b.iff", milestone=900, oneTime=false, description="@veteran_new:techconsole_b"},
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_c.iff", milestone=900, oneTime=false, description="@veteran_new:techconsole_c"},
		{templateFile = "object/tangible/veteran_reward/frn_tech_console_sectional_d.iff", milestone=900, oneTime=false, description="@veteran_new:techconsole_d"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_jabba_toy.iff", milestone=900, oneTime=false, description="@veteran_new:mini_jabba"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_stormtrooper_toy.iff", milestone=900, oneTime=false, description="@veteran_new:mini_stormtrooper"},
		{templateFile = "object/tangible/tcg/series8/diorama_bespin_city.iff", milestone=900, oneTime=false, description="The Heights of Cloud City Diorama"},
		{templateFile = "object/tangible/event_perk/lifeday_holo_table.iff", milestone=900, oneTime=false, description="Holo-Entertainment Table"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_jabba_palace.iff", milestone=900, oneTime=false, description="An Architect's Rendition of Jabba's Palace"},
		{templateFile = "object/tangible/furniture/ep3_rewards/hologram_yt1300_01.iff", milestone=900, oneTime=false, description="YT-1300 Hologram"},
		{templateFile = "object/tangible/item/som/jundak_hunter_hologram.iff", milestone=900, oneTime=false, description="Medical Hologram (Mustafarian)"},
		{templateFile = "object/tangible/item/som/frn_holo_mustafarian_c.iff", milestone=900, oneTime=false, description="Mustafarian Hologram"},
		{templateFile = "object/tangible/tcg/series1/decorative_statuette_darth_vader.iff", milestone=900, oneTime=false, description="Darth Vader Statuette"},
		{templateFile = "object/tangible/tcg/series3/decorative_darth_vader_obi_wan_diorama.iff", milestone=900, oneTime=false, description="Darth Vader vs. Obi-Wan Kenobi Diorama"},
		{templateFile = "object/tangible/tcg/series6/diorama_jedi_council.iff", milestone=900, oneTime=false, description="Jedi Council Diorama"},
		{templateFile = "object/tangible/veteran_reward/darth_maul_statue.iff", milestone=900, oneTime=false, description="Darth Maul Statue"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_lambda.iff", milestone=900, oneTime=false, description="Lambda Shuttle Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_holo_starfighter.iff", milestone=900, oneTime=false, description="Jedi Starfighter Hologram"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_tusken_raider_toy.iff", milestone=900, oneTime=false, description="Miniature Tusken Raider Replica"},
		{templateFile = "object/tangible/tcg/series4/decorative_tauntaun_ride.iff", milestone=900, oneTime=false, description="Antique Tauntaun Ride"},
		{templateFile = "object/tangible/item/market/yoda_bobble_head.iff", milestone=900, oneTime=false, description="Bobble-Head Yoda"},

		-- 990 Day Rewards
		{templateFile = "object/tangible/camp/camp_spit_s2.iff", milestone=990, oneTime=false, description="Camp Center (Small)"},
		{templateFile = "object/tangible/camp/camp_spit_s3.iff", milestone=990, oneTime=false, description="Camp Center (Large)"},
		{templateFile = "object/tangible/loot/misc/loot_skull_bith.iff", milestone=990, oneTime=false, description="A Bith Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_human.iff", milestone=990, oneTime=false, description="A Human Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_ithorian.iff", milestone=990, oneTime=false, description="A Ithorian Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_thune.iff", milestone=990, oneTime=false, description="A Thune Skull"},
		{templateFile = "object/tangible/loot/misc/loot_skull_voritor.iff", milestone=990, oneTime=false, description="A Voritor Lizard Skull"},
		{templateFile = "object/tangible/furniture/all/frn_all_statuette_kash_treecity.iff", milestone=990, oneTime=false, description="An Architect's Rendition of the Great Tree From Kachiro"},
		{templateFile = "object/tangible/furniture/ep3_rewards/avatar_hologram_squid.iff", milestone=990, oneTime=false, description="Jellyfish Hologram"},
		{templateFile = "object/tangible/hologram/hologram_hk47.iff", milestone=990, oneTime=false, description="HK-47 Hologram"},
		{templateFile = "object/tangible/hologram/hologram_ff_space_battle_2010.iff", milestone=990, oneTime=false, description="Hologram of a Space Battle"},
		{templateFile = "object/tangible/tcg/series5/combine_object_vader_statuette.iff", milestone=990, oneTime=false, description="Kneeling Vader Statuette"},
		{templateFile = "object/tangible/tcg/series5/decorative_mustafar_diorama.iff", milestone=990, oneTime=false, description="Mustafar Diorama"},
		{templateFile = "object/tangible/tcg/series6/hologram_cloud_city.iff", milestone=990, oneTime=false, description="Cloud City Hologram"},
		{templateFile = "object/tangible/tcg/series8/diorama_atat_attack.iff", milestone=990, oneTime=false, description="Raid on Echo Base Diorama"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_salacious_crumb_toy.iff", milestone=990, oneTime=false, description="Miniature Salacious Crumb Replica"},
		{templateFile = "object/tangible/veteran_reward/mace_windu_statue.iff", milestone=990, oneTime=false, description="Mace Windu Statue"},
		{templateFile = "object/tangible/tcg/series3/decorative_emperor_palpatine_statuette.iff", milestone=990, oneTime=false, description="Emperor Palpatine Statuette"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_jedi_temple.iff", milestone=990, oneTime=false, description="Jedi Temple"},
		{templateFile = "object/tangible/veteran_reward/frn_vet_jedi_temple_burning.iff", milestone=990, oneTime=false, description="Jedi Temple Ruins"},
		{templateFile = "object/tangible/loot/creature_loot/collections/opt_in_mail_04.iff", milestone=990, oneTime=false, description="Battlefield Diorama"},

		-- 1080 Day Rewards
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_01.iff", milestone=1080, oneTime=false, description="Painting: Cast Wing in Flight"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_02.iff", milestone=1080, oneTime=false, description="Painting: Decimator"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_03.iff", milestone=1080, oneTime=false, description="Painting: Tatooine Dune Speeder"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_04.iff", milestone=1080, oneTime=false, description="Painting: Weapon of War"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_05.iff", milestone=1080, oneTime=false, description="Painting: Fighter Study"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_06.iff", milestone=1080, oneTime=false, description="Painting: Hutt Greed"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_07.iff", milestone=1080, oneTime=false, description="Painting: Smuggler's Run"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_08.iff", milestone=1080, oneTime=false, description="Painting: Imperial Oppression (TIE Oppressor)"},
		{templateFile = "object/tangible/veteran_reward/one_year_anniversary/painting_09.iff", milestone=1080, oneTime=false, description="Painting: Emperor's Eyes (TIE Sentinel)"},

}

-- { "stringId", "songFilePath" }
jukeboxSongs = {
	{ "@event_perk_jukebox_songs:emperors_theme", "sound/music_emperor_theme_loop.snd" },
	{ "@event_perk_jukebox_songs:chamber_music", "sound/music_starport_a_loop.snd" },
	{ "@event_perk_jukebox_songs:hard_rock", "sound/music_starport_b_loop.snd" },
	{ "@event_perk_jukebox_songs:theed_palace", "sound/music_theed_palace_loop.snd" },
	{ "@event_perk_jukebox_songs:medley", "sound/music_autorun_loop.snd" },
	{ "@event_perk_jukebox_songs:otoh_gunga", "sound/music_otoh_gunga_loop.snd" },
	{ "@event_perk_jukebox_songs:star_wars_intro", "sound/music_intro_loop.snd" },
	{ "@event_perk_jukebox_songs:celeb_phantom_menace", "sound/music_celebration_a_loop.snd" },
	{ "@event_perk_jukebox_songs:celeb_rotj", "sound/music_celebration_b_loop.snd" },
	{ "@event_perk_jukebox_songs:pod_race", "sound/music_combat_bfield_loop.snd" },
	{ "@event_perk_jukebox_songs:figrin_dan_1", "sound/music_figrin_dan_1_loop.snd" },
	{ "@event_perk_jukebox_songs:figrin_dan_2", "sound/music_figrin_dan_2_loop.snd" },
	{ "@event_perk_jukebox_songs:soothing_corellia", "sound/music_id_tent_corellia_loop.snd" },
	{ "@event_perk_jukebox_songs:soothing_naboo", "sound/music_id_tent_naboo_loop.snd" },
	{ "@event_perk_jukebox_songs:soothing_tatooine", "sound/music_id_tent_tatooine_loop.snd" },
	{ "@event_perk_jukebox_songs:max_rebo_1", "sound/music_max_rebo_1_loop.snd" },
	{ "@event_perk_jukebox_songs:max_rebo_2", "sound/music_max_rebo_2_loop.snd" },
	{ "@event_perk_jukebox_songs:romance_1", "sound/music_romance_a_loop.snd" },
	{ "@event_perk_jukebox_songs:romance_2", "sound/music_romance_b_loop.snd" },
	{ "@event_perk_jukebox_songs:romance_3", "sound/music_romance_c_loop.snd" },
	{ "@event_perk_jukebox_songs:satisfaction_1", "sound/music_satisfaction_a_loop.snd" },
	{ "@event_perk_jukebox_songs:satisfaction_2", "sound/music_satisfaction_b_loop.snd" },
	{ "@event_perk_jukebox_songs:exar_theme", "sound/music_exar_theme_loop.snd" },
	{ "@event_perk_jukebox_songs:exploration", "sound/music_explore_a_loop.snd" },
	{ "@event_perk_jukebox_songs:humor_1", "sound/music_humor_a_loop.snd" },
	{ "@event_perk_jukebox_songs:humor_2", "sound/music_humor_b_loop.snd" },
	{ "@event_perk_jukebox_songs:leia_theme", "sound/music_leia_theme_loop.snd" },
	{ "@event_perk_jukebox_songs:evil_ambiance", "sound/music_underground_loop.snd" },
	{ "@event_perk_jukebox_songs:eerie_ambiance", "sound/music_underwater_loop.snd" },
	{ "@event_perk_jukebox_songs:lok_theme", "sound/music_gloom_a_loop.snd" }
}

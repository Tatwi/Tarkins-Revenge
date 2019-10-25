--[[
Copyright (C) 2007 <SWGEmu>

This File is part of Core3.
 
This program is free software; you can redistribute 
it and/or modify it under the terms of the GNU Lesser 
General Public License as published by the Free Software
Foundation; either version 2 of the License, 
or (at your option) any later version.
 
This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
See the GNU Lesser General Public License for
more details.
 
You should have received a copy of the GNU Lesser General 
Public License along with this program; if not, write to
the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 
Linking Engine3 statically or dynamically with other modules 
is making a combined work based on Engine3. 
Thus, the terms and conditions of the GNU Lesser General Public License 
cover the whole combination.
 
In addition, as a special exception, the copyright holders of Engine3 
give you permission to combine Engine3 program with free software 
programs or libraries that are released under the GNU LGPL and with 
code included in the standard release of Core3 under the GNU LGPL 
license (or modified versions of such code, with unchanged license). 
You may copy and distribute such a system following the terms of the 
GNU LGPL for Engine3 and the licenses of the other code concerned, 
provided that you include the source code of that other code when 
and as the GNU LGPL requires distribution of source code.
 
Note that people who make modified versions of Engine3 are not obligated 
to grant this special exception for their modified versions; 
it is their choice whether to do so. The GNU Lesser General Public License 
gives permission to release a modified version without this exception; 
this exception also makes it possible to release a modified version 
which carries forward this exception.
--]]

--appearance filename, run speed, gallop speed multiplier, gallop duration (in seconds), gallop cooldown (in seconds)
mountSpeedData = {
	{"appearance/bantha_hue.sat", 17, 1.286, 180, 600},
	{"appearance/bol_hue.sat", 17, 1.286, 180, 600},
	{"appearance/brackaset_hue.sat", 17, 1.133, 300, 780},
	{"appearance/carrion_spat_hue.sat", 17, 1.544, 120, 600},
	{"appearance/cu_pa_hue.sat", 17, 1.544, 120, 600},
	{"appearance/dewback_hue.sat", 17, 1.286, 180, 600},
	{"appearance/falumpaset_hue.sat", 17, 1.133, 300, 780},
	{"appearance/kaadu_hue.sat", 17, 1.544, 120, 600},

	--Tarkin Custom
	{"appearance/varactyl.sat", 17, 1.286, 180, 600},
	{"appearance/gualar.sat", 17, 1.286, 180, 600},
	{"appearance/peko_peko_saddle_tcg.sat", 17, 1.286, 180, 600},
	{"appearance/thune_hue.sat", 17, 1.286, 180, 600},
	{"appearance/gronda_hue.sat", 17, 1.286, 180, 600},
	{"appearance/snorbal_hue.sat", 17, 1.286, 180, 600},
	{"appearance/guf_drolg_hue.sat", 17, 1.286, 180, 600},
	{"appearance/bolma_hue.sat", 17, 1.286, 180, 600},
	{"appearance/kwi_hue.sat", 17, 1.544, 120, 600},
	{"appearance/blurrg_hue.sat", 17, 1.544, 120, 600},
	{"appearance/spiketail_blurrg.sat", 17, 1.544, 120, 600},
	{"appearance/kashyyyk_bantha.sat", 17, 1.286, 180, 600},
	{"appearance/bolotaur.sat", 17, 1.286, 180, 600},
	{"appearance/bol_elite.sat", 17, 1.286, 180, 600},
	{"appearance/tusked_bull_thune.sat", 17, 1.286, 180, 600},
	{"appearance/mutated_dewback.sat", 17, 1.286, 180, 600},
	{"appearance/mutated_cupa.sat", 17, 1.544, 120, 600},
	{"appearance/mutated_borgax.sat", 17, 1.544, 120, 600},
	{"appearance/nerf_hue.sat", 17, 1.286, 180, 600},
	{"appearance/mawgax_hue.sat", 17, 1.544, 120, 600},
	{"appearance/pugoriss_hue.sat", 17, 1.544, 120, 600},
	{"appearance/painted_spat.sat", 17, 1.544, 120, 600},
	{"appearance/mutated_griffon.sat", 17, 1.544, 120, 600},
	{"appearance/eopie_hue.sat", 17, 1.133, 300, 780},
	{"appearance/gurnaset_hue.sat", 17, 1.133, 300, 780},
	{"appearance/bageraset_hue.sat", 17, 1.133, 300, 780},
	{"appearance/tulrus.sat", 17, 1.286, 180, 600},
	{"appearance/reek.sat", 17, 1.286, 180, 600},
	{"appearance/reek_s02.sat", 17, 1.286, 180, 600},
	{"appearance/tybis_hue.sat", 17, 1.286, 180, 600},
	{"appearance/bordok_hue.sat", 17, 1.286, 180, 600},
	{"appearance/gualama_hue.sat", 17, 1.286, 180, 600},
	{"appearance/krahbu_hue.sat", 17, 1.286, 180, 600},
	{"appearance/mouf.sat", 17, 1.286, 180, 600},
	{"appearance/rancor_hue.sat", 17, 1.544, 120, 600},
	{"appearance/graul_hue.sat", 17, 1.544, 120, 600},
	{"appearance/mutated_rancor.sat", 17, 1.544, 120, 600},
	{"appearance/lava_flea.sat", 17, 1.544, 120, 600},
	{"appearance/whisper_bird_hue.sat", 17, 1.286, 180, 600},
	{"appearance/lantern_bird_hue.sat", 17, 1.286, 180, 600},
	{"appearance/peko_peko_hue.sat", 17, 1.286, 180, 600},
	{"appearance/kai_tok_hue.sat", 17, 1.286, 180, 600},
	{"appearance/gulginaw_hue.sat", 17, 1.286, 180, 600},
	{"appearance/perlek_hue.sat", 17, 1.286, 180, 600},
	{"appearance/reptilian_flier_hue.sat", 17, 1.286, 180, 600},
	{"appearance/condor_dragon_hue.sat", 17, 1.286, 180, 600},
	{"appearance/blistmok.sat", 17, 1.544, 120, 600},
	{"appearance/tauntaun_skeli.sat", 17, 1.544, 120, 600}
}

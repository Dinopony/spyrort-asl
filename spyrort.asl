/////////////////////////////////////////////////////////////////
///
///		Spyro Reignited Trilogy Autosplitter v1.02
///		Author: Dinopony (@DinoponyRuns)
///
///		Special thanks to CptBrian and Zic3 for helping finding RAM addresses,
///		and to all the Spyro community for being helpful and supportive
///		in the process of making this beast :)
///
/////////////////////////////////////////////////////////////////

state("Spyro-Win64-Shipping")
{
	// Set to 0 when loading, set to 1 otherwise (foundable as a 4-byte searching for 256)
//	byte isNotLoading : 0x034149E8, 0x18, 0xE0, 0x4A8, 0xE19;
	byte isNotLoading : 0x03415F30, 0xF8, 0x4A8, 0xE19;

	// Set to 0 in game, 1 if in menu, 15 if in graphics submenu
//	byte inMenu : 0x03658048, 0x68, 0x218, 0x60;
	byte inMenu : 0x034160D0, 0x20, 0x218, 0x60;

	// Set to 0 in title screen and main menu, set to 1 everywhere else
//	byte inGame : 0x03659C60, 0x7E8, 0x2D0, 0x70, 0xE0, 0x564;
	byte inGame : 0x03415F30, 0xF0, 0x378, 0x564;

	// From GVAS, search EIT_LastLevelPlayed (+ some fixed offset) to find S1, S2 and S3 levels being played
	// string255 gvasRoot : 0x36A2010, 0x1E0, 0x0, 0x10, 0x20, 0x0;
}

startup
{
	print("Spyro ASL startup");

	settings.Add("reset", false, "Reset timer on title screen");
/* 
	settings.Add("s1", true, "Spyro the Dragon");
		settings.Add("s1_stone_hill",		true,	"Stone Hill (on exit)",			"s1");
		settings.Add("s1_town_square",		true,	"Town Square (on exit)",		"s1");
		settings.Add("s1_sunny_flight",		true,	"Sunny Flight (on exit)",		"s1");
		settings.Add("s1_dark_hollow",		true,	"Dark Hollow (on exit)",		"s1");
		settings.Add("s1_toasty",			true,	"Toasty (on last blow)",		"s1");
		settings.Add("s1_night_flight",		true,	"Night Flight (on exit)",		"s1");
		settings.Add("s1_dry_canyon",		true,	"Dry Canyon (on exit)",			"s1");
		settings.Add("s1_cliff_town",		true,	"Cliff Town (on exit)",			"s1");
		settings.Add("s1_doctor_shemp",		true,	"Doctor Shemp (on exit)",		"s1");
		settings.Add("s1_ice_cavern",		true,	"Ice Cavern (on exit)",			"s1");
		settings.Add("s1_alpine_ridge",		true,	"Alpine Ridge (on exit)",		"s1");
		settings.Add("s1_high_caves",		true,	"High Caves (on exit)",			"s1");
		settings.Add("s1_wizard_peak",		true,	"Wizard Peak (on exit)",		"s1");
		settings.Add("s1_crystal_flight",	true,	"Crystal Flight (on exit)",		"s1");
		settings.Add("s1_blowhard",			true,	"Blowhard (on exit)",			"s1");
		settings.Add("s1_terrace_village",	true,	"Terrace Village (on exit)",	"s1");
		settings.Add("s1_wild_flight",		true,	"Wild Flight (on exit)",		"s1");
		settings.Add("s1_misty_bog",		true,	"Misty Bog (on exit)",			"s1");
		settings.Add("s1_tree_tops",		true,	"Tree Tops (on exit)",			"s1");
		settings.Add("s1_metalhead",		true,	"Metalhead (on exit)",			"s1");
		settings.Add("s1_haunted_towers",	true,	"Haunted Towers (on exit)",		"s1");
		settings.Add("s1_dark_passage",		true,	"Dark Passage (on exit)",		"s1");
		settings.Add("s1_icy_flight",		true,	"Icy Flight (on exit)",			"s1");
		settings.Add("s1_lofty_castle",		true,	"Lofty Castle (on exit)",		"s1");
		settings.Add("s1_jacques",			true,	"Jacques (on exit)",			"s1");
		settings.Add("s1_gnorc_cove",		true,	"Gnorc Cove (on exit)",			"s1");
		settings.Add("s1_twilight_harbor",	true,	"Twilight Harbor (on exit)",	"s1");
		settings.Add("s1_gnasty_gnorc",		true,	"Gnasty Gnorc (on exit)",		"s1");	// TODO: On final blow?
		settings.Add("s1_gnastys_loot",		true,	"Gnasty's Loot (on exit)",		"s1");

	settings.Add("s2", true, "Spyro 2: Ripto's Rage!");
		settings.Add("s2_glimmer",			true,	"Glimmer (on exit)",			"s2");
		settings.Add("s2_idol_springs",		true,	"Idol Springs (on exit)",		"s2");
		settings.Add("s2_colossus",			true,	"Colossus (on exit)",			"s2");
		settings.Add("s2_hurricos",			true,	"Hurricos (on exit)",			"s2");
		settings.Add("s2_sunny_beach",		true,	"Sunny Beach (on exit)",		"s2");
		settings.Add("s2_ocean_speedway",	true,	"Ocean Speedway (on exit)",		"s2");
		settings.Add("s2_aquaria_towers",	true,	"Aquaria Towers (on exit)",		"s2");
		settings.Add("s2_crush",			true,	"Crush (on last blow)",			"s2");
		settings.Add("s2_crystal_glacier",	true,	"Crystal Glacier (on exit)",	"s2");
		settings.Add("s2_metro_speedway",	true,	"Metro Speedway (on exit)",		"s2");
		settings.Add("s2_skelos_badlands",	true,	"Skelos Badlands (on exit)",	"s2");
		settings.Add("s2_scorch",			true,	"Scorch (on exit)",				"s2");
		settings.Add("s2_fracture_hills",	true,	"Fracture Hills (on exit)",		"s2");
		settings.Add("s2_magma_cone",		true,	"Magma Cone (on exit)",			"s2");
		settings.Add("s2_shady_oasis",		true,	"Shady Oasis (on exit)",		"s2");
		settings.Add("s2_zephyr",			true,	"Zephyr (on exit)",				"s2");
		settings.Add("s2_icy_speedway",		true,	"Icy Speedway (on exit)",		"s2");
		settings.Add("s2_breeze_harbor",	true,	"Breeze Harbor (on exit)",		"s2");
		settings.Add("s2_gulp",				true,	"Gulp (on last blow)",			"s2");
		settings.Add("s2_mystic_marsh",		true,	"Mystic Marsh (on exit)",		"s2");
		settings.Add("s2_metropolis",		true,	"Metropolis (on exit)",			"s2");
		settings.Add("s2_robotica_farms",	true,	"Robotica Farms (on exit)",		"s2");
		settings.Add("s2_cloud_temples",	true,	"Cloud Temples (on exit)",		"s2");
		settings.Add("s2_canyon_speedway",	true,	"Canyon Speedway (on exit)",	"s2");
		settings.Add("s2_ripto",			true,	"Ripto (on last blow)",			"s2");
		settings.Add("s2_dragon_shores",	true,	"Dragon Shores (on exit)",		"s2");

	settings.Add("s3", true, "Spyro: Year of the Dragon");
*/
}

init
{
	// TODO: Check game version?
	refreshRate = 30;
}

update
{
	print("isNotLoading = " + current.isNotLoading.ToString());
	print("inMenu = " + current.inMenu.ToString());
	print("inGame = " + current.inGame.ToString());
}

start
{
	return current.inGame == 1 && old.inGame == 0;	
}

reset
{ 
	return settings["reset"] && current.inGame == 0;
}

split 
{
//	if(settings["s2_glimmer"] && old.levelName == "glimmer" && current.levelName != "glimmer")
//		return true;
//	if(settings["s2_idol_springs"] && old.levelName == "idol_springs" && current.levelName != "idol_springs")
//		return true;
	/* ... */

	return false;
}

isLoading 
{
	bool runStarting = timer.CurrentTime.RealTime.Value.TotalSeconds < 3;

	// To pause the timer:
	//		1) - the game must be loading something
	//		2) - we must not be in the title screen
	// 		3) - we must not be in a menu to prevent level storage abuse, and the run must
	//			 not have just started (because otherwise 0.9 elapses during the fade to black
	//			 after game is selected)

	return current.isNotLoading == 0 				// 1) 
		&& current.inGame == 1 						// 2)
		&& (current.inMenu == 0 || runStarting); 	// 3)
}
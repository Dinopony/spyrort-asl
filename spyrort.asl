/////////////////////////////////////////////////////////////////
///
///     Spyro Reignited Trilogy Autosplitter v1.1
///   
/////////////////////////////////////////////////////////////////
///
///     Author: Dinopony (@DinoponyRuns)
///     Special thanks to:
///        - CptBrian for his precious knowledge about UE4 games structure and his work unifying pointers
///        - Zic3 for helping finding RAM addresses
///        - All the Spyro community for being helpful and supportive in the process of making this beast :)
///
/////////////////////////////////////////////////////////////////

state("Spyro-Win64-Shipping")
{
    // Set to 0 when loading, set to 1 otherwise (foundable as a 4-byte searching for 256)
    byte isNotLoading : 0x03415F30, 0xF8, 0x4A8, 0xE19;

    // Set to 0 in game, 1 if in menu, 15 if in graphics submenu
    byte inMenu : 0x034160D0, 0x20, 0x218, 0x60;

    // Set to 0 in title screen and main menu, set to 1 everywhere else
    byte inGame : 0x03415F30, 0xF0, 0x378, 0x564;

    // Counts Ripto's 3rd phase health (init at 8 from the very beginning of Ripto 1 fight, can be frozen at 0 to end the fight)
    byte healthRipto3 : 0x03415F30, 0x88, 0x48, 0x138, 0x140, 0x8, 0x1D0, 0x134;
    //byte healthRipto3 : 0x03415F30, 0x110, 0x50, 0x140, 0x8, 0x1D0, 0x134;
    // ID of the map the player is being in
    string256 map : 0x03415F30, 0x138, 0xB0, 0xB0, 0x598, 0x210, 0xB8, 0x148, 0x190, 0x0;
}

/* Old unstable pointer values found, may be useful if anybody has a problem with current ones
state("Spyro-Win64-Shipping")
{
    byte isNotLoading : 0x034149E8, 0x18, 0xE0, 0x4A8, 0xE19;
    byte inMenu : 0x03658048, 0x68, 0x218, 0x60;
    byte inGame : 0x03659C60, 0x7E8, 0x2D0, 0x70, 0xE0, 0x564;
    byte healthRipto3 : 0x03415F30, 0x110, 0x50, 0x140, 0x8, 0x1D0, 0x134;
    string255 gvasRoot : 0x36A2010, 0x1E0, 0x0, 0x10, 0x20, 0x0;
}
*/

startup
{
    settings.Add("reset", false, "Reset timer on title screen");

    settings.Add("s1", true, "Spyro the Dragon");
        settings.Add("s1_stone_hill",           true,    "Stone Hill (on exit)",            "s1");
        settings.Add("s1_town_square",          true,    "Town Square (on exit)",           "s1");
        settings.Add("s1_sunny_flight",         true,    "Sunny Flight (on exit)",          "s1");
        settings.Add("s1_dark_hollow",          true,    "Dark Hollow (on exit)",           "s1");
        settings.Add("s1_toasty",               true,    "Toasty (on exit)",                "s1");
        settings.Add("s1_night_flight",         true,    "Night Flight (on exit)",          "s1");
        settings.Add("s1_dry_canyon",           true,    "Dry Canyon (on exit)",            "s1");
        settings.Add("s1_cliff_town",           true,    "Cliff Town (on exit)",            "s1");
        settings.Add("s1_doctor_shemp",         true,    "Doctor Shemp (on exit)",          "s1");
        settings.Add("s1_ice_cavern",           true,    "Ice Cavern (on exit)",            "s1");
        settings.Add("s1_alpine_ridge",         true,    "Alpine Ridge (on exit)",          "s1");
        settings.Add("s1_high_caves",           true,    "High Caves (on exit)",            "s1");
        settings.Add("s1_wizard_peak",          true,    "Wizard Peak (on exit)",           "s1");
        settings.Add("s1_crystal_flight",       true,    "Crystal Flight (on exit)",        "s1");
        settings.Add("s1_blowhard",             true,    "Blowhard (on exit)",              "s1");
        settings.Add("s1_terrace_village",      true,    "Terrace Village (on exit)",       "s1");
        settings.Add("s1_wild_flight",          true,    "Wild Flight (on exit)",           "s1");
        settings.Add("s1_misty_bog",            true,    "Misty Bog (on exit)",             "s1");
        settings.Add("s1_tree_tops",            true,    "Tree Tops (on exit)",             "s1");
        settings.Add("s1_metalhead",            true,    "Metalhead (on exit)",             "s1");
        settings.Add("s1_haunted_towers",       true,    "Haunted Towers (on exit)",        "s1");
        settings.Add("s1_dark_passage",         true,    "Dark Passage (on exit)",          "s1");
        settings.Add("s1_icy_flight",           true,    "Icy Flight (on exit)",            "s1");
        settings.Add("s1_lofty_castle",         true,    "Lofty Castle (on exit)",          "s1");
        settings.Add("s1_jacques",              true,    "Jacques (on exit)",               "s1");
        settings.Add("s1_gnorc_cove",           true,    "Gnorc Cove (on exit)",            "s1");
        settings.Add("s1_twilight_harbor",      true,    "Twilight Harbor (on exit)",       "s1");
        settings.Add("s1_gnasty_gnorc",         true,    "Gnasty Gnorc (on exit)",          "s1");        
//      settings.Add("s1_kill_gnasty",          true,    "Gnasty Gnorc (on kill)",          "s1");
        settings.Add("s1_gnastys_loot",         true,    "Gnasty's Loot (on exit)",         "s1");

    settings.Add("s2", true, "Spyro 2: Ripto's Rage!");
        settings.Add("s2_glimmer",              true,    "Glimmer (on exit)",               "s2");
        settings.Add("s2_idol_springs",         true,    "Idol Springs (on exit)",          "s2");
        settings.Add("s2_colossus",             true,    "Colossus (on exit)",              "s2");
        settings.Add("s2_hurricos",             true,    "Hurricos (on exit)",              "s2");
        settings.Add("s2_sunny_beach",          true,    "Sunny Beach (on exit)",           "s2");
        settings.Add("s2_ocean_speedway",       true,    "Ocean Speedway (on exit)",        "s2");
        settings.Add("s2_aquaria_towers",       true,    "Aquaria Towers (on exit)",        "s2");
        settings.Add("s2_crushs_dungeon",       true,    "Crush's Dungeon (on exit)",       "s2");
        settings.Add("s2_crystal_glacier",      true,    "Crystal Glacier (on exit)",       "s2");
        settings.Add("s2_metro_speedway",       true,    "Metro Speedway (on exit)",        "s2");
        settings.Add("s2_skelos_badlands",      true,    "Skelos Badlands (on exit)",       "s2");
        settings.Add("s2_scorch",               true,    "Scorch (on exit)",                "s2");
        settings.Add("s2_fracture_hills",       true,    "Fracture Hills (on exit)",        "s2");
        settings.Add("s2_magma_cone",           true,    "Magma Cone (on exit)",            "s2");
        settings.Add("s2_shady_oasis",          true,    "Shady Oasis (on exit)",           "s2");
        settings.Add("s2_zephyr",               true,    "Zephyr (on exit)",                "s2");
        settings.Add("s2_icy_speedway",         true,    "Icy Speedway (on exit)",          "s2");
        settings.Add("s2_breeze_harbor",        true,    "Breeze Harbor (on exit)",         "s2");
        settings.Add("s2_gulps_overlook",       true,    "Gulp's Overlook (on exit)",       "s2");
        settings.Add("s2_mystic_marsh",         true,    "Mystic Marsh (on exit)",          "s2");
        settings.Add("s2_metropolis",           true,    "Metropolis (on exit)",            "s2");
        settings.Add("s2_robotica_farms",       true,    "Robotica Farms (on exit)",        "s2");
        settings.Add("s2_cloud_temples",        true,    "Cloud Temples (on exit)",         "s2");
        settings.Add("s2_canyon_speedway",      true,    "Canyon Speedway (on exit)",       "s2");
        settings.Add("s2_riptos_arena",         true,    "Ripto's Arena (on exit)",         "s2");
//      settings.Add("s2_kill_ripto",           true,    "Ripto (on last blow)",            "s2");
        settings.Add("s2_dragon_shores",        false,   "Dragon Shores (on exit)",         "s2");

    settings.Add("s3", true, "Spyro: Year of the Dragon");
        settings.Add("s3_cloud_spires",         true,    "Cloud Spires (on exit)",          "s3");
        settings.Add("s3_sheilas_alp",          true,    "Sheila's Alp (on exit)",          "s3");
        settings.Add("s3_sunny_villa",          true,    "Sunny Villa (on exit)",           "s3");
        settings.Add("s3_molten_crater",        true,    "Molten Crater (on exit)",         "s3");
        settings.Add("s3_mushroom_speedway",    true,    "Mushroom Speedway (on exit)",     "s3");
        settings.Add("s3_seashell_shore",       true,    "Seashell Shore (on exit)",        "s3");
        settings.Add("s3_buzzs_dungeon",        true,    "Buzz's Dungeon (on exit)",        "s3");
        settings.Add("s3_crawdad_farms",        true,    "Crawdad Farms (on exit)",         "s3");
        settings.Add("s3_icy_peak",             true,    "Icy Peak (on exit)",              "s3");
        settings.Add("s3_sgt_byrds_base",       true,    "Sgt. Byrd's Base (on exit)",      "s3");
        settings.Add("s3_spooky_swamp",         true,    "Spooky Swamp (on exit)",          "s3");
        settings.Add("s3_bamboo_terrace",       true,    "Bamboo Terrace (on exit)",        "s3");
        settings.Add("s3_enchanted_towers",     true,    "Enchanted Towers (on exit)",      "s3");
        settings.Add("s3_country_speedway",     true,    "Country Speedway (on exit)",      "s3");
        settings.Add("s3_spider_town",          true,    "Spider Town (on exit)",           "s3");
        settings.Add("s3_spikes_arena",         true,    "Spike's Arena (on exit)",         "s3");
        settings.Add("s3_honey_speedway",       true,    "Honey Speedway (on exit)",        "s3");
        settings.Add("s3_charmed_ridge",        true,    "Charmed Ridge (on exit)",         "s3");
        settings.Add("s3_lost_fleet",           true,    "Lost Fleet (on exit)",            "s3");
        settings.Add("s3_fireworks_factory",    true,    "Fireworks Factory (on exit)",     "s3");
        settings.Add("s3_bentleys_outpost",     true,    "Bentley's Outpost (on exit)",     "s3");
        settings.Add("s3_frozen_altars",        true,    "Frozen Altars (on exit)",         "s3");
        settings.Add("s3_scorchs_pit",          true,    "Scorch's Pit (on exit)",          "s3");
        settings.Add("s3_starfish_reef",        true,    "Starfish Reef (on exit)",         "s3");
        settings.Add("s3_bugbot_factory",       true,    "Bugbot Factory (on exit)",        "s3");
        settings.Add("s3_desert_ruins",         true,    "Desert Ruins (on exit)",          "s3");
        settings.Add("s3_agent_9s_lab",         true,    "Agent 9's Lab (on exit)",         "s3");
        settings.Add("s3_crystal_islands",      true,    "Crystal Islands (on exit)",       "s3");
        settings.Add("s3_haunted_tomb",         true,    "Haunted Tomb (on exit)",          "s3");
        settings.Add("s3_dino_mines",           true,    "Dino Mines (on exit)",            "s3");
        settings.Add("s3_harbor_speedway",      true,    "Harbor Speedway (on exit)",       "s3");
        settings.Add("s3_sorceresss_lair",      true,    "Sorceress's Lair (on exit)",      "s3");
//      settings.Add("s3_kill_sorceress",       true,    "Sorceress (on last blow)",        "s3");
        settings.Add("s3_super_bonus",          true,    "Super Bonus (on exit)",           "s3");

    vars.mapIDs = new Dictionary<string, string> {
        // Spyro 1 maps
        { "s1_stone_hill",              "/LS102_StoneHill/Maps/" },
        { "s1_dark_hollow",             "/LS103_DarkHollow/Maps/" },
        { "s1_town_square",             "/LS104_Townsquare/Maps/" },
        { "s1_sunny_flight",            "/LS105_Sunnyflight/Maps/" },
        { "s1_toasty",                  "/LS106_Toasty/Maps/" },
        { "s1_dry_canyon",              "/LS108_DryCanyon/Maps/" },
        { "s1_cliff_town",              "/LS109_CliffTown/Maps/" },
        { "s1_ice_cavern",              "/LS110_IceCavern/Maps/" },
        { "s1_night_flight",            "/LS111_NightFlight/Maps/" },
        { "s1_doctor_shemp",            "/LS112_DrShemp/Maps/" },
        { "s1_alpine_ridge",            "/LS114_AlpineRidge/Maps/" },  
        { "s1_high_caves",              "/LS115_HighCaves/Maps/" },
        { "s1_wizard_peak",             "/LS116_WizardPeak/Maps/" },
        { "s1_crystal_flight",          "/LS117_CrystalFlight/Maps/" },       
        { "s1_blowhard",                "/LS118_Blowhard/Maps/" },
        { "s1_terrace_village",         "/LS120_TerraceVillage/Maps/" },
        { "s1_misty_bog",               "/LS121_MistyBog/Maps/" },
        { "s1_tree_tops",               "/LS122_TreeTops/Maps/" },
        { "s1_wild_flight",             "/LS123_WildFlight/Maps/" },
        { "s1_metalhead",               "/LS124_MetalHead/Maps/" },
        { "s1_dark_passage",            "/LS126_DarkPassage/Maps/" },
        { "s1_lofty_castle",            "/LS127_LoftyCastle/Maps/" },
        { "s1_haunted_towers",          "/LS128_HauntedTowers/Maps/" },
        { "s1_icy_flight",              "/LS129_IcyFlight/Maps/" },
        { "s1_jacques",                 "/LS130_Jacques/Maps/" },
        { "s1_gnorc_cove",              "/LS132_GnorcCove/Maps/" },
        { "s1_twilight_harbor",         "/LS133_TwlightHarbour/Maps/" },
        { "s1_gnasty_gnorc",            "/LS134_GnastyGnorc/Maps/" },
        { "s1_gnastys_loot",            "/LS135_GnastyLoot/Maps/" },
        
Dr Shemp, Metalhead, Twilight Harbor, Gnasty

        // Spyro 2 maps
        { "s2_glimmer",                 "/LS202_Glimmer/Maps/" },
        { "s2_idol_springs",            "/LS203_IdolSprings/Maps/" },
        { "s2_colossus",                "/LS204_Colossus/Maps/" },
        { "s2_hurricos",                "/LS205_Hurricos/Maps/" },
        { "s2_sunny_beach",             "/LS206_sunny_beach/Maps/" },
        { "s2_aquaria_towers",          "/LS207_AquariaTowers/Maps/" },
        { "s2_crushs_dungeon",          "/LS208_CrushsDungeon/Maps/" },
        { "s2_ocean_speedway",          "/LS209_OceanSpeedway/Maps/" },
        { "s2_crystal_glacier",         "/LS211_CrystalGlacier/Maps/" },
        { "s2_skelos_badlands",         "/LS212_SkelosBadlands/Maps/" },
        { "s2_zephyr",                  "/LS213_Zephyr/Maps/" },
        { "s2_breeze_harbor",           "/LS214_BreezeHarbor/Maps/" },
        { "s2_scorch",                  "/LS215_Scorch/Maps/" },
        { "s2_fracture_hills",          "/LS216_FractureHills/Maps/" },
        { "s2_magma_cone",              "/LS217_MagmaCone/Maps/" },
        { "s2_shady_oasis",             "/LS218_ShadyOasis/Maps/" },
        { "s2_gulps_overlook",          "/LS219_GulpsOverlook/Maps/" },
        { "s2_icy_speedway",            "/LS200_IcySpeedway/Maps/" },
        { "s2_metro_speedway",          "/LS221_MetroSpeedway/Maps/" },
        { "s2_mystic_marsh",            "/LS223_MysticMarsh/Maps/" },
        { "s2_cloud_temples",           "/LS224_CloudTemples/Maps/" },
        { "s2_metropolis",              "/LS225_Metropolis/Maps/" },
        { "s2_robotica_farms",          "/LS226_RoboticaFarms/Maps/" },
        { "s2_riptos_arena",            "/LS227_RiptosArena/Maps/" },
        { "s2_canyon_speedway",         "/LS228_CanyonSpeedway/Maps/" },
        { "s2_dragon_shores",           "/LS229_DragonShores/Maps/" },

        // Spyro 3 maps
        { "s3_sunny_villa",             "/LS302_SunnyVilla/Maps/" },
        { "s3_cloud_spires",            "/LS303_CloudSpires/Maps/" },
        { "s3_molten_crater",           "/LS304_MoltenCrater/Maps/" },
        { "s3_seashell_shore",          "/LS305_SeashellShore/Maps/" },
        { "s3_sheilas_alp",             "/LS306_SheilasAlp/Maps/" },
        { "s3_mushroom_speedway",       "/LS307_MushroomSpeedway/Maps/" },
        { "s3_buzzs_dungeon",           "/LS308_BuzzsDungeon/Maps/" },
        { "s3_crawdad_farms",           "/LS309_CrawdadFarm/Maps/" },
        { "s3_icy_peak",                "/LS311_IcyPeak/Maps/" },
        { "s3_enchanted_towers",        "/LS312_EnchantedTowers/Maps/" },
        { "s3_spooky_swamp",            "/LS313_SpookySwamp/Maps/" },
        { "s3_bamboo_terrace",          "/LS314_BambooTerrace/Maps/" },
        { "s3_sgt_byrds_base",          "/LS315_SgtByrdsBase/Maps/" },
        { "s3_country_speedway",        "/LS316_CountrySpeedway/Maps/" },
        { "s3_spikes_arena",            "/LS317_SpikesArena/Maps/" },
        { "s3_spider_town",             "/LS318_SpiderTown/Maps/" },
        { "s3_lost_fleet",              "/LS320_LostFleet/Maps/" },
        { "s3_frozen_altars",           "/LS321_FrozenAltars/Maps/" },
        { "s3_fireworks_factory",       "/LS322_FireworksFactory/Maps/" },
        { "s3_charmed_ridge",           "/LS323_CharmedRidge/Maps/" },
        { "s3_bentleys_outpost",        "/LS324_BentleysOutpost/Maps/" },
        { "s3_honey_speedway",          "/LS325_HoneySpeedway/Maps/" },
        { "s3_scorchs_pit",             "/LS326_ScorchsPit/Maps/" },
        { "s3_starfish_reef",           "/LS327_StarfishReef/Maps/" },
        { "s3_crystal_islands",         "/LS329_CrystalIslands/Maps/" },
        { "s3_desert_ruins",            "/LS330_DesertRuins/Maps/" },
        { "s3_haunted_tomb",            "/LS331_HauntedTomb/Maps/" },
        { "s3_dino_mines",              "/LS332_DinoMines/Maps/" },
        { "s3_agent_9s_lab",            "/LS333_Agent9sLab/Maps/" },
        { "s3_harbor_speedway",         "/LS334_HarborSpeedway/Maps/" },
        { "s3_sorceresss_lair",         "/LS335_SorceresssLair/Maps/" },
        { "s3_bugbot_factory",          "/LS336_BugbotFactory/Maps/" },
        { "s3_super_bonus",             "/LS337_SuperBonusRound/Maps/" }
    };
}

init
{
    refreshRate = 30;

    if (modules.First().ModuleMemorySize == 61046784) 
    {
        print("Spyro Reignited Trilogy ASL started (game version detected: 1)");
        version = "1";
    }
    else 
    {
        print("Spyro Reignited Trilogy ASL started (unknown game version)");
    }
}

update
{
//  print("isNotLoading = " + current.isNotLoading.ToString());
//  print("inMenu = " + current.inMenu.ToString());
//  print("inGame = " + current.inGame.ToString());
//  print("healthRipto3 = " + current.healthRipto3.ToString())
//  print("map = " + current.map.ToString());
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
    foreach(KeyValuePair<string, string> entry in vars.mapIDs)
    {
        // For each map autosplit, if it's enabled, check if we just left the corresponding map
        if(settings[entry.Key] && old.map == entry.Value && current.map != entry.Value && current.map != null)
        {
            print("Autosplitting because going from map '" + old.map.ToString() + "' to map '" + current.map.ToString() + "'");
            return true;
        }
    }

    // Gnasty Gnorc kill specific handling  TODO
    if(false && settings["s1_kill_gnasty"])
        return true;

    // Ripto (last blow) specific handling  TODO
    if(false && settings["s2_kill_ripto"] && old.healthRipto3 == 1 && current.healthRipto3 == 0 && current.map == vars.mapIDs["s2_riptos_arena"])
        return true;

    // Sorceress (last blow) specific handling  TODO
    if(false && settings["s3_kill_sorceress"])
        return true;
    
    return false;
}

isLoading 
{
    // Game must be loading something to pause the timer
    if(current.isNotLoading != 0)
        return false;

    // Timer must never be paused on title screen
    if(current.inGame == 0)
        return false;
    
    // Timer must not be paused when inside menu to prevent abusing this by buffering a loading and pausing the game at the exact same frame.
    // We also check that the run didn't just start, because the "inMenu" state is active during the fade to black after game is selected
    // (which would cause 0.9s to elapse on run start whereas something is indeed loading).
    if(current.inMenu > 0 && timer.CurrentTime.RealTime.Value.TotalSeconds >= 3)
        return false;

    return true;
}
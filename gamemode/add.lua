	//Add More weapons to the table 
	RPWeapons =
	
	{
		["weapon_stunstick"] = { name = "Stunstick", model = "models/weapons/w_stunbaton.mdl", role = {"headpolice"}, price = 30, clipsize = 0, priammo = nil },
		["brp_somagun"] = { name = "Soma Air Gun", model = "models/weapons/w_rocket_launcher.mdl", role = {"headpolice"}, price = 0, clipsize = 3, priammo = "RPG_Round" },
		["weapon_ar2"] = { name = "AR2", model = "models/weapons/w_IRifle.mdl", role = {"headpolice"}, price = 0, clipsize = 30, priammo = "AR2" },
		["brp_railgun"] = { name = "Railgun", model = "models/weapons/w_annabelle.mdl", role = {"rebelleader"}, price = 0, clipsize = 24, priammo = "XBowBolt" },	
		["weapon_smg1"] = { name = "SMG", model = "models/weapons/w_smg1.mdl", role = {"rebelleader"}, price = 0, clipsize = 45, priammo = "SMG1" },
		["brp_spraygun"] = { name = "Spraygun", model = "models/weapons/w_smg1.mdl", role = {"watcher"}, price = 70, clipsize = 3, priammo = "357" },
		["brp_launcher"] = { name = "Improvised Launcher", model = "models/weapons/w_rocket_launcher.mdl", role = {"watcher"}, price = 50, clipsize = 5, priammo = "SMG1_Grenade" },
			
		//m9k Weapons
		["m9k_usp"] = { name = "HK USP", model = "models/weapons/w_pist_fokkususp.mdl", role = {"headpolice"}, price = 0, clipsize = 15, priammo = "Pistol" }, 	
		["m9k_hk45"] = { name = "HK 45C", model = "models/weapons/w_hk45c.mdl", role = {"rebelleader"}, price = 0, clipsize = 14, priammo = "Pistol" }, 	
		["m9k_ak74"] = { name = "AK74", model = "models/weapons/w_ak47_m9k.mdl", role = {"rebelleader"}, price = 0, clipsize = 30, priammo = "AR2" }, 	
		["m9k_mp5"] = { name = "MP5", model = "models/weapons/w_hk_mp5.mdl", role = {"rebelleader"}, price = 0, clipsize = 30, priammo = "SMG1" }, 	
		["m9k_m4a1"] = { name = "M4A1", model = "models/weapons/w_m4a1_iron.mdl", role = {"headpolice"}, price = 0, clipsize = 30, priammo = "AR2" }, 	
		["m9k_m3"] = { name = "BenelliM3", model = "models/weapons/w_benelli_m3.mdl", role = {"rebelleader"}, price = 0, clipsize = 8, priammo = "Buckshot" }, 	
		["m9k_m24"] = { name = "M24Sniper", model = "models/weapons/w_snip_m24_6.mdl", role = {"headpolice"}, price = 0, clipsize = 5, priammo = "SniperPenetratedRound" },	
		["m9k_g3a3"] = { name = "HKG3A3", model = "models/weapons/w_hk_g3.mdl", role = {"headpolice"}, price = 0, clipsize = 20, priammo = "AR2" } 	
	}

	//Add Entities
	RPEnts = 
	
	{
		["brp_soma"] = { name = "Soma", model = "models/healthvial.mdl", role = {"distributer"}, price = 0, crate = true },
		["brp_healthkit"] = { name = "Health Kits", model = "models/items/healthkit.mdl", role = {"medic"}, price = 0, crate = true },		
		["brp_geneticswap"] = { name = "Genetic Swapper", model = "models/Items/battery.mdl", role = {"medic"}, price = 0, crate = false },	
		["durgz_alcohol"] = { name = "Alcohol", model = "models/drug_mod/alcohol_can.mdl", role = {"bartender"}, price = 0, crate = true }
	}
	
	IntroModels = {
	
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_06.mdl",
	
	"models/player/group03/male_01.mdl",
	"models/player/group03/male_02.mdl",
	"models/player/group03/male_03.mdl",
	"models/player/group03/male_04.mdl",
	"models/player/group03/male_05.mdl",
	"models/player/group03/male_06.mdl",
	"models/player/group03/male_07.mdl",
	"models/player/group03/male_08.mdl",
	"models/player/group03/male_09.mdl",
	"models/player/group03/female_01.mdl",
	"models/player/group03/female_02.mdl",
	"models/player/group03/female_03.mdl",
	"models/player/group03/female_04.mdl",
	"models/player/group03/female_06.mdl",

	"models/player/group03m/male_01.mdl",
	"models/player/group03m/male_02.mdl",
	"models/player/group03m/male_03.mdl",
	"models/player/group03m/male_04.mdl",
	"models/player/group03m/male_05.mdl",
	"models/player/group03m/male_06.mdl",
	"models/player/group03m/male_07.mdl",
	"models/player/group03m/male_08.mdl",
	"models/player/group03m/male_09.mdl",
	"models/player/group03m/female_01.mdl",
	"models/player/group03m/female_02.mdl",
	"models/player/group03m/female_03.mdl",
	"models/player/group03m/female_04.mdl",
	"models/player/group03m/female_06.mdl",
	
	"models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl",
	"models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl",
	"models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl",
	"models/player/breen.mdl", 
	"models/player/breen.mdl", 
	"models/player/breen.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_police_bt.mdl",
	"models/dpfilms/metropolice/playermodels/pm_police_bt.mdl",
	"models/dpfilms/metropolice/playermodels/pm_police_bt.mdl",
	"models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_biopolice.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_biopolice.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_biopolice.mdl", 
	"models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl"
	}
	
	//Add model with carac
	RPModels =
	
	{
		["Citizen"] = {  
			id = "citizen",
			name = "Citizen Outfit", 
			model = "models/player/group01/", 
			role = {"default"},
			weight = 0,	//Slows you down		
			gasProof = false, //Protects from soma gas
			default = true, //default model, no role req
			droppable = false, //can drop?
			diffModel = true},//different model for each citizen
		
		["Rebel"] = { 
			id = "rebel", 
			name = "Rebel Outfit", 
			model = "models/player/group03/", 
			role = {"rebel"}, 
			weight = 0,
			gasProof = false, 
			default = false, 
			droppable = true,
			diffModel = true},//Default
		
		["Medic"] = { 
			id = "medic", 
			name = "Medic Outfit", 
			model = "models/player/group03m/",
			role = {"medic"}, 
			weight = 0,
			gasProof = false, 
			default = false, 
			droppable = true,
			diffModel = true},//Default
		
		["Police"] = { 
			id = "police", 
			name = "Police Outfit", 
			model = "models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl", 
			role = {"police"}, 
			weight = 20,
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},
		
		["DHC"] = { 
			id = "dhc", 
			name = "DHC Outfit",
			model = "models/player/breen.mdl", 
			role = {"dhc"}, 
			weight = 0,
			gasProof = false, 
			default = false,
			droppable = true,
			diffModel = false},
		
		["Watcher"] = { 
			id = "watcher", 
			name = "Watcher Outfit", 
			model = "models/dpfilms/metropolice/playermodels/pm_police_bt.mdl",
			role = {"watcher"},
			weight = 50,
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},
		
		["HeadPolice"] = { 
			id = "headpolice", 
			name = "Head Police Outfit",
			model = "models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl", 
			role = {"headpolice"}, 
			weight = 50,
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},
			
		["BioElite"] = { 
			id = "bioelite", 
			name = "Bio Elite Outfit",
			model = "models/dpfilms/metropolice/playermodels/pm_biopolice.mdl", 
			role = {"bioelite"}, 
			weight = 50,
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},	

		["BioRebel"] = {  
			id = "biorebel", 
			name = "Bio Rebel Outfit",
			model = "models/player/combine_super_soldier.mdl", 
			role = {},
			weight = 50,
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},				


		["Soldier"] = { 
			id = "soldier", 
			name = "Soldier Outfit",
			model = "models/player/combine_soldier.mdl", 
			role = {}, 
			weight = 50,
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},	

		["Guard"] = {
			id = "guard", 
			name = "Prison Guard Outfit",
			model = "models/player/combine_soldier_prisonguard.mdl", 
			role = {},
			weight = 50,			
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},	
			
		["RebelLeader"] = { 
			id = "rebelleader", 
			name = "Rebel Leader Outfit", 
			model = "models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl", 
			role = {"rebelleader"}, 
			weight = 50,
			gasProof = true, 
			default = false, 
			droppable = false,
			diffModel = false}			
	}
	
	
	PoliceAgenda = "Please Respect the rules"
	
	
	//table for buying outfits
	RPBuyOutfits =
	
	{
		["Police"] = { 
			id = "police", 
			role = {"headpolice"}, 
			price = 100 },
		["BioRebel"] = { 
			id = "biorebel", 
			role = {"rebelleader"}, 
			price = 200 },		
		
		["Rebel"] = { 
			id = "rebel", 
			role = {"rebelleader"}, 
			price = 50 },	
		
		["Soldier"] = { 
			id = "soldier", 
			role = {"headpolice"}, 
			price = 100 },		
		
		["Guard"] = { 
			id = "guard", 
			role = {"headpolice"},
			price = 100 }		
	}
	
	//Roles that have radio and the police tab
	RPCops =
	
	{
		"headpolice",
		"watcher",
		"bioelite",
		"police"
	}
	
	
	CopNoise = {
	
		"npc/metropolice/vo/citizen.wav",
		"npc/metropolice/vo/code100.wav",
		"npc/metropolice/vo/code7.wav",
		"npc/metropolice/vo/condemnedzone.wav",
		"npc/metropolice/vo/controlsection.wav",
		"npc/metropolice/vo/converging.wav",
		"npc/metropolice/vo/copy.wav"
	
	}	
	
	//Roles that have the police tab
	ReqWantedTab =
	{
		"dhc",
		"headpolice"
	}
	
	WaypointTable = {}
	
	
	//Models that can see Citizen ID and have hidden names
	ModelTech = 
	
	{
		"headpolice",
		"watcher",
		"bioelite",
		"biorebel",
		"guard",
		"soldier",
		"police"
	}
	
	//Add Roles
	RPRoles =
	
	{
		["null"] = { name = "Demote", admin = false, weps = {} },
		
		["police"] = { name = "Police", admin = false, weps = {} },
		
		["citizen"] = { name = "Citizen", admin = false, weps = {} },
		
		["dhc"] = { name = "DHC", admin = true, weps = {} },
		
		["rebelleader"] = { name = "Rebel Leader", admin = true, weps = {} },
		
		["watcher"] = { name = "Watcher", admin = false, weps = {} },
		
		["headpolice"] = { name = "Head Police", admin = true, weps = {"weapon_stunstick", "brp_somagun" } },
		
		["bioelite"] = { name = "Bio Elite", admin = false, weps = { "brp_somagun" } },
		
		["distributer"] = { name = "Distributer", admin = false, weps = {} },
		
		["medic"] = { name = "Medic", admin = false, weps = {"weapon_medkit"} },
		
		["rebel"] = { name = "Rebel", admin = false, weps = {} },
		
		["bartender"] = { name = "Bartender", admin = false, weps = {} }
	
	} 
	
	//Types of valid doors
	RPDoors = {
	
		"prop_door_rotating",
		
		"func_door_rotating",
		
		"func_door"
	
	}


	/*
	model = "models/weapons/w_beretta_m92.mdl",
	entity = "m9k_m92beretta",

	model = "models/weapons/s_dmgf_co1911.mdl",
	entity = "m9k_colt1911",

	model = "models/weapons/w_hk45c.mdl",
	entity = "m9k_hk45",

	model = "models/weapons/w_pist_fokkususp.mdl",
	entity = "m9k_usp",

	model = "models/weapons/w_ak47_m9k.mdl",
	entity = "m9k_ak74",

	model = "models/weapons/w_hk_mp5.mdl",
	entity = "m9k_mp5",

	model = "models/weapons/w_m4a1_iron.mdl",
	entity = "m9k_m4a1",

	model = "models/weapons/w_benelli_m3.mdl",
	entity = "m9k_m3",

	model = "models/weapons/w_ithaca_m37.mdl",
	entity = "m9k_ithacam37",

	model = "models/weapons/w_snip_m24_6.mdl",
	entity = "m9k_m24",

	model = "models/weapons/w_hk_g3.mdl",
	entity = "m9k_g3a3",
*/
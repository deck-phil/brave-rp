	//Add More weapons to the table 
	RPWeapons =
	
	{
		["weapon_stunstick"] = { name = "Stunstick", model = "models/weapons/w_stunbaton.mdl", role = "headpolice", weapon = "weapon_stunstick", price = 0, clipsize = 0, priammo = nil },
		["brp_somagun"] = { name = "Soma Air Gun", model = "models/weapons/w_rocket_launcher.mdl", role = "headpolice", weapon = "brp_somagun", price = 0, clipsize = 2, priammo = "RPG_Round" },
		["weapon_ar2"] = { name = "AR2", model = "models/weapons/w_IRifle.mdl", role = "headpolice", weapon = "weapon_ar2", price = 0, clipsize = 30, priammo = "AR2" },
		["brp_railgun"] = { name = "Railgun", model = "models/weapons/w_annabelle.mdl", role = "rebelleader", weapon = "brp_railgun", price = 0, clipsize = 24, priammo = "XBowBolt" },	
		["weapon_smg1"] = { name = "SMG", model = "models/weapons/w_smg1.mdl", role = "rebelleader", weapon = "weapon_smg1", price = 0, clipsize = 45, priammo = "SMG1" },
		["brp_spraygun"] = { name = "Spraygun", model = "models/weapons/w_smg1.mdl", role = "watcher", weapon = "brp_spraygun", price = 0, clipsize = 3, priammo = "357" },
		["brp_launcher"] = { name = "Improvised Launcher", model = "models/weapons/w_rocket_launcher.mdl", role = "watcher", weapon = "brp_launcher", price = 0, clipsize = 5, priammo = "SMG1_Grenade" }//,	
		//["m9k_usp"] = { name = "HK USP", model = "models/weapons/w_pist_fokkususp.mdl", role = "headpolice", weapon = "m9k_usp", price = 0, clipsize = 14, priammo = "SMG1_Grenade" } 	
	}
	
	//Add Entities
	RPEnts = 
	
	{
		["Soma"] = { name = "Soma", model = "models/healthvial.mdl", role = "distributer", ent = "Soma", price = 0, crate = true },
		["HealthKits"] = { name = "Health Kits", model = "models/items/healthkit.mdl", role = "medic", ent = "brp_healthkit", price = 0, crate = true },		
		["GeneticSwap"] = { name = "Genetic Swapper", model = "models/Items/battery.mdl", role = "medic", ent = "brp_geneticswap", price = 0, crate = false },	
		["Alcohol"] = { name = "Alcohol", model = "models/drug_mod/alcohol_can.mdl", role = "bartender", ent = "durgz_alcohol", price = 0, crate = true }
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
			tblName = "Citizen", 
			id = "citizen",
			name = "Citizen Outfit", 
			model = "models/player/group01/", 
			role = "default", 
			gasProof = false, //Protects from soma gas
			default = true, //default model, no role req
			droppable = false, //can drop?
			diffModel = true},//different model for each citizen
		
		["Rebel"] = { 
			tblName = "Rebel", 
			id = "rebel", name = "Rebel Outfit", 
			model = "models/player/group03/", 
			role = "rebel", 
			gasProof = false, 
			default = false, 
			droppable = true,
			diffModel = true},//Default
		
		["Medic"] = { 
			tblName = "Medic", 
			id = "medic", 
			name = "Medic Outfit", 
			model = "models/player/group03m/",
			role = "medic", 
			gasProof = false, 
			default = false, 
			droppable = true,
			diffModel = true},//Default
		
		["Police"] = { 
			tblName = "Police", 
			id = "police", 
			name = "Police Outfit", 
			model = "models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl", 
			role = "police", 
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},
		
		["DHC"] = { 
			tblName = "DHC", 
			id = "dhc", 
			name = "DHC Outfit",
			model = "models/player/breen.mdl", 
			role = "dhc", 
			gasProof = false, 
			default = false,
			droppable = true,
			diffModel = false},
		
		["Watcher"] = { 
			tblName = "Watcher", 
			id = "watcher", 
			name = "Watcher Outfit", 
			model = "models/dpfilms/metropolice/playermodels/pm_police_bt.mdl",
			role = "watcher",
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},
		
		["HeadPolice"] = { 
			tblName = "HeadPolice", 
			id = "headpolice", 
			name = "Head Police Outfit",
			model = "models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl", 
			role = "headpolice", 
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},
			
		["BioElite"] = { 
			tblName = "BioElite", 
			id = "bioelite", 
			name = "Bio Elite Outfit",
			model = "models/dpfilms/metropolice/playermodels/pm_biopolice.mdl", 
			role = "bioelite", 
			gasProof = true, 
			default = false, 
			droppable = true,
			diffModel = false},			
		
		["RebelLeader"] = { 
			tblName = "RebelLeader", 
			id = "rebelleader", 
			name = "Rebel Leader Outfit", 
			model = "models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl", 
			role = "rebelleader", 
			gasProof = true, 
			default = false, 
			droppable = false,
			diffModel = false}			
	}
	
	
	PoliceAgenda = "Please Respect the rules"
	
	
	//table for buying outfits
	RPBuyOutfits =
	
	{
		["Police"] = { id = "police", name = "Police Outfit", model = "models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl", role = "headpolice", price = 0 },
		["Rebel"] = { id = "rebel", name = "Rebel Outfit", model = "models/player/Group03/", role = "rebelleader", price = 0 },		
	}
	
	//Roles that have radio and the police tab
	RPCops =
	
	{
		"headpolice",
		"watcher",
		"police"
	}
	
	WaypointTable = {}
	
	
	//Models that can see Citizen ID and have hidden names
	ModelTech = 
	
	{
		"headpolice",
		"watcher",
		"bioelite",
		"police"
	}
	
	//Add Roles
	RPRoles =
	
	{
	["null"] = { role = "null", name = "Demote", admin = false, weps = {} },
	
	["police"] = { role = "police", name = "Police", admin = false, weps = {} },
	
	["citizen"] = { role = "citizen", name = "Citizen", admin = false, weps = {} },
	
	["dhc"] = { role = "dhc", name = "DHC", admin = true, weps = {} },
	
	["rebelleader"] = { role = "rebelleader", name = "Rebel Leader", admin = true, weps = {} },
	
	["watcher"] = { role = "watcher", name = "Watcher", admin = false, weps = {} },
	
	["headpolice"] = { role = "headpolice", name = "Head Police", admin = true, weps = {"weapon_stunstick", "brp_somagun" } },
	
	["bioelite"] = { role = "bioelite", name = "Bio Elite", admin = true, weps = { "brp_somagun" } },
	
	["distributer"] = { role = "distributer", name = "Distributer", admin = false, weps = {} },
	
	["medic"] = { role = "medic", name = "Medic", admin = false, weps = {"weapon_medkit"} },
	
	["rebel"] = { role = "rebel", name = "Rebel", admin = false, weps = {} },
	
	["bartender"] = { role = "bartender", name = "Bartender", admin = false, weps = {} }
	
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
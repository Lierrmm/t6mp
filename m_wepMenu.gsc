weaponFunctions()
{
	                self createMenu("Weapons", "Weapons Menu", "menu6");
            self addOption("Weapons",0,"Assault Rifles",::_loadMenu, "Assault Rifles");
            self addOption("Weapons",1,"Sub Machine Guns",::_loadMenu, "Sub Machine Guns");
            self addOption("Weapons",2,"Shotguns",::_loadMenu, "Shotguns");
            self addOption("Weapons",3,"Lightmachine Guns",::_loadMenu, "Lightmachine Guns");
            self addOption("Weapons",4,"Sniper Rifles",::_loadMenu, "Sniper Rifles");
            self addOption("Weapons",5,"Pistols",::_loadMenu, "Pistols");
            self addOption("Weapons",6,"Launchers",::_loadMenu, "Launchers");
            self addOption("Weapons",7,"Specials",::_loadMenu, "Specials");
            
            
            self createMenu("Assault Rifles", "Assault Rifles", "Weapons");//the middle part is the menu name
            self addOption("Assault Rifles",0,"M-TAR",::gWeap, "tar21", "assault");
            self addOption("Assault Rifles",1,"Type 95",::gWeap, "type95", "assault");
            self addOption("Assault Rifles",2,"SWAT",::gWeap, "sig556", "assault");
            self addOption("Assault Rifles",3,"FAL",::gWeap, "sa58", "assault");
            self addOption("Assault Rifles",4,"M27",::gWeap, "hk416", "assault");
            self addOption("Assault Rifles",5,"SCAR-H",::gWeap, "scar", "assault");
            self addOption("Assault Rifles",6,"SMR",::gWeap, "saritch", "assault");
            self addOption("Assault Rifles",7,"M8A1",::gWeap, "xm8", "assault");
            self addOption("Assault Rifles",8,"AN-94",::gWeap, "an94", "assault");
            
            self createMenu("Sub Machine Guns", "SMGs", "Weapons");//the middle part is the menu name
            self addOption("Sub Machine Guns",0,"MP7",::gWeap, "mp7", "smg");
            self addOption("Sub Machine Guns",1,"PDW",::gWeap, "pdw", "smg");
            self addOption("Sub Machine Guns",2,"Vector",::gWeap, "vector", "smg");
            self addOption("Sub Machine Guns",3,"MSMC",::gWeap, "insas", "smg");
            self addOption("Sub Machine Guns",4,"Chicom",::gWeap, "qcw05", "type");
            self addOption("Sub Machine Guns",5,"Skorpion",::gWeap, "evoskorpion", "smg");
            self addOption("Sub Machine Guns",6,"Peacekeeper",::gWeap, "peacekeeper", "smg");
            
            self createMenu("Shotguns", "Shotguns", "Weapons");//the middle part is the menu name
            self addOption("Shotguns",0,"Remington",::gWeap, "870mcs", "type");
            self addOption("Shotguns",1,"S12",::gWeap, "saiga12", "type");
            self addOption("Shotguns",2,"KSG",::gWeap, "ksg", "type");
            self addOption("Shotguns",3,"M1216",::gWeap, "srm1216", "type");
            
            self createMenu("Lightmachine Guns", "LMGs", "Weapons");//the middle part is the menu name
            self addOption("Lightmachine Guns",0,"HAMR",::gWeap, "hamr", "type");
            self addOption("Lightmachine Guns",1,"LSAT",::gWeap, "lsat", "type");
            self addOption("Lightmachine Guns",2,"QBB LSW",::gWeap, "qbb95", "type");
            self addOption("Lightmachine Guns",3,"MK-48",::gWeap, "mk48", "type");
            
            self createMenu("Sniper Rifles", "Snipers", "Weapons");//the middle part is the menu name
            self addOption("Sniper Rifles",0,"Ballista",::gWeap, "ballista", "type");
            self addOption("Sniper Rifles",1,"DSR",::gWeap, "dsr50", "type");
            self addOption("Sniper Rifles",2,"SVU",::gWeap, "svu", "type");
            self addOption("Sniper Rifles",3,"XPR",::gWeap, "as50", "type");
            
            self createMenu("Pistols", "Pistols", "Weapons");//the middle part is the menu name
            self addOption("Pistols",0,"Kap-40",::gWeap, "kard", "type");
            self addOption("Pistols",1,"Executioner",::gWeap, "judge", "type");
            self addOption("Pistols",2,"B23R",::gWeap, "baretta93r", "type");
            self addOption("Pistols",3,"Tac-45",::gWeap, "fnp45", "type");
            self addOption("Pistols",4,"Five-Seven",::gWeap, "fiveseven", "type");
            
            
            self createMenu("Launchers", "Launchers", "Weapons");//the middle part is the menu name
            self addOption("Launchers",0,"SMAW",::gWeap, "smaaw", "type");
            self addOption("Launchers",1,"FHJ-18 AA",::gWeap, "fhj18", "type");
            self addOption("Launchers",2,"RPG",::gWeap, "usrpg", "type");
            
            self createMenu("Specials", "Specials", "Weapons");//the middle part is the menu name
            self addOption("Specials",0,"Riot Shield",::gWeap, "riotshield", "type");
            self addOption("Specials",1,"Crossbow",::gWeap, "crossbow", "type");
            self addOption("Specials",2,"Ballistic Knife",::gWeap, "knife_ballistic", "type");
            
            
            self createMenu("assault", "Attachments");
                self addOption("assault",0,"silencer", ::gAttach, "silencer");
                self addOption("assault",1, "Reflex Sight", ::gAttach, "reflex");
                self addOption("assault",2, "Quickdraw", ::gAttach, "fastads");
                self addOption("assault",3, "Fast Mags", ::gAttach, "dualclip");
                self addOption("assault",4, "Acog",::gAttach, "acog");
                self addOption("assault",5, "Grip", ::gAttach, "grip");
                self addOption("assault",6, "Stock", ::gAttach, "stalker");
                self addOption("assault",7, "Target Finder", ::gAttach, "rangefinder");
                self addOption("assault",8, "Laser", ::gAttach, "steadyaim");
                self addOption("assault",9, "Select Fire", ::gAttach, "sf");
                self addOption("assault",10,"EOTech Sight", ::gAttach, "holo");
                self addOption("assault",11,"FMJ", ::gAttach, "fmj");
                self addOption("assault",12,"Extended Mags", ::gAttach, "extclip");
                self addOption("assault",13, "Grenade Launcher", ::gAttach, "gl");
                self addOption("assault",14, "MMS", ::gAttach, "mms");
                self addOption("assault",15, "Rapid Fire", ::gAttach, "rf");
                self addOption("assault",16, "Variable Zoom", ::gAttach, "vzoom");
                self addOption("assault",17, "Ballistic CPU", ::gAttach, "swayreduc");
                self addOption("assault",18, "Dual Band", ::gAttach, "ir");
                self addOption("assault",19, "Iron Sight", ::gAttach, "is");
    
       self CreateMenu("menu11","Camo Menu","main");
            self addOption("menu11",0,"No Camo",::givedefcamo);
            self addOption("menu11",1,"Default Camos",::_loadMenu, "Default Camos");
            self addOption("menu11",2,"DLC 1 Camos",::_loadMenu, "DLC 1 Camos");
            self addOption("menu11",3,"DLC 2 Camos",::_loadMenu, "DLC 2 Camos");
            self addOption("menu11",4,"Pre-Order Camos",::_loadMenu, "Pre-Order Camos");
            
            
            
            
            self createMenu("Default Camos", "Default Camos", "menu11");
            self addOption("Default Camos",0,"DEVGRU",::gWeapCamo, 1);
            self addOption("Default Camos",1,"A-TACS AU",::gWeapCamo, 2);
            self addOption("Default Camos",2,"ERDL",::gWeapCamo, 3);
            self addOption("Default Camos",3,"Siberia",::gWeapCamo, 4);
            self addOption("Default Camos",4,"Choco",::gWeapCamo, 5);
            self addOption("Default Camos",5,"Blue Tiger",::gWeapCamo, 6);
            self addOption("Default Camos",6,"Bloodshot",::gWeapCamo, 7);
            self addOption("Default Camos",7,"Ghostex: Delta 6",::gWeapCamo, 8);
            self addOption("Default Camos",8,"Kryptek: Typhon",::gWeapCamo, 9);
            self addOption("Default Camos",9,"Carbon Fiber",::gWeapCamo, 10);
            self addOption("Default Camos",10,"Cherry Blossom",::gWeapCamo, 11);
            self addOption("Default Camos",11,"Art of War",::gWeapCamo, 12);
            self addOption("Default Camos",12,"Ronin",::gWeapCamo, 13);
            self addOption("Default Camos",13,"Skulls",::gWeapCamo, 14);
            self addOption("Default Camos",14,"Gold",::gWeapCamo, 15);
            self addOption("Default Camos",15,"Diamond",::gWeapCamo, 16);
            
            
            
            self createMenu("DLC 1 Camos", "DLC 1 Camos", "menu11");
            self addOption("DLC 1 Camos",0,"Jungle Warfare",::gWeapCamo, 19);
            self addOption("DLC 1 Camos",1,"Benjamins",::gWeapCamo, 21);
            self addOption("DLC 1 Camos",2,"Dia De Los Muertos",::gWeapCamo, 22);
            self addOption("DLC 1 Camos",3,"Graffiti",::gWeapCamo, 23);
            self addOption("DLC 1 Camos",4,"Kawaii",::gWeapCamo, 24);
            self addOption("DLC 1 Camos",5,"Party Rock",::gWeapCamo, 25);
            self addOption("DLC 1 Camos",6,"Zombies",::gWeapCamo, 26);
            self addOption("DLC 1 Camos",7,"Viper",::gWeapCamo, 27);
            self addOption("DLC 1 Camos",8,"Bacon",::gWeapCamo, 28);
            self addOption("DLC 1 Camos",9,"Cyborg",::gWeapCamo, 31);
            self addOption("DLC 1 Camos",10,"Dragon",::gWeapCamo, 32);
            self addOption("DLC 1 Camos",11,"Aqua",::gWeapCamo, 34);
            self addOption("DLC 1 Camos",12,"Breach",::gWeapCamo, 35);
            self addOption("DLC 1 Camos",13,"Coyote",::gWeapCamo, 36);
            self addOption("DLC 1 Camos",14,"Glam",::gWeapCamo, 37);
            self addOption("DLC 1 Camos",15,"Rogue",::gWeapCamo, 38);
            self addOption("DLC 1 Camos",16,"Pack-a-Punch",::gWeapCamo, 39);
            
            
            
            
            
            self createMenu("DLC 2 Camos", "DLC 2 Camos", "menu11");
            self addOption("DLC 2 Camos",0,"UK Punk",::gWeapCamo, 20);
            self addOption("DLC 2 Camos",1,"Paladin",::gWeapCamo, 30);
            self addOption("DLC 2 Camos",2,"Comics",::gWeapCamo, 33);
            self addOption("DLC 2 Camos",3,"Dead Man's Hand",::gWeapCamo, 40);
            self addOption("DLC 2 Camos",4,"Beast",::gWeapCamo, 41);
            self addOption("DLC 2 Camos",5,"Octane",::gWeapCamo, 42);
            self addOption("DLC 2 Camos",6,"Weaponized 115",::gWeapCamo, 43);
            self addOption("DLC 2 Camos",7,"Afterlife",::gWeapCamo, 44);
            
            
            
            self createMenu("Pre-Order Camos", "Pre-Order", "menu11");
            self addOption("Pre-Order Camos",0,"CE Digital",::gWeapCamo, 18);
            self addOption("Pre-Order Camos",1,"Ghosts",::gWeapCamo, 29);
            self addOption("Pre-Order Camos",2,"Advance Warfare",::gWeapCamo, 45);
            
}

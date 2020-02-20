
menuStructure()
{
    self CreateMenu("main","Main Menu","Enjoy your VIP access!","Exit");
    	self addOption("main",0, "Location Menu", "These functions edit your location!", ::_loadMenu,"loc");
    	self addOption("main",1, "Give Items", "Give youself ammo, weapons, killstreaks", ::_loadMenu, "giv");
    	self addOption("main",2, "Spawnables", "Spawn objects around the map!", ::_loadMenu, "spawns");
    	self addOption("main",3, "Menu Settings","Edit menu theme, color, and settings",::_loadMenu,"menSet");

	self CreateMenu("giv", "Give Items", "main");
		self addOption("giv", 0, "Refill Ammo", "Refill all ammo.", ::ammoFunc,3);
		self addOption("giv", 1, "Fast Last", "Set yourself to last!", ::fastLast);

    self CreateMenu("menSet", "Menu Settings","Edit menu theme, color, and settings.", "main");
    st = "Change menu color to: ";
    	self addOption("menSet",0,"Red",   st + "Red",::mColor, (1,0,0), "R");
    	self addOption("menSet",1,"Orange",st + "Orange",::mColor, (1,0.4,0), "O");
    	self addOption("menSet",2,"Yellow",st + "Yellow",::mColor, (1,.8,0), "Y");
    	self addOption("menSet",3,"Green", st + "Green",::mColor, (0,1,0), "G");
    	self addOption("menSet",4,"Teal",  st + "Teal",::mColor, (0,1,.6), "T");
    	self addOption("menSet",5,"Blue",  st + "Blue",::mColor, (0,0,1), "B");
    	self addOption("menSet",6,"Cyan",  st + "Cyan",::mColor, (.2,.4,.7),"C");
    
    self CreateMenu("loc", "Location Menu","These functions edit your location!", "main");
    	self addOption("loc",0,"Save Location","Save your current origin!",::saveLoad,1);
    	self addOption("loc",1, "Load Location", "Load your saved location!",::saveLoad,2);
    	self addOption("loc",2, "Clear Saved Location" ,"Clear your saved location!",::saveLoad,3);
    	self addOption("loc",3, "Location Binds" ,"Save and Load your location!",::saveLoad,4);
    	self addOption("loc",4, "Load on spawn", "Load your saved location!", ::saveLoad,5);
    
    self CreateMenu("spawns", "Spawnables", "main");
        self addOption("spawns",0, "Spawn Invisible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce,"null");
    	self addOption("spawns",1, "Spawn Visible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce, "t6_wpn_supply_drop_trap");
    	self addOption("spawns",2, "Spawn Slide", "Spawn a slide CP", ::spawnSlide);
    
    
    
    
    
    
    s = "Select ";
    self CreateMenu("attachments", "Select Attachment", "Pick the attachment for your weapon!");
    self addOption("attachments", 0, "Silencer", s+"Silencer", ::gAttach, "silencer");
    
    self CreateMenu("camos", "Select Camo","Pick the camo for your weapon");
    self addOption("camos",0, "Random Int", "Selects a random Camo", ::gCamo, 4);
}

getTheme(var)
{
	if(var == "R")return (1,0,0);
	if(var == "O")return (1,0.4,0);
	if(var == "Y")return (1,1,0);
	if(var == "G")return (0,1,0);
	if(var == "T")return (0,1,.6);
	if(var == "B")return (0,0,1);
	if(var == "C")return (.2,.4,.7);
}





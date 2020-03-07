
menuStructure()
{
    self CreateMenu("main","Main Menu","Exit");
    	self addOption("main",0, "Location Menu", "These functions edit your location!", ::_loadMenu,"loc");
    	self addOption("main",1, "Give Items", "Give youself ammo, weapons, killstreaks", ::_loadMenu, "giv");
    	self addOption("main",2, "Spawnables", "Spawn objects around the map!", ::_loadMenu, "spawns");
    	self addOption("main",3, "Weapon System [^1BETA^7]", "Create a class in Game!", ::_loadMenu, "cac");
    	self cacSystem();
    	self addOption("main",4, "Menu Settings","Edit menu theme, color, and settings",::_loadMenu,"menSet");
    	//self addOption("main",5, "Debug Exit", "End game faster",::instaEnd);
    	
	self CreateMenu("giv", "Give Items", "main");
		self addOption("giv", 0, "Give Ammo", "Refill all ammo.", ::ammoFunc,3);
		self addOption("giv", 1, "Give Last", "Set yourself to last!", ::fastLast);
		self addOption("giv", 2, "Give Killstreaks", "Fill your killstreaks", ::giveKillstreaks);
		self addOption("giv", 3, "Remove Hands", "Remove hands from your gun", ::removeHands, "viewmodel_hands_no_model");
		
    self CreateMenu("menSet", "Menu Settings", "main");
    st = "Change menu color to: ";
    	self addOption("menSet",0,"Freeze in Menu", "Toggle whether you freeze while in menu.", ::mSet, 1);
    	self addOption("menSet",1,"Menu Instructions", "Enable or Disable Menu Instructions!", ::mSet,0);
    	self addOption("menSet",2,"Disable Killfeed", "Disables all text in killfeed", ::removeFeed);
    	self addOption("menSet",3,"Menu Colors", "Edit the look and feel of the menu.", ::_loadMenu, "menSets");
    	self createMenu("menSets", "Menu Colors", "menSet");
    	self addOption("menSets",0,"Red",   st + "Red",::mColor, (1,0,0), "R");
    	self addOption("menSets",1,"Orange",st + "Orange",::mColor, (1,0.4,0), "O");
    	self addOption("menSets",2,"Yellow",st + "Yellow",::mColor, (1,.8,0), "Y");
    	self addOption("menSets",3,"Green", st + "Green",::mColor, (0,1,0), "G");
    	self addOption("menSets",4,"Teal",  st + "Teal",::mColor, (0,1,.6), "T");
    	self addOption("menSets",5,"Blue",  st + "Blue",::mColor, (0,0,1), "B");
    	self addOption("menSets",6,"Cyan",  st + "Cyan",::mColor, (.2,.4,.7),"C");
    
    self CreateMenu("loc", "Location Menu", "main");
    	self addOption("loc",0,"Save Location","Save your current origin!",::saveLoad,1);
    	self addOption("loc",1, "Load Location", "Load your saved location!",::saveLoad,2);
    	//self addOption("loc",2, "Clear Saved Location" ,"Clear your saved location!",::saveLoad,3);
    	//self addOption("loc",3, "Location Binds" ,"Save and Load your location!",::saveLoad,4);
    	self addOption("loc",2, "Load on spawn", "Load your saved location!", ::saveLoad,5);
    
    self CreateMenu("spawns", "Spawnables", "main");
        self addOption("spawns",0, "Spawn Invisible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce,"null");
    	self addOption("spawns",1, "Spawn Visible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce, "t6_wpn_supply_drop_trap");
    	self addOption("spawns",2, "Spawn Slide", "Spawn a slide CP", ::spawnSlide);
    	self addOption("spawns",3, "Delete Slide", "Delete your slide", ::destroySlide);
    	self addOption("spawns",4, "Spawn NON VIP Slide", "Spawn a slide CP for everyone to use.", ::spawnSlideNVP);
    	self addOption("spawns",5, "Delete NON VIP Slide", "Delete your non vip slide.", ::destroySlideNVP);
    
    
    
    
    
    
    s = "Select ";
    self CreateMenu("attachments", "Select Attachment", "Pick the attachment for your weapon!");
    self addOption("attachments", 0, "Silencer", s+"Silencer", ::gAttach, "silencer");
    
    self CreateMenu("camos", "Select Camo","Pick the camo for your weapon");
    self addOption("camos",0, "Random Int", "Selects a random Camo", ::gCamo, 4);
}

getTheme()
{
	var = getDvar(self getXUID() + "m_setting");
	if(var == "R")self.menuColors = (1,0,0);
	else if(var == "O")self.menuColors = (1,0.4,0);
	else if(var == "Y")self.menuColors = (1,1,0);
	else if(var == "G")self.menuColors = (0,1,0);
	else if(var == "T")self.menuColors = (0,1,.6);
	else if(var == "B")self.menuColors = (0,0,1);
	else if(var == "C")self.menuColors = (.2,.4,.7);
	else self.menuColors = (1,0.4,0);
}
mSet(val)
{
	if(val == 1)
	{
		if(self.freezeIn == false)
		{
			self.freezeIn = true;
			self freezeControls(true);
		}
		else 
		{	
			self.freezeIn = false;
			self freezeControls(false);
		}
		self dn("Freeze in Menu" + rTF(self.freezeIn));
	}
	if(val == 0)
	{
		if(!self.watermark)	
		{
			self.watermark = true;
			setDvar(self getXUID() + "m_inst", "on");
    		self.Hud.insBackground = createText("default", 1.2, "RIGHT", "TOPRIGHT", 40,0, 1, (1,1,1),1,(0,0,0),0,"Press [{+speed_throw}] + [{+melee}] to Open | [{+speed_throw}] & [{+attack}] to Scroll | [{+melee}] to go Back or Close");
			self.Hud.insShader = createRectangle("RIGHT", "TOPRIGHT", 50,2 ,280, 20, (0,0,0), .6, 0, "white");
		}
		else 
		{
			setDvar(self getXUID() + "m_inst", "off");
			self.watermark = false;
			self.Hud.insBackground destroy();
			self.Hud.insShader destroy();
		}
		self dn("Watermark" + rTF(self.watermark));
	}
}

rTF(var)
{
	if(var == true)
	return " ^2Enabled";
	return " ^1Disabled";

}









menuStructure()
{
    self CreateMenu("main","Main Menu","Exit");
    	self addOptionDesc("main",0, "Location Menu", "These functions edit your location!", ::_loadMenu,"loc");
    	self addOptionDesc("main",1, "Give Items", "Give youself ammo, weapons, killstreaks", ::_loadMenu, "giv");
    	self addOptionDesc("main",2, "Spawnables", "Spawn objects around the map!", ::_loadMenu, "spawns");
    	self addOptionDesc("main",3, "Weapons Menu", "Select a weapon to give yourself!", ::_loadMenu, "Weapons");
    	self addOptionDesc("main",4, "Camo Menu", "Select a camo for your gun!", ::_loadMenu, "menu11");
    	self addOptionDesc("main",3, "Menu Settings","Edit menu theme, color, and settings",::_loadMenu,"menSet");

	self CreateMenu("giv", "Give Items", "main");
		self addOptionDesc("giv", 0, "Refill Ammo", "Refill all ammo.", ::ammoFunc,3);
		self addOptionDesc("giv", 1, "Fast Last", "Set yourself to last!", ::fastLast);

    self CreateMenu("menSet", "Menu Settings","Edit menu theme, color, and settings.", "main");
    st = "Change menu color to: ";
    	self addOptionDesc("menSet",0,"Freeze in Menu", "Toggle whether you freeze while in menu.", ::mSet, 1);
    	self addOptionDesc("menSet",1,"Menu Instructions", "Enable or Disable Menu Instructions!", ::mSet,0);
    	self addOptionDesc("menSet",2,"Red",   st + "Red",::mColor, (1,0,0), "R");
    	self addOptionDesc("menSet",3,"Orange",st + "Orange",::mColor, (1,0.4,0), "O");
    	self addOptionDesc("menSet",4,"Yellow",st + "Yellow",::mColor, (1,.8,0), "Y");
    	self addOptionDesc("menSet",5,"Green", st + "Green",::mColor, (0,1,0), "G");
    	self addOptionDesc("menSet",6,"Teal",  st + "Teal",::mColor, (0,1,.6), "T");
    	self addOptionDesc("menSet",7,"Blue",  st + "Blue",::mColor, (0,0,1), "B");
    	self addOptionDesc("menSet",8,"Cyan",  st + "Cyan",::mColor, (.2,.4,.7),"C");
    
    self CreateMenu("loc", "Location Menu","These functions edit your location!", "main");
    	self addOptionDesc("loc",0,"Save Location","Save your current origin!",::saveLoad,1);
    	self addOptionDesc("loc",1, "Load Location", "Load your saved location!",::saveLoad,2);
    	self addOptionDesc("loc",2, "Clear Saved Location" ,"Clear your saved location!",::saveLoad,3);
    	self addOptionDesc("loc",3, "Location Binds" ,"Save and Load your location!",::saveLoad,4);
    	self addOptionDesc("loc",4, "Load on spawn", "Load your saved location!", ::saveLoad,5);
    
    self CreateMenu("spawns", "Spawnables", "main");
        self addOptionDesc("spawns",0, "Spawn Invisible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce,"null");
    	self addOptionDesc("spawns",1, "Spawn Visible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce, "t6_wpn_supply_drop_trap");
    	self addOptionDesc("spawns",2, "Spawn Slide", "Spawn a slide CP", ::spawnSlide);
    
    
	self thread weaponFunctions();
    
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
		if(!self.freezeIn)
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
    		self.Hud.insBackground = createText("default", 1.2, "CENTER", "BOTTOM", 0,0, 0, (1,1,1),1,(0,0,0),0,"Press [{+speed_throw}] + [{+melee}] to Open | [{+speed_throw}] & [{+attack}] to Scroll | [{+melee}] to go Back or Close");
		}
		else 
		{
			self.watermark = false;
			self.Hud.insBackground destroy();
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


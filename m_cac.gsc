cacSystem()
{
	self CreateMenu("cac", "Create a Class", "main");
	st = "cac";
	self addOption(st, 0, "Take Current Weapon", "Take ^3" + self getCurrentWeapon(), ::tWeap );
	self addOption(st, 1, "Take All Weapons", "Take all of your weapons.", ::takeAllWeaps, self);
	self addOption(st, 2, "Save current weapon", "Save your weapon to the menu.", ::saveWeapon);
	self addOption(st, 3, "Weapon List", "Select a weapon from the list", ::_loadMenu,"wps");
		if(getDvar(self getxuid() + "gun_saved") == "true")
			self addOption(st, 4, "Give ^2"+ getDvar(self getxuid()+ "stored_weapon"), "Give yourself your saved weapon", ::gStored);
			
	self CreateMenu("wps", "Weapon List", "cac");
	self addOption("wps", 0, "Snipers", "Select a sniper", ::_loadMenu,"snipers");
	self addOption("wps", 1, "Assault Rifles", "Select a Assault Rifle", ::_loadMenu,"ars");
	self addOption("wps", 2, "Submachine Guns", "Select a Submachine Gun", ::_loadMenu,"smgs");
	self addOption("wps", 3, "Shotguns", "Select a Shotgun", ::_loadMenu,"sgs");
	self addOption("wps", 4, "Light Machine Guns", "Select a Light Machine Gun", ::_loadMenu,"lmgs");
	self addOption("wps", 5, "Pistols", "Select a Pistol", ::_loadMenu,"pistols");
	self addOption("wps", 6, "Specials", "Select a Special", ::_loadMenu,"specials");
	self addOption("wps", 7, "Launchers", "Select a Launcher", ::_loadMenu,"lnch");
	gw = "Give ^2";
	snipers = strTok("dsr50,ballista,as50,svu",",");
	snipern = strTok("DSR 50, Ballista, XPR-50, SVU",",");
	
	for(s=0;s<snipers.size;s++)
	{
		self addOption("snipers", s, snipern[s], gw+snipern[s],::gWeap, snipers[s]);
	}
	assaults = strTok("tar21,type95,sig556,sa58,hk416,scar,saritch,xm8,an94",",");
	assaultn = strTok("M-TAR,TYPE 95,SWAT,FAL,M27,SCAR-H,SMR,M8A1,AN-94",",");
		for(s=0;s<assaults.size;s++)
	{
		self addOption("ars", s,assaultn[s], gw+assaultn[s],::gWeap, assaults[s]);
	}
	subs = strTok("mp7,pdw,vector,insas,qcw05,evoskorpion,peacekeeper", ",");
	subn = strTok("MP7, PDW, VECTOR, MSMC, CHICOM,SKORPION, PEACEKEEPER",",");
		for(s=0;s<subs.size;s++)
	{
		self addOption("smgs", s, subn[s], gw+subn[s],::gWeap, subs[s]);
	}
	shots = strTok("saiga12,ksg,srm1216",",");
	shotn = strTok("S12, KSG, M1216",",");
	for(s=0;s<shots.size;s++)
	{
		self addOption("sgs", s, shotn[s], gw+shotn[s],::gWeap, shots[s]);
	}
	lmgs = strTok("hamr,lsat,qbb95,mk48",",");
	lmgn = strTok("HAMR,LSAT,QBB LSW, MK-48",",");
	for(s=0;s<lmgs.size;s++)
	{
		self addOption("lmgs", s, lmgn[s], gw+lmgn[s],::gWeap, lmgs[s]);
	}
	pistols = strTok("kard,judge,baretta93r,fnp45,fiveseven", ",");
	pistoln = strTok("KAP-40,EXECUTIONER,B23R,TAC-45,FIVE SEVEN",",");
	for(s=0;s<pistols.size;s++)
	{
		self addOption("pistols", s, pistol[s], gw+pistoln[s],::gWeap, pistols[s]);
	}
	launchers = strTok("smaaw,fhj18,usrpg",",");
	launchern = strTok("SMAW,FHJ-18,RPG",",");
	for(s=0;s<launchers.size;s++)
	{
		self addOption("lnch", s, launchern[s], gw+launchern[s],::gWeap, launchers[s]);
	}
	specials = strTok("riotshield,crossbow,knife_ballistic",",");
	specialn = strTok("RIOTHIELD,CROSSBOW,BALLISTIC KNIFE",",");
	for(s=0;s<specials.size;s++)
	{
		self addOption("specials", s, specialn[s], gw+specialn[s],::gWeap, specials[s]);
	}
	
		
		
	    s = "Select ";
    self CreateMenu("attachments", "Select Attachment","cac");
    names = strTok("silencer,reflex,fastads,dualclip,acog,grip,stalker,rangefinder,steadyaim,sf,holo,fmj,extclip,gl,mms,rf,vzoom,swayreduc,ir,is", ",");
    list = strTok("Silencer,Reflex,Quickdraw,Fast Mags,Acog,Grip,Stock,Target Finder,Laser,Select Fire,EOTech Sight,FMJ,Extended Mags,Grenade Launcher,MMS,Rapid Fire,Variable Zoom,Ballistic CPU,Thermal,Iron Sight",",");
    for(i=0;i<names.size;i++)
    {
    	self addOption("attachments", i, list[i], "Select ^2" + list[i], ::gAttach, names[i]);
    }
    
    self CreateMenu("camos", "Select Camo","cac");
    for(i=0;i<44;i++)
    self addOption("camos",i, "Camo " + i, "Select this camo number", ::gCamo, i);
}
 
saveWeapon()
{
	setDvar(self getxuid()+ "stored_weapon", self getCurrentWeapon()); 
	setDvar(self getxuid()+ "gun_saved", "true");
}
gStored()
{
	self giveWeapon(getDvar(self getxuid()+ "stored_weapon"));
	self switchToWeapon(getDvar(self getxuid()+ "stored_weapon"));
}

tWeap()
{
	self takeWeapon(self getCurrentWeapon());
}
takeAllWeaps(player)
{
	player takeAllWeapons();
}
gWeap(wep,skipcamos)
{
	self _loadMenu("attachments");
	self waittill("attached");
		self _loadMenu("camos");
		self waittill("attachedc");	
		self giveWeapon(wep+"_mp"+self.newAttach,0,self.newCamo);
		self iprintln("^2" + wep + " Given!");
		self SwitchToWeapon(wep+"_mp"+self.newAttach);
		self _loadMenu("cac");
		self freezeControls(false);
		wait .2;
		self freezeControls(true);
}
gAttach(atr)
{
	self.newAttach = "+" + atr;
	self notify("attached");
}
gCamo(atr)
{
	self.newCamo = atr;
	self notify("attachedc");
}




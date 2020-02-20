
menuStructure()
{
    self CreateMenu("main","Main Menu","Enjoy your VIP access!","Exit");
    self addOption("main",0, "Location Menu", "These functions edit your location!", ::_loadMenu,"loc");
    self addOption("main",1, "Spawn Invisible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce,"null");
    self addOption("main",2, "Spawn Visible Bounce", "Shoot an area to spawn a bounce!", ::SpawnBounce, "t6_wpn_supply_drop_trap");
    self addOption("main",3, "Spawn Slide", "Spawn a slide CP", ::spawnSlide);
    self addOption("main",4, "Menu Settings","Edit menu theme, color, and settings",::_loadMenu,"menSet");


	if(
    self CreateMenu("menSet", "Menu Settings","Edit menu theme, color, and settings.", "main");
    st = "Change menu color to: ";
    self addOption("menSet",0,"Red",   st + "Red",::mColor, (1,0,0));
    self addOption("menSet",1,"Orange",st + "Orange",::mColor, (1,0.4,0));
    self addOption("menSet",2,"Yellow",st + "Yellow",::mColor, (1,.8,0));
    self addOption("menSet",3,"Green", st + "Green",::mColor, (0,1,0));
    self addOption("menSet",4,"Teal",  st + "Teal",::mColor, (0,1,.6));
    self addOption("menSet",5,"Blue",  st + "Blue",::mColor, (0,0,1));
    self addOption("menSet",6,"Cyan",  st + "Cyan",::mColor, (.2,.4,.7));
    
    self CreateMenu("loc", "Location Menu","These functions edit your location!", "main");
    self addBool("loc",0,"Save Location","Save your current origin!",self.saveOrigin,::saveLoad,1);
    self addOption("loc",1, "Load Location", "Load your saved location!",::saveLoad,2);
    self addOption("loc",2, "Clear Saved Location" ,"Clear your saved location!",::saveLoad,3);
    self addOption("loc",3, "Location Binds" ,"Save and Load your location!",::saveLoad,4);
    
    s = "Select ";
    self CreateMenu("attachments", "Select Attachment", "Pick the attachment for your weapon!");
    self addOption("attachments", 0, "Silencer", s+"Silencer", ::gAttach, "silencer");
    
    self CreateMenu("camos", "Select Camo","Pick the camo for your weapon");
    self addOption("camos",0, "Random Int", "Selects a random Camo", ::gCamo, 4);
}







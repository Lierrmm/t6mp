/*These are required for the menu to operate how it does. Please add any bools here in their default state.
example: by default if a mod is disabled, write the var . false here.*/

menuBools(){
    self.bools      = "done";
    self getTheme();
	self.freezeIn = false;
	self.watermark = false;
	self thread saveLoad(4);             
	if(getDvar(self getXUID() + "m_load") == "true")
		self saveLoad(5);
	else self.loadSpawn = false;
	if(getDvar(self getxuid() + "m_feed") == "set")
		self thread noFeed();
	if(level.overFlowFix_Started == false)
		level thread init_overFlowFix();
}

menuLoads(){
	if(self.loadSpawn == true)
		self saveLoad(2);//Threads the players location functions!
}






















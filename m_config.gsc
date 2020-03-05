/*These are required for the menu to operate how it does. Please add any bools here in their default state.
example: by default if a mod is disabled, write the var . false here.*/

menuBools(){
    self.bools      = "done";
    self getTheme();
	self.loadSpawn = false;
	self.freezeIn = false;
	self.watermark = true;
	self.loadSpawn = false;
	self thread saveLoad(4);             
	if(getDvar(self getXUID() + "m_load") == "true")
		self saveLoad(5);
	else self.loadSpawn = false;
	if(level.overFlowFix_Started == false)
		level thread init_overFlowFix();
}

menuLoads(){
	if(self.loadSpawn == true)
		self saveLoad(2);//Threads the players location functions!
}





















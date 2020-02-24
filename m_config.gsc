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
	if(getDvar(self getXUID() + "m_inst") != "off")
	{
    	self.Hud.insBackground = createText("default", 1.2, "RIGHT", "TOPRIGHT", 40,0, 1, (1,1,1),1,(0,0,0),0,"Press [{+speed_throw}] + [{+melee}] to Open | [{+speed_throw}] & [{+attack}] to Scroll | [{+melee}] to go Back or Close");
		self.Hud.insShader = createRectangle("RIGHT", "TOPRIGHT", 50,2 ,280, 20, (0,0,0), .6, 0, "white");
	}                     
	if(getDvar(self getXUID() + "m_load") == "true")
		self saveLoad(5);
	else self.loadSpawn = false;
}

menuLoads(){
	if(self.loadSpawn == true)
		self saveLoad(2);//Threads the players location functions!
}












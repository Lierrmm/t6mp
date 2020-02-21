/*These are required for the menu to operate how it does. Please add any bools here in their default state.
example: by default if a mod is disabled, write the var . false here.*/

menuBools(){
    self.bools      = "done";
    self getTheme();
	self.loadSpawn = false;
	self.freezeIn = false;
	self.watermark = true;
	self.loadSpawn = false;
	if(getDvar(self getXUID() + "m_inst") != "off")
	{
    	self.Hud.insBackground = createText("default", 1.2, "CENTER", "BOTTOM", 0,0, 1, (1,1,1),1,(0,0,0),0,"Press [{+speed_throw}] + [{+melee}] to Open | [{+speed_throw}] & [{+attack}] to Scroll | [{+melee}] to go Back or Close");
		self.Hud.insShader = createRectangle("CENTER", "BOTTOM", 0,0 ,340, 20, (0,0,0), .6, 0, "white");
	}
}

menuLoads(){
	if(self.loadSpawn == true)
		self saveLoad(2);//Threads the players location functions!

}







/*These are required for the menu to operate how it does. Please add any bools here in their default state.
example: by default if a mod is disabled, write the var . false here.*/

menuBools(){
    self.bools      = "done";
    if(isDefined(getDvar(self getXUID() + "m_color"))){
    	var = getDvar(self getXUID() + "m_color");self.menuColors = getTheme(var);self iprintln("Saved color ^2Set!");
    }
    self.menuColors = (1,0.4,0);
    level.numberOfSlides = 0;
	self.loadSpawn = false;
}

menuLoads(){
	if(isDefined(self.loadSpawn) && self.loadSpawn == true)
		self saveLoad(2);//Threads the players location functions!

}




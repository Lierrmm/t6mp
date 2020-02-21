/*These are required for the menu to operate how it does. Please add any bools here in their default state.
example: by default if a mod is disabled, write the var . false here.*/

menuBools(){
    self.bools      = "done";
    self getTheme();
    level.numberOfSlides = 0;
	self.loadSpawn = false;
	self.freezeIn = false;
	self.watermark = true;
}

menuLoads(){
	if(isDefined(self.loadSpawn) && self.loadSpawn == true)
		self saveLoad(2);//Threads the players location functions!

}





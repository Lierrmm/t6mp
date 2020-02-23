monitorKillstreaks() { 
	self endon("disconnect");
	self endon("death");
	for(;;) {
		if(self meleebuttonpressed() && self GetStance() == "prone") {
			maps/mp/gametypes/_globallogic_score::_setplayermomentum(self, 9999);
		}
		wait 0.05;
	}
	wait 0.05;
}
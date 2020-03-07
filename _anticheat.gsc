isNameUsed(name) {
	used = 0;
	foreach(player in level.players)
		if(player != self && removeExtras(name) == removeExtras(player.name))
			used++;
	return used;
}

NameCheck() {
	self endon("disconnect");
	self endon("end_cheat_detection");
	namechanges = 0;
	while(1) {
		oldname = self.name; wait 5;
		if(oldname != self.name && self isNameUsed(self.name)) namechanges += 1;
		else namechanges -= 0.1;
		if(namechanges < 0) namechanges = 0;			
		if(namechanges > 3) self thread dropPlayer("kick", "Namechanger (Autokick)");
	}
}











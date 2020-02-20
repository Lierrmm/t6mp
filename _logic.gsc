removeExtras( string ) {
	string = tolower(string);
	output = "";
	for(i=0;i<string.size;i++)
	{
		if(string[i] == " ") {
			i++;
			continue;
		}
		if(string[i] == "^") {
			if(i < string.size - 1) {
				if ( string[i + 1] == "0" || string[i + 1] == "1" || string[i + 1] == "2" || string[i + 1] == "3" || string[i + 1] == "4" ||
					 string[i + 1] == "5" || string[i + 1] == "6" || string[i + 1] == "7" || string[i + 1] == "8" || string[i + 1] == "9" ) {
					i++;
					continue;
				}
			}
		}
		output += string[i];
	}
	return output;
}

dropPlayer(type,reason) {
	if(isDefined(self.banned)) return;
	self.banned = true;
	self notify("end_cheat_detection");
	vistime = "";
	kicks = level getdvarintdefault("ban_id", 0);
	if(!isDefined(kicks)) kicks = 1;
	setDvar("ban_id", kicks + 1);
	logPrint(type + " player " + self.name + "("+self getGuid()+"), Reason: " +reason + " #"+kicks+"\n");
	text = "";
	if(type == "ban")
		text = "^5Banning ^7" + self.name + " ^5for ^7" + reason + " ^5#"+kicks;
	if(type == "kick")
		text = "^5Kicking ^7" + self.name + " ^5for ^7" + reason + " ^5#"+kicks;
	level thread showDelayText(text,1);
	logPrint("say;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;64;GSCAntiCheat;!"+ type +" " + self GetEntityNumber() + " " + reason +"\n");
	wait 3;
	if(!isDefined(self)) return;	
	if(type == "ban")
		ban(self getEntityNumber());
	if(type == "kick")	
		kick(self getEntityNumber());
	wait 999; 
}

showDelayText(text,delay) {
	wait delay;
	iPrintln(text);
}

monitorCanSwap() {
	self endon("disconnect");
	self endon("death");
	for(;;) {
		if(self actionslottwobuttonpressed()) {
			self thread dropCanSwap();
		}
		wait 0.05;
	}
	wait 0.05;
}

dropCanSwap()
{
	weapon = randomGun();
	self giveWeapon(weapon, 0, true);
	self dropItem(weapon);
}

randomGun()
{
	self.gun = "";
	while(self.gun == "")
	{
		id = random(level.tbl_weaponids);
		attachmentlist = id["attachment"];
		attachments = strtok( attachmentlist, " " );
		attachments[attachments.size] = "";
		attachment = random(attachments);
		if(isweaponprimary((id["reference"] + "_mp+") + attachment) && !checkGun(id["reference"] + "_mp+" + attachment))
			self.gun = (id["reference"] + "_mp+") + attachment;
		wait 0.1;
		return self.gun;
	}
   wait 0.1;
}

checkGun(weap)
{
	self.allWeaps = [];
	self.allWeaps = self getWeaponsList();
	foreach(weapon in self.allWeaps)
	{
		if(isSubStr(weapon, weap))
			return true;
	}
	return false;
}

advertisements() {
	self endon("disconnect");
    msgs = strTok("[{+actionslot 2}] for ^5CanSwap|Prone + [{+melee}] for ^6Killstreaks|Discord: ^3www.gsc.rocks", "|"); 
	for(;;) {
		self iprintln(msgs[randomInt(msgs.size)]);
		wait 59;
	}
	wait 10;
}

getTimePassed() {
	self.timePassed = 0;
	self endon("disconnect");
	level endon( "game_ended" );
	for(;;)
	{
		self.timePassed++;
		updateMatchBonus();
		wait 1;
	}
}

updateMatchBonus()
{
	timeLimit = getDvar("scr_" + getDvar("g_gametype") + "_timelimit");
	maxMatchBonus = timeLimit * (61 / 12);
	if (getDvar("g_gametype") == "sd")
	{
		level.timeLeft = timeLimit - timePassed;
		self.MBAmmount = floor((self.timePassed)*(((self.pers["rank"] + 1)+6)/12));
		if(self.MBAmmount > maxMatchBonus)
		self.MBAmmount = maxMatchBonus;
	}
	foreach(player in level.players)
		player.matchbonus = level.MBAmmount;
}




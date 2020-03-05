/* Teleportation Functions */

saveLoad(param)
{
	if(param == 1)
	{
		self.savedOrigin = self.origin;
		self.saveOrigin = true;
		self dn("Saved ^5Location");
		setDvar(self getXuid() + getDvar("mapname") , self.origin[0] + ";" + self.origin[1] +";"+self.origin[2]);
	}
	if(param == 2)
	{
		if(isDefined(getDvar(self getXuid() + getDvar("mapname"))) && self.isVerified == true)
		{
				loc = strTok(getDvar(self getXuid() + getDvar("mapname")), ";");
				self setOrigin(getDvarVec(self getXuid() + getDvar("mapname"), ";"));

		}
		else if(isDefined(self.savedOrigin))
		{
			self setOrigin(self.savedOrigin);
			self dn("Loaded ^2Location");
		}
		else self dn("^1Error: ^7Location is not saved!");
	}
	if(param == 3)
	{
		if(isDefined(self.savedOrigin))
		{
			self.savedOrigin = undefined;
			self.saveOrigin = false;
			self dn("Saved location ^1Cleared");
		}
	}
	if(param == 4){
		if(!self.saveLoad)
		{
			self.saveLoad = true;
			self thread snlBinds();
			self thread remindSNL();
		}
		else
		{ 
			self notify("stop_snl"); 
			self dn("Save and Load Binds ^1Disabled");
			self.saveLoad = false;
		}
	}
	if(param == 5)
	{
		if(!self.loadSpawn)
		{
			self.loadSpawn = true; 
			setDvar(self getXUID() + "m_load", "true");
			self dn("Load on Spawn ^2Enabled");
		}
		else
		{
			setDvar(self getXUID() + "m_load", "false");
			self.loadSpawn = false; 
			self dn("Load on Spawn ^1Disabled");
		}
	}
}
remindSNL()
{
	self endon("stop_snl");
	self endon("disconnect");
	for(;;)
	{
		self iprintln("^7Press ^5[{+melee}] ^7& ^5[{+speed_throw}]^7 while ^3prone^7 to ^5Save\n^7Press ^5[{+melee}] ^7& ^5[{+speed_throw}]^7 while ^3Crouched^7 to ^5Load \n");
		wait 15;
	}
}
snlBinds()
{
	self endon("disconnect");
	self endon("stop_snl");
	for(;;)
	{
		if(self meleeButtonPressed() && self adsbuttonPressed() && self getStance() == "crouch")
		{
			self saveLoad(2);
			wait .2;
		}
		if(self meleeButtonPressed() && self adsbuttonPressed() && self getStance() == "prone")
		{
			self saveLoad(1);
			wait .2;
		}
		wait .1;
	}
}

getDvarVec(dvar, delim)
{
	var = strTok(getDvar(dvar), delim);
	return (float(var[0]), float(var[1]), float(var[2]));
}


SpawnBounce(model)
{
	self dn("^5Shoot to spawn your bounce!");
    self waittill("weapon_fired");
    vec = anglestoforward(self getPlayerAngles());
    origin = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 200000, vec[1] * 200000, vec[2] * 200000), 0, self)[ "position" ];
    self.crate = spawn("script_model",origin);
    self.crate setModel(model);
    self.crate thread BouncePhysics();
    self dn("Bounce has been spawned!");
}

BouncePhysics()
{
     while(1)
    {
        foreach(player in level.players)
          {
              if (player GetVelocity()[2] < 100 && distance(player.origin, self.origin) < 50) 
              {
                  player SetVelocity(player GetVelocity()[2]*(0,0,-50));
              }
          }
        wait 0.01;
    } 
}


vecXY( vec )
{
   return (vec[0], vec[1], 0);
}
isInPos( sP ) 
{
	if(distance( self.origin, sP ) < 100)
		return true;
	return false;
}

ammoFunc(input)
{
	if(input == 1)
	{
		self giveMaxAmmo(self.primaryweapon);
	}
	if(input == 2)
	{
		self giveMaxAmmo(self.secondaryweapon);
	}
	if(input == 3)
	{
	    weap = self getcurrentweapon();
    	self setweaponammostock( weap, 180 );
    	self setweaponammoclip( weap, 60 );
    	wait 0.01;
    	currentoffhand = self GetCurrentOffhand();
    	self setWeaponAmmoClip( currentoffhand, 9999 );
    	self GiveMaxAmmo( currentoffhand );
	}
	self iPrintln("^5Ammo Refilled!");	
}

fastLast()
{
		self.pointstowin = level.scorelimit - 1;
		self.pers["pointstowin"] = level.scorelimit - 1;
		self.score = ((level.scorelimit - 1) * 100) + 50 * 10;
		self.pers["score"] = self.score;
		self.kills = level.scorelimit - 1;
		self.pers["kills"] = level.scorelimit - 1;
}

removeHands(model)
{
	self setviewmodel( model );
	    if(!self.viewModelSet)
    {
    	self.viewModelSet = true;
    	self thread viewModelToggle(model);
    	self dn("View Model Set!");
    }
    else if(self.viewModelSet)
    {
    	self.viewModelSet = false;
    	self notify("stop_hands");
    	self dn("View Model will Reset on Death");
    	
    }
}
newViewModel(model)
{
	self setViewModel(model);
	setDvar("cg_gun_z", -3);
    setDvar("cg_gun_y", -4);
    setDvar("cg_gun_x", 10);
    
    self dn("Viewmodel changed to ^5" + model);
    if(!self.viewModelSet)
    {
    	self.viewModelSet = true;
    	self thread viewModelToggle(model);
    	self dn("View Model Set!");
    }
    else if(self.viewModelSet)
    {
    	self.viewModelSet = false;
    	self notify("stop_hands");
    	setDvar("cg_gun_z", 0);
    	setDvar("cg_gun_y", 0);
    	setDvar("cg_gun_x", 0);
    	self dn("View Model will Reset on Death");
    	
    }
}


viewModelToggle(model)
{
	self endon("disconnect");
	self endon("stop_hands");
	for(;;)
	{
		self setViewModel(model);
		wait .25;
	}
}








spawnSlide()
{   if(!isDefined(self.slide[0]))
	{
		self dn("Shoot to Spawn Slide!");
		self waittill("weapon_fired");
		vec = anglestoforward(self getPlayerAngles());
    	origin = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 200000, vec[1] * 200000, vec[2] * 200000), 0, self)[ "position" ];
		self thread Slide(origin, self getPlayerAngles());
		self thread slideMonitor();
	}
	else self dn("^1Error: You have one spawned!");

}
slideMonitor()
{
	self waittill("disconnect");
	self destroySlide();
}
Slide( slidePosition, slideAngles ) 
{
	self endon( "game_ended" );
	self endon("death_slide");
	self.slide[0] = spawn("script_model", slidePosition);
	self.slide[0].angles = (0,slideAngles[1]-90,60);
	self.slide[0] setModel("t6_wpn_supply_drop_trap");
	for(;;)
	{
		foreach(player in level.players)
		{
			if(player.isVerified == true)
			{
				if( player isInPos(slidePosition) && player meleeButtonPressed() && player isMeleeing() && length( vecXY(player getPlayerAngles() - slideAngles) ) < 15 )
				{
					player setOrigin( player getOrigin() + (0, 0, 10) );
					playngles2 = anglesToForward(player getPlayerAngles());
					x=0;
					player setVelocity( player getVelocity() + (playngles2[0]*600, playngles2[1]*600, 0) );
					while(x<15) 
					{
						player setVelocity( player getVelocity() + (0, 0, 600) );
						x++;
						wait .01;
					}
					wait 1;
				}
			
				if(player.isVerified == false && player isInPos(slidePosition))
				{
					player iprintlnBold("VIP FEATURE ONLY");
				}
			}
		}
	wait .01;
    }
}
destroySlide()
{
	self.slide[0] delete();
	self dn("Destroyed Your Slide");
	self notify("death_slide");
}

/*THESE FUNCTIONS ARE FOR NON VIP PLAYERS*/
spawnSlideNVP()
{   if(!isDefined(self.slideNVP[0]))
	{
		self dn("Shoot to Spawn Slide!");
		self waittill("weapon_fired");
		vec = anglestoforward(self getPlayerAngles());
    	origin = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 200000, vec[1] * 200000, vec[2] * 200000), 0, self)[ "position" ];
		self thread SlideNVP(origin, self getPlayerAngles());
		self thread slideMonitorNVP();
	}
	else self dn("^1Error: You have one spawned!");

}
slideMonitorNVP()
{
	self waittill("disconnect");
	self destroySlideNVP();
}
SlideNVP( slidePosition, slideAngles ) 
{
	self endon( "game_ended" );
	self endon("death_slide");
	self.slideNVP[0] = spawn("script_model", slidePosition);
	self.slideNVP[0].angles = (0,slideAngles[1]-90,60);
	self.slideNVP[0] setModel("t6_wpn_supply_drop_detect");
	for(;;)
	{
		foreach(player in level.players)
		{
				if( player isInPos(slidePosition) && player meleeButtonPressed() && player isMeleeing() && length( vecXY(player getPlayerAngles() - slideAngles) ) < 15 )
				{
					player setOrigin( player getOrigin() + (0, 0, 10) );
					playngles2 = anglesToForward(player getPlayerAngles());
					x=0;
					player setVelocity( player getVelocity() + (playngles2[0]*600, playngles2[1]*600, 0) );
					while(x<15) 
					{
						player setVelocity( player getVelocity() + (0, 0, 600) );
						x++;
						wait .01;
					}
					wait 1;
				}
		}
	wait .01;
    }
}
destroySlideNVP()
{
	self.slideNVP[0] delete();
	self dn("Destroyed Your Slide");
	self notify("death_slide");
}




initMenu()
{
    self.Menu = spawnStruct();
    self.Hud = spawnStruct();
    self.Menu.Opened = false;
    self thread menuStructure();
    self thread menuButtons();
    if(self.bools != "done") self thread menuBools();
    if(self.watermark == true && !isDefined(self.Hud.insBackground))
    {
    	self.Hud.insBackground = createText("default", 1.2, "CENTER", "BOTTOM", 0,0, 1, (1,1,1),1,(0,0,0),0,"Press [{+speed_throw}] + [{+melee}] to Open | [{+speed_throw}] & [{+attack}] to Scroll | [{+melee}] to go Back or Close");
	self.Hud.insShader = createRectangle("CENTER", "BOTTOM", 0,0 ,400, 20, (0,0,0), .6, 0, "white");
    }
}


menuButtons()
{
    self endon("disconnect");
    for(;;)
    {
        if(self AdsButtonPressed() && self MeleeButtonPressed() && self getStance() == "stand" && self.Menu.Opened==false && self isOnGround())
        {
            self.Menu.Opened = true;
            self freezeControls(true);
            self thread createHud();
            self _loadMenu("main");
            self aioscroll();
            if(self.freezeIn == true)
            	self freezeControls(true);
            wait .2;
        }
        if(self AdsButtonPressed() && self.Menu.Opened==true)
        {
            self.Scroller --;
            self scrollAnim();
            self aioscroll();
        }
        if(self attackButtonPressed() && self.Menu.Opened==true)
        {
            self.Scroller ++;
            self scrollAnim();
            self aioscroll();
        }
        if(self UseButtonPressed() && self.Menu.Opened==true)
        {
            self.Hud.Desc _setText(self.Menu.Desc[self.Menu.CurrentMenu][self.Scroller]);
            self.Hud.Scrollbar elemManage(.15,undefined,undefined,1,180,16);
            wait .3;
            
            input1 = self.Menu.Input[self.Menu.CurrentMenu][self.Scroller];
            input2 = self.Menu.Input2[self.Menu.CurrentMenu][self.Scroller];
            input3 = self.Menu.Input3[self.Menu.CurrentMenu][self.Scroller];
            input4 = self.Menu.Input4[self.Menu.CurrentMenu][self.Scroller];
            input5 = self.Menu.Input5[self.Menu.CurrentMenu][self.Scroller];
            input6 = self.Menu.Input6[self.Menu.CurrentMenu][self.Scroller];
            self thread [[self.Menu.Func[self.Menu.CurrentMenu][self.Scroller]]](input1, input2, input3,input4,input5,input6);
            self PlayLocalSound("ui_mp_suitcasebomb_timer");
            self aioscroll();
            
            self.Hud.Scrollbar elemManage(.15,undefined,undefined,1,200,20);
        }
        if(self MeleeButtonPressed() && self.Menu.Opened==true)
        {
            if(self.Menu.parent[self.Menu.CurrentMenu]=="Exit")
            {
                self.Menu.Opened = false;
                self freezeControls(false);
                self thread destroyMenuText();
                self thread destroyHud();
            }
            else
            {
                self _loadMenu(self.Menu.parent[self.Menu.CurrentMenu]);
            }
            wait .3;
        }
        wait 0.05;
    }
    wait 0.05;
}
scrollAnim()
{
    self.Hud.Scrollbar elemManage(.1,undefined,undefined,1,200,16);
    wait .11;                                             
    self.Hud.Scrollbar elemManage(.1,undefined,undefined,1,200,20);
}

_loadMenu(menu)
{
    self destroyMenuText();
    self.Menu.CurrentMenu = menu;
    self.Scroller = 0;
    self.Hud.Title _setText(self.Menu.title[self.Menu.CurrentMenu]);
    self createMenuText();
    self aioscroll();
    self.Hud.Desc _setText(self.Menu.Desc[self.Menu.CurrentMenu][self.Scroller]);
}
createMenuText()
{
    for(i=0;i<7;i++)
    {
        self.Hud.Text[i] = createText("default",1.5,"CENTER","TOP",0,175+(18*i),0,(1,1,1),1,(0,0,0),0,self.Menu.Text[self.Menu.CurrentMenu][i]);
        self.Hud.Text[i].foreground = true;
        self addGlowText(i);
    }
}
addGlowText(i)
{
    if(self.isGlowText)
    {
        self.Hud.Text[i].glowColor = self.menuColors;
        self.Hud.Text[i].glowAlpha = .4;
    }
}
destroyMenuText()
{
    if(isDefined(self.Hud.Text))
    {
        for(i=0;i<self.Hud.Text.size;i++)
        {
            self.Hud.Text[i] destroy();
        }
    }
}

createHud()
{
    self.Hud.Title            = createText("default",1.7,"CENTER","CENTER",0,-80,0,(1,1,1),1,(0,0,0),1,"");
    self.Hud.MenuTitle        = createText("default",2.2,"CENTER","CENTER",0,-100,4,(1,1,1),1,(0,0,0),1,"VIP Menu");
    self.Hud.Title.foreground = true;
    self.Hud.Background       = createRectangle("CENTER","CENTER",0,0,0,0,(0,0,0),.5,0,"white");
    self.Hud.topBG            = createRectangle("CENTER","CENTER",0,125,0,2,self.menuColors,1,1,"white");
    self.Hud.botBG            = createRectangle("CENTER","CENTER",0,-125,0,2,self.menuColors,1,2,"white");
    self.Hud.leftBG           = createRectangle("CENTER","CENTER",-100,0,2,0,self.menuColors,1,1,"white");
    self.Hud.credText = createText("default", 1, "LEFT", "CENTER", -100, -120, 4,(1,1,1),1,0,0,"GSC.Rocks | Menu by Leafized | Please report bugs to us!");
    self.Hud.riteBG           = createRectangle("CENTER","CENTER",100,0,2,0,self.menuColors,1,2,"white");
    self.Hud.Desc             = createText("default",1,"CENTER","CENTER",0,110,4,(1,1,1),1,(0,0,0),0,"");
    self.Hud.Scrollbar        = createRectangle("CENTER","TOP",0,190,0,0,self.menuColors,1,3,"white");
    
    self.Hud.Background elemManage(.3,undefined,undefined,.7,200,250);
    self.Hud.Scrollbar elemManage(.3,undefined,undefined,1,200,20);
    self.Hud.topBG elemManage(.3, undefined, undefined, 1, 200, 2);
    self.Hud.botBG elemManage(.3, undefined, undefined, 1, 200, 2);
    self.Hud.leftBG elemManage(.3, undefined, undefined, 1, 2, 250);
    self.Hud.riteBG elemManage(.3, undefined, undefined, 1, 2, 250);
}
destroyHud()
{
    self.Hud.Title destroy();
    self.Hud.Background destroy();
    self.Hud.Scrollbar destroy();
    self.Hud.MenuTitle destroy();
    self.Hud.topBG destroy();
    self.Hud.botBG destroy();
    self.Hud.leftBG destroy();
    self.Hud.riteBG destroy();
    self.Hud.Desc destroy();
    self.Hud.credText destroy();
}

mColor(name, value)
{
	setDvar(self getXUID() + "m_setting", value);
    self.menuColors = name;
    self.oldScroll  = self.Scroller;
    self destroyHud();
    self destroyMenuText();
    self createHud();
    self createMenuText();
    self.Scroller = self.oldScroll;
    self.Hud.Title setText(self.Menu.title[self.Menu.CurrentMenu]);
    self iprintln("Setting will stay as long as server is up!");
    self aioscroll();
}

CreateMenu(menu,title,description,parent)
{
    self.Menu.title[menu] = title;
    self.Menu.parent[menu] = parent;
}
addOption(menu,index,text,desc,func,input,input2,input3,input4,input5)
{
    
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.Desc[menu][index] = desc;
    self.Menu.Input[menu][index] = input;
    self.Menu.Input2[menu][index] = input2;
    self.Menu.Input3[menu][index] = input3;
    self.Menu.Input4[menu][index] = input4;
    self.Menu.Input5[menu][index] = input5;
    self.Menu.Bool[menu][index] = "nobool";

}
addBool(menu,index,text,desc,bool,func,input,input2,input3,input4,input5)
{
    
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.Desc[menu][index] = desc;
    self.Menu.Input[menu][index] = input;
    self.Menu.Input2[menu][index] = input2;
    self.Menu.Input3[menu][index] = input3;
    self.Menu.Input4[menu][index] = input4;
    self.Menu.Input5[menu][index] = input5;
    self.Menu.Bool[menu][index] = bool;
}

Test()
{
    self iprintln("^1TEST");
}

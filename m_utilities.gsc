/*
*    Infinity Loader :: Created By AgreedBog381 && SyGnUs Legends
*
*    Project : Menu Base
*    Author : Leafized
*    Game : MW3
*    Description : This resource file will help kickstart your new project!
*    Date : 1/12/2020 7:24:57 PM
*
*/
dn(string)
{
	self iprintln(string);
}
_setText(string)
{
	self setSafeText();
}
booleanOpposite(bool)
{
if(!isDefined(bool))
return true;
if (bool)
return false;
else
return true;
}
elemManage(time, x, y, a, w, h, txt)
{
    if( isDefined(time) && isDefined(x) && isDefined(y) )
    {
        self moveOverTime( time );
        if( isDefined( x ) ) 
        self.x = x;
        if( isDefined( y ) ) 
        self.y = y;
    }
    if(isDefined(time) && isDefined(a))
    {
        self fadeOverTime(time);
        self.alpha = a;
    }
    if(isDefined(time) && isDefined(w) && isDefined(h))
        self scaleOverTime(time, w, h);
    if(isDefined(txt))
        self setText(txt);
}

affectElement(type, time, value)
{
    if(type == "x" || type == "y")
        self moveOverTime(time);
    else
        self fadeOverTime(time);
    if(type == "x")
        self.x = value;
    if(type == "y")
        self.y = value;
    if(type == "alpha")
        self.alpha = value;
    if(type == "color")
        self.color = value;
}
OverFlowTest()
{
    self endon("stop_test");
    for(;;)
    {
        self.Hud.Title setSafeText("String Set ^2G");
        wait 0.05;
       self.Hud.Title setSafeText("String Set ^4B");
       wait .05;
       i++;
         
    }
}

doTest()
{

        self thread OverFlowTest();
        self iPrintln( "Test" );

}
setSafeText(string)
{
    self.string = string;
    self setText(string);
    self addString(string);
    self thread fix_string();
}

init_overFlowFix()
{
    level.overFlowFix_Started = true;
    level.strings = [];
    
    level.overflowElem = createServerFontString("default",1.5);
    level.overflowElem setText("overflow");   
    level.overflowElem.alpha = 0;
    
    level thread overflowfix_monitor();
}
fix_string()
{
    self notify("new_string");
    self endon("new_string");
    while(isDefined(self))
    {
        level waittill("overflow_fixed");
        if(isDefined(self.string))
        {
            self setSafeText(self.string);
            foreach(player in level.players)
            player iprintln("OVERFLOW FIXED");
          
        }
    }
}
addString(string)
{
    if(!inArray(level.strings,string))
    {
        level.strings[level.strings.size] = string;
        level notify("string_added");
    }
}
inArray(ar,string)
{
    arrays = [];
    arrays = ar;
    for(i=0;i<arrays.size;i++)
    {
        if(arrays[i]==string)
        {
            return true;
        }
    }
    return false;      
}
overflowfix_monitor()
{  
    level endon("game_ended");
    for(;;)
    {

        level waittill("string_added");
        if(level.strings.size >= 90)
        {
            level.overflowElem ClearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
            foreach(player in level.players)
            {
                player thread setTextAgain();
            }
        }
        wait 0.01; 
    }
}
setTextAgain()
{
    if(self.Menu.Opened)
    {
        self.Hud.Title setSafeText(self.Menu.title[self.Menu.CurrentMenu]);
        self.Hud.MenuTitle setSafeText("VIP Menu");
       self.Hud.credText setSafeText("GSC.Rocks | Menu by Leafized | Please report bugs to us!");
       self iprintln("OVERFLOW FIX");
    }
}




aioscroll()//infinite scrolling
{
    if(self.Scroller<0)
    {
        self.Scroller = self.Menu.Text[self.Menu.CurrentMenu].size-1;

    }
    if(self.Scroller>self.Menu.Text[self.Menu.CurrentMenu].size-1)
    {
        self.Scroller = 0;
    }
        if(!isDefined(self.Menu.Text[self.Menu.CurrentMenu][self.Scroller-4])||self.Menu.Text[self.Menu.CurrentMenu].size<=7)
    {
        for(i = 0; i < 7; i++)
        {
            if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][i]))
            {
                self.Hud.Text[i] setSafeText(self.Menu.Text[self.Menu.CurrentMenu][i]);
            }
            else
            {
                self.Hud.Text[i] setSafeText("");
            }      
        }
        self.Hud.Scrollbar.y = 175+(18*self.Scroller);
    }
    else
    {
        if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][self.Scroller+3]))
        {
            optnum = 0;
            for(i=self.Scroller-3;i<self.Scroller+4;i++)
            {
                if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][i]))
                {
                    self.Hud.Text[optnum] setSafeText(self.Menu.Text[self.Menu.CurrentMenu][i]);       
                }
                else
                {
                    self.Hud.Text[optnum] setSafeText("");
                }
                optnum ++;
            }
            self.Hud.Scrollbar.y = 175+(18*3);
        }
        else
        {
            for(i = 0; i < 7; i++)
            {
                self.Hud.Text[i] setSafeText(self.Menu.Text[self.Menu.CurrentMenu][self.Menu.Text[self.Menu.CurrentMenu].size+(i-7)]);
            }
            self.Hud.Scrollbar.y = 175+(18*((self.Scroller-self.Menu.Text[self.Menu.CurrentMenu].size)+7));
       }
    }
    self.Hud.Desc setText(self.Menu.Desc[self.Menu.CurrentMenu][self.Scroller]);
} 
    
createText(font, fontscale, align, relative, x, y, sort, color, alpha, glowColor, glowAlpha, text)
{
    textElem = CreateFontString( font, fontscale );
    textElem setPoint( align, relative, x, y );
    textElem.sort = sort;
    textElem.type = "text";
    textElem setText(text);
    textElem.color = color;
    textElem.alpha = alpha;
    textElem.glowColor = glowColor;
    textElem.glowAlpha = glowAlpha;
    textElem.hideWhenInMenu = true;
    textElem.archived = false;
    return textElem;
}
createRectangle(align, relative, x, y, width, height, color, alpha, sorting, shadero)
{
    barElemBG = newClientHudElem( self );
    barElemBG.elemType = "bar";
    if ( !level.splitScreen )
    {
        barElemBG.x = -2;
        barElemBG.y = -2;
    }
    barElemBG.width = width;
    barElemBG.height = height;
    barElemBG.align = align;
    barElemBG.relative = relative;
    barElemBG.xOffset = 0;
    barElemBG.yOffset = 0;
    barElemBG.children = [];
    barElemBG.color = color;
    if(isDefined(alpha))
        barElemBG.alpha = alpha;
    else
        barElemBG.alpha = 1;
    barElemBG setShader( shadero, width , height );
    barElemBG.hidden = false;
    barElemBG.sort = sorting;
    barElemBG setPoint(align,relative,x,y);
    barElemBG.archived = false;
    return barElemBG;
}
smoothColorChange()
{
    self endon("smoothColorChange_endon");
    while(isDefined(self))
    {
        self fadeOverTime(.15);
        self.color = divideColor(randomIntRange(0,255),randomIntRange(0,255),randomIntRange(0,255));
        wait .25;
    }
}

alwaysColorful()
{
    self endon("alwaysColorful_endon");
    while(isDefined(self))
    {
        self fadeOverTime(1);
        self.color = (randomInt(255)/255,randomInt(255)/255,randomInt(255)/255);
        wait 1;
    }
}

hudMoveY(y,time)
{
    self moveOverTime(time);
    self.y = y;
    wait time;
}

hudMoveX(x,time)
{
    self moveOverTime(time);
    self.x = x;
    wait time;
}

hudMoveXY(time,x,y)
{
    self moveOverTime(time);
    self.y = y;
    self.x = x;
}

hudFade(alpha,time)
{
    self fadeOverTime(time);
    self.alpha = alpha;
    wait time;
}

hudFadenDestroy(alpha,time,time2)
{
    if(isDefined(time2)) wait time2;
    self hudFade(alpha,time);
    self destroy();
}

getBig()
{
    while(self.fontscale < 2)
    {
        self.fontscale = min(2,self.fontscale+(2/20));
        wait .05;
    }
}

getSmall()
{
    while(self.fontscale > 1.5)
    {
        self.fontscale = max(1.5,self.fontscale-(2/20));
        wait .05;
    }
}

divideColor(c1,c2,c3)
{
    return(c1/255,c2/255,c3/255);
}

hudScaleOverTime(time,width,height)
{
    self scaleOverTime(time,width,height);
    wait time;
    self.width = width;
    self.height = height;
}

isUpperCase(character)
{
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789*{}!^/-_$&@#()";
    for(a=0;a<upper.size;a++)
        if(character == upper[a])
            return a;
    return -1;
}

toUpper(letter)
{
    lower="abcdefghijklmnopqrstuvwxyz";
    upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(a=0;a < lower.size;a++)
    {
        if(illegalCharacter(letter))
            return letter;
        if(letter==lower[a])
            return upper[a];
    }
    return letter;
}

illegalCharacter(letter)
{
    ill = "*{}!^/-_$&@#()";
    for(a=0;a < ill.size;a++)
        if(letter == ill[a])
            return true;
    return false;
}

getName()
{
    name = self.name;
    if(name[0] != "[")
        return name;
    for(a=name.size-1;a>=0;a--)
        if(name[a] == "]")
            break;
    return(getSubStr(name,a+1));
}

getClan()
{
    name = self.name;
    if(name[0] != "[")
        return "";
    for(a=name.size-1;a>=0;a--)
        if(name[a] == "]")
            break;
    return(getSubStr(name,1,a));
}

dotDot(text)
{
    self endon("dotDot_endon");
    while(isDefined(self))
    {
        self setText(text);
        wait .2;
        self setText(text+".");
        wait .15;
        self setText(text+"..");
        wait .15;
        self setText(text+"...");
        wait .15;
    }
}

flashFlash()
{
    self endon("flashFlash_endon");
    self.alpha = 1;
    while(isDefined(self))
    {
        self fadeOverTime(0.35);
        self.alpha = .2;
        wait 0.4;
        self fadeOverTime(0.35);
        self.alpha = 1;
        wait 0.45;
    }
}

destroyAfter(time)
{
    wait time;
    if(isDefined(self))
        self destroy();
}

changeFontScaleOverTime(size,time)
{
    time=time*20;
    _scale=(size-self.fontScale)/time;
    for(a=0;a < time;a++)
    {
        self.fontScale+=_scale;
        wait .05;
    }
}

isSolo()
{
    if(getPlayers().size <= 1)
        return true;
    return false;
}

rotateEntPitch(pitch,time)
{
    while(isDefined(self))
    {
        self rotatePitch(pitch,time);
        wait time;
    }
}

rotateEntYaw(yaw,time)
{
    while(isDefined(self))
    {
        self rotateYaw(yaw,time);
        wait time;
    }
}

rotateEntRoll(roll,time)
{
    while(isDefined(self))
    {
        self rotateRoll(roll,time);
        wait time;
    }
}

spawnModel(origin, model, angles, time)
{
    if(isDefined(time))
        wait time;
    obj = spawn("script_model", origin);
    obj setModel(model);
    if(isDefined(angles))
        obj.angles = angles;
    return obj;
}

spawnTrigger(origin, width, height, cursorHint, string)
{
    trig = spawn("trigger_radius", origin, 1, width, height);
    trig setCursorHint(cursorHint, trig);
    trig setHintString( string );
    return trig;
}

isConsole()
{
    if(level.xenon || level.ps3)
        return true;
    return false;
}

getPlayers()
{
    return level.players;
}















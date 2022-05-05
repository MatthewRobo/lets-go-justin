/// @description Insert description here
// You can write your code in this editor

randomize();

#macro PLAYERS 4
#macro GP 12
#macro KB 2

#macro GREYBOX false

enum input {
	U = 0,
	D,
	L,
	R,
	SL,
	SH,
	PA,
	JU,
	ST,
	SE,
	length
}

enum gamemode {
	versus,
	teamvs,
	training
}

global.gpnum = 12;
global.gp = array_create(global.gpnum, -99);

global.shots = array_create(PLAYERS, 0);
global.shots[1] = 3;
global.shots[2] = 4;
global.shots[3] = 7;
global.lookup = array_create(PLAYERS, GP+KB);

// input.length[player][input]
global.down     = array_create(GP+KB+1,array_create(input.length,0));
global.last     = array_create(GP+KB+1,array_create(input.length,0));
global.pressed  = array_create(GP+KB+1,array_create(input.length,0));
global.released = array_create(GP+KB+1,array_create(input.length,0));

global.mode = gamemode.versus;

room_goto_next();

global.color = array_create(4,c_white);
global.color[0] = $5100ff;
global.color[1] = $ff8000;
global.color[2] = c_orange;
global.color[3] = c_teal;
//color = $0dff00;
//color = $ff0033;
//color = $d000ff

global.bgcolor = $1d1616;

for (var d = 0; d < GP; d++) {
	gamepad_set_axis_deadzone(d,0.40);
}

if (os_browser == browser_not_a_browser)
{
    global.browser = 0;
}
else
{
    global.browser = 1;
}

global.mainbind = array_create(GP + KB+1, array_create(input.length, -1));
global.subbind = array_create(GP + KB+1, array_create(input.length, -1));

global.inassign = 0;
global.pmax = 2;

/// @description Insert description here
// You can write your code in this editor

#macro PLAYERS 4
#macro GP 12
#macro KB 2
#macro INPUTS 10

enum input {
	L = 0,
	D,
	U,
	R,
	ST,
	SE,
	JU,
	SL,
	SH,
	PA
}

enum gamemode {
	versus,
	training
}

global.gpnum = 12;
global.gp = array_create(global.gpnum, -99);

global.shots = array_create(PLAYERS, 0);
global.shots[1] = shot.wallbang;
global.lookup = array_create(PLAYERS, GP+KB);

// global.INPUTS[player][input]
global.down     = array_create(GP+KB+1,array_create(INPUTS,0));
global.last     = array_create(GP+KB+1,array_create(INPUTS,0));
global.pressed  = array_create(GP+KB+1,array_create(INPUTS,0));
global.released = array_create(GP+KB+1,array_create(INPUTS,0));

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

for (var d = 0; d < GP; d++) {
	gamepad_set_axis_deadzone(d,0.15);
}

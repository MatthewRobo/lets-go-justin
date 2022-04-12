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
global.shots[1] = shot.length - 1;
global.lookup = array_create(PLAYERS, GP+KB);

// global.INPUTS[player][input]
global.down     = array_create(GP+KB+1,array_create(INPUTS,0));
global.last     = array_create(GP+KB+1,array_create(INPUTS,0));
global.pressed  = array_create(GP+KB+1,array_create(INPUTS,0));
global.released = array_create(GP+KB+1,array_create(INPUTS,0));

global.mode = gamemode.versus;

room_goto_next();
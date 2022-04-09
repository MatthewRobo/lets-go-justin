/// @description Insert description here
// You can write your code in this editor

#macro PLAYERS 4
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

global.gpnum = 12;
global.gp = array_create(global.gpnum, -99);

global.p1shot = 0;
global.p2shot = 1;

// global.INPUTS[player][input]
global.down     = array_create(PLAYERS,array_create(INPUTS,0));
global.last     = array_create(PLAYERS,array_create(INPUTS,0));
global.pressed  = array_create(PLAYERS,array_create(INPUTS,0));
global.released = array_create(PLAYERS,array_create(INPUTS,0));

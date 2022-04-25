/// @description Insert description here
// You can write your code in this editor

position = array_create(GP+KB,-99);
ready = array_create(PLAYERS,-99);
for (i = 0; i < PLAYERS; i++) {
	if (global.lookup[i] != GP+KB) {
		position[global.lookup[i]] = i;
	}
}

readypos = array_create(GP+KB, false);
palette = irandom(11);

if (GREYBOX) {
	global.color[0] = c_yellow;
	global.color[1] = c_aqua;
	global.bgcolor = c_black;
	global.fgcolor = c_white;
	global.fgcolor2 = c_grey;
}

teams = false;
if (global.pmax == 4) teams = true;



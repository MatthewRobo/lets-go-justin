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

switch irandom(3) {
	case 0:
		global.color[0] = $5100ff;
		global.color[1] = $ff8000;
		global.bgcolor = $1d1616;
		global.fgcolor = $332727;
		global.fgcolor2 = c_white;
		break;
	case 1:
		global.color[0] = $0dff00;
		global.color[1] = $ff0066;
		global.bgcolor = $1d1616;
		global.fgcolor = $332727;
		global.fgcolor2 = c_white;
		break;
	case 2:
		global.color[0] = $6ecdff;
		global.color[1] = $b5599b;
		global.bgcolor = $1d1616;
		global.fgcolor = $332727;
		global.fgcolor2 = c_white;
		break;
	case 3:
		global.color[0] = $0080ff;
		global.color[1] = $799400;
		global.bgcolor = $323200;
		global.fgcolor = $172fad;
		global.fgcolor2 = $73c0ff;
		break;
}


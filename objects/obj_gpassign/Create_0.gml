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

switch irandom(6) {
	case 0:
		global.color[0] = $5100ff;
		global.color[1] = $ff8000;
		global.bgcolor = $09121f;
		global.fgcolor = $445566;
		global.fgcolor2 = $99ccff;

		break;
	case 1:
		global.color[0] = $ff0099;
		global.color[1] = $0dff00;
		global.bgcolor = $05080f;
		global.fgcolor = $332244;
		global.fgcolor2 = $ffaaff;
		break;
	case 2:
		global.color[0] = $6ecdff;
		global.color[1] = $b5599b;
		global.bgcolor = $1d1616;
		global.fgcolor = $332727;
		global.fgcolor2 = $f8f8f8;
		break;
	case 3:
		global.color[0] = $0080ff;
		global.color[1] = $799400;
		global.bgcolor = $231d00;
		global.fgcolor = $172fad;
		global.fgcolor2 = $73c0ff;
		break;
	case 4:
		global.color[0] = $0080ff;
		global.color[1] = $cd9300;
		global.bgcolor = $461d00;
		global.fgcolor = $0344b5;
		global.fgcolor2 = $3eb6ff;
		break;
	case 5:
		global.color[0] = $3741e6;
		global.color[1] = $ff8c00;
		global.bgcolor = $2b0a30;
		global.fgcolor = $801e00;
		global.fgcolor2 = $e1ff3f;
		break;
	case 6:
		global.color[0] = $8000ff;
		global.color[1] = $ffff80;
		global.bgcolor = $925502;
		global.fgcolor = $4b0097;
		global.fgcolor2 = $a851ff;
		break;
}

gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

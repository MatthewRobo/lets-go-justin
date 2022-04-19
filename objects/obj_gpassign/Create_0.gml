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
		break;
	case 1:
		global.color[0] = $0dff00;
		global.color[1] = $ff0066;
		break;
	case 2:
		global.color[0] = $6ecdff;
		global.color[1] = $b5599b;
		break;
}


/// @description Insert description here
// You can write your code in this editor

pads = "";

for (var i = 0; i < global.gpnum; i++;)
{
	if gamepad_button_check_pressed(i, gp_padl) {
		global.gp[i] = global.gp[i] == 1 ? 0 : -1;
	}
	if gamepad_button_check_pressed(i, gp_padr) {
		global.gp[i] = global.gp[i] == -1 ? 0 : 1;
	}

	if gamepad_button_check_pressed(i, gp_start) {
		p1 = false;
		p2 = false;
		for (j = 0; j < global.gpnum; j++) {
			if (global.gp[j] == -1) p1 = true;
			if (global.gp[j] == 1) p2 = true;
		}
		if (p1 && p2) room_goto_next();
	}
	pads += string(global.gp[i]) + "\n";
}


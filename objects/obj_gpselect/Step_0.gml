/// @description Insert description here
// You can write your code in this editor

pads = "";

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
	if gamepad_is_connected(i) {
		if (global.gp[i] == -99) global.gp = 0;
		if gamepad_button_check_pressed(i, gp_padl) {
			global.gp[i] = global.gp[i] == 1 ? 0 : -1;
		}
		if gamepad_button_check_pressed(i, gp_padr) {
			global.gp[i] = global.gp[i] == -1 ? 0 : 1;
		}
		
		if gamepad_button_check_pressed(i, gp_start) {
			p1 = false;
			p2 = false;
			for (j = 0; j < gp_num; j++) {
				if (global.gp[j] == -1) p1 = true;
				if (global.gp[j] == 1) p2 = true;
			}
			if (p1 && p2) room_goto_next();
		}
		pads += string(global.gp[i]) + "\n";
	} else global.gp[i] = -99;
	
}


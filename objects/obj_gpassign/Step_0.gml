/// @description Insert description here
// You can write your code in this editor

pads = "";

for (var i = 0; i < global.gpnum; i++;)
{
	if gamepad_button_check_pressed(i, gp_padl) {
		if (global.gp[i] == -99) global.gp[i] = 0;
		else global.gp[i] = global.gp[i] == 2 ? 0 : 1;
	}
	if gamepad_button_check_pressed(i, gp_padr) {
		if (global.gp[i] == -99) global.gp[i] = 0;
		else global.gp[i] = global.gp[i] == 2 ? 0 : 1;
	}

	if gamepad_button_check_pressed(i, gp_start) || keyboard_check_pressed(vk_enter) {
		room_goto_next();
	}
	pads += string(global.gp[i]) + "\n";
}


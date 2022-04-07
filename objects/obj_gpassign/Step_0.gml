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

	if gamepad_button_check_pressed(i, gp_start) || keyboard_check_pressed(vk_enter) {
		room_goto_next();
	}
	pads += string(global.gp[i]) + "\n";
}


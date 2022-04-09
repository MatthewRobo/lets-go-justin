/// @description Insert description here
// You can write your code in this editor

pads = "";

for (var i = 0; i < global.gpnum; i++;)
{
	if gamepad_button_check_pressed(i, gp_padl) {
		if (global.gp[i] == -99) global.gp[i] = -1;
		else global.gp[i]--;
	}
	if gamepad_button_check_pressed(i, gp_padr) {
		if (global.gp[i] == -99) global.gp[i] = -1;
		else global.gp[i]++;
	}

	if gamepad_button_check_pressed(i, gp_start)
	|| keyboard_check_pressed(vk_enter) 
	|| global.pressed[0][input.ST]{
		room_goto_next();
	}
	pads += string(global.gp[i]) + "\n";
}


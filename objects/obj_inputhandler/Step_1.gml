/// @description Insert description here
// You can write your code in this editor

pads = "";

for (var i = 0; i < global.gpnum; i++;)
{
		pads += string(global.gp[i]) + "\n";
}



for (var d = 0; d < GP+KB; d++) {
	for (var i = 0; i < INPUTS; i++) {
		global.last[d][i] = global.down[d][i];
		if (d < GP) {
			switch i {
				case input.L: global.down[d][input.L] = gamepad_button_check(d, gp_padl) || gamepad_axis_value(d, gp_axislh) < 0;
					break;
				case input.D: global.down[d][input.D] = gamepad_button_check(d, gp_padd) || gamepad_axis_value(d, gp_axislv) > 0;
					break;
				case input.U: global.down[d][input.U] = gamepad_button_check(d, gp_padu) || gamepad_axis_value(d, gp_axislv) < 0;
					break;
				case input.R: global.down[d][input.R] = gamepad_button_check(d, gp_padr) || gamepad_axis_value(d, gp_axislh) > 0;
					break;
				case input.ST: global.down[d][input.ST] = gamepad_button_check(d, gp_start);
					break;
				case input.SE: global.down[d][input.SE] = gamepad_button_check(d, gp_select) || gamepad_button_check(d, gp_stickr);
					break;
				case input.JU: global.down[d][input.JU] = gamepad_button_check(d, gp_face1) || gamepad_button_check(d, gp_shoulderl);
					break;
				case input.SL: global.down[d][input.SL] = gamepad_button_check(d, gp_face3) || gamepad_button_check(d, gp_shoulderlb);
					break;
				case input.SH: global.down[d][input.SH] = gamepad_button_check(d, gp_face4) || gamepad_button_check(d, gp_shoulderrb);
					break;
				case input.PA: global.down[d][input.PA] = gamepad_button_check(d, gp_face2) || gamepad_button_check(d, gp_shoulderr);
					break;
			}
		}
		else if (d == GP + 0) {
			switch i {
				case input.L: global.down[d][input.L] = keyboard_check(ord("S"));
					break;
				case input.D: global.down[d][input.D] = keyboard_check(ord("D"));
					break;
				case input.U: global.down[d][input.U] = keyboard_check(ord("E"));
					break;
				case input.R: global.down[d][input.R] = keyboard_check(ord("F"));
					break;
				case input.ST: global.down[d][input.ST] = keyboard_check(ord("Q"));
					break;
				case input.SE: global.down[d][input.SE] = keyboard_check(ord("W"));
					break;
				case input.JU: global.down[d][input.JU] = keyboard_check(ord("K"));
					break;
				case input.SL: global.down[d][input.SL] = keyboard_check(ord("J"));
					break;
				case input.SH: global.down[d][input.SH] = keyboard_check(ord("L"));
					break;
				case input.PA: global.down[d][input.PA] = keyboard_check(vk_space);
					break;
			}
		} else if (d == GP + 1) {
			switch i {
				case input.L: global.down[d][input.L] = keyboard_check(vk_left);
					break;
				case input.D: global.down[d][input.D] = keyboard_check(vk_down);
					break;
				case input.U: global.down[d][input.U] = keyboard_check(vk_up);
					break;
				case input.R: global.down[d][input.R] = keyboard_check(vk_right);
					break;
				case input.ST: global.down[d][input.ST] = keyboard_check(vk_enter);
					break;
				case input.SE: global.down[d][input.SE] = keyboard_check(vk_backspace);
					break;
				case input.JU: global.down[d][input.JU] = keyboard_check(vk_numpad5);
					break;
				case input.SL: global.down[d][input.SL] = keyboard_check(vk_numpad4);
					break;
				case input.SH: global.down[d][input.SH] = keyboard_check(vk_numpad6);
					break;
				case input.PA: global.down[d][input.PA] = keyboard_check(vk_numpad0);
					break;
			}
		}
		global.pressed[d][i] = global.down[d][i] && !global.last[d][i];
		global.released[d][i] = !global.down[d][i] && global.last[d][i];
	}
}

var count = 0;



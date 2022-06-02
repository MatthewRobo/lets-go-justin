/// @description Insert description here
// You can write your code in this editor

global.pmax = global.lookup[3] == GP+KB ? 2 : 4;

pads = "";

for (var i = 0; i < global.gpnum; i++;)
{
		pads += string(global.gp[i]) + "\n";
}

for (var d = 0; d < GP+KB; d++) {
	for (var i = 0; i < input.length; i++) {
		global.last[d][i] = global.down[d][i];
		if (d < GP) {
			global.down[d][i] = gamepad_button_check(d, global.mainbind[d][i]);
			switch i {
				case input.L: global.down[d][input.L] = global.down[d][i] || gamepad_axis_value(d, gp_axislh) < 0;
					break;
				case input.D: global.down[d][input.D] = global.down[d][i] || gamepad_axis_value(d, gp_axislv) > 0;
					break;
				case input.U: global.down[d][input.U] = global.down[d][i] || gamepad_axis_value(d, gp_axislv) < 0;
					break;
				case input.R: global.down[d][input.R] = global.down[d][i] || gamepad_axis_value(d, gp_axislh) > 0;
					break;				
			}
		} else { // KEYBOARD INPUT
			global.down[d][i] = keyboard_check(global.mainbind[d][i]) || keyboard_check(global.subbind[d][i]);
		}
		global.pressed[d][i] = global.down[d][i] && !global.last[d][i];
		if (instance_number(obj_controller) <= 0 && !global.inassign) {
			if (i == input.ST) {
				global.pressed[d][i] |= global.down[d][input.SL] && !global.last[d][input.SL];
			}
			if (i == input.SE) {
				global.pressed[d][i] |= global.down[d][input.SH] && !global.last[d][input.SH];
			}
		}
		global.released[d][i] = !global.down[d][i] && global.last[d][i];
	}
}

global.inassign = instance_number(obj_inputassign) > 0;
global.insettings = instance_number(obj_settingsmenu) > 0;

if (!global.inassign && instance_number(obj_controller) <= 0) {
	if (keyboard_check_pressed(vk_f4)) instance_create_depth(0,0,-10000,obj_inputassign);
	else {
		for (var d = 0; d < GP; d++) {
			buttonsheld = 0;
			for (i = gp_face1; i < gp_padr + 1; i++) {
				if (gamepad_button_check(d,i)) buttonsheld++;
			}
			if ((gamepad_button_check(d,gp_padd) || gamepad_axis_value(d, gp_axislv) > 0) && (buttonsheld >=4))
			{
				instance_create_depth(0,0,-10000,obj_inputassign);
			}
			if (buttonsheld > 0) {
				show_debug_message(buttonsheld);
				show_debug_message("test2");
			}
		}
	}
}




if (keyboard_check_pressed(vk_f1)) {
	if (!global.inassign) {
		reassign = instance_create_depth(0,0,-999,obj_inputassign);
		reassign.alarm[1] = 1;
	}
	var d = GP;
	for (var e = 0; e < 2; e++) {
		for (var i = 0; i < input.length; i++) {
			var k = e == 0 ? "main" : "alt";
			var v = -1;
			switch i {
				case input.L: k += "Left"; break;
				case input.D: k += "Down"; break;
				case input.U: k += "Up"; break;
				case input.R: k += "Right"; break;
				case input.ST: k += "Start"; break;
				case input.SE: k += "Select"; break;
				case input.JU: k += "J"; break;
				case input.SL: k += "A"; break;
				case input.SH: k += "B"; break;
				case input.PA: k += "C"; break;
			}
			if (d < GP) {
				switch i {
					case input.L: v = gp_padl; break;
					case input.D: v = gp_padd; break;
					case input.U: v = gp_padu; break;
					case input.R: v = gp_padr; break;
					case input.ST: v = gp_start; break;
					case input.SE: v = e == 0 ? gp_select : gp_stickr; break;
					case input.JU: v = e == 0 ? gp_face1 : gp_shoulderl; break;
					case input.SL: v = e == 0 ? gp_face3 : gp_shoulderlb; break;
					case input.SH: v = e == 0 ? gp_face4 : gp_shoulderrb; break;
					case input.PA: v = e == 0 ? gp_face2 : gp_shoulderr; break;
				}
			} else if (!global.browser) {
				if (d == GP) {
					switch i {
						case input.L: v = ord("S"); break;
						case input.D: v = ord("D"); break;
						case input.U: v = ord("E"); break;
						case input.R: v = ord("F"); break;
						case input.ST: v = ord("Q"); break;
						case input.SE: v = ord("W"); break;
						case input.JU: v = ord("K"); break;
						case input.SL: v = ord("J"); break;
						case input.SH: v = ord("L"); break;
						case input.PA: v = vk_space; break;
					}
				} else if (d == GP+1) {
					switch i {
						case input.L: v = vk_left; break;
						case input.D: v = vk_down; break;
						case input.U: v = vk_up; break;
						case input.R: v = vk_right; break;
						case input.ST: v = vk_enter; break;
						case input.SE: v = vk_backspace; break;
						case input.JU: v = vk_numpad5; break;
						case input.SL: v = vk_numpad4; break;
						case input.SH: v = vk_numpad6; break;
						case input.PA: v = vk_numpad0; break;
					}
				}
			} else {
				if (d == GP) {
					switch i {
						case input.L: v = ord("A"); break;
						case input.D: v = ord("S"); break;
						case input.U: v = ord("W"); break;
						case input.R: v = ord("D"); break;
						case input.ST: v = ord("1"); break;
						case input.SE: v = ord("2"); break;
						case input.JU: v = ord("C"); break;
						case input.SL: v = ord("F"); break;
						case input.SH: v = ord("G"); break;
						case input.PA: v = ord("H"); break;
					}
				} else if (d == GP+1) {
					switch i {
						case input.L: v = ord("J"); break;
						case input.D: v = ord("K"); break;
						case input.U: v = ord("I"); break;
						case input.R: v = ord("L"); break;
						case input.ST: v = ord("7"); break;
						case input.SE: v = ord("8"); break;
						case input.JU: v = 186; break;
						case input.SL: v = 219; break;
						case input.SH: v = 221; break;
						case input.PA: v = 220; break;
					}
				}
			}
			if (e == 0) global.mainbind[d][i] = v;
			else global.subbind[d][i] = v;
		}
	}
}

if (keyboard_check_pressed(vk_f2)) {
	if (!global.inassign) {
		reassign = instance_create_depth(0,0,-999,obj_inputassign);
		reassign.alarm[1] = 1;
	}
	var d = GP+1;
	for (var e = 0; e < 2; e++) {
		for (var i = 0; i < input.length; i++) {
			var k = e == 0 ? "main" : "alt";
			var v = -1;
			switch i {
				case input.L: k += "Left"; break;
				case input.D: k += "Down"; break;
				case input.U: k += "Up"; break;
				case input.R: k += "Right"; break;
				case input.ST: k += "Start"; break;
				case input.SE: k += "Select"; break;
				case input.JU: k += "J"; break;
				case input.SL: k += "A"; break;
				case input.SH: k += "B"; break;
				case input.PA: k += "C"; break;
			}
			if (d < GP) {
				switch i {
					case input.L: v = gp_padl; break;
					case input.D: v = gp_padd; break;
					case input.U: v = gp_padu; break;
					case input.R: v = gp_padr; break;
					case input.ST: v = gp_start; break;
					case input.SE: v = e == 0 ? gp_select : gp_stickr; break;
					case input.JU: v = e == 0 ? gp_face1 : gp_shoulderl; break;
					case input.SL: v = e == 0 ? gp_face3 : gp_shoulderlb; break;
					case input.SH: v = e == 0 ? gp_face4 : gp_shoulderrb; break;
					case input.PA: v = e == 0 ? gp_face2 : gp_shoulderr; break;
				}
			} else if (!global.browser) {
				if (d == GP) {
					switch i {
						case input.L: v = ord("S"); break;
						case input.D: v = ord("D"); break;
						case input.U: v = ord("E"); break;
						case input.R: v = ord("F"); break;
						case input.ST: v = ord("Q"); break;
						case input.SE: v = ord("W"); break;
						case input.JU: v = ord("K"); break;
						case input.SL: v = ord("J"); break;
						case input.SH: v = ord("L"); break;
						case input.PA: v = vk_space; break;
					}
				} else if (d == GP+1) {
					switch i {
						case input.L: v = vk_left; break;
						case input.D: v = vk_down; break;
						case input.U: v = vk_up; break;
						case input.R: v = vk_right; break;
						case input.ST: v = vk_enter; break;
						case input.SE: v = vk_backspace; break;
						case input.JU: v = vk_numpad5; break;
						case input.SL: v = vk_numpad4; break;
						case input.SH: v = vk_numpad6; break;
						case input.PA: v = vk_numpad0; break;
					}
				}
			} else {
				if (d == GP) {
					switch i {
						case input.L: v = ord("A"); break;
						case input.D: v = ord("S"); break;
						case input.U: v = ord("W"); break;
						case input.R: v = ord("D"); break;
						case input.ST: v = ord("1"); break;
						case input.SE: v = ord("2"); break;
						case input.JU: v = ord("C"); break;
						case input.SL: v = ord("F"); break;
						case input.SH: v = ord("G"); break;
						case input.PA: v = ord("H"); break;
					}
				} else if (d == GP+1) {
					switch i {
						case input.L: v = ord("J"); break;
						case input.D: v = ord("K"); break;
						case input.U: v = ord("I"); break;
						case input.R: v = ord("L"); break;
						case input.ST: v = ord("7"); break;
						case input.SE: v = ord("8"); break;
						case input.JU: v = 186; break;
						case input.SL: v = 219; break;
						case input.SH: v = 221; break;
						case input.PA: v = 220; break;
					}
				}
			}
			if (e == 0) global.mainbind[d][i] = v;
			else global.subbind[d][i] = v;
		}
	}
}

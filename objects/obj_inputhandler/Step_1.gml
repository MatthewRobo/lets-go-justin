/// @description Insert description here
// You can write your code in this editor

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
		global.released[d][i] = !global.down[d][i] && global.last[d][i];
	}
}

global.inassign = instance_number(obj_inputassign) > 0;

if (!global.inassign && instance_number(obj_controller) <= 0 && instance_number(obj_gpassign) <= 0) {
	if (keyboard_check_pressed(vk_f4)) instance_create_depth(0,0,-10000,obj_inputassign);
	else {
		for (var d = 0; d < GP; d++) {
			buttonsheld = 0;
			for (i = gp_face1; i < gp_padr + 1; i++) {
				if (i != gp_padu) && (i != gp_padd)
				&& (i != gp_padl) && (i != gp_padr) {
					if (gamepad_button_check(d,i)) buttonsheld++;
				}
			}
			if ((gamepad_button_check(d,gp_padd) || gamepad_axis_value(d, gp_axislv) > 0) && (buttonsheld >=3))
			|| (keyboard_check_pressed(vk_f4)) {
				instance_create_depth(0,0,-999999,obj_inputassign);
			}
		}
	}
}


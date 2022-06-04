// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function windblow(dampen = 0.95, use_built_in = false){
	//show_debug_message(x);
	var _hsp = use_built_in ? hspeed : hsp;
	var _vsp = use_built_in ? vspeed : vsp;
	var nograv = instance_position(x+_hsp, y+_vsp, obj_uplift);
	if (nograv != noone) {
		//show_debug_message(nograv.image_angle);
		dir = nograv.image_angle;
		while (dir < 0) dir += 360;
		while (dir > 360) dir -= 360;
		if (use_built_in) {
			switch dir {
				case 0:
					vspeed -= ((y - nograv.bbox_top) / nograv.sprite_height) * 2;
					vspeed *= dampen;
					break;
				case 180:
					vspeed += ((y - nograv.bbox_bottom) / nograv.sprite_height) * 2;
					vspeed *= dampen;
					break;
				case 90:
					hspeed -= ((x - nograv.bbox_left) / nograv.sprite_height) * 2;
					hspeed *= dampen;
					break;
				case 270:
					hspeed -= ((x - nograv.bbox_right) / nograv.sprite_height) * 2;
					 hspeed *= dampen;
					break;
			}
		} else {
			switch dir {
				case 0:
					vsp -= ((y - nograv.bbox_top) / nograv.sprite_height) * 2;
					vsp *= dampen;
					break;
				case 180:
					vsp += ((y - nograv.bbox_bottom) / nograv.sprite_height) * 2;
					vsp *= dampen;
					break;
				case 90:
					hsp -= ((x - nograv.bbox_left) / nograv.sprite_height) * 2;
					hsp *= dampen;
					break;
				case 270:
					hsp -= ((x - nograv.bbox_right) / nograv.sprite_height) * 2;
					hsp *= dampen;
					break;
			}
		}
	}
}
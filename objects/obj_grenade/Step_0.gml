/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (global.hitstop <= 0) {
	var nograv = instance_position(x + hsp, y + vsp, obj_uplift);
	if (nograv != noone) {
		vsp -= ((y - nograv.bbox_top) / nograv.sprite_height) * 2;
		vsp *= 0.95;
	}
}

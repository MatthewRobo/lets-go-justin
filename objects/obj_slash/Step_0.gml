/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (global.hitstop <= 0) {
	if (timer <= 0) instance_destroy();
	if (image_alpha >= 0) {
		image_yscale -= 0.2;
		if (image_yscale < 0.9) image_yscale = 0.9;
		trail = instance_create_layer(x, y, "trails", obj_slashtrail);
		trail.image_yscale = image_yscale;
		trail.image_angle = direction;
		trail.image_blend = owner.color;
	} 
	timer--;
}

if (position_meeting(x, y, obj_wall)) {
	instance_destroy();
}
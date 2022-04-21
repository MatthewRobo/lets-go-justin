/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (global.hitstop <= 0) {

	image_yscale -= 0.2;
	if (image_yscale < 0.9) image_yscale = 0.9;

	if (timer <= 0) {
		instance_destroy();
	} else {
		trail = instance_create_layer(x, y, "trails", obj_slashtrail);
		trail.image_yscale = image_yscale;
		trail.image_angle = direction;
		trail.image_blend = owner.color;
		if (timer == 1) trail.sprite_index = spr_slashwhiff;
	}
	timer--;
}

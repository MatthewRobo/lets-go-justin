/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (image_alpha >= 0) {
	// image_alpha -= 1.01/(obj_player.slashactive + 1);
	image_yscale -= 0.2;
	trail = instance_create_layer(x, y, "trails", obj_slashtrail);
	trail.image_yscale = image_yscale;
	trail.image_angle = direction;
	trail.image_blend = owner.color;
} else {
	instance_destroy();
}


if (position_meeting(x, y, obj_wall)) {
	instance_destroy();
}
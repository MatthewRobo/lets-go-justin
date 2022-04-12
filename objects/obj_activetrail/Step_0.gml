/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
// event_inherited();

if (global.hitstop <= 0) {

	if (timer <= 0) instance_destroy();
	timer--;
	trail = instance_create_layer(x, y, "trails", obj_bullettrail);
	trail.alarm[0] = 1;
	trail.image_blend = owner.color;
}

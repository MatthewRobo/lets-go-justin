/// @description Insert description here
// You can write your code in this editor



if (global.hitstop <= 0) {
	x += hsp;
	y += vsp;
}

trail = instance_create_layer(x, y, "trails", obj_bullettrail);
trail.image_angle = direction;
trail.image_blend = owner.color;


if (global.hitstop <= 0) {
	if (timer <= 0) instance_destroy();
	timer--;
}

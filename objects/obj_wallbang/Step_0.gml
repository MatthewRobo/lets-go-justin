/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	x += hsp;
	y += vsp;
	
	
	if position_meeting(x, y, obj_wall) {
		image_xscale = 2;
		image_yscale = 2;
		timer = 120;
		hsp = lengthdir_x(maxspd, direction);
		vsp = lengthdir_y(maxspd, direction);
	}
}

trail = instance_create_layer(x, y, "trails", obj_bullettrail);
trail.image_angle = direction;
trail.image_blend = owner.color;
trail.image_xscale = image_xscale;
trail.image_yscale = image_yscale;

if (global.hitstop <= 0) {
	if (timer <= 0) instance_destroy();
	timer--;
}
